using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for OperationalSignificancesManagement.xaml
	/// </summary>
	public partial class OperationalSignificancesManagement : Window
	{

		public List<OperationalSignificance> OperationalSignificances
		{
			get { return (List<OperationalSignificance>)GetValue(OperationalSignificancesProperty); }
			set { SetValue(OperationalSignificancesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for OperationalSignificances.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty OperationalSignificancesProperty =
			DependencyProperty.Register("OperationalSignificances", typeof(List<OperationalSignificance>), typeof(OperationalSignificancesManagement), new UIPropertyMetadata(null, OnOperationalSignificancesChanged));

		private static void OnOperationalSignificancesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			OperationalSignificancesManagement form = d as OperationalSignificancesManagement;
			if (form != null)
			{
				form.OperationalSignificances = (List<OperationalSignificance>)e.NewValue;
			}
		}


		public List<EstateType> EstateTypes
		{
			get { return (List<EstateType>)GetValue(EstateTypesProperty); }
			set { SetValue(EstateTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for EstateTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstateTypesProperty =
			DependencyProperty.Register("EstateTypes", typeof(List<EstateType>), typeof(OperationalSignificancesManagement), new UIPropertyMetadata(null, OnEstateTypesChanged));

		private static void OnEstateTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			OperationalSignificancesManagement form = d as OperationalSignificancesManagement;
			if (form != null)
			{
				form.EstateTypes = (List<EstateType>)e.NewValue;
			}
		}

		public List<SignificanceOfTheUse> SignificanceOfTheUses
		{
			get { return (List<SignificanceOfTheUse>)GetValue(SignificanceOfTheUsesProperty); }
			set { SetValue(SignificanceOfTheUsesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SignificanceOfTheUses.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SignificanceOfTheUsesProperty =
			DependencyProperty.Register("SignificanceOfTheUses", typeof(List<SignificanceOfTheUse>), typeof(OperationalSignificancesManagement), new UIPropertyMetadata(null, OnSignificanceOfTheUsesChanged));

		private static void OnSignificanceOfTheUsesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			OperationalSignificancesManagement form = d as OperationalSignificancesManagement;
			if (form != null)
			{
				form.SignificanceOfTheUses = (List<SignificanceOfTheUse>)e.NewValue;
			}
		}

		public OperationalSignificancesManagement()
		{
			InitializeComponent();
		}

		private void cbEstateTypes_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			SignificanceOfTheUses = null;
			OperationalSignificances = null;
			LoadSignificanceOfTheUses();
		}

		private void LoadSignificanceOfTheUses()
		{
			if (cbEstateTypes.SelectedItem == null) cbSignificanceOfTheUses.ItemsSource = null;
			cbSignificanceOfTheUses.ItemsSource = Session.Inst.BEManager.GetSignificanceOfTheUses(cbEstateTypes.SelectedItem as EstateType, Session.Inst.OfflineMode).OrderBy(s => s.Name);
		}

		private void cbSignificanceOfTheUses_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			LoadOperationalSignificances();
		}

		private void LoadOperationalSignificances()
		{
			if (cbSignificanceOfTheUses.SelectedItem == null)
				dgOperationalSignificances.ItemsSource = null;
			else
				dgOperationalSignificances.ItemsSource = Session.Inst.BEManager.GetOperationalSignificances(cbSignificanceOfTheUses.SelectedItem as SignificanceOfTheUse, Session.Inst.OfflineMode).OrderBy(s => s.Name);
		}

		private void dgOperationalSignificances_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			if (cbSignificanceOfTheUses.SelectedItem == null)
			{
				MessageBox.Show(CultureResources.Inst["PleaseSelectOperationalSignificance"], CultureResources.Inst["SelectOperationalSignificance"], MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}
			OperationalSignificance operationalSignificance = e.Row.Item as OperationalSignificance;
			if (operationalSignificance == null || string.IsNullOrEmpty(operationalSignificance.Name))
			{
				e.Cancel = true;
				return;
			}
			operationalSignificance.SignificanceOfTheUseID = (int)cbSignificanceOfTheUses.SelectedValue;
			if (operationalSignificance.ID > 0)
			{
				if (!Session.Inst.BEManager.UpdateoperationalSignificance(operationalSignificance))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddOperationalSignificance(operationalSignificance))
				{
					e.Cancel = true;
				}
			}
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as OperationalSignificance;
			if (bt == null) return;
			if (Session.Inst.BEManager.DeleteOperationalSignificance(bt))
			{
				LoadOperationalSignificances();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void form_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}

		private void form_Loaded(object sender, RoutedEventArgs e)
		{
			EstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
		}
	}
}
