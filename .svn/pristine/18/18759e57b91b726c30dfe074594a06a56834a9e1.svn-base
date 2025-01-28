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
	/// Interaction logic for SignificanceOfTheUsesManagement.xaml
	/// </summary>
	public partial class SignificanceOfTheUsesManagement : Window
	{


		public List<EstateType> EstateTypes
		{
			get { return (List<EstateType>)GetValue(EstateTypesProperty); }
			set { SetValue(EstateTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for EstateTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstateTypesProperty =
			DependencyProperty.Register("EstateTypes", typeof(List<EstateType>), typeof(SignificanceOfTheUsesManagement), new UIPropertyMetadata(null, OnEstateTypesChanged));

		private static void OnEstateTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SignificanceOfTheUsesManagement form = d as SignificanceOfTheUsesManagement;
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
			DependencyProperty.Register("SignificanceOfTheUses", typeof(List<SignificanceOfTheUse>), typeof(SignificanceOfTheUsesManagement), new UIPropertyMetadata(null, OnSignificanceOfTheUsesChanged));

		private static void OnSignificanceOfTheUsesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SignificanceOfTheUsesManagement form = d as SignificanceOfTheUsesManagement;
			if (form != null)
			{
				form.SignificanceOfTheUses = (List<SignificanceOfTheUse>)e.NewValue;
			}
		}


		public SignificanceOfTheUsesManagement()
		{
			InitializeComponent();
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

		private void cbEstateTypes_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			LoadSignificanceOfTheUses();
		}

		private void LoadSignificanceOfTheUses()
		{
			if (cbEstateTypes.SelectedItem == null) dgSignificanceOfTheUses.ItemsSource = null;

			dgSignificanceOfTheUses.ItemsSource = Session.Inst.BEManager.GetSignificanceOfTheUses(cbEstateTypes.SelectedItem as EstateType, Session.Inst.OfflineMode).OrderBy(s => s.Name);
		}

		private void dgSignificanceOfTheUses_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			SignificanceOfTheUse significanceOfTheUse = e.Row.Item as SignificanceOfTheUse;
			if (significanceOfTheUse == null || string.IsNullOrEmpty(significanceOfTheUse.Name))
			{
				e.Cancel = true;
				return;
			}

			if (significanceOfTheUse.ID > 0)
			{
				if (!Session.Inst.BEManager.UpdateSignificanceOfTheUse(significanceOfTheUse))
				{
					e.Cancel = true;
				}
			}
			else
			{
				significanceOfTheUse.EstateTypeID = ((EstateType)cbEstateTypes.SelectedItem).EstateTypeID;
				if (!Session.Inst.BEManager.AddSignificanceOfTheUse(significanceOfTheUse))
				{
					MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
					e.Cancel = true;
				}
			}
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as SignificanceOfTheUse;
			if (bt == null) return;
			if (Session.Inst.BEManager.DeleteSignificanceOfTheUse(bt))
			{
				LoadSignificanceOfTheUses();
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
	}
}
