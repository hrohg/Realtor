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
using System.Windows.Navigation;
using System.Windows.Shapes;
using RealEstate.Business.Managers;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;
using RealEstateApp.CustomControls;
using Reports;
using Shared.Helpers;

namespace UserControls
{
    /// <summary>
    /// Interaction logic for FavoriteClients.xaml
    /// </summary>
    public partial class FavoriteClients : UserControl
    {
        public DragDockPanel EstatesAndDemandsControl
        {
            get { return (DragDockPanel)GetValue(EstatesAndDemandsControlProperty); }
            set { SetValue(EstatesAndDemandsControlProperty, value); }
        }

        // Using a DependencyProperty as the backing store for EstatesAndFavoriteClientsControl.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty EstatesAndDemandsControlProperty =
            DependencyProperty.Register("EstatesAndDemandsControl", typeof(DragDockPanel), typeof(FavoriteClients), new UIPropertyMetadata(null, OnEstatesAndDemandsControlChanged));

        private static void OnEstatesAndDemandsControlChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var estatesList = d as FavoriteClients;
            if (estatesList != null)
            {
                estatesList.EstatesAndDemandsControl = (DragDockPanel)e.NewValue;
            }
        }

        public DragDockPanel AddEditControlPanel
        {
            get { return (DragDockPanel)GetValue(AddEditControlPanelProperty); }
            set { SetValue(AddEditControlPanelProperty, value); }
        }

        // Using a DependencyProperty as the backing store for AddEditControlPanel.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty AddEditControlPanelProperty =
            DependencyProperty.Register("AddEditControlPanel", typeof(DragDockPanel), typeof(FavoriteClients), new UIPropertyMetadata(null, OnAddEditControlPanelChanged));

        private static void OnAddEditControlPanelChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            FavoriteClients form = d as FavoriteClients;
            if (form != null)
            {
                form.AddEditControlPanel = (DragDockPanel)e.NewValue;
            }
        }


        public DemandTypes DemandType
        {
            get { return (DemandTypes)GetValue(DemandTypeProperty); }
            set { SetValue(DemandTypeProperty, value); }
        }

        // Using a DependencyProperty as the backing store for DemandType.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty DemandTypeProperty =
            DependencyProperty.Register("DemandType", typeof(DemandTypes), typeof(FavoriteClients), new UIPropertyMetadata(DemandTypes.All, OnDemandTypeChanged));

        private static void OnDemandTypeChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            FavoriteClients form = sender as FavoriteClients;
            if (form != null)
            {
                form.DemandType = (DemandTypes)e.NewValue;
            }
        }


        public ObservableCollection<NeededEstate> NeededEstates
        {
            get { return (ObservableCollection<NeededEstate>)GetValue(NeededEstatesProperty); }
            set { SetValue(NeededEstatesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for NeededEstates.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty NeededEstatesProperty =
            DependencyProperty.Register("NeededEstates", typeof(ObservableCollection<NeededEstate>), typeof(FavoriteClients), new UIPropertyMetadata(null, OnNeededEstateChanged));

        private static void OnNeededEstateChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            FavoriteClients d = sender as FavoriteClients;
            if (d != null)
            {
                d.NeededEstates = (ObservableCollection<NeededEstate>)e.NewValue;
                //d.NeededEstates[0].EstateTypes
            }
        }

        public FavoriteClients()
        {
            InitializeComponent();
        }

        public void LoadFavoriteClients()
        {
            NeededEstates = DemandManager.GetFavoriteDemands(Session.Inst.User, Session.Inst.OfflineMode);
            Session.Inst.DemandsCount = NeededEstates.Count;
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

        private void demands_Loaded(object sender, RoutedEventArgs e)
        {
            LoadFavoriteClients();
            if (Session.Inst.User.IsAdminOrDirector || this.DemandType == DemandTypes.Personal)
            {
                mnuDelete.Visibility = System.Windows.Visibility.Visible;
            }
            else
            {
                mnuDelete.Visibility = System.Windows.Visibility.Collapsed;
            }

            if (Session.Inst.OfflineMode)
            {
                mnuDelete.Visibility = Visibility.Collapsed;
            }
        }

        private void mnuEdit_Click(object sender, RoutedEventArgs e)
        {
            if (dgNeededEstates.SelectedItem != null)
            {
                var addEditControl = (AddEditDemand)AddEditControlPanel.FindName("addEditDemand");
                addEditControl.Demand = (NeededEstate)dgNeededEstates.SelectedItem;
                AddEditControlPanel.MaximizeToggle_Checked(sender, e);
            }
        }

        public void UpdateFavoriteClients()
        {
            LoadFavoriteClients();
        }

        private void mnuShowResult_Click(object sender, RoutedEventArgs e)
        {
            OpenEstatesAndDemands();
        }

        private void OpenEstatesAndDemands()
        {
            if (dgNeededEstates.SelectedItems.Count == 0) return;
            EstatesAndDemands form = new EstatesAndDemands(dgNeededEstates.SelectedItems.OfType<NeededEstate>());
            form.Show();
        }

        private void mnuDelete_Click(object sender, RoutedEventArgs e)
        {
            if (dgNeededEstates.SelectedItems.Count == 0) return;

            Session.Inst.BEManager.DeleteFavoriteDemands(Session.Inst.User.ID, dgNeededEstates.SelectedItems.OfType<NeededEstate>());
            LoadFavoriteClients();
        }

        private void RefreshEstatesAndDemands()
        {
            var showForm = EstatesAndDemandsControl.FindName("estatesShowedClients") as EstatesShowedClients;
            showForm.Refresh();
        }

        public void RefreshData()
        {
            LoadFavoriteClients();
        }

        private void mnuDemands_ContextMenuOpening(object sender, ContextMenuEventArgs e)
        {
            if ((Session.Inst.User.IsBroker && dgNeededEstates.SelectedItems != null && dgNeededEstates.SelectedItems.Count != 1) || Session.Inst.OfflineMode)
            {
                mnuDelete.Visibility = Visibility.Collapsed;
            }
            else
            {
                mnuDelete.Visibility = Visibility.Visible;
            }
            if (Session.Inst.OfflineMode)
            {
                mnuDelete.Visibility = Visibility.Collapsed;
            }
        }

        private void mnuSelectShowEstate_Click(object sender, RoutedEventArgs e)
        {
            if (dgNeededEstates.SelectedItem == null) return;

            var clientSelectionForm = new ClientSelectionFormForEstate(true);
            if (clientSelectionForm.ShowDialog() ?? false)
            {
                var selectedEstate = clientSelectionForm.SelectedEstateDemand;
                EstatesAndDemand showInfo = clientSelectionForm.EstateAndDemand;
                showInfo.DemandID = (dgNeededEstates.SelectedItem as NeededEstate).ID;
                if (Session.Inst.BEManager.AddEstateShowInfo(showInfo))
                {
                    MessageBox.Show(CultureResources.Inst["SuccessfullyAddedShowInfo"], string.Empty, MessageBoxButton.OK, MessageBoxImage.Information);
                    RefreshEstatesAndDemands();
                }
                else
                {
                    MessageBox.Show(CultureResources.Inst["CanNotAddShowInfo"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void btnExportToExcel_Click(object sender, RoutedEventArgs e)
        {
            dgNeededEstates.ExportToExcel();
        }

        private void mnuOpen_Click(object sender, RoutedEventArgs e)
        {
            OpenDemand();
        }

        private void btnPrint_Click(object sender, RoutedEventArgs e)
        {
            PrintDemands printData = new PrintDemands
                                        {
                                            AdditionalDetailsTitle = CultureResources.Inst["AdditionalDetails"],
                                            BrokerTitle = CultureResources.Inst["Broker"],
                                            EstateTypeTitle = CultureResources.Inst["EstateType"],
                                            OrderTypeTitle = CultureResources.Inst["OrderType"],
                                            PriceTitle = CultureResources.Inst["Price"],
                                            RegionTitle = CultureResources.Inst["Region"],
                                            RoomsTitle = CultureResources.Inst["Rooms"],
                                            SquareTitle = CultureResources.Inst["Square"]
                                        };
            var data = GetFavoriteClientsPrintData();
            printData.RegData("FavoriteClientsData", data);
            printData.Show(true);
        }

        private List<DemandPrintData> GetFavoriteClientsPrintData()
        {
            if (NeededEstates == null) return null;

            return NeededEstates.Select(s => new DemandPrintData
                                                {
                                                    AdditionalDetails = s.AdditionalDetails,
                                                    Broker = s.User.FullName,
                                                    EstateType = s.EstateTypes,
                                                    OrderType = (s.IsNeedForRent ?? false) ? CultureResources.Inst["Rent"] : CultureResources.Inst["Buy"],
                                                    Price = !string.IsNullOrEmpty(s.PriceInterval) ? string.Format("{0} {1}", s.PriceInterval, s.Currency.Name) : string.Empty,
                                                    Region = s.Regions,
                                                    Rooms = s.RoomsCountInterval,
                                                    Square = s.SquareInterval,
                                                }).ToList();
        }
    }
}
