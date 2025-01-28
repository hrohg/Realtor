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
using RealEstate.Business.Managers;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;
using UserControls;

namespace RealEstateApp
{
    /// <summary>
    /// Interaction logic for DeletedClients.xaml
    /// </summary>
    public partial class DeletedClients : Window
    {
        #region Dependency properties



        public DemandSearchCriteria SearchParameters
        {
            get { return (DemandSearchCriteria)GetValue(SearchParametersProperty); }
            set { SetValue(SearchParametersProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SearchParameters.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SearchParametersProperty =
            DependencyProperty.Register("SearchParameters", typeof(DemandSearchCriteria), typeof(DeletedClients), new PropertyMetadata(null, OnSearchParametersChanged));

        private static void OnSearchParametersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((DeletedClients)d).SearchParameters = (DemandSearchCriteria)e.NewValue;
        }


        public ObservableCollection<NeededEstate> Clients
        {
            get { return (ObservableCollection<NeededEstate>)GetValue(ClientsProperty); }
            set { SetValue(ClientsProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Clients.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ClientsProperty =
            DependencyProperty.Register("Clients", typeof(ObservableCollection<NeededEstate>), typeof(DeletedClients), new PropertyMetadata(null, OnClientsChanged));

        private static void OnClientsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((DeletedClients)d).Clients = (ObservableCollection<NeededEstate>)e.NewValue;
        }

        #endregion
        public DeletedClients()
        {
            InitializeComponent();
        }

        private void deletedClients_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                CloseForm();
            }
        }

        private void CloseForm()
        {
            Close();
        }

        private void deletedClients_Loaded(object sender, RoutedEventArgs e)
        {
            LoadClients(true);
        }

        private void LoadClients(bool isAtLoading)
        {
            if (isAtLoading)
            {
                Clients = new ObservableCollection<NeededEstate>(DemandManager.GetAllDemands(Session.Inst.User, new RealEstate.DataAccess.SearchCriteria.DemandSearchCriteria { IsDeleted = true }, Session.Inst.OfflineMode));
            }
            else
            {
                Clients = new ObservableCollection<NeededEstate>(DemandManager.GetAllDemands(Session.Inst.User, SearchParameters, Session.Inst.OfflineMode));
            }
        }

        private void btnOk_Click(object sender, RoutedEventArgs e)
        {
            CloseForm();
        }

        private void dgEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            OpenDemand();
        }

        private void OpenDemand()
        {
            if (dgNeededEstates.SelectedItem == null) return;
            DemandView dView = new DemandView(dgNeededEstates.SelectedItem as NeededEstate);
            dView.Show();
        }

        private void mnuOpen_Click(object sender, RoutedEventArgs e)
        {
            OpenDemand();
        }

        private void mnuReturnToDemands_Click(object sender, RoutedEventArgs e)
        {
            NeededEstate neededEstate = dgNeededEstates.SelectedItem as NeededEstate;
            if (DemandManager.ReturnToClientsList(neededEstate))
            {
                Clients.Remove(neededEstate);
            }
            else
            {
                MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void txtName_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                btnSearch_Click(sender, new RoutedEventArgs());
            }
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            LoadClients(false);
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            SearchParameters = new DemandSearchCriteria { IsDeleted = true };
            btnSearch_Click(sender, e);
        }
    }
}
