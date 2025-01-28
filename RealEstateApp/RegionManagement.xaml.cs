using System.Collections.Generic;
using System.Collections.ObjectModel;
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
	/// Interaction logic for RegionManagement.xaml
	/// </summary>
	public partial class RegionManagement : Window
	{


		public List<State> States
		{
			get { return (List<State>)GetValue(StatesProperty); }
			set { SetValue(StatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for States.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StatesProperty =
			DependencyProperty.Register("States", typeof(List<State>), typeof(RegionManagement), new UIPropertyMetadata(null, OnStatesChanged));

		private static void OnStatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RegionManagement form = d as RegionManagement;
			if (form != null)
			{
				form.States = (List<State>)e.NewValue;
			}
		}



		public List<City> Cities
		{
			get { return (List<City>)GetValue(CitiesProperty); }
			set { SetValue(CitiesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Cities.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CitiesProperty =
			DependencyProperty.Register("Cities", typeof(List<City>), typeof(RegionManagement), new UIPropertyMetadata(null, OnCitiesChanged));

		private static void OnCitiesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RegionManagement form = d as RegionManagement;
			if (form != null)
			{
				form.Cities = (List<City>)e.NewValue;
			}
		}



		public ObservableCollection<Region> Regions
		{
			get { return (ObservableCollection<Region>)GetValue(RegionsProperty); }
			set { SetValue(RegionsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Regions.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RegionsProperty =
			DependencyProperty.Register("Regions", typeof(ObservableCollection<Region>), typeof(RegionManagement), new UIPropertyMetadata(null, OnRegionsChanged));

		private static void OnRegionsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RegionManagement form = d as RegionManagement;
			if (form != null)
			{
				form.Regions = (ObservableCollection<Region>)e.NewValue;
			}
		}


		public RegionManagement()
		{
			InitializeComponent();
		}

		private void regionManagement_OnLoaded(object sender, RoutedEventArgs e)
		{
			States = Session.Inst.BEManager.GetStates(Session.Inst.User, Session.Inst.OfflineMode).OrderBy(s => s.Name).ToList();
			cbStates.SelectedValue = 1;
		}

		private void cbStates_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			Regions = null;
			LoadCities(cbStates.SelectedItem as State);
		}

		private void LoadCities(State selectedState)
		{
			if (selectedState == null) return;
			Regions = null;

			Cities = Session.Inst.BEManager.GetCities(selectedState, Session.Inst.OfflineMode).OrderBy(s => s.Name).ToList();
			var yerevan = Cities.FirstOrDefault(s => s.CityID == 1);
			if (yerevan != null)
			{
				cbCities.SelectedItem = yerevan;
			}
		}

		private void cbCities_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			LoadRegions();
		}

		private void LoadRegions()
		{
			if (cbCities.SelectedItem == null) return;
			Regions = new ObservableCollection<Region>(Session.Inst.BEManager.GetRegions((int)cbCities.SelectedValue, Session.Inst.User, Session.Inst.OfflineMode).OrderBy(s => s.Name));
		}

		private void dgRegions_RowEditEnding(object sender, System.Windows.Controls.DataGridRowEditEndingEventArgs e)
		{
			if (cbCities.SelectedItem == null)
			{
				MessageBox.Show(CultureResources.Inst["PleaseSelectCity"], CultureResources.Inst["SelectCity"], MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}
            if (e.EditAction != DataGridEditAction.Commit) return;
			Region region = e.Row.Item as Region;
			if (region == null || string.IsNullOrEmpty(region.Name))
			{
				e.Cancel = true;
				return;
			}
			region.CityID = (int)cbCities.SelectedValue;
			if (region.RegionID > 0)
			{
				if (!Session.Inst.BEManager.UpdateRegion(region))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddRegion(region))
				{
					e.Cancel = true;
				}
			}
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as Region;
			if (bt == null) return;

			if (Session.Inst.BEManager.DeleteRegion(bt))
			{
				LoadRegions();
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

		private void regionManagement_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}
	}
}
