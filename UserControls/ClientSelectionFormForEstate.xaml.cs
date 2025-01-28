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
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using RealEstate.DataAccess.Interfaces;
using RealEstate.DataAccess.SearchCriteria;

namespace UserControls
{
    /// <summary>
    /// Interaction logic for ClientSelectionFormForEstate.xaml
    /// </summary>
    public partial class ClientSelectionFormForEstate : Window
    {
        #region Dependency Properties and properties



        public List<User> Brokers
        {
            get { return (List<User>)GetValue(BrokersProperty); }
            set { SetValue(BrokersProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Brokers.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty BrokersProperty =
            DependencyProperty.Register("Brokers", typeof(List<User>), typeof(ClientSelectionFormForEstate), new UIPropertyMetadata(null, OnBrokersChanged));

        private static void OnBrokersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ClientSelectionFormForEstate selectionFormForEstate = d as ClientSelectionFormForEstate;
            if (selectionFormForEstate != null)
            {
                selectionFormForEstate.Brokers = (List<User>)e.NewValue;
            }
        }


        public EstatesAndDemand EstateAndDemand { get; set; }

        public IDemandEstateDisplayData SelectedEstateDemand
        {
            get { return (IDemandEstateDisplayData)GetValue(SelectedEstateDemandProperty); }
            set { SetValue(SelectedEstateDemandProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SelectedEstateDemand.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedEstateDemandProperty =
            DependencyProperty.Register("SelectedEstateDemand", typeof(IDemandEstateDisplayData), typeof(ClientSelectionFormForEstate), new UIPropertyMetadata(null, OnSelectedEstateDemandChanged));

        private static void OnSelectedEstateDemandChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ClientSelectionFormForEstate selectionFormForEstate = d as ClientSelectionFormForEstate;
            if (selectionFormForEstate != null)
            {
                selectionFormForEstate.SelectedEstateDemand = (IDemandEstateDisplayData)e.NewValue;
            }
        }


        public DemandSearchCriteria SearchParameters
        {
            get { return (DemandSearchCriteria)GetValue(SearchParametersProperty); }
            set { SetValue(SearchParametersProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SearchParameters.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SearchParametersProperty =
            DependencyProperty.Register("SearchParameters", typeof(DemandSearchCriteria), typeof(ClientSelectionFormForEstate), new UIPropertyMetadata(null, OnSearchParametersChanged));

        private static void OnSearchParametersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ClientSelectionFormForEstate selectionFormForEstate = d as ClientSelectionFormForEstate;
            if (selectionFormForEstate != null)
            {
                selectionFormForEstate.SearchParameters = (DemandSearchCriteria)e.NewValue;
            }
        }

        public ObservableCollection<IDemandEstateDisplayData> Demands
        {
            get { return (ObservableCollection<IDemandEstateDisplayData>)GetValue(DemandsProperty); }
            set { SetValue(DemandsProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Demands.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty DemandsProperty =
            DependencyProperty.Register("Demands", typeof(ObservableCollection<IDemandEstateDisplayData>), typeof(ClientSelectionFormForEstate), new UIPropertyMetadata(null, OnDemandsChanged));

        private static void OnDemandsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ClientSelectionFormForEstate selectionFormForEstate = d as ClientSelectionFormForEstate;
            if (selectionFormForEstate != null)
            {
                selectionFormForEstate.Demands = (ObservableCollection<IDemandEstateDisplayData>)e.NewValue;
            }
        }

        public bool IsForEstateSearch
        {
            get { return (bool)GetValue(IsForEstateSearchProperty); }
            set { SetValue(IsForEstateSearchProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsForEstateSearch.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsForEstateSearchProperty =
            DependencyProperty.Register("IsForEstateSearch", typeof(bool), typeof(ClientSelectionFormForEstate), new UIPropertyMetadata(false, OnIsForEstateSearchChanged));

        private static void OnIsForEstateSearchChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ClientSelectionFormForEstate selectionFormForEstate = d as ClientSelectionFormForEstate;
            if (selectionFormForEstate != null)
            {
                selectionFormForEstate.IsForEstateSearch = (bool)e.NewValue;
            }
        }

        #endregion

        public ClientSelectionFormForEstate()
        {
            InitializeComponent();
            SearchParameters = new DemandSearchCriteria();
        }

        public ClientSelectionFormForEstate(bool isForEstateSearch)
            : this()
        {
            IsForEstateSearch = isForEstateSearch;
        }



        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            SearchDemands();
        }

        private void SearchDemands()
        {
            Demands = new ObservableCollection<IDemandEstateDisplayData>(Session.Inst.BEManager.GetDemands(SearchParameters).OfType<IDemandEstateDisplayData>());
        }

        private void dgEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dgDemands.SelectedItem != null && dgDemands.SelectedItem is Estate)
            {
                OpenEstate(dgDemands.SelectedItem as Estate);
            }
        }

        private void txtName_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                SearchDemands();
            }
        }

        private void btnOK_Click(object sender, RoutedEventArgs e)
        {
            if (SelectedEstateDemand == null)
            {
                var caption = IsForEstateSearch ? CultureResources.Inst["SelectEstate"] : CultureResources.Inst["SelectDemand"];
                var message = IsForEstateSearch ? CultureResources.Inst["PleaseSelectEstate"] : CultureResources.Inst["PleaseSelectDemand"];
                MessageBox.Show(message, caption, MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            if (dpDate.SelectedDate == null)
            {
                MessageBox.Show(CultureResources.Inst["PleaseSelectDate"], CultureResources.Inst["SelectDate"], MessageBoxButton.OK, MessageBoxImage.Warning);
                dpDate.Focus();
                return;
            }
            //if(cbBroker.SelectedValue == null)
            //{
            //    MessageBox.Show("Please select broker", "Select broker", MessageBoxButton.OK, MessageBoxImage.Warning);
            //    cbBroker.Focus();
            //    return;
            //}

            this.EstateAndDemand = new EstatesAndDemand
            {
                ShowDate = dpDate.SelectedDate,
                Comment = txtComment.Text
            };
            if (cbBroker.SelectedValue != null)
            {
                this.EstateAndDemand.BrokerID = (int)cbBroker.SelectedValue;
            }
            if (IsForEstateSearch)
            {
                this.EstateAndDemand.EstateID = SelectedEstateDemand.ID;
            }
            else
            {
                this.EstateAndDemand.DemandID = SelectedEstateDemand.ID;
            }
            this.DialogResult = true;
            this.Close();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
            this.Close();
        }

        private void selectionForm_Loaded(object sender, RoutedEventArgs e)
        {
            this.Brokers = Session.Inst.BEManager.GetBrokers(Session.Inst.OfflineMode);
            dpDate.SelectedDate = DateTime.Now;
            txtName.Focus();
        }

        private void btnSearchEstates_Click(object sender, RoutedEventArgs e)
        {
            SearchEstates();
        }

        private void SearchEstates()
        {
            Demands = new ObservableCollection<IDemandEstateDisplayData>(Session.Inst.BEManager.SearchEstatesForShowDemand(SearchParameters, Session.Inst.OfflineMode));
        }

        private void mnuOpen_Click(object sender, RoutedEventArgs e)
        {
            if (dgDemands.SelectedItem != null && dgDemands.SelectedItem is Estate)
            {
                OpenEstate(dgDemands.SelectedItem as Estate);
            }
        }

        private void OpenEstate(Estate estate)
        {
            EstateView view = new EstateView(estate);
            view.ShowDialog();
        }
    }
}
