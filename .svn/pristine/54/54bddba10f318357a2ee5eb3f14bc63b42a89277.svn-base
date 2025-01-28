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
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;
using RealEstateApp.CustomControls;
using Reports;
using Shared.Helpers;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for Demands.xaml
	/// </summary>
	public partial class Demands : UserControl
	{


        public FavoriteClients FavoriteClientsControl
        {
            get { return (FavoriteClients)GetValue(FavoriteClientsControlProperty); }
            set { SetValue(FavoriteClientsControlProperty, value); }
        }

        // Using a DependencyProperty as the backing store for FavoriteClientsControl.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty FavoriteClientsControlProperty =
            DependencyProperty.Register("FavoriteClientsControl", typeof(FavoriteClients), typeof(Demands), new PropertyMetadata(null, OnFavoriteClientsControlChanged));

	    private static void OnFavoriteClientsControlChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
	    {
	        ((Demands) d).FavoriteClientsControl = (FavoriteClients) e.NewValue;
	    }


	    public DragDockPanel EstatesAndDemandsControl
		{
			get { return (DragDockPanel)GetValue(EstatesAndDemandsControlProperty); }
			set { SetValue(EstatesAndDemandsControlProperty, value); }
		}

		// Using a DependencyProperty as the backing store for EstatesAndDemandsControl.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstatesAndDemandsControlProperty =
			DependencyProperty.Register("EstatesAndDemandsControl", typeof(DragDockPanel), typeof(Demands), new UIPropertyMetadata(null, OnEstatesAndDemandsControlChanged));

		private static void OnEstatesAndDemandsControlChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var estatesList = d as Demands;
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
			DependencyProperty.Register("AddEditControlPanel", typeof(DragDockPanel), typeof(Demands), new UIPropertyMetadata(null, OnAddEditControlPanelChanged));

		private static void OnAddEditControlPanelChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			Demands form = d as Demands;
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
			DependencyProperty.Register("DemandType", typeof(DemandTypes), typeof(Demands), new UIPropertyMetadata(DemandTypes.All, OnDemandTypeChanged));

		private static void OnDemandTypeChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			Demands form = sender as Demands;
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
			DependencyProperty.Register("NeededEstates", typeof(ObservableCollection<NeededEstate>), typeof(Demands), new UIPropertyMetadata(null, OnNeededEstateChanged));

		private static void OnNeededEstateChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			Demands d = sender as Demands;
			if (d != null)
			{
				d.NeededEstates = (ObservableCollection<NeededEstate>)e.NewValue;
				//d.NeededEstates[0].EstateTypes
			}
		}

		public DemandSearchCriteria SearchParameters
		{
			get { return (DemandSearchCriteria)GetValue(SearchParametersProperty); }
			set { SetValue(SearchParametersProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SearchParameters.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SearchParametersProperty =
			DependencyProperty.Register("SearchParameters", typeof(DemandSearchCriteria), typeof(Demands), new UIPropertyMetadata(null, OnSearchParametersChanged));

		private static void OnSearchParametersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var demandsList = d as Demands;
			if (demandsList != null)
			{
				demandsList.SearchParameters = (DemandSearchCriteria)e.NewValue;
			}
		}


		public Demands()
		{
			InitializeComponent();
			SearchParameters = new DemandSearchCriteria();
		}

		public void LoadDemands()
		{
			if (DemandType == DemandTypes.All)
			{
				NeededEstates = Session.Inst.BEManager.GetAllDemands(Session.Inst.User, SearchParameters, Session.Inst.OfflineMode);
				Session.Inst.DemandsCount = NeededEstates.Count;
			}
			else
			{
				if (Session.Inst.User == null) return;
				NeededEstates = Session.Inst.BEManager.GetDemandsByBroker(Session.Inst.User.ID, Session.Inst.OfflineMode);
				Session.Inst.Update();
			}
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
			LoadDemands();
			if (Session.Inst.User.IsAdminOrDirector || this.DemandType == DemandTypes.Personal)
			{
				mnuEdit.Visibility = mnuDelete.Visibility = System.Windows.Visibility.Visible;
			}
			else
			{
				mnuEdit.Visibility = mnuDelete.Visibility = System.Windows.Visibility.Collapsed;
			}

			if (Session.Inst.OfflineMode)
			{
				mnuEdit.Visibility = mnuDelete.Visibility = Visibility.Collapsed;
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

		public void UpdateDemands()
		{
			LoadDemands();
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
			var demands = dgNeededEstates.SelectedItems;
			if (demands == null) return;

			if (MessageBox.Show(CultureResources.Inst["AreYouSureYouWantToDeleteThisDemand"], CultureResources.Inst["ConfirmDelete"], MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
			{
				var faultCount = Session.Inst.BEManager.DeleteDemands(demands.OfType<NeededEstate>());
				if (faultCount == 0)
				{
					//MessageBox.Show("Պահանջարկը հաջողությամբ ջնջվեց", "", MessageBoxButton.OK, MessageBoxImage.Information);
					LoadDemands();
					RefreshEstatesAndDemands();
				}
				else
				{
					MessageBox.Show(string.Format(CultureResources.Inst["CanNotDeleteXDemandY"], faultCount, faultCount > 1 ? CultureResources.Inst["s"] : string.Empty), CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				}
			}
		}

		private void RefreshEstatesAndDemands()
		{
			var showForm = EstatesAndDemandsControl.FindName("estatesShowedClients") as EstatesShowedClients;
			showForm.Refresh();
		}

		public void RefreshData()
		{
			LoadDemands();
		}

		private void mnuDemands_ContextMenuOpening(object sender, ContextMenuEventArgs e)
		{
			if ((Session.Inst.User.IsBroker && dgNeededEstates.SelectedItems != null && dgNeededEstates.SelectedItems.Count != 1) || Session.Inst.OfflineMode)
			{
				mnuEdit.Visibility = mnuDelete.Visibility = Visibility.Collapsed;
			}
			else
			{
				mnuEdit.Visibility = mnuDelete.Visibility = Visibility.Visible;
			}
			if(Session.Inst.OfflineMode)
			{
				mnuEdit.Visibility = mnuDelete.Visibility = Visibility.Collapsed;
			}
		}

		private void btnSearch_Click(object sender, RoutedEventArgs e)
		{
			LoadDemands();
		}

		private void btnClear_Click(object sender, RoutedEventArgs e)
		{
			SearchParameters = new DemandSearchCriteria();
			btnSearch_Click(sender, e);
		}

		private void txtName_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Enter)
			{
				btnSearch_Click(sender, new RoutedEventArgs());
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
			var data = GetDemandsPrintData();
			printData.RegData("DemandsData", data);
			printData.Show(true);
		}

		private List<DemandPrintData> GetDemandsPrintData()
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

        private void mnuAddtoFavorites_Click(object sender, RoutedEventArgs e)
        {
            if (dgNeededEstates.SelectedItems.Count == 0) return;
            DemandManager.AddFavoriteClient(Session.Inst.User.ID, dgNeededEstates.SelectedItems.OfType<NeededEstate>().Select(s => s.ID));
            FavoriteClientsControl.UpdateFavoriteClients();
        }
	}


}
