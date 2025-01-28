using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using AK.Converters;
using Microsoft.Win32;
using System.Collections.ObjectModel;
using System.Linq;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using RealEstateApp.CustomControls;
using Shared.Helpers;
using System.Threading;

namespace UserControls
{
    /// <summary>
    /// Interaction logic for UserControl1.xaml
    /// </summary>
	public partial class AddEditRealEstate
    {
        #region DependencyProperties

        public ObservableCollection<Convenient> OfficePlaceConvenients
        {
            get { return (ObservableCollection<Convenient>)GetValue(OfficePlaceConvenientsProperty); }
            set { SetValue(OfficePlaceConvenientsProperty, value); }
        }

        // Using a DependencyProperty as the backing store for OfficePlaceConvenients.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty OfficePlaceConvenientsProperty =
            DependencyProperty.Register("OfficePlaceConvenients", typeof(ObservableCollection<Convenient>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnOfficePlaceConvenientsChanged));

        private static void OnOfficePlaceConvenientsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = d as AddEditRealEstate;
            if (form != null)
            {
                form.OfficePlaceConvenients = (ObservableCollection<Convenient>)e.NewValue;
            }
        }


        public ObservableCollection<String> EstateVideos
        {
            get { return (ObservableCollection<String>)GetValue(EstateVideosProperty); }
            set { SetValue(EstateVideosProperty, value); }
        }

        // Using a DependencyProperty as the backing store for EstateVideos.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty EstateVideosProperty =
            DependencyProperty.Register("EstateVideos", typeof(ObservableCollection<String>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnEstateVideosChanged));

        private static void OnEstateVideosChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = d as AddEditRealEstate;
            if (form != null)
            {
                form.EstateVideos = (ObservableCollection<string>)e.NewValue;
            }
        }


        public List<Roofing> Roofings
        {
            get { return (List<Roofing>)GetValue(RoofingsProperty); }
            set { SetValue(RoofingsProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Roofings.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty RoofingsProperty =
            DependencyProperty.Register("Roofings", typeof(List<Roofing>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnRoofingsChanged));

        private static void OnRoofingsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = d as AddEditRealEstate;
            if (form != null)
            {
                form.Roofings = (List<Roofing>)e.NewValue;
            }
        }


        public List<OperationalSignificance> OperationalSignificances
        {
            get { return (List<OperationalSignificance>)GetValue(OperationalSignificancesProperty); }
            set { SetValue(OperationalSignificancesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for OperationalSignificances.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty OperationalSignificancesProperty =
            DependencyProperty.Register("OperationalSignificances", typeof(List<OperationalSignificance>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnOperationalSignificancesChanged));

        private static void OnOperationalSignificancesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = d as AddEditRealEstate;
            if (form != null)
            {
                form.OperationalSignificances = (List<OperationalSignificance>)e.NewValue;
            }
        }

        public List<SignificanceOfTheUse> SignificanceOfTheUses
        {
            get { return (List<SignificanceOfTheUse>)GetValue(SignificanceOfTheUsesProperty); }
            set { SetValue(SignificanceOfTheUsesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SignificanceOfTheUses.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SignificanceOfTheUsesProperty =
            DependencyProperty.Register("SignificanceOfTheUses", typeof(List<SignificanceOfTheUse>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnSignificanceOfTheUsesChanged));

        private static void OnSignificanceOfTheUsesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = d as AddEditRealEstate;
            if (form != null)
            {
                form.SignificanceOfTheUses = (List<SignificanceOfTheUse>)e.NewValue;
            }
        }


        public FavoriteEstates FavoriteEstatesControl
        {
            get { return (FavoriteEstates)GetValue(FavoriteEstatesControlProperty); }
            set { SetValue(FavoriteEstatesControlProperty, value); }
        }

        // Using a DependencyProperty as the backing store for FavoriteEstatesControl.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty FavoriteEstatesControlProperty =
            DependencyProperty.Register("FavoriteEstatesControl", typeof(FavoriteEstates), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnFavoriteEstatesControlChanged));

        private static void OnFavoriteEstatesControlChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = d as AddEditRealEstate;
            if (form != null)
            {
                form.FavoriteEstatesControl = (FavoriteEstates)e.NewValue;
            }
        }

        public List<User> Brokers
        {
            get { return (List<User>)GetValue(BrokersProperty); }
            set { SetValue(BrokersProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Brokers.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty BrokersProperty =
            DependencyProperty.Register("Brokers", typeof(List<User>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnBrokersChanged));

        private static void OnBrokersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = d as AddEditRealEstate;
            if (form != null)
            {
                form.Brokers = (List<User>)e.NewValue;
            }
        }


        public List<int> Ratings
        {
            get { return (List<int>)GetValue(RatingsProperty); }
            set { SetValue(RatingsProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Ratings.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty RatingsProperty =
            DependencyProperty.Register("Ratings", typeof(List<int>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnRatingsChanged));

        private static void OnRatingsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = sender as AddEditRealEstate;
            if (form != null)
            {
                form.Ratings = (List<int>)e.NewValue;
            }
        }


        public List<OfficePlaceTypeEntity> OfficePlaceTypes
        {
            get { return (List<OfficePlaceTypeEntity>)GetValue(OfficePlaceTypesProperty); }
            set { SetValue(OfficePlaceTypesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for OfficePlaceTypes.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty OfficePlaceTypesProperty =
            DependencyProperty.Register("OfficePlaceTypes", typeof(List<OfficePlaceTypeEntity>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnOfficePlaceTypesChanged));

        private static void OnOfficePlaceTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = sender as AddEditRealEstate;
            if (form != null)
            {
                form.OfficePlaceTypes = (List<OfficePlaceTypeEntity>)e.NewValue;
            }
        }


        public List<GarageTypeEntity> GarageTypes
        {
            get { return (List<GarageTypeEntity>)GetValue(GarageTypesProperty); }
            set { SetValue(GarageTypesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for GarageTypes.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty GarageTypesProperty =
            DependencyProperty.Register("GarageTypes", typeof(List<GarageTypeEntity>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnGarageTypesChanged));

        private static void OnGarageTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = sender as AddEditRealEstate;
            if (form != null)
            {
                form.GarageTypes = (List<GarageTypeEntity>)e.NewValue;
            }
        }


        public List<EarthPlaceTypeEntity> EarthPlaceTypes
        {
            get { return (List<EarthPlaceTypeEntity>)GetValue(EarthPlaceTypesProperty); }
            set { SetValue(EarthPlaceTypesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for EarthPlaceTypes.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty EarthPlaceTypesProperty =
            DependencyProperty.Register("EarthPlaceTypes", typeof(List<EarthPlaceTypeEntity>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnEarthPlaceTypesChanged));

        private static void OnEarthPlaceTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = sender as AddEditRealEstate;
            if (form != null)
            {
                form.EarthPlaceTypes = (List<EarthPlaceTypeEntity>)e.NewValue;
            }
        }


        public List<State> States
        {
            get { return (List<State>)GetValue(StatesProperty); }
            set { SetValue(StatesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for States.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty StatesProperty =
            DependencyProperty.Register("States", typeof(List<State>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnStatesChanged));

        private static void OnStatesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate form = sender as AddEditRealEstate;
            if (form != null)
            {
                form.States = (List<State>)e.NewValue;
            }
        }



        public ObservableCollection<Country> Countries
        {
            get { return (ObservableCollection<Country>)GetValue(CountriesProperty); }
            set { SetValue(CountriesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Countries.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CountriesProperty =
            DependencyProperty.Register("Countries", typeof(ObservableCollection<Country>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnCountriesChanged));

        private static void OnCountriesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((AddEditRealEstate)d).Countries = (ObservableCollection<Country>)e.NewValue;
        }


        public Estate RealEstate
        {
            get { return (Estate)GetValue(RealEstateProperty); }
            set { SetValue(RealEstateProperty, value); }
        }

        // Using a DependencyProperty as the backing store for RealEstate.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty RealEstateProperty =
            DependencyProperty.Register("RealEstate", typeof(Estate), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnRealEstateChanged));

        private static void OnRealEstateChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
            if (wnd != null)
            {
                var estate = (Estate)e.NewValue;
                wnd.RealEstate = estate;
                if (estate != null)
                {
                    if (estate.EstateConvenients != null && estate.EstateConvenients.Count > 0)
                    {
                        wnd.CheckConvenients();
                    }

                    if (estate.EstateImages != null && estate.EstateImages.Count > 0)
                       // wnd.RealEstateImages = GetImagesFileNames(estate.EstateImages.Where(s => s.IsDeleted == null || s.IsDeleted == false));
                    wnd.RealEstateImages = GetImagesFileNames(estate.EstateImages);
                    if (estate.EstateVideos != null && estate.EstateVideos.Count > 0)
                    {
                        wnd.EstateVideos = new ObservableCollection<string>(estate.EstateVideos.Select(s => string.Format("{0}{1}{2}", Session.Inst.OfflineMode ? Constants.LocalVideosFolderPath : Constants.VideosFolderPath, s.ID, s.FileExtension)));
                    }
                    else
                    {
                        wnd.EstateVideos = new ObservableCollection<string>();
                    }
                }
                wnd.gbAddDetails.UpdateLayout();
            }
        }

        private void CheckConvenients()
        {
            foreach (var item in icConvenients.Items)
            {
                var lvi = icConvenients.ItemContainerGenerator.ContainerFromItem(item);
                if (lvi != null)
                {
                    ContentPresenter cp = (ContentPresenter)lvi;
                    CheckBox ckbx = (CheckBox)cp.ContentTemplate.FindName("chkConvenient", cp);
                    var convenient = RealEstate.EstateConvenients.FirstOrDefault(s => s.ConvenientID == ((Convenient)ckbx.CommandParameter).ID);
                    ckbx.IsChecked = convenient != null;
                }
            }
        }

        public static ObservableCollection<EstateImage> GetImagesFileNames(IEnumerable<EstateImage> images)
        {
            foreach (EstateImage image in images.Where(s => s.IsDeleted == null || s.IsDeleted == false))
            {
                image.ImageFilePath = string.Format("{0}{1}.{2}",
                                                    Session.Inst.OfflineMode
                                                        ? Constants.LocalImagesFolderPath
                                                        : Constants.ImagesFolderPath, image.ImageID,
                                                    (ImageTypes)image.ImageTypeID.GetValueOrDefault(1));
            }
            return new ObservableCollection<EstateImage>(images);
        }

        public List<EstateType> RealEstateTypes
        {
            get { return (List<EstateType>)GetValue(RealEstateTypesProperty); }
            set { SetValue(RealEstateTypesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for RealEstateTypes.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty RealEstateTypesProperty =
            DependencyProperty.Register("RealEstateTypes", typeof(List<EstateType>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnRealEstateTypesChanged));

        private static void OnRealEstateTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
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
            DependencyProperty.Register("Projects", typeof(List<Project>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnProjectsChanged));

        private static void OnProjectsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
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
            DependencyProperty.Register("OrderTypes", typeof(List<OrderType>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnOrderTypesChanged));

        private static void OnOrderTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
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
            DependencyProperty.Register("BuildingTypes", typeof(List<BuildingType>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnBuildingTypesChanged));

        private static void OnBuildingTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
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
            DependencyProperty.Register("Remonts", typeof(List<Remont>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnRemontsChanged));

        private static void OnRemontsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
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
            DependencyProperty.Register("Regions", typeof(List<Region>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnRegionsChanged));

        private static void OnRegionsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
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
            DependencyProperty.Register("Cities", typeof(List<City>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnCitiesChanged));

        private static void OnCitiesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
            if (wnd != null)
            {
                wnd.Cities = (List<City>)e.NewValue;
            }
        }



        public List<Currency> Currencies
        {
            get { return (List<Currency>)GetValue(CurrenciesProperty); }
            set { SetValue(CurrenciesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CurrenciesProperty =
            DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnCurrenciesChanged));

        private static void OnCurrenciesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
            if (wnd != null)
            {
                wnd.Currencies = (List<Currency>)e.NewValue;
            }
        }



        public List<Street> Streets
        {
            get { return (List<Street>)GetValue(StreetsProperty); }
            set { SetValue(StreetsProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Streets.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty StreetsProperty =
            DependencyProperty.Register("Streets", typeof(List<Street>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnStreetsChanged));

        private static void OnStreetsChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
            if (wnd != null)
            {
                wnd.Streets = (List<Street>)e.NewValue;
            }
        }

        public ObservableCollection<EstateImage> RealEstateImages
        {
            get { return (ObservableCollection<EstateImage>)GetValue(RealEstateImagesProperty); }
            set { SetValue(RealEstateImagesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for RealEstateImages.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty RealEstateImagesProperty =
            DependencyProperty.Register("RealEstateImages", typeof(ObservableCollection<EstateImage>), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnRealEstateImagesChanged));

        private static void OnRealEstateImagesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
            if (wnd != null)
            {
                wnd.RealEstateImages = (ObservableCollection<EstateImage>)e.NewValue;
            }
        }

        public DragDockPanel RealEstatesListControl
        {
            get { return (DragDockPanel)GetValue(RealEstatesListControlProperty); }
            set { SetValue(RealEstatesListControlProperty, value); }
        }

        // Using a DependencyProperty as the backing store for RealEstatesListControl.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty RealEstatesListControlProperty =
            DependencyProperty.Register("RealEstatesListControl", typeof(DragDockPanel), typeof(AddEditRealEstate), new UIPropertyMetadata(null, OnRealEstatesListControlChanged));

        private static void OnRealEstatesListControlChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AddEditRealEstate wnd = sender as AddEditRealEstate;
            if (wnd != null)
            {
                wnd.RealEstatesListControl = (DragDockPanel)e.NewValue;
            }
        }



        public bool IsSiteImagesSelectionEnabled
        {
            get { return (bool)GetValue(IsSiteImagesSelectionEnabledProperty); }
            set { SetValue(IsSiteImagesSelectionEnabledProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsSiteImagesSelectionEnabled.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsSiteImagesSelectionEnabledProperty =
            DependencyProperty.Register("IsSiteImagesSelectionEnabled", typeof(bool), typeof(AddEditRealEstate), new UIPropertyMetadata(false));


        #endregion

        public AddEditRealEstate()
        {
            InitializeComponent();
            CultureResources.CultureChanged += CultureResources_CultureChanged;
        }

        void CultureResources_CultureChanged(object sender, EventArgs e)
        {
            if (RealEstate != null)
            {
                int i = RealEstate.EstateID;
                RealEstate.EstateID = -1;
                RealEstate.EstateID = i;
            }

        }

        private void LoadData()
        {
            //Cities = Session.Inst.BEManager.GetCities();
            List<EarthPlaceTypeEntity> earthPlaceTypes = Session.Inst.BEManager.GetEarthPlaceTypes();
            if (earthPlaceTypes != null)
            {
                earthPlaceTypes.Insert(0, new EarthPlaceTypeEntity { ID = -1, Name = CultureResources.Inst["NotSpecified"] });
                EarthPlaceTypes = earthPlaceTypes;
            }

            var remonts = Session.Inst.BEManager.GetRemonts(Session.Inst.OfflineMode);
            if (remonts != null)
            {
                remonts.Insert(0, new Remont { RemontID = -1, Name = CultureResources.Inst["NotSpecified"] });
                Remonts = remonts;
            }

            var projects = Session.Inst.BEManager.GetProjects(Session.Inst.OfflineMode);
            if (projects != null)
            {
                projects.Insert(0, new Project { ProjectID = -1, Name = CultureResources.Inst["NotSpecified"] });
                Projects = projects;
            }

            List<BuildingType> buildingTypes = Session.Inst.BEManager.GetBuildingTypes(Session.Inst.OfflineMode);
            if (buildingTypes != null)
            {
                buildingTypes.Insert(0, new BuildingType { BuildingTypeID = -1, Name = CultureResources.Inst["NotSpecified"] });
                BuildingTypes = buildingTypes;
            }

            OrderTypes = Session.Inst.BEManager.GetOrderTypesForEstate(Session.Inst.User, Session.Inst.OfflineMode);
            RealEstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
            Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
            States = Session.Inst.BEManager.GetStates(Session.Inst.User, Session.Inst.OfflineMode);
            OfficePlaceConvenients = Session.Inst.BEManager.GetConvenients(Session.Inst.OfflineMode);
            Countries = Session.Inst.BEManager.GetCountries(Session.Inst.OfflineMode);
            List<GarageTypeEntity> garageTypes = Session.Inst.BEManager.GetGarageTypes();
            if (garageTypes != null)
            {
                garageTypes.Insert(0, new GarageTypeEntity { ID = -1, Name = CultureResources.Inst["NotSpecified"] });
                GarageTypes = garageTypes;
            }

            List<OfficePlaceTypeEntity> officePlaceTypes = Session.Inst.BEManager.GetOfficePlaceTypes();
            if (officePlaceTypes != null)
            {
                officePlaceTypes.Insert(0, new OfficePlaceTypeEntity { ID = -1, Name = CultureResources.Inst["NotSpecified"] });
                OfficePlaceTypes = officePlaceTypes;
            }

            //Streets = StreetManager.GetStreets((Region)cbRegions.SelectedItem);

            LoadRatings();

            List<User> brokers = Session.Inst.BEManager.GetBrokers(Session.Inst.OfflineMode);
            if (brokers != null)
            {
                brokers.Insert(0, new User { ID = -1, Name = CultureResources.Inst["NotSpecified"] });
                Brokers = brokers;
            }

            List<Roofing> roofings = Session.Inst.BEManager.GetRoofings(Session.Inst.OfflineMode);
            if (roofings != null)
            {
                roofings.Insert(0, new Roofing { ID = -1, Name = CultureResources.Inst["NotSpecified"] });
                Roofings = roofings;
            }
        }

        private void LoadRatings()
        {
            List<int> list = new List<int>();

            for (int i = Session.Inst.MainSettings.RatingFrom; i <= Session.Inst.MainSettings.RatingTo; i++)
            {
                list.Add(i);
            }
            Ratings = list;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (!RealEstate.Validate())
            {
                MessageBox.Show(string.Format(CultureResources.Inst["PleaseFillTheFollowingFieldsX"], RealEstate.ErrorMessage), CultureResources.Inst["InputError"]);
                return;
            }
            if (!string.IsNullOrEmpty(RealEstate.Code))
            {
                var isCodeValid = Session.Inst.BEManager.ValidateEstateCode(RealEstate);
                if (!isCodeValid)
                {
                    MessageBox.Show(CultureResources.Inst["EstateWithSameCodeExist"], CultureResources.Inst["CodeDuplicate"], MessageBoxButton.OK, MessageBoxImage.Error);
                    txtCode.Focus();
                    return;
                }
            }
            CollectData();
            StringBuilder errorMessage = new StringBuilder();
            if (RealEstate.EstateID > 0)
            {

                RealEstate.LastModifiedDate = DateTime.Now;
                if (Session.Inst.BEManager.UpdateEstate(RealEstate, ref errorMessage))
                {
                    Session.Inst.BEManager.UpdateImages(RealEstate.EstateID, RealEstateImages, ref errorMessage);
                    Session.Inst.BEManager.SaveVideos(RealEstate.EstateID, EstateVideos, ref errorMessage);
                    MessageBox.Show(CultureResources.Inst["EstateSuccessfullySaved"], "", MessageBoxButton.OK, MessageBoxImage.Asterisk);
                    RefreshEstateList();
                    RefreshFavoriteEstatesList();
                    ClearFields();
                }
                else
                {
                    MessageBox.Show(CultureResources.Inst["EstateNotSaved"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                if (Session.Inst.BEManager.CheckEstate(RealEstate))
                {
                    var messageBoxResult = MessageBox.Show(CultureResources.Inst["EstateExistYouWantToAdd"],
                                                            CultureResources.Inst["EstateDuplicate"], MessageBoxButton.YesNo, MessageBoxImage.Question);
                    if (messageBoxResult == MessageBoxResult.No)
                    {
                        return;
                    }
                }
                RealEstate.AddDate = DateTime.Now;
                if (Session.Inst.User.IsBroker)
                {
                    RealEstate.BrokerID = Session.Inst.User.ID;
                }
                int realEstateID = Session.Inst.BEManager.SaveRealEstate(RealEstate, ref errorMessage);
                if (realEstateID > 0)
                {


                    if (RealEstateImages.Count > 0)
                    {
                        var singleOfMany = string.Empty; //
                        var conflictedImagesCount = Session.Inst.BEManager.SaveImages(realEstateID, RealEstateImages, ref errorMessage);
                        if (conflictedImagesCount > 1 && Thread.CurrentThread.CurrentCulture.Name == "hy-AM")
                        {
                            singleOfMany = "են";
                        }
                        else
                        {
                            singleOfMany = "ի";
                        }
                        if (conflictedImagesCount == -1)
                        {
                            MessageBox.Show(CultureResources.Inst["PhotosNotSaved"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                        if (conflictedImagesCount > 0)
                        {

                            MessageBox.Show(
                                string.Format(CultureResources.Inst["XPhotoYNotSaved"], conflictedImagesCount,
                                                                                                          conflictedImagesCount > 1 ? CultureResources.Inst["s"] : string.Empty,
                                                                                                          singleOfMany),
                                                                                        CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                    if (EstateVideos != null && EstateVideos.Count > 0)
                    {
                        StringBuilder videosMessage = new StringBuilder();
                        int conflictedVideosCount = Session.Inst.BEManager.SaveVideos(RealEstate.EstateID, EstateVideos, ref videosMessage);
                        var singleOfMany = string.Empty; //
                        if (conflictedVideosCount > 1 && Thread.CurrentThread.CurrentCulture.Name == "hy-AM")
                        {
                            singleOfMany = "են";
                        }
                        else
                        {
                            singleOfMany = "ի";
                        }
                        if (conflictedVideosCount > 0)
                        {
                            MessageBox.Show(
                                string.Format(CultureResources.Inst["XVideoNotSaved"], conflictedVideosCount,
                                                                                                          conflictedVideosCount > 1 ? CultureResources.Inst["s"] : string.Empty,
                                                                                                          singleOfMany),
                                CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                    MessageBox.Show(CultureResources.Inst["EstateSuccessfullySaved"], "", MessageBoxButton.OK, MessageBoxImage.Asterisk);
                    RealEstate = new Estate { CityID = 1, StateID = 1 };
                    ClearFields();
                    RefreshEstateList();

                    Session.Inst.EstatesCount++;
                }
                else
                {
                    MessageBox.Show(CultureResources.Inst["EstateNotSaved"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void RefreshFavoriteEstatesList()
        {
            if (FavoriteEstatesControl == null) return;
            FavoriteEstatesControl.CheckEstateToUpdateList(RealEstate);
        }

        private void RefreshEstateList()
        {
            ((RealEstatesList)RealEstatesListControl.FindName("EstatesList")).RefreshEstates();
        }

        private void CollectData()
        {
            if (cbStreets.SelectedItem == null && !string.IsNullOrEmpty(cbStreets.Text))
            {
                RealEstate.Street = new Street { Name = cbStreets.Text, RegionID = RealEstate.RegionID };
                //Translator.TranslateBackStreets(RealEstate.Street);
            }
            else
            {
                RealEstate.Street = (Street)cbStreets.SelectedItem;
            }

            if (RealEstate.Price.HasValue)
            {
                RealEstate.PriceInAMD = CalculationHelper.GetPriceInAMD(RealEstate.Price, (Currency)cbCurrencies.SelectedItem);
            }

            if ((chkPricePerDay.IsChecked ?? false) && (!RealEstate.PricePerDay.HasValue || RealEstate.PricePerDay.Value <= 0))
            {
                RealEstate.PricePerDay = null;
            }
            else
            {
                RealEstate.PricePerDayInAMD = CalculationHelper.GetPriceInAMD(RealEstate.PricePerDay, (Currency)cbCurrencies.SelectedItem);
            }

        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            ClearFields();
        }

        private void ClearFields()
        {
            RealEstate = new Estate { CityID = 1, StateID = 1 };
            RealEstateImages = new ObservableCollection<EstateImage>();
            EstateVideos = new ObservableCollection<string>();
            if (!string.IsNullOrEmpty(cbStreets.Text))
            {
                cbStreets.Text = string.Empty;
            }
        }

        private void btnAddImages_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
                                                {
                                                    CheckFileExists = true,
                                                    Filter = "Image Files|*.jpg;*.jpeg;*.gif;*.png;*.bmp",
                                                    //InitialDirectory = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location),
                                                    Multiselect = true,
                                                    RestoreDirectory = true,
                                                    Title = CultureResources.Inst["SelectPhotos"]
                                                };
            if (openFileDialog.ShowDialog().GetValueOrDefault(false))
            {
                if (openFileDialog.FileNames.Length > 0)
                {
                    foreach (string fileName in openFileDialog.FileNames)
                    {
                        RealEstateImages.Add(new EstateImage { ImageFilePath = fileName });
                    }
                }
            }
        }

        private void btnRemoveImage_Click(object sender, RoutedEventArgs e)
        {
            var image = ((Button)sender).CommandParameter as EstateImage;
            if (RealEstateImages.Contains(image))
            {
                RealEstateImages.Remove(image);
                //int imageID = AKConvert.ToInt32(Path.GetFileNameWithoutExtension(image));
                if (image.ImageID > 0)
                {
                    Session.Inst.BEManager.RemoveImage(image.ImageID);
                    //RefreshEstateList();
                }
            }
        }

        private void cbRegions_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cbRegions.SelectedItem != null)
            {
                List<Street> streets = Session.Inst.BEManager.GetStreets((Region)cbRegions.SelectedItem, Session.Inst.OfflineMode);
                streets.Insert(0, new Street { StreetID = -1, Name = CultureResources.Inst["NotSpecified"] });
                Streets = streets;
            }
            else
            {
                Streets = new List<Street>();
            }
        }

        private void cbCities_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cbCities.SelectedItem != null)
            {
                List<Region> regions = Session.Inst.BEManager.GetRegions(((City)cbCities.SelectedItem).CityID, Session.Inst.User, Session.Inst.OfflineMode);
                regions.Insert(0, new Region { RegionID = -1, Name = CultureResources.Inst["NotSpecified"] });
                Regions = regions;
            }
            else
            {
                Regions = new List<Region>();
            }
        }

        private void cbStates_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cbStates.SelectedItem != null)
            {
                List<City> cities = Session.Inst.BEManager.GetCities(cbStates.SelectedItem as State, Session.Inst.OfflineMode);
                cities.Insert(0, new City { CityID = -1, Name = CultureResources.Inst["NotSpecified"] });
                Cities = cities;
            }
            else
            {
                Cities = new List<City>();
            }
        }

        public void RefreshData()
        {
            LoadData();
        }

        private void cbRealEstateType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            List<SignificanceOfTheUse> significanceOfTheUses = Session.Inst.BEManager.GetSignificanceOfTheUses(cbRealEstateType.SelectedItem as EstateType, Session.Inst.OfflineMode);
            if (significanceOfTheUses != null)
            {
                significanceOfTheUses.Insert(0, new SignificanceOfTheUse { ID = -1, Name = CultureResources.Inst["NotSpecified"] });
                SignificanceOfTheUses = significanceOfTheUses;
            }
        }

        private void cbSignificanceOfTheUses_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            List<OperationalSignificance> operationalSignificances = Session.Inst.BEManager.GetOperationalSignificances(cbSignificanceOfTheUses.SelectedItem as SignificanceOfTheUse, Session.Inst.OfflineMode);
            if (operationalSignificances != null)
            {
                operationalSignificances.Insert(0, new OperationalSignificance { ID = -1, Name = CultureResources.Inst["NotSpecified"] });
                OperationalSignificances = operationalSignificances;
            }
        }

        private void btnAddVideo_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                CheckFileExists = true,
                Filter = "Video Files|*.avi;*.mp4;*.3gp;*.wmv",
                //InitialDirectory = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location),
                Multiselect = true,
                RestoreDirectory = true,
                Title = CultureResources.Inst["SelectVideos"]
            };
            if (openFileDialog.ShowDialog().GetValueOrDefault(false))
            {
                if (openFileDialog.FileNames.Length > 0)
                {
                    foreach (string fileName in openFileDialog.FileNames)
                    {
                        EstateVideos.Add(fileName);
                    }
                    //BindingExpression be = BindingOperations.GetBindingExpression(lstVideos, ItemsControl.ItemsSourceProperty);
                    //if (be != null) be.UpdateSource();
                }
            }
        }

        private void addRealEstate_Loaded(object sender, RoutedEventArgs e)
        {
            LoadData();
            bool b;
            if (bool.TryParse(ConfigurationManager.AppSettings["IsWebEnabled"], out b))
            {
                IsSiteImagesSelectionEnabled = b;
            }
            if (!IsSiteImagesSelectionEnabled)
            {
                if (bool.TryParse(ConfigurationManager.AppSettings["IsImageUploadEnabled"], out b))
                {
                    IsSiteImagesSelectionEnabled = b;
                }
            }
            if (RealEstate == null)
            {
                RealEstate = new Estate { CityID = 1, StateID = 1 };
            }
            if (RealEstateImages == null)
            {
                RealEstateImages = new ObservableCollection<EstateImage>();
            }
            if (EstateVideos == null)
            {
                EstateVideos = new ObservableCollection<string>();
            }
        }

        private void btnRemoveVideo_Click(object sender, RoutedEventArgs e)
        {
            var videoPath = ((Button)sender).CommandParameter.ToString();
            if (videoPath.Contains(Constants.VideosFolderPath))
            {
                Session.Inst.BEManager.DeleteVideo(videoPath);
            }
            EstateVideos.Remove(videoPath);
        }

        private void chkConvenient_Checked(object sender, RoutedEventArgs e)
        {
            CheckBox checkbox = (CheckBox)sender;
            if (checkbox != null)
            {
                Convenient convenient = (Convenient)checkbox.CommandParameter;
                if (checkbox.IsChecked ?? false)
                {
                    if (convenient != null && RealEstate.EstateConvenients.FirstOrDefault(s => s.ConvenientID == convenient.ID) == null)
                    {
                        RealEstate.EstateConvenients.Add(new EstateConvenient { ConvenientID = convenient.ID });
                    }
                }
                else
                {
                    var conv = RealEstate.EstateConvenients.FirstOrDefault(s => s.ConvenientID == convenient.ID);
                    if (conv != null)
                    {
                        RealEstate.EstateConvenients.Remove(conv);
                    }
                }
            }
        }

        private void icConvenients_Loaded(object sender, RoutedEventArgs e)
        {
            if (RealEstate.EstateConvenients != null && RealEstate.EstateConvenients.Count > 0)
            {
                CheckConvenients();
            }
        }

        private void btnMap_Click(object sender, RoutedEventArgs e)
        {
            GoogleMapViewer mapViewer = null;
            if (RealEstate.Street != null && !string.IsNullOrEmpty(RealEstate.Street.Name))
            {
                mapViewer = new GoogleMapViewer(RealEstate.Street.Name);
            }
            else
            {
                mapViewer = new GoogleMapViewer();
            }
            if (mapViewer.ShowDialog() ?? false)
            {
                RealEstate.Lat = mapViewer.Lat;
                RealEstate.Lng = mapViewer.Lng;
            }
        }

        private void Grid_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == System.Windows.Input.Key.Enter && (((FrameworkElement)e.OriginalSource).Name != "txtAdditionalInformation" &&
                                                            ((FrameworkElement)e.OriginalSource).Name != "txtAdditionalInformationSite"))
            {
                if (vpEstate.IsValid)
                {
                    btnSave_Click(sender, new RoutedEventArgs());
                }
            }
        }

        private void miMakeMain_Click(object sender, RoutedEventArgs e)
        {
            var estateImage = (sender as MenuItem).Tag as EstateImage;
            foreach (EstateImage image in RealEstateImages)
            {
                image.IsMain = false;
            }
            estateImage.IsMain = true;
        }

        private void cbCountries_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(RealEstate.CountryID.HasValue)
            {
                Cities = Session.Inst.BEManager.GetCitiesByCountry(RealEstate.CountryID.Value, Session.Inst.OfflineMode).ToList();
            }
        }
    }
}
