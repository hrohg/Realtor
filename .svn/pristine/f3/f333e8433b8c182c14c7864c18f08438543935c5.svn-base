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
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for EstatesShowedClients.xaml
	/// </summary>
	public partial class EstatesShowedClients : UserControl
	{
		#region Dependency properties

		#region Estates
		public ObservableCollection<EstatesAndDemand> Estates
		{
			get { return (ObservableCollection<EstatesAndDemand>)GetValue(EstatesProperty); }
			set { SetValue(EstatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Estates.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstatesProperty =
			DependencyProperty.Register("Estates", typeof(ObservableCollection<EstatesAndDemand>), typeof(EstatesShowedClients), new UIPropertyMetadata(null, OnEstatesChanged));

		private static void OnEstatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EstatesShowedClients form = d as EstatesShowedClients;
			if (form != null)
			{
				form.Estates = (ObservableCollection<EstatesAndDemand>)e.NewValue;
			}
		}
		#endregion

		#region Demands
		public ObservableCollection<EstatesAndDemand> Demands
		{
			get { return (ObservableCollection<EstatesAndDemand>)GetValue(DemandsProperty); }
			set { SetValue(DemandsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Demands.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty DemandsProperty =
			DependencyProperty.Register("Demands", typeof(ObservableCollection<EstatesAndDemand>), typeof(EstatesShowedClients), new UIPropertyMetadata(null, OnDemandsChanged));

		private static void OnDemandsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EstatesShowedClients form = d as EstatesShowedClients;
			if (form != null)
			{
				form.Demands = (ObservableCollection<EstatesAndDemand>)e.NewValue;
			}
		}
		#endregion

		#region DemandDeleteVisibility



		public Visibility DemandDeleteVisibility
		{
			get { return (Visibility)GetValue(DemandDeleteVisibilityProperty); }
			set { SetValue(DemandDeleteVisibilityProperty, value); }
		}

		// Using a DependencyProperty as the backing store for DemandDeleteVisibility.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty DemandDeleteVisibilityProperty =
			DependencyProperty.Register("DemandDeleteVisibility", typeof(Visibility), typeof(EstatesShowedClients), new UIPropertyMetadata(Visibility.Collapsed, OnDemandDeleteVisibilityChanged));

		private static void OnDemandDeleteVisibilityChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var form = d as EstatesShowedClients;
			if (form != null)
			{
				form.DemandDeleteVisibility = (Visibility)e.NewValue;
			}
		}

		#endregion

		#region EstateDeleteVisibility



		public Visibility EstateDeleteVisibility
		{
			get { return (Visibility)GetValue(EstateDeleteVisibilityProperty); }
			set { SetValue(EstateDeleteVisibilityProperty, value); }
		}

		// Using a DependencyProperty as the backing store for EstateDeleteVisibility.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstateDeleteVisibilityProperty =
			DependencyProperty.Register("EstateDeleteVisibility", typeof(Visibility), typeof(EstatesShowedClients), new UIPropertyMetadata(Visibility.Collapsed, OnEstateDeleteVisibilityChanged));

		private static void OnEstateDeleteVisibilityChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var form = d as EstatesShowedClients;
			if (form != null)
			{
				form.EstateDeleteVisibility = (Visibility)e.NewValue;
			}
		}

		#endregion

		public List<Currency> Currencies
		{
			get { return (List<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(EstatesShowedClients), new UIPropertyMetadata(null, OnCurrenciesChanged));

		private static void OnCurrenciesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EstatesShowedClients form = d as EstatesShowedClients;
			if (form != null)
			{
				form.Currencies = (List<Currency>)e.NewValue;
			}
		}

		#region Search Criterias

		public DemandSearchCriteria DemandSearchCriteria
		{
			get { return (DemandSearchCriteria)GetValue(DemandSearchCriteriaProperty); }
			set { SetValue(DemandSearchCriteriaProperty, value); }
		}

		// Using a DependencyProperty as the backing store for DemandSearchCriteria.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty DemandSearchCriteriaProperty =
			DependencyProperty.Register("DemandSearchCriteria", typeof(DemandSearchCriteria), typeof(EstatesShowedClients), new UIPropertyMetadata(null, OnDemandSearchCriteriaChanged));

		private static void OnDemandSearchCriteriaChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EstatesShowedClients form = d as EstatesShowedClients;
			if (form != null)
			{
				form.DemandSearchCriteria = (DemandSearchCriteria)e.NewValue;
			}
		}

		public RealEstateSearchParameters EstateSearchCriteria
		{
			get { return (RealEstateSearchParameters)GetValue(EstateSearchCriteriaProperty); }
			set { SetValue(EstateSearchCriteriaProperty, value); }
		}

		// Using a DependencyProperty as the backing store for EstateSearchCriteria.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstateSearchCriteriaProperty =
			DependencyProperty.Register("EstateSearchCriteria", typeof(RealEstateSearchParameters), typeof(EstatesShowedClients), new UIPropertyMetadata(null, OnEstateSearchCriteriaChanged));

		private static void OnEstateSearchCriteriaChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EstatesShowedClients form = d as EstatesShowedClients;
			if (form != null)
			{
				form.EstateSearchCriteria = (RealEstateSearchParameters)e.NewValue;
			}
		}

		#endregion

		#endregion

		public EstatesShowedClients()
		{
			InitializeComponent();
			DemandSearchCriteria = new DemandSearchCriteria();
			EstateSearchCriteria = new RealEstateSearchParameters { DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose };
		}

		private void UserControl_Loaded(object sender, RoutedEventArgs e)
		{
			LoadDemands();
			LoadEstates();
			Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
		}

		private void LoadEstates()
		{

			EstateDeleteVisibility = Visibility.Collapsed;
			Estates = Session.Inst.BEManager.GetShowedToClientsEstates(EstateSearchCriteria, Session.Inst.User, Session.Inst.OfflineMode);
		}

		private void LoadDemands()
		{
			DemandDeleteVisibility = System.Windows.Visibility.Collapsed;
			Demands = Session.Inst.BEManager.GetAllDemandsWithShowedEstates(Session.Inst.User, DemandSearchCriteria, Session.Inst.OfflineMode);
		}

		private void mnuOpenEstate_Click(object sender, RoutedEventArgs e)
		{
			OpenEstate();
		}

		private void dgEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
		{
			OpenEstate();
		}

		private void OpenEstate()
		{
			if (dgEstates.SelectedItem == null) return;
            EstateView view = new EstateView((dgNeededEstates.SelectedItem as EstatesAndDemand).Estate);
			view.ShowDialog();
		}

		private NeededEstate DemandForEstates { get; set; }
		private Estate EstateForDemands { get; set; }

		private void btnShowEstatesForDemand_Click(object sender, RoutedEventArgs e)
		{
			EstateDeleteVisibility = System.Windows.Visibility.Visible;
			LoadShowedEstatesForDemand(((Button)sender).Tag as NeededEstate);
		}

		private void LoadShowedEstatesForDemand(NeededEstate demand)
		{
			//EstateDeleteVisibility = System.Windows.Visibility.Visible;
			DemandForEstates = demand;
			Estates = Session.Inst.BEManager.GetShowedEstatesForDemand(demand.ID, Session.Inst.OfflineMode);
		}

		private void btnShowDemandsForEstate_Click(object sender, RoutedEventArgs e)
		{
			LoadShowedDemandsForEstate(((Button)sender).Tag as Estate);
		}

		private void LoadShowedDemandsForEstate(Estate estate)
		{
			DemandDeleteVisibility = System.Windows.Visibility.Visible;
			EstateForDemands = estate;
			Demands = Session.Inst.BEManager.GetShowedClientsForEstate(estate.ID, Session.Inst.OfflineMode);
		}

		private void btnSearchDemands_Click(object sender, RoutedEventArgs e)
		{
			LoadDemands();
			expDemandSearch.IsExpanded = false;
		}

		private void btnClearDemandsSearch_Click(object sender, RoutedEventArgs e)
		{
			DemandSearchCriteria = new DemandSearchCriteria();
			LoadDemands();
			expDemandSearch.IsExpanded = false;
		}

		private void txtNameDemands_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Enter)
			{
				LoadDemands();
				expDemandSearch.IsExpanded = false;
			}
		}

		private void btnSearchEstates_Click(object sender, RoutedEventArgs e)
		{
			LoadEstates();
			expEstatesSearch.IsExpanded = false;
		}

		private void btnClearEstateSearch_Click(object sender, RoutedEventArgs e)
		{
			EstateSearchCriteria = new RealEstateSearchParameters { DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose };
			LoadEstates();
			expEstatesSearch.IsExpanded = false;
		}

		private void btnShowEstates_Click(object sender, RoutedEventArgs e)
		{
			LoadEstates();
		}

		private void txtSearchEstate_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Enter)
			{
				LoadEstates();
			}
		}

		private void btnShowDemands_Click(object sender, RoutedEventArgs e)
		{
			LoadDemands();
		}

		private void expDemandSearch_LostFocus(object sender, RoutedEventArgs e)
		{
			//expDemandSearch.IsExpanded = false;
		}

		public void Refresh()
		{
			LoadEstates();
			LoadDemands();
		}

		private void btnDeleteDemand_Click(object sender, RoutedEventArgs e)
		{
			var sh = (EstatesAndDemand)((Button)sender).Tag;
			int estateID = sh.EstateID;
			if (Session.Inst.BEManager.DeleteShoingInfo(sh))
			{
				if (Demands.Count == 1)
				{
					Refresh();
				}
				else
				{
					LoadShowedDemandsForEstate(new Estate { EstateID = estateID });
				}
			}
			else
			{
				//display error message
			}
		}

		private void btnDeleteEstate_Click(object sender, RoutedEventArgs e)
		{
			var sh = (EstatesAndDemand)((Button)sender).Tag;
			int demandID = sh.DemandID;
			if (Session.Inst.BEManager.DeleteShoingInfo(sh))
			{
				if (Estates.Count == 1)
				{
					Refresh();
				}
				else
				{
					LoadShowedEstatesForDemand(new NeededEstate { ID = demandID });
				}
			}
			else
			{
				//display error message
			}
		}

        private void dgNeededEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            OpenClientDetails();
        }

	    private void OpenClientDetails()
	    {
            if (dgNeededEstates.SelectedItem == null) return;
            new DemandView((dgNeededEstates.SelectedItem as EstatesAndDemand).NeededEstate).ShowDialog();
	    }

	    private void mnuOpenDemand_Click(object sender, RoutedEventArgs e)
	    {
            OpenClientDetails();
	    }
	}
}
