using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using RealEstate.Common.Helpers;
using System.Collections.ObjectModel;
using RealEstate.DataAccess;
using RealEstateApp.CustomControls;
using Shared.Helpers;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for SearchControl.xaml
	/// </summary>
	public partial class SearchControl
	{

		public ObservableCollection<Convenient> OfficePlaceConvenients
		{
			get { return (ObservableCollection<Convenient>)GetValue(OfficePlaceConvenientsProperty); }
			set { SetValue(OfficePlaceConvenientsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for OfficePlaceConvenients.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty OfficePlaceConvenientsProperty =
			DependencyProperty.Register("OfficePlaceConvenients", typeof(ObservableCollection<Convenient>), typeof(SearchControl), new UIPropertyMetadata(null, OnOfficePlaceConvenientsChanged));

		private static void OnOfficePlaceConvenientsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SearchControl form = d as SearchControl;
			if (form != null)
			{
				form.OfficePlaceConvenients = (ObservableCollection<Convenient>)e.NewValue;
			}
		}

		public Visibility NotEarthPlaceAddonsVisibility
		{
			get { return (Visibility)GetValue(NotEarthPlaceAddonsVisibilityProperty); }
			set { SetValue(NotEarthPlaceAddonsVisibilityProperty, value); }
		}

		// Using a DependencyProperty as the backing store for NotEarthPlaceAddonsVisibility.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty NotEarthPlaceAddonsVisibilityProperty =
			DependencyProperty.Register("NotEarthPlaceAddonsVisibility", typeof(Visibility), typeof(SearchControl), new UIPropertyMetadata(Visibility.Collapsed, OnNotEarthPlaceAddonsVisibilityConverter));

		private static void OnNotEarthPlaceAddonsVisibilityConverter(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SearchControl s = d as SearchControl;
			if (s != null)
			{
				s.NotEarthPlaceAddonsVisibility = (Visibility)e.NewValue;
			}
		}


		public Visibility HouseAddonsVisible
		{
			get { return (Visibility)GetValue(HouseAddonsVisibleProperty); }
			set { SetValue(HouseAddonsVisibleProperty, value); }
		}

		// Using a DependencyProperty as the backing store for HouseAddonsVisible.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty HouseAddonsVisibleProperty =
			DependencyProperty.Register("HouseAddonsVisible", typeof(Visibility), typeof(SearchControl), new UIPropertyMetadata(Visibility.Collapsed, OnHouseAddonsVisibleChanged));

		private static void OnHouseAddonsVisibleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SearchControl s = d as SearchControl;
			if (s != null)
			{
				s.HouseAddonsVisible = (Visibility)e.NewValue;
			}
		}


		public Visibility OfficePlaceAddonsVisibility
		{
			get { return (Visibility)GetValue(OfficePlaceAddonsVisibilityProperty); }
			set { SetValue(OfficePlaceAddonsVisibilityProperty, value); }
		}

		// Using a DependencyProperty as the backing store for OfficePlaceAddonsVisibility.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty OfficePlaceAddonsVisibilityProperty =
			DependencyProperty.Register("OfficePlaceAddonsVisibility", typeof(Visibility), typeof(SearchControl), new UIPropertyMetadata(Visibility.Collapsed, OnOfficePlaceAddonsVisibilityChanged));

		private static void OnOfficePlaceAddonsVisibilityChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SearchControl s = d as SearchControl;
			if (s != null)
			{
				s.OfficePlaceAddonsVisibility = (Visibility)e.NewValue;
			}
		}


		public List<State> States
		{
			get { return (List<State>)GetValue(StatesProperty); }
			set { SetValue(StatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for States.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StatesProperty =
			DependencyProperty.Register("States", typeof(List<State>), typeof(SearchControl), new UIPropertyMetadata(null, OnStatesChanged));

		private static void OnStatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SearchControl s = d as SearchControl;
			if (s != null)
			{
				s.States = (List<State>)e.NewValue;
			}
		}

		public List<EstateType> RealEstateTypes
		{
			get { return (List<EstateType>)GetValue(RealEstateTypesProperty); }
			set { SetValue(RealEstateTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for RealEstateTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RealEstateTypesProperty =
			DependencyProperty.Register("RealEstateTypes", typeof(List<EstateType>), typeof(SearchControl), new UIPropertyMetadata(null, OnRealEstateTypesChanged));

		private static void OnRealEstateTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl wnd = sender as SearchControl;
			if (wnd != null)
			{
				wnd.RealEstateTypes = (List<EstateType>)e.NewValue;
			}
		}

		public List<Project> Projects
		{
			get { return (List<Project>)GetValue(ProjectsProperty); }
			set { SetValue(ProjectsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Projects.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ProjectsProperty =
			DependencyProperty.Register("Projects", typeof(List<Project>), typeof(SearchControl), new UIPropertyMetadata(null, OnProjectsChanged));

		private static void OnProjectsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl wnd = sender as SearchControl;
			if (wnd != null)
			{
				wnd.Projects = (List<Project>)e.NewValue;
			}
		}

		public List<OrderType> OrderTypes
		{
			get { return (List<OrderType>)GetValue(OrderTypesProperty); }
			set { SetValue(OrderTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for OrderTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty OrderTypesProperty =
			DependencyProperty.Register("OrderTypes", typeof(List<OrderType>), typeof(SearchControl), new UIPropertyMetadata(null, OnOrderTypesChanged));

		private static void OnOrderTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl wnd = sender as SearchControl;
			if (wnd != null)
			{
				wnd.OrderTypes = (List<OrderType>)e.NewValue;
			}
		}


		public List<BuildingType> BuildingTypes
		{
			get { return (List<BuildingType>)GetValue(BuildingTypesProperty); }
			set { SetValue(BuildingTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for BuildingTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty BuildingTypesProperty =
			DependencyProperty.Register("BuildingTypes", typeof(List<BuildingType>), typeof(SearchControl), new UIPropertyMetadata(null, OnBuildingTypesChanged));

		private static void OnBuildingTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl wnd = sender as SearchControl;
			if (wnd != null)
			{
				wnd.BuildingTypes = (List<BuildingType>)e.NewValue;
			}
		}

		public List<Remont> Remonts
		{
			get { return (List<Remont>)GetValue(RemontsProperty); }
			set { SetValue(RemontsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Remonts.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RemontsProperty =
			DependencyProperty.Register("Remonts", typeof(List<Remont>), typeof(SearchControl), new UIPropertyMetadata(null, OnRemontsChanged));

		private static void OnRemontsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl wnd = sender as SearchControl;
			if (wnd != null)
			{
				wnd.Remonts = (List<Remont>)e.NewValue;
			}
		}

		public List<Region> Regions
		{
			get { return (List<Region>)GetValue(RegionsProperty); }
			set { SetValue(RegionsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Regions.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RegionsProperty =
			DependencyProperty.Register("Regions", typeof(List<Region>), typeof(SearchControl), new UIPropertyMetadata(null, OnRegionsChanged));

		private static void OnRegionsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl wnd = sender as SearchControl;
			if (wnd != null)
			{
				wnd.Regions = (List<Region>)e.NewValue;
			}
		}

		public List<City> Cities
		{
			get { return (List<City>)GetValue(CitiesProperty); }
			set { SetValue(CitiesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Cities.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CitiesProperty =
			DependencyProperty.Register("Cities", typeof(List<City>), typeof(SearchControl), new UIPropertyMetadata(null, OnCitiesChanged));

		private static void OnCitiesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl wnd = sender as SearchControl;
			if (wnd != null)
			{
				wnd.Cities = (List<City>)e.NewValue;
			}
		}



		public Control RealEstatesListControlName
		{
			get { return (Control)GetValue(RealEstatesListControlNameProperty); }
			set { SetValue(RealEstatesListControlNameProperty, value); }
		}

		// Using a DependencyProperty as the backing store for RealEstatesListControlName.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RealEstatesListControlNameProperty =
			DependencyProperty.Register("RealEstatesListControlName", typeof(Control), typeof(SearchControl), new UIPropertyMetadata(null, OnRealEstatesListControlNameChanged));

		private static void OnRealEstatesListControlNameChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl sc = (SearchControl)sender;
			if (sc != null)
			{
				sc.RealEstatesListControlName = (Control)e.NewValue;
			}
		}

		public List<Currency> Currencies
		{
			get { return (List<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(SearchControl), new UIPropertyMetadata(null, OnCurrenciesChanged));

		private static void OnCurrenciesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl wnd = sender as SearchControl;
			if (wnd != null)
			{
				wnd.Currencies = (List<Currency>)e.NewValue;
			}
		}

		public ObservableCollection<Street> Streets
		{
			get { return (ObservableCollection<Street>)GetValue(StreetsProperty); }
			set { SetValue(StreetsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Streets.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StreetsProperty =
			DependencyProperty.Register("Streets", typeof(ObservableCollection<Street>), typeof(SearchControl), new UIPropertyMetadata(null, OnStreetsChanged));

		private static void OnStreetsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl wnd = sender as SearchControl;
			if (wnd != null)
			{
				wnd.Streets = (ObservableCollection<Street>)e.NewValue;
			}
		}

		public RealEstateSearchParameters SearchParameters
		{
			get { return (RealEstateSearchParameters)GetValue(SearchParametersProperty); }
			set { SetValue(SearchParametersProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SearchParameters.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SearchParametersProperty =
			DependencyProperty.Register("SearchParameters", typeof(RealEstateSearchParameters), typeof(SearchControl), new UIPropertyMetadata(null, OnSearchParametersChanged));

		private static void OnSearchParametersChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SearchControl searchControl = sender as SearchControl;
			if (searchControl != null)
			{
				searchControl.SearchParameters = (RealEstateSearchParameters)e.NewValue;
			}
		}

		public List<Street> StreetsSingle
		{
			get { return (List<Street>)GetValue(StreetsSingleProperty); }
			set { SetValue(StreetsSingleProperty, value); }
		}

		// Using a DependencyProperty as the backing store for StreetsSingle.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StreetsSingleProperty =
			DependencyProperty.Register("StreetsSingle", typeof(List<Street>), typeof(SearchControl), new UIPropertyMetadata(null, OnStreetsSingleChanged));

		private static void OnStreetsSingleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SearchControl control = d as SearchControl;
			if (control != null)
			{
				control.StreetsSingle = (List<Street>)e.NewValue;
			}
		}

		public List<Region> RegionsSingle
		{
			get { return (List<Region>)GetValue(RegionsSingleProperty); }
			set { SetValue(RegionsSingleProperty, value); }
		}

		// Using a DependencyProperty as the backing store for RegionsSingle.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RegionsSingleProperty =
			DependencyProperty.Register("RegionsSingle", typeof(List<Region>), typeof(SearchControl), new UIPropertyMetadata(null, OnRegionsSingleChanged));

		private static void OnRegionsSingleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var control = d as SearchControl;
			if (control != null)
			{
				control.RegionsSingle = (List<Region>) e.NewValue;
			}
		}



		public ObservableCollection<Country> Countries
		{
			get { return (ObservableCollection<Country>)GetValue(CountriesProperty); }
			set { SetValue(CountriesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Countries.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CountriesProperty =
			DependencyProperty.Register("Countries", typeof(ObservableCollection<Country>), typeof(SearchControl), new PropertyMetadata(null, OnCountriesChanged));

		private static void OnCountriesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((SearchControl)d).Countries = (ObservableCollection<Country>)e.NewValue;
		}


		public SearchControl()
		{
			InitializeComponent();
		}

		private void LoadData()
		{
			Regions = Session.Inst.BEManager.GetRegions(1, Session.Inst.User, Session.Inst.OfflineMode);
			OrderTypes = Session.Inst.BEManager.GetOrderTypesForEstate(Session.Inst.User, Session.Inst.OfflineMode);
			RealEstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
			Remonts = Session.Inst.BEManager.GetRemonts(Session.Inst.OfflineMode);
			Projects = Session.Inst.BEManager.GetProjects(Session.Inst.OfflineMode);
			Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
			States = Session.Inst.BEManager.GetStates(Session.Inst.User, Session.Inst.OfflineMode);
			Streets = null;
			OfficePlaceConvenients = Session.Inst.BEManager.GetConvenients(Session.Inst.OfflineMode);
			BuildingTypes = Session.Inst.BEManager.GetBuildingTypes(Session.Inst.OfflineMode);
			Countries = Session.Inst.BEManager.GetCountries(Session.Inst.OfflineMode);
		}

		private void CheckBoxOrderTypes_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				OrderType orderType = (OrderType)checkbox.CommandParameter;
				if (checkbox.IsChecked.GetValueOrDefault(false))
				{
					if (orderType != null)
					{
						SearchParameters.OrderTypes.Add(orderType);
					}
				}
				else
				{
					if (SearchParameters.OrderTypes.Contains(orderType))
					{
						SearchParameters.OrderTypes.Remove(orderType);
					}
				}

				var rent = SearchParameters.OrderTypes.FirstOrDefault(s => s.OrderTypeID == 2);
				tblkPricePerDayHeader.Visibility = spPricePerDayHeader.Visibility = rent != null ? Visibility.Visible : Visibility.Collapsed;
			}
		}

		private void CheckBoxRealEstateTypes_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				EstateType realEstateType = (EstateType)checkbox.CommandParameter;
				if (checkbox.IsChecked.GetValueOrDefault(false))
				{
					if (realEstateType != null)
					{
						SearchParameters.RealEstateTypes.Add(realEstateType);
					}
				}
				else
				{
					if (SearchParameters.RealEstateTypes.Contains(realEstateType))
					{
						SearchParameters.RealEstateTypes.Remove(realEstateType);
					}
				}

				var hasHouse = SearchParameters.RealEstateTypes.FirstOrDefault(s => s.EstateTypeID == 2) != null;
				var onlyEarth = SearchParameters.RealEstateTypes.FirstOrDefault(s => s.EstateTypeID == 3) != null && SearchParameters.RealEstateTypes.Count == 1;
				var hasOfficePlace = SearchParameters.RealEstateTypes.FirstOrDefault(s => s.EstateTypeID == 4) != null;

				HouseAddonsVisible = hasHouse ? Visibility.Visible : Visibility.Collapsed;
				OfficePlaceAddonsVisibility = hasOfficePlace ? Visibility.Visible : Visibility.Collapsed;
				NotEarthPlaceAddonsVisibility = onlyEarth ? Visibility.Collapsed : Visibility.Visible;
			}
		}

		private void CheckBoxRegion_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				if (Streets == null) Streets = new ObservableCollection<Street>();
				Region region = (Region)checkbox.CommandParameter;
				if (checkbox.IsChecked.GetValueOrDefault(false))
				{
					if (region != null)
					{
						SearchParameters.Regions.Add(region);
						var streets = Session.Inst.BEManager.GetStreets(region, Session.Inst.OfflineMode);
						foreach (Street street in streets)
						{
							Streets.Add(street);
						}
					}
					if (Streets.Count > 0)
					{
						gbStreets.Visibility = Visibility.Visible;
					}
				}
				else
				{
					if (SearchParameters.Regions.Contains(region))
					{
						SearchParameters.Regions.Remove(region);
						var streets = Streets.Where(s => s.RegionID == region.RegionID).ToList();
						foreach (Street street in streets)
						{
							Streets.Remove(street);
						}
					}
					if (Streets.Count <= 0)
					{
						gbStreets.Visibility = Visibility.Collapsed;
					}
				}
			}
		}

		private void CheckBoxRemonts_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				Remont remont = (Remont)checkbox.CommandParameter;
				if (checkbox.IsChecked.GetValueOrDefault(false))
				{
					if (remont != null)
					{
						SearchParameters.Remonts.Add(remont);
					}
				}
				else
				{
					if (SearchParameters.Remonts.Contains(remont))
					{
						SearchParameters.Remonts.Remove(remont);
					}
				}
			}
		}

		private void CheckBoxStreet_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				Street street = (Street)checkbox.CommandParameter;
				if (checkbox.IsChecked.GetValueOrDefault(false))
				{
					if (street != null)
					{
						SearchParameters.Streets.Add(street);
					}
				}
				else
				{
					if (SearchParameters.Streets.Contains(street))
					{
						SearchParameters.Streets.Remove(street);
					}
				}
			}
		}

		private void CheckBoxProjects_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				Project project = (Project)checkbox.CommandParameter;
				if (checkbox.IsChecked.GetValueOrDefault(false))
				{
					if (project != null)
					{
						SearchParameters.Projects.Add(project);
					}
				}
				else
				{
					if (SearchParameters.Projects.Contains(project))
					{
						SearchParameters.Projects.Remove(project);
					}
				}
			}
		}

		private void btnSearch_Click(object sender, RoutedEventArgs e)
		{
			if (SearchParameters.PriceFrom.HasValue)
			{
				SearchParameters.PriceFromInAMD = CalculationHelper.GetPriceInAMD(SearchParameters.PriceFrom, (Currency)cbCurrencies.SelectedItem);
			}
			if (SearchParameters.PriceTo.HasValue)
			{
				SearchParameters.PriceToInAMD = CalculationHelper.GetPriceInAMD(SearchParameters.PriceTo, (Currency)cbCurrencies.SelectedItem);
			}
			if (SearchParameters.IsOverseas)
			{
				SearchParameters.StateID = null;
			}
			else
			{
				SearchParameters.CountryID = null;
			}
			var listControl = (DragDockPanel)RealEstatesListControlName;
			((RealEstatesList)listControl.FindName("EstatesList")).SearchParameters = null;
			((RealEstatesList)listControl.FindName("EstatesList")).SearchParameters = SearchParameters;
			listControl.MaximizeToggle_Checked(sender, e);
		}

		private void btnClear_Click(object sender, RoutedEventArgs e)
		{
			SearchParameters = new RealEstateSearchParameters { DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose };
			OrderTypes = Session.Inst.BEManager.GetOrderTypesForEstate(Session.Inst.User, Session.Inst.OfflineMode);
			RealEstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
			Remonts = Session.Inst.BEManager.GetRemonts(Session.Inst.OfflineMode);
			Projects = Session.Inst.BEManager.GetProjects(Session.Inst.OfflineMode);
			Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
			gbStreets.Visibility = Visibility.Collapsed;
			Streets = new ObservableCollection<Street>();
			BuildingTypes = Session.Inst.BEManager.GetBuildingTypes(Session.Inst.OfflineMode);
		}

		private void cbStates_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (cbStates.SelectedItem != null)
			{
				SearchParameters.CityID = null;
				Cities = Session.Inst.BEManager.GetCities(cbStates.SelectedItem as State, Session.Inst.OfflineMode);
			}
			else
			{
				//if (!SearchParameters.IsOverseas)
				//{
				//	Cities = null;
				//}
				Regions = null;
				RegionsSingle = null;
				Streets = new ObservableCollection<Street>();
				StreetsSingle = new List<Street>();
			}
		}

		private void cbCities_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (cbCities.SelectedItem != null)
			{
				RegionsSingle = Regions = Session.Inst.BEManager.GetRegions((cbCities.SelectedItem as City).CityID, Session.Inst.User, Session.Inst.OfflineMode);
			}
			else
			{
				Regions = new List<Region>();
				Streets = new ObservableCollection<Street>();
				StreetsSingle = new List<Street>();
			}
		}

		public void RefreshData()
		{
			LoadData();
		}

		private void searchControl_Loaded(object sender, RoutedEventArgs e)
		{
			LoadData();
			SearchParameters = new RealEstateSearchParameters { StateID = 1, CityID = 1, DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose };
			Streets = new ObservableCollection<Street>();
			tblkPricePerDayHeader.Visibility = spPricePerDayHeader.Visibility = Visibility.Collapsed;
		}

		private void chkConvenient_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				Convenient convenient = (Convenient)checkbox.CommandParameter;
				if (checkbox.IsChecked ?? false)
				{
					if (convenient != null && SearchParameters.EstateConvenients.FirstOrDefault(s => s.ID == convenient.ID) == null)
					{
						SearchParameters.EstateConvenients.Add(new Convenient { ID = convenient.ID });
					}
				}
				else
				{
					var conv = SearchParameters.EstateConvenients.FirstOrDefault(s => s.ID == convenient.ID);
					if (conv != null)
					{
						SearchParameters.EstateConvenients.Remove(conv);
					}
				}
			}
		}


		private void cbRegions_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (cbRegions.SelectedItem != null)
			{
				StreetsSingle = Session.Inst.BEManager.GetStreets((cbRegions.SelectedItem as Region), Session.Inst.OfflineMode);
			}
			else
			{
				StreetsSingle = new List<Street>();
			}	
		}

		private void CheckBoxBuildingTypes_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				BuildingType buildingType = (BuildingType)checkbox.CommandParameter;
				if (checkbox.IsChecked ?? false)
				{
					if (buildingType != null)
					{
						SearchParameters.BuildingTypes.Add(buildingType);
					}
				}
				else
				{
					if (SearchParameters.BuildingTypes.Contains(buildingType))
					{
						SearchParameters.BuildingTypes.Remove(buildingType);
					}
				}
			}
		}

		private void StackPanel_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
		{
			if(e.Key == System.Windows.Input.Key.Enter)
			{
				btnSearch_Click(sender, new RoutedEventArgs());
				e.Handled = true;
			}
		}

		private void CheckBox_MouseEnter(object sender, System.Windows.Input.MouseEventArgs e)
		{
			if (e.LeftButton == System.Windows.Input.MouseButtonState.Pressed)
			{
				var checkbox = sender as CheckBox;
				checkbox.IsChecked = !checkbox.IsChecked;
				//e.Handled = true;
			}
		}

		private void cbCountries_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (cbCountries.SelectedValue == null) return;
			SearchParameters.CityID = null;
			Cities = Session.Inst.BEManager.GetCitiesByCountry((int) cbCountries.SelectedValue, Session.Inst.OfflineMode).ToList();
		}

		private void chkIsOverseas_CheckedChanged(object sender, RoutedEventArgs e)
		{
			SearchParameters.CityID = null;
			SearchParameters.StreetID = null;
			SearchParameters.AptNumber = string.Empty;
			SearchParameters.HomeNumber = string.Empty;
			SearchParameters.RegionID = null;
			Cities = null;
			BindingExpression expression = null;
			if (chkIsOverseas.IsChecked ?? false)
			{
				expression = cbCountries.GetBindingExpression(ComboBox.SelectedValueProperty);
				cbCountries_SelectionChanged(sender, null);
			}
			else
			{
				expression = cbStates.GetBindingExpression(ComboBox.SelectedValueProperty);
				cbStates_SelectionChanged(sender, null);
			}
			expression.UpdateSource();
		}
	}
}
