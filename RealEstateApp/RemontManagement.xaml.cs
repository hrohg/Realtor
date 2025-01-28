using System.Collections.ObjectModel;
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
	/// Interaction logic for RemontManagement.xaml
	/// </summary>
	public partial class RemontManagement : Window
	{


		public ObservableCollection<Remont> Remonts
		{
			get { return (ObservableCollection<Remont>)GetValue(RemontsProperty); }
			set { SetValue(RemontsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Remonts.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RemontsProperty =
			DependencyProperty.Register("Remonts", typeof(ObservableCollection<Remont>), typeof(RemontManagement), new UIPropertyMetadata(null, OnRemontsChanged));

		private static void OnRemontsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RemontManagement form = d as RemontManagement;
			if (form != null)
			{
				form.Remonts = (ObservableCollection<Remont>)e.NewValue;
			}
		}


		public RemontManagement()
		{
			InitializeComponent();
		}

		private void RemontManagement_OnLoaded(object sender, RoutedEventArgs e)
		{
			LoadRemonts();
		}

		private void LoadRemonts()
		{
			Remonts = new ObservableCollection<Remont>(Session.Inst.BEManager.GetRemonts(Session.Inst.OfflineMode).OrderBy(s => s.Name));
		}

		private void dgRemonts_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			Remont remont = e.Row.Item as Remont;
			if (remont == null || string.IsNullOrEmpty(remont.Name))
			{
				e.Cancel = true;
				return;
			}

			if (remont.RemontID > 0)
			{
				if (!Session.Inst.BEManager.UpdateRemont(remont))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddRemont(remont))
				{
					e.Cancel = true;
				}
			}
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as Remont;
			if (bt == null) return;

			if (Session.Inst.BEManager.DeleteRemont(bt))
			{
				LoadRemonts();
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

		private void remont_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}
	}
}
