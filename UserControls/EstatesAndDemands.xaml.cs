using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Business.Managers;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;

namespace UserControls
{
    /// <summary>
    /// Interaction logic for EstatesAndDemands.xaml
    /// </summary>
    public partial class EstatesAndDemands : Window
    {
        public CriteriaFilter ParamFilter
        {
            get { return (CriteriaFilter)GetValue(ParamFilterProperty); }
            set { SetValue(ParamFilterProperty, value); }
        }

        // Using a DependencyProperty as the backing store for ParamFilter.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ParamFilterProperty =
            DependencyProperty.Register("ParamFilter", typeof(CriteriaFilter), typeof(EstatesAndDemands), new PropertyMetadata(null, OnParamFilterChanged));

        private static void OnParamFilterChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((EstatesAndDemands)d).ParamFilter = (CriteriaFilter)e.NewValue;
        }


        public ObservableCollection<NeededEstate> NeededEstates
        {
            get { return (ObservableCollection<NeededEstate>)GetValue(NeededEstatesProperty); }
            set { SetValue(NeededEstatesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for NeededEstates.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty NeededEstatesProperty =
            DependencyProperty.Register("NeededEstates", typeof(ObservableCollection<NeededEstate>), typeof(EstatesAndDemands), new UIPropertyMetadata(null, OnNeededEstatesChanged));

        private static void OnNeededEstatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            EstatesAndDemands form = d as EstatesAndDemands;
            if (form != null)
            {
                form.NeededEstates = (ObservableCollection<NeededEstate>)e.NewValue;
                if (form.NeededEstates.Count > 0)
                {
                    form.dgNeededEstates.SelectedIndex = 0;
                }
            }
        }

        public ObservableCollection<Estate> Estates
        {
            get { return (ObservableCollection<Estate>)GetValue(EstatesProperty); }
            set { SetValue(EstatesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Estates.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty EstatesProperty =
            DependencyProperty.Register("Estates", typeof(ObservableCollection<Estate>), typeof(EstatesAndDemands), new UIPropertyMetadata(null, OnEstatesChanged));

        private static void OnEstatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            EstatesAndDemands form = d as EstatesAndDemands;
            if (form != null)
            {
                form.Estates = (ObservableCollection<Estate>)e.NewValue;
                form.FillRealEstates();
            }
        }


        public EstatesAndDemands()
        {
            InitializeComponent();
            ParamFilter = new CriteriaFilter
            {
                IsEstateTypeEnabled = true,
                IsRoomEnabled = true,
                IsSquareEnabled = true,
                IsPriceEnabled = true,
                IsRegionsEnabled = true,
                IsRemontEnabled = true,
                IsProjectEnabled = true,
                IsBuildingTypesEnabled = true
            };
        }

        public EstatesAndDemands(IEnumerable<NeededEstate> demands)
            : this()
        {
            NeededEstates = new ObservableCollection<NeededEstate>(demands);
        }

        private void dgNeededEstates_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SearchEstatesForDemand();
        }

        private void SearchEstatesForDemand()
        {
            var demand = dgNeededEstates.SelectedItem as NeededEstate;
            if (demand == null) return;

            RealEstateSearchParameters searchParameter = RealEstateSearchParameters.GetSearchParameter(demand);
            if (searchParameter == null) return;
            FilterParameters(searchParameter);
            searchParameter.DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose;
            searchParameter.ItemsCountPerPage = 200;
            int itemsCount;
            Estates = Session.Inst.BEManager.GetSearchedRealEstates(searchParameter, Session.Inst.User, out itemsCount, Session.Inst.OfflineMode);
        }

        private void FilterParameters(RealEstateSearchParameters searchParameter)
        {
            if (!ParamFilter.IsEstateTypeEnabled)
            {
                searchParameter.RealEstateTypes = null;
            }
            if (!ParamFilter.IsBuildingTypesEnabled)
            {
                searchParameter.BuildingTypes = null;
            }
            if (!ParamFilter.IsPriceEnabled)
            {
                searchParameter.PriceFrom = searchParameter.PriceFromInAMD = searchParameter.PricePerDayFrom = searchParameter.PricePerDayFromInAMD = null;
                searchParameter.PricePerDayToInAMD = searchParameter.PricePerDayTo = null;
                searchParameter.PriceTo = searchParameter.PriceToInAMD = null;
            }
            if (!ParamFilter.IsProjectEnabled)
            {
                searchParameter.Projects = null;
            }
            if (!ParamFilter.IsRegionsEnabled)
            {
                searchParameter.Regions = null;
            }
            if (!ParamFilter.IsRemontEnabled)
            {
                searchParameter.Remonts = null;
            }
            if (!ParamFilter.IsRoomEnabled)
            {
                searchParameter.RoomCountFrom = searchParameter.RoomCountTo = null;
            }
            if (!ParamFilter.IsSquareEnabled)
            {
                searchParameter.SquareFrom = searchParameter.SquareTo = null;
            }
        }

        private void FillRealEstates()
        {
            if (Estates == null || Estates.Count == 0) return;

            var Projects = Session.Inst.BEManager.GetProjects(Session.Inst.OfflineMode);
            var Remonts = Session.Inst.BEManager.GetRemonts(Session.Inst.OfflineMode);
            var RealEstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
            var BuildingTypes = Session.Inst.BEManager.GetBuildingTypes(Session.Inst.OfflineMode);
            var Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
            var OrderTypes = Session.Inst.BEManager.GetOrderTypesForEstate(Session.Inst.User, Session.Inst.OfflineMode);
            var Regions = Session.Inst.BEManager.GetRegions(1, Session.Inst.User, Session.Inst.OfflineMode);
            var Streets = Session.Inst.BEManager.GetStreets(Session.Inst.OfflineMode);

            foreach (Estate estate in Estates)
            {
                var tempEstate = estate;
                if (tempEstate.BuildingType != null)
                {
                    estate.BuildingType = BuildingTypes.FirstOrDefault(s => s.BuildingTypeID == tempEstate.BuildingType.BuildingTypeID);
                }
                if (tempEstate.Currency != null)
                {
                    estate.Currency = Currencies.FirstOrDefault(s => s.CurrencyID == tempEstate.Currency.CurrencyID);
                }
                if (tempEstate.OrderType != null)
                {
                    estate.OrderType = OrderTypes.FirstOrDefault(s => s.OrderTypeID == tempEstate.OrderType.OrderTypeID);
                }
                if (estate.Project != null)
                {
                    estate.Project = Projects.FirstOrDefault(s => s.ProjectID == tempEstate.Project.ProjectID);
                }
                if (estate.EstateType != null)
                {
                    estate.EstateType = RealEstateTypes.FirstOrDefault(s => s.EstateTypeID == tempEstate.EstateType.EstateTypeID);
                }
                if (estate.Remont != null)
                {
                    estate.Remont = Remonts.FirstOrDefault(s => s.RemontID == tempEstate.Remont.RemontID);
                }
                if (estate.Region != null)
                {
                    estate.Region = Regions.FirstOrDefault(s => s.RegionID == tempEstate.Region.RegionID);
                }
                if (estate.Street != null)
                {
                    estate.Street = Streets.FirstOrDefault(s => s.StreetID == tempEstate.Street.StreetID);
                }
            }
        }

        private void dgEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            EstateView estateView = new EstateView(dgEstates.SelectedItem as Estate);
            estateView.Show();
        }

        private void btnOK_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            var chk = sender as CheckBox;
            var exp = chk.GetBindingExpression(CheckBox.IsCheckedProperty);
            if (exp != null)
            {
                exp.UpdateSource();
            }
            SearchEstatesForDemand();
        }

        private void mnuOfferClient_Click(object sender, RoutedEventArgs e)
        {
            if (dgNeededEstates.SelectedItem == null || dgEstates.SelectedItems == null || dgEstates.SelectedItems.Count == 0) return;

            //var clientSelectionForm = new ClientSelectionFormForEstate();
            //if (clientSelectionForm.ShowDialog() ?? false)
            //{
            ClientSuggestedEstate suggestedEstate = new ClientSuggestedEstate();
            suggestedEstate.EstatesIds = dgEstates.SelectedItems.OfType<Estate>().Select(s => s.EstateID).ToList();
            suggestedEstate.ClientID = (dgNeededEstates.SelectedItem as NeededEstate).ID;

            suggestedEstate.BrokerID = Session.Inst.User.ID;
            //suggestedEstate.Comment = clientSelectionForm.EstateAndDemand.Comment;
            suggestedEstate.SuggestDate = DateTime.Now;
            if (EstatesAndDemandManager.AddSuggestInfo(suggestedEstate))
            {
                MessageBox.Show(CultureResources.Inst["DataSavedSuccessfully"], string.Empty, MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                MessageBox.Show(CultureResources.Inst["DataSaveError"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
            }
            //}
        }

        private void mnuPrintSelected_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItems != null && dgEstates.SelectedItems.Count > 0)
            {
                PrintColumnsSelectionForm form = new PrintColumnsSelectionForm(dgEstates.SelectedItems.OfType<Estate>().ToList());
                form.ShowDialog();
            }
        }

        private void mnuOpen_Click(object sender, RoutedEventArgs e)
        {
            EstateView view = new EstateView((Estate)dgEstates.SelectedItem);
            view.Show();
        }
    }

    public class CriteriaFilter : BindableObject
    {
        private bool _isEstateTypeEnabled;
        private bool _isRoomEnabled;
        private bool _isSquareEnabled;
        private bool _isPriceEnabled;
        private bool _isRegionsEnabled;
        private bool _isRemontEnabled;
        private bool _isProjectEnabled;
        private bool _isBuildingTypesEnabled;

        public bool IsEstateTypeEnabled
        {
            get { return _isEstateTypeEnabled; }
            set
            {
                _isEstateTypeEnabled = value;
                OnPropertyChanged("IsEstateTypeEnabled");
            }
        }

        public bool IsRoomEnabled
        {
            get { return _isRoomEnabled; }
            set
            {
                _isRoomEnabled = value;
                OnPropertyChanged("IsRoomEnabled");
            }
        }

        public bool IsSquareEnabled
        {
            get { return _isSquareEnabled; }
            set
            {
                _isSquareEnabled = value;
                OnPropertyChanged("IsSquareEnabled");
            }
        }

        public bool IsPriceEnabled
        {
            get { return _isPriceEnabled; }
            set
            {
                _isPriceEnabled = value;
                OnPropertyChanged("IsPriceEnabled");
            }
        }

        public bool IsRegionsEnabled
        {
            get { return _isRegionsEnabled; }
            set
            {
                _isRegionsEnabled = value;
                OnPropertyChanged("IsRegionsEnabled");
            }
        }

        public bool IsRemontEnabled
        {
            get { return _isRemontEnabled; }
            set
            {
                _isRemontEnabled = value;
                OnPropertyChanged("IsRemontEnabled");
            }
        }

        public bool IsProjectEnabled
        {
            get { return _isProjectEnabled; }
            set
            {
                _isProjectEnabled = value;
                OnPropertyChanged("IsProjectEnabled");
            }
        }

        public bool IsBuildingTypesEnabled
        {
            get { return _isBuildingTypesEnabled; }
            set
            {
                _isBuildingTypesEnabled = value;
                OnPropertyChanged("IsBuildingTypesEnabled");
            }
        }
    }
}
