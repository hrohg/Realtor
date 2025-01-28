using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using UserControls;
using DataGridRowEditEndingEventArgs = Microsoft.Windows.Controls.DataGridRowEditEndingEventArgs;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for RoofingManagement.xaml
	/// </summary>
	public partial class RoofingManagement : Window
	{

		public List<Roofing> Roofings
		{
			get { return (List<Roofing>)GetValue(RoofingsProperty); }
			set { SetValue(RoofingsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Roofings.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RoofingsProperty =
			DependencyProperty.Register("Roofings", typeof(List<Roofing>), typeof(RoofingManagement), new UIPropertyMetadata(null, OnRoofingChanged));

		private static void OnRoofingChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RoofingManagement form = d as RoofingManagement;
			if (form != null)
			{
				form.Roofings = (List<Roofing>)e.NewValue;
			}
		}


		public RoofingManagement()
		{
			InitializeComponent();
		}

		private void dgRoofing_RowEditEnding(object sender, System.Windows.Controls.DataGridRowEditEndingEventArgs e)
		{
			Roofing roofing = e.Row.Item as Roofing;
			if (roofing == null || string.IsNullOrEmpty(roofing.Name))
			{
				e.Cancel = true;
				return;
			}

			if (roofing.ID > 0)
			{
				if (!Session.Inst.BEManager.UpdateRoofing(roofing))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddRoofing(roofing))
				{
					e.Cancel = true;
				}
			}
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as Roofing;
			if (bt == null) return;
			if (Session.Inst.BEManager.DeleteRoofing(bt))
			{
				LoadRoofings();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void roofingForm_Loaded(object sender, RoutedEventArgs e)
		{
			LoadRoofings();
		}

		private void LoadRoofings()
		{
			Roofings = Session.Inst.BEManager.GetRoofings(Session.Inst.OfflineMode).OrderBy(s => s.Name).ToList();
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void roofingForm_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}
	}
}
