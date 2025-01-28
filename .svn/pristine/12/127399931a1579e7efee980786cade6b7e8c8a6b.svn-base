using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using RealEstateApp.CustomControls;
using Shared.Helpers;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for AddEditDemand.xaml
	/// </summary>
	public partial class AddEditDemand : UserControl
	{
		public List<OrderType> OrderTypes
		{
			get { return (List<OrderType>)GetValue(OrderTypesProperty); }
			set { SetValue(OrderTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for OrderTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty OrderTypesProperty =
			DependencyProperty.Register("OrderTypes", typeof(List<OrderType>), typeof(AddEditDemand), new UIPropertyMetadata(null, OnOrderTypesChanged));

		private static void OnOrderTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			AddEditDemand form = d as AddEditDemand;
			if (form != null)
			{
				form.OrderTypes = (List<OrderType>)e.NewValue;
			}
		}


		public DragDockPanel PersonalDemandsListPanel
		{
			get { return (DragDockPanel)GetValue(PersonalDemandsListPanelProperty); }
			set { SetValue(PersonalDemandsListPanelProperty, value); }
		}

		// Using a DependencyProperty as the backing store for PersonalDemandsListPanel.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty PersonalDemandsListPanelProperty =
			DependencyProperty.Register("PersonalDemandsListPanel", typeof(DragDockPanel), typeof(AddEditDemand), new UIPropertyMetadata(null, OnPersonalDemandsListPanelChanged));

		private static void OnPersonalDemandsListPanelChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			AddEditDemand form = d as AddEditDemand;
			if (form != null)
			{
				form.PersonalDemandsListPanel = (DragDockPanel)e.NewValue;
			}
		}


		public DragDockPanel DemandsListPanel
		{
			get { return (DragDockPanel)GetValue(DemandsListPanelProperty); }
			set { SetValue(DemandsListPanelProperty, value); }
		}

		// Using a DependencyProperty as the backing store for DemandsListPanel.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty DemandsListPanelProperty =
			DependencyProperty.Register("DemandsListPanel", typeof(DragDockPanel), typeof(AddEditDemand), new UIPropertyMetadata(null, OnDemandsListPanelChanged));

		private static void OnDemandsListPanelChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			AddEditDemand form = d as AddEditDemand;
			if (form != null)
			{
				form.DemandsListPanel = (DragDockPanel)e.NewValue;
			}
		}

		public List<User> Brokers
		{
			get { return (List<User>)GetValue(BrokersProperty); }
			set { SetValue(BrokersProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Brokers.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty BrokersProperty =
			DependencyProperty.Register("Brokers", typeof(List<User>), typeof(AddEditDemand), new UIPropertyMetadata(null, OnBrokersChanged));

		private static void OnBrokersChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			((AddEditDemand)sender).Brokers = (List<User>)e.NewValue;
		}

		public List<EstateType> EstateTypes
		{
			get { return (List<EstateType>)GetValue(EstateTypesProperty); }
			set { SetValue(EstateTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for EstateTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstateTypesProperty =
			DependencyProperty.Register("EstateTypes", typeof(List<EstateType>), typeof(AddEditDemand), new UIPropertyMetadata(null, OnEstateTypesChanged));

		private static void OnEstateTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			AddEditDemand form = d as AddEditDemand;
			if (form != null)
			{
				form.EstateTypes = (List<EstateType>)e.NewValue;
			}
		}

		public List<Region> Regions
		{
			get { return (List<Region>)GetValue(RegionsProperty); }
			set { SetValue(RegionsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Regions.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RegionsProperty =
			DependencyProperty.Register("Regions", typeof(List<Region>), typeof(AddEditDemand), new UIPropertyMetadata(null, OnRegionsChanged));

		private static void OnRegionsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			AddEditDemand form = d as AddEditDemand;
			if (form != null)
			{
				form.Regions = e.NewValue as List<Region>;
			}
		}


		public List<Currency> Currencies
		{
			get { return (List<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(AddEditDemand), new UIPropertyMetadata(null, OnCurrenciesChange));

		private static void OnCurrenciesChange(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			AddEditDemand form = sender as AddEditDemand;
			if (form != null)
			{
				form.Currencies = (List<Currency>)e.NewValue;
			}
		}


		public NeededEstate Demand
		{
			get { return (NeededEstate)GetValue(DemandProperty); }
			set { SetValue(DemandProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Demand.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty DemandProperty =
			DependencyProperty.Register("Demand", typeof(NeededEstate), typeof(AddEditDemand), new UIPropertyMetadata(null, OnDemandChanged));

		private static void OnDemandChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			AddEditDemand form = sender as AddEditDemand;
			if (form != null)
			{
				form.Demand = e.NewValue as NeededEstate;
				if (form.Demand != null && form.Demand.ID > 0)
				{
					form.LoadDemand();
				}
			}
		}



		public List<Remont> Remonts
		{
			get { return (List<Remont>)GetValue(RemontsProperty); }
			set { SetValue(RemontsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Remonts.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RemontsProperty =
			DependencyProperty.Register("Remonts", typeof(List<Remont>), typeof(AddEditDemand), new UIPropertyMetadata(null, OnRemontsChanged));

		private static void OnRemontsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((AddEditDemand)d).Remonts = (List<Remont>)e.NewValue;
		}



		public List<BuildingType> BuildingTypes
		{
			get { return (List<BuildingType>)GetValue(BuildingTypesProperty); }
			set { SetValue(BuildingTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for BuildingTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty BuildingTypesProperty =
			DependencyProperty.Register("BuildingTypes", typeof(List<BuildingType>), typeof(AddEditDemand), new UIPropertyMetadata(null, OnBuildingTypesChanged));

		private static void OnBuildingTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((AddEditDemand)d).BuildingTypes = (List<BuildingType>)e.NewValue;
		}



		public List<Project> Projects
		{
			get { return (List<Project>)GetValue(ProjectsProperty); }
			set { SetValue(ProjectsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Projects.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ProjectsProperty =
			DependencyProperty.Register("Projects", typeof(List<Project>), typeof(AddEditDemand), new UIPropertyMetadata(null, OnProjectsChanged));

		private static void OnProjectsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((AddEditDemand)d).Projects = (List<Project>)e.NewValue;
		}


		private void LoadDemand()
		{
			if (Demand.NeededEstateTypes != null && Demand.NeededEstateTypes.Count > 0)
			{
				foreach (var item in lstRealEstateTypes.Items)
				{
					ListViewItem lvi = lstRealEstateTypes.ItemContainerGenerator.ContainerFromItem(item) as ListViewItem;
					ContentPresenter cp = this.FindVisualChild<ContentPresenter>(lvi);
					CheckBox ckbx = (CheckBox)cp.ContentTemplate.FindName("chkEstateType", cp);
					var estateType = Demand.NeededEstateTypes.FirstOrDefault(s => s.EstateTypeID == ((EstateType)ckbx.CommandParameter).EstateTypeID);
					ckbx.IsChecked = estateType != null;
				}
			}
			if (Demand.NeededRegions != null && Demand.NeededRegions.Count > 0)
			{
				foreach (var item in lstRegions.Items)
				{
					ListViewItem lvi = lstRegions.ItemContainerGenerator.ContainerFromItem(item) as ListViewItem;
					ContentPresenter cp = this.FindVisualChild<ContentPresenter>(lvi);
					CheckBox ckbx = (CheckBox)cp.ContentTemplate.FindName("chkRegion", cp);
					var region = Demand.NeededRegions.FirstOrDefault(s => s.RegionID == ((Region)ckbx.CommandParameter).RegionID);
					ckbx.IsChecked = region != null;
				}
			}
            if (Demand.NeededBuildingTypes != null && Demand.NeededBuildingTypes.Count > 0)
			{
				foreach (var item in lstBuildingTypes.Items)
				{
					ListViewItem lvi = lstBuildingTypes.ItemContainerGenerator.ContainerFromItem(item) as ListViewItem;
					ContentPresenter cp = this.FindVisualChild<ContentPresenter>(lvi);
					CheckBox ckbx = (CheckBox)cp.ContentTemplate.FindName("chkBuildingType", cp);
                    var buildingType = Demand.NeededBuildingTypes.FirstOrDefault(s => s.BuildingTypeID == ((BuildingType)ckbx.CommandParameter).BuildingTypeID);
					ckbx.IsChecked = buildingType != null;
				}
			}
            if (Demand.NeededProjects != null && Demand.NeededProjects.Count > 0)
			{
				foreach (var item in lstProjects.Items)
				{
					ListViewItem lvi = lstProjects.ItemContainerGenerator.ContainerFromItem(item) as ListViewItem;
					ContentPresenter cp = this.FindVisualChild<ContentPresenter>(lvi);
					CheckBox ckbx = (CheckBox)cp.ContentTemplate.FindName("chkProject", cp);
                    var proj = Demand.NeededProjects.FirstOrDefault(s => s.ProjectID == ((Project)ckbx.CommandParameter).ProjectID);
					ckbx.IsChecked = proj != null;
				}
			}
            if (Demand.NeededRemonts != null && Demand.NeededRemonts.Count > 0)
			{
				foreach (var item in lstRemonts.Items)
				{
					ListViewItem lvi = lstRemonts.ItemContainerGenerator.ContainerFromItem(item) as ListViewItem;
					ContentPresenter cp = this.FindVisualChild<ContentPresenter>(lvi);
					CheckBox ckbx = (CheckBox)cp.ContentTemplate.FindName("chkRemont", cp);
                    var remont = Demand.NeededRemonts.FirstOrDefault(s => s.NeededRemontID == ((Remont)ckbx.CommandParameter).RemontID);
					ckbx.IsChecked = remont != null;
				}
			}

			if (Demand.IsNeedForRent ?? false)
			{
				rbRent.IsChecked = true;
			}
			else
			{
				rbSell.IsChecked = true;
			}
		}



		public AddEditDemand()
		{
			InitializeComponent();
			CultureResources.CultureChanged += CultureResources_CultureChanged;
		}

		void CultureResources_CultureChanged(object sender, EventArgs e)
		{
			if (Demand != null)
			{
				int i = Demand.ID;
				Demand.ID = -1;
				Demand.ID = i;
			}

		}

		public AddEditDemand(NeededEstate demand)
			: this()
		{
			this.Demand = demand;
            //if (this.Demand.NeededRemonts != null)
            //{
            //    this.Demand.RemontsList = new List<NeededRemont>(this.Demand.NeededRemonts.Select(s => new NeededRemont {NeededRemontID = s.NeededRemontID}));
            //}
		}

		private void LoadData()
		{
			Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
			cbCurrencies.SelectedIndex = 0;
			Regions = Session.Inst.BEManager.GetRegions(1, Session.Inst.User, Session.Inst.OfflineMode);
			EstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
			Brokers = Session.Inst.BEManager.GetBrokers(Session.Inst.OfflineMode);
			OrderTypes = Session.Inst.BEManager.GetOrderTypesForEstate(Session.Inst.User, Session.Inst.OfflineMode);
			Projects = Session.Inst.BEManager.GetProjects(Session.Inst.OfflineMode);
			BuildingTypes = Session.Inst.BEManager.GetBuildingTypes(Session.Inst.OfflineMode);
			Remonts = Session.Inst.BEManager.GetRemonts(Session.Inst.OfflineMode);
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			if (!Demand.IsValid())
			{
				MessageBox.Show(string.Format(CultureResources.Inst["PleaseFillTheFollowingFieldsX"], Demand.ErrorMessage), CultureResources.Inst["InputError"]);
				return;
			}
			Demand.IsNeedForRent = rbRent.IsChecked;
			if (cbCurrencies.SelectedItem == null)
			{
				cbCurrencies.SelectedItem = Currencies.First(s => s.CurrencyID == 1); //amd
			}
			if (Demand.PriceFrom.HasValue)
			{
				Demand.PriceFromInAMD = CalculationHelper.GetPriceInAMD(Demand.PriceFrom, (Currency)cbCurrencies.SelectedItem);
			}
			if (Demand.PriceTo.HasValue)
			{
				Demand.PriceToInAMD = CalculationHelper.GetPriceInAMD(Demand.PriceTo, (Currency)cbCurrencies.SelectedItem);
			}

			if (Demand.ID == 0)
			{
				if (Session.Inst.User.IsBroker)
				{
					Demand.BrokerID = Session.Inst.User.ID;
				}
				else
				{
					Demand.BrokerID = cbBrokers.SelectedItem != null ? ((User)cbBrokers.SelectedItem).ID : (int?)null;
				}
				Demand.AddDate = DateTime.Now.Date;
				if (Session.Inst.BEManager.CheckDemandExisting(Demand))
				{
					if (MessageBox.Show("DemandExist", "DemandExist", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.Yes) != MessageBoxResult.Yes)
					{
						return;
					}
				}
				if (Session.Inst.BEManager.SaveDemand(Demand))
				{
					MessageBox.Show(CultureResources.Inst["DemandSuccessfullySaved"], "", MessageBoxButton.OK, MessageBoxImage.Information);
					ClearForm();
					RefreshDemandsList();
					MinimizeWindow();
					Session.Inst.DemandsCount++;
				}
				else
				{
					MessageBox.Show(CultureResources.Inst["DemandNotSaved"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				}
			}
			else
			{
				Demand.LastModifiedDate = DateTime.Now;
				if (cbBrokers.Visibility == Visibility.Visible && cbBrokers.SelectedItem != null)
				{
					var selectedUser = (User)cbBrokers.SelectedItem;
					Demand.User = selectedUser;
					Demand.BrokerID = selectedUser.ID;
				}
				if (Session.Inst.BEManager.UpdateDemand(Demand))
				{
					MessageBox.Show(CultureResources.Inst["DemandSuccessfullySaved"], "", MessageBoxButton.OK, MessageBoxImage.Information);
					ClearForm();
					RefreshDemandsList();
					MinimizeWindow();
				}
				else
				{
					MessageBox.Show(CultureResources.Inst["DemandNotSaved"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				}
			}
		}

		private void MinimizeWindow()
		{
			//var panel = ((FrameworkElement)Parent).Parent as DragDockPanel;
			//if (panel != null)
			//{
			//    panel.MaximizeToggle_Checked(new object(), new RoutedEventArgs());
			//}
		}

		private void RefreshDemandsList()
		{
			var allDemands = (Demands)DemandsListPanel.FindName("allDemands");
			allDemands.UpdateDemands();
			//var personalDemands = (Demands)PersonalDemandsListPanel.FindName("personalDemands");
			//personalDemands.UpdateDemands();
		}

		private void btnClear_Click(object sender, RoutedEventArgs e)
		{
			ClearForm();
		}

		private void ClearForm()
		{
			Demand = new NeededEstate();
			Regions = Session.Inst.BEManager.GetRegions(1, Session.Inst.User, Session.Inst.OfflineMode);
			EstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
			Projects = Session.Inst.BEManager.GetProjects(Session.Inst.OfflineMode);
			BuildingTypes = Session.Inst.BEManager.GetBuildingTypes(Session.Inst.OfflineMode);
			Remonts = Session.Inst.BEManager.GetRemonts(Session.Inst.OfflineMode);
		}

		private void CheckBoxRealEstateTypes_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				EstateType realEstateType = (EstateType)checkbox.CommandParameter;
				if (checkbox.IsChecked ?? false)
				{
					if (realEstateType != null && Demand.NeededEstateTypes.FirstOrDefault(s => s.EstateTypeID == realEstateType.EstateTypeID) == null)
					{
						Demand.NeededEstateTypes.Add(new NeededEstateType { EstateTypeID = realEstateType.EstateTypeID });
					}
				}
				else
				{
					var neededEstateType = Demand.NeededEstateTypes.FirstOrDefault(s => s.EstateTypeID == realEstateType.EstateTypeID);
					if (neededEstateType != null)
					{
						Demand.NeededEstateTypes.Remove(neededEstateType);
					}
				}
			}
		}

		private void CheckBoxRegion_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				Region region = (Region)checkbox.CommandParameter;
				if (checkbox.IsChecked ?? false)
				{
					if (region != null && Demand.NeededRegions.FirstOrDefault(s => s.RegionID == region.RegionID) == null)
					{
						Demand.NeededRegions.Add(new NeededRegion { RegionID = region.RegionID });
					}
				}
				else
				{
					var neededRegion = Demand.NeededRegions.FirstOrDefault(s => s.RegionID == region.RegionID);
					if (neededRegion != null)
					{
						Demand.NeededRegions.Remove(neededRegion);
					}
				}
			}
		}

		public void RefreshData()
		{
			LoadData();
		}

		private void rbSell_Checked(object sender, RoutedEventArgs e)
		{

		}

		private void addEditDemand_Loaded(object sender, RoutedEventArgs e)
		{
			LoadData();
			if (Demand == null)
			{
				Demand = new NeededEstate();
			}
		}

		private void CheckBoxRemonts_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
			    if (Demand.NeededRemonts == null)
			    {
			        Demand.NeededRemonts = new System.Data.Linq.EntitySet<NeededRemont>();
			    }
				Remont remont = (Remont)checkbox.CommandParameter;
				if (checkbox.IsChecked ?? false)
				{
                    if (remont != null && Demand.NeededRemonts.FirstOrDefault(s => s.NeededRemontID == remont.RemontID) == null)
					{
                        Demand.NeededRemonts.Add(new NeededRemont { NeededRemontID = remont.RemontID });
					}
				}
				else
				{
                    var neededRemont = Demand.NeededRemonts.FirstOrDefault(s => s.NeededRemontID == remont.RemontID);
					if (neededRemont != null)
					{
                        Demand.NeededRemonts.Remove(neededRemont);
					}
				}
			}
		}

		private void CheckBoxProjects_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				var project = (Project)checkbox.CommandParameter;
                
			    if (Demand.NeededProjects == null)
			    {
			        Demand.NeededProjects = new System.Data.Linq.EntitySet<NeededProject>();
			    }
				if (checkbox.IsChecked ?? false)
				{
                    if (project != null && Demand.NeededProjects.FirstOrDefault(s => s.ProjectID == project.ProjectID) == null)
					{
                        Demand.NeededProjects.Add(new NeededProject { ProjectID = project.ProjectID });
					}
				}
				else
				{
                    var neededProject = Demand.NeededProjects.FirstOrDefault(s => s.ProjectID == project.ProjectID);
					if (neededProject != null)
					{
                        Demand.NeededProjects.Remove(neededProject);
					}
				}
			}
		}

		private void CheckBoxBuildingTypes_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				var buildingType = (BuildingType)checkbox.CommandParameter;
			    if (Demand.NeededBuildingTypes == null)
			    {
			        Demand.NeededBuildingTypes = new System.Data.Linq.EntitySet<NeededBuildingType>();
			    }
				if (checkbox.IsChecked ?? false)
				{
                    if (buildingType != null && Demand.NeededBuildingTypes.FirstOrDefault(s => s.BuildingTypeID == buildingType.BuildingTypeID) == null)
					{
                        Demand.NeededBuildingTypes.Add(new NeededBuildingType { BuildingTypeID = buildingType.BuildingTypeID });
					}
				}
				else
				{
                    var neededBuildingType = Demand.NeededBuildingTypes.FirstOrDefault(s => s.BuildingTypeID == buildingType.BuildingTypeID);
					if (neededBuildingType != null)
					{
                        Demand.NeededBuildingTypes.Remove(neededBuildingType);
					}
				}
			}
		}

		private void Grid_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
		{
			if(e.Key == System.Windows.Input.Key.Enter)
			{
				btnOK_Click(sender, new RoutedEventArgs());
			}
		}
	}
}
