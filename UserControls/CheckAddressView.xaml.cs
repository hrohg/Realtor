using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;
using RealEstateApp.CustomControls;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for CheckAddressView.xaml
	/// </summary>
	public partial class CheckAddressView : Window
	{
		#region Dependency properties

		public RealEstateSearchParameters SearchParameters
		{
			get { return (RealEstateSearchParameters)GetValue(SearchParametersProperty); }
			set { SetValue(SearchParametersProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SearchParameters.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SearchParametersProperty =
			DependencyProperty.Register("SearchParameters", typeof(RealEstateSearchParameters), typeof(CheckAddressView), new UIPropertyMetadata(null, OnSearchParametersChanged));

		private static void OnSearchParametersChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			CheckAddressView sec = sender as CheckAddressView;
			if (sec != null)
			{
				sec.SearchParameters = (RealEstateSearchParameters)e.NewValue;
			}
		}

		public List<Region> Regions
		{
			get { return (List<Region>)GetValue(RegionsProperty); }
			set { SetValue(RegionsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Regions.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RegionsProperty =
			DependencyProperty.Register("Regions", typeof(List<Region>), typeof(CheckAddressView), new UIPropertyMetadata(null, OnRegionsChanged));

		private static void OnRegionsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			CheckAddressView wnd = sender as CheckAddressView;
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
			DependencyProperty.Register("Cities", typeof(List<City>), typeof(CheckAddressView), new UIPropertyMetadata(null, OnCitiesChanged));

		private static void OnCitiesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			CheckAddressView wnd = sender as CheckAddressView;
			if (wnd != null)
			{
				wnd.Cities = (List<City>)e.NewValue;
			}
		}

		public List<Street> StreetsSingle
		{
			get { return (List<Street>)GetValue(StreetsSingleProperty); }
			set { SetValue(StreetsSingleProperty, value); }
		}

		// Using a DependencyProperty as the backing store for StreetsSingle.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StreetsSingleProperty =
			DependencyProperty.Register("StreetsSingle", typeof(List<Street>), typeof(CheckAddressView), new UIPropertyMetadata(null, OnStreetsSingleChanged));

		private static void OnStreetsSingleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			CheckAddressView control = d as CheckAddressView;
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
			DependencyProperty.Register("RegionsSingle", typeof(List<Region>), typeof(CheckAddressView), new UIPropertyMetadata(null, OnRegionsSingleChanged));

		private static void OnRegionsSingleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var control = d as CheckAddressView;
			if (control != null)
			{
				control.RegionsSingle = (List<Region>)e.NewValue;
			}
		}

		public ObservableCollection<Street> Streets
		{
			get { return (ObservableCollection<Street>)GetValue(StreetsProperty); }
			set { SetValue(StreetsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Streets.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StreetsProperty =
			DependencyProperty.Register("Streets", typeof(ObservableCollection<Street>), typeof(CheckAddressView), new UIPropertyMetadata(null, OnStreetsChanged));

		private static void OnStreetsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			CheckAddressView wnd = sender as CheckAddressView;
			if (wnd != null)
			{
				wnd.Streets = (ObservableCollection<Street>)e.NewValue;
			}
		}

		public List<State> States
		{
			get { return (List<State>)GetValue(StatesProperty); }
			set { SetValue(StatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for States.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StatesProperty =
			DependencyProperty.Register("States", typeof(List<State>), typeof(CheckAddressView), new UIPropertyMetadata(null, OnStatesChanged));

		private static void OnStatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			CheckAddressView s = d as CheckAddressView;
			if (s != null)
			{
				s.States = (List<State>)e.NewValue;
			}
		}

		#endregion

		public CheckAddressView(DragDockPanel ddpRealEstatesList)
		{
			InitializeComponent();
			ListControl = ddpRealEstatesList;
			SearchParameters = new RealEstateSearchParameters { IsForCheckAddress = true };
			LoadData();
		}

		private void LoadData()
		{
			States = Session.Inst.BEManager.GetStates(Session.Inst.User, Session.Inst.OfflineMode);
			Regions = Session.Inst.BEManager.GetRegions(1, Session.Inst.User, Session.Inst.OfflineMode);
			Streets = null;
		}

		private DragDockPanel ListControl { get; set; }

		private void cbStates_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (cbStates.SelectedItem != null)
			{
				Cities = Session.Inst.BEManager.GetCities(cbStates.SelectedItem as State, Session.Inst.OfflineMode);
			}
			else
			{
				Cities = null;
				Regions = null;
				RegionsSingle = null;
				Streets = new ObservableCollection<Street>();
				StreetsSingle = new List<Street>();
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

		private void btnCheck_Click(object sender, RoutedEventArgs e)
		{
			((RealEstatesList)ListControl.FindName("EstatesList")).SearchParameters = null;
			((RealEstatesList)ListControl.FindName("EstatesList")).SearchParameters = SearchParameters.Clone() as RealEstateSearchParameters;
			ListControl.MaximizeToggle_Checked(sender, e);
			DialogResult = true;
			Close();
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			DialogResult = false;
			Close();
		}

		private void StackPanel_KeyUp(object sender, KeyEventArgs e)
		{
			if(e.Key == Key.Enter)
			{
				btnCheck_Click(sender, new RoutedEventArgs());
			}
		}
	}
}
