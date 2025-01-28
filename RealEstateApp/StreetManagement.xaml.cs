using System.Collections.Generic;
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
	/// Interaction logic for StreetManagement.xaml
	/// </summary>
	public partial class StreetManagement : Window
	{

		public List<State> States
		{
			get { return (List<State>)GetValue(StatesProperty); }
			set { SetValue(StatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for States.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StatesProperty =
			DependencyProperty.Register("States", typeof(List<State>), typeof(StreetManagement), new UIPropertyMetadata(null, OnStatesChanged));

		private static void OnStatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			StreetManagement form = d as StreetManagement;
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
			DependencyProperty.Register("Cities", typeof(List<City>), typeof(StreetManagement), new UIPropertyMetadata(null, OnCitiesChanged));

		private static void OnCitiesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			StreetManagement form = d as StreetManagement;
			if (form != null)
			{
				form.Cities = (List<City>)e.NewValue;
			}
		}

		public List<Region> Regions
		{
			get { return (List<Region>)GetValue(RegionsProperty); }
			set { SetValue(RegionsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Regions.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RegionsProperty =
			DependencyProperty.Register("Regions", typeof(List<Region>), typeof(StreetManagement), new UIPropertyMetadata(null, OnRegionsChanged));

		private static void OnRegionsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			StreetManagement form = d as StreetManagement;
			if (form != null)
			{
				form.Regions = (List<Region>)e.NewValue;
			}
		}

		public ObservableCollection<Street> Streets
		{
			get { return (ObservableCollection<Street>)GetValue(StreetsProperty); }
			set { SetValue(StreetsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Streets.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StreetsProperty =
			DependencyProperty.Register("Streets", typeof(ObservableCollection<Street>), typeof(StreetManagement), new UIPropertyMetadata(null, OnStreetsChanged));

		private static void OnStreetsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			StreetManagement form = d as StreetManagement;
			if (form != null)
			{
				form.Streets = (ObservableCollection<Street>)e.NewValue;
			}
		}


		public StreetManagement()
		{
			InitializeComponent();
		}

		private void cbStates_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			Streets = null;
			Regions = null;
			LoadCities();
		}

		private void LoadCities()
		{
			if (cbStates.SelectedItem == null) return;
			Cities = Session.Inst.BEManager.GetCities(cbStates.SelectedItem as State, Session.Inst.OfflineMode);
			var yerevan = Cities.FirstOrDefault(s => s.CityID == 1);
			if (yerevan != null)
			{
				cbCities.SelectedItem = yerevan;
			}
		}

		private void cbCities_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			Streets = null;
			if (cbCities.SelectedItem == null) return;
			Regions = Session.Inst.BEManager.GetRegions((int)cbCities.SelectedValue, Session.Inst.User, Session.Inst.OfflineMode);
		}

		private void cbRegions_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			LoadStreets();
		}

		private void streetManagement_OnLoaded(object sender, RoutedEventArgs e)
		{
			States = Session.Inst.BEManager.GetStates(Session.Inst.User, Session.Inst.OfflineMode).OrderBy(s => s.Name).ToList();
			cbStates.SelectedValue = 1;
		}

		private void dgStreets_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			if (cbRegions.SelectedItem == null)
			{
				MessageBox.Show(CultureResources.Inst["PleaseSelectStateRegion"], CultureResources.Inst["SelectRegion"], MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}
			Street street = e.Row.Item as Street;
			if (street == null || string.IsNullOrEmpty(street.Name))
			{
				e.Cancel = true;
				return;
			}
			street.RegionID = (int)cbRegions.SelectedValue;
			if (street.StreetID > 0)
			{
				if (!Session.Inst.BEManager.UpdateStreet(street))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddStreet(street))
				{
					e.Cancel = true;
				}
			}
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as Street;
			if (bt == null) return;

			if (Session.Inst.BEManager.DeleteStreet(bt))
			{
				LoadStreets();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void LoadStreets()
		{
			if (cbRegions.SelectedItem == null) return;
			Streets = new ObservableCollection<Street>(Session.Inst.BEManager.GetStreets(cbRegions.SelectedItem as Region, Session.Inst.OfflineMode).OrderBy(s => s.Name));
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void streetManagement_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}
	}
}
