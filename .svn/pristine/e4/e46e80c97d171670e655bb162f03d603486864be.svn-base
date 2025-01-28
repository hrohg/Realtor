using System;
using System.Collections.Generic;
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
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;
using Reports;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for Statistics.xaml
	/// </summary>
	public partial class Statistics
	{

		#region DependencyProperties



		public StatisticSearchCriteria SearchCriteria
		{
			get { return (StatisticSearchCriteria)GetValue(SearchCriteriaProperty); }
			set { SetValue(SearchCriteriaProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SearchCriteria.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SearchCriteriaProperty =
			DependencyProperty.Register("SearchCriteria", typeof(StatisticSearchCriteria), typeof(Statistics), new UIPropertyMetadata(null, OnSearchCriteriaChanged));

		private static void OnSearchCriteriaChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((Statistics)d).SearchCriteria = (StatisticSearchCriteria)e.NewValue;
		}


		public List<ReportTypeEntity> ReportTypes
		{
			get { return (List<ReportTypeEntity>)GetValue(ReportTypesProperty); }
			set { SetValue(ReportTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for ReportTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ReportTypesProperty =
			DependencyProperty.Register("ReportTypes", typeof(List<ReportTypeEntity>), typeof(Statistics), new UIPropertyMetadata(null, OnReportTypesChanged));

		private static void OnReportTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((Statistics)d).ReportTypes = (List<ReportTypeEntity>)e.NewValue;
		}


		public ReportTypeEntity SelectedReportType
		{
			get { return (ReportTypeEntity)GetValue(SelectedReportTypeProperty); }
			set { SetValue(SelectedReportTypeProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SelectedReportType.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SelectedReportTypeProperty =
			DependencyProperty.Register("SelectedReportType", typeof(ReportTypeEntity), typeof(Statistics), new UIPropertyMetadata(null, OnSelectedReportTypeChanged));

		private static void OnSelectedReportTypeChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var wnd = (Statistics)d;
			wnd.SelectedReportType = (ReportTypeEntity)e.NewValue;
		}



		public User SelectedBroker
		{
			get { return (User)GetValue(SelectedBrokerProperty); }
			set { SetValue(SelectedBrokerProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SelectedBroker.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SelectedBrokerProperty =
			DependencyProperty.Register("SelectedBroker", typeof(User), typeof(Statistics), new UIPropertyMetadata(null, OnSelectedBrokerChanged));

		private static void OnSelectedBrokerChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((Statistics)d).SelectedBroker = (User)e.NewValue;
		}

		public List<User> Brokers
		{
			get { return (List<User>)GetValue(BrokersProperty); }
			set { SetValue(BrokersProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Brokers.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty BrokersProperty =
			DependencyProperty.Register("Brokers", typeof(List<User>), typeof(Statistics), new UIPropertyMetadata(null, OnBrokersChanged));

		private static void OnBrokersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((Statistics)d).Brokers = (List<User>)e.NewValue;
		}




		public ReportData StatisticData
		{
			get { return (ReportData)GetValue(StatisticDataProperty); }
			set { SetValue(StatisticDataProperty, value); }
		}

		// Using a DependencyProperty as the backing store for StatisticData.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StatisticDataProperty =
			DependencyProperty.Register("StatisticData", typeof(ReportData), typeof(Statistics), new UIPropertyMetadata(null, OnStatisticsDataChanged));

		private static void OnStatisticsDataChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((Statistics)d).StatisticData = (ReportData)e.NewValue;
		}

		#endregion

		public Statistics()
		{
			InitializeComponent();
		}

		private void statistics_Loaded(object sender, RoutedEventArgs e)
		{
			ReportTypes = Session.Inst.BEManager.GetReportTypes();
			Brokers = Session.Inst.BEManager.GetUsers(Session.Inst.OfflineMode).ToList();
			SearchCriteria = new StatisticSearchCriteria
								{
									StartDate = Session.Inst.BEManager.GetFirstAddedObjectDate(Session.Inst.OfflineMode),
									EndDate = DateTime.Now.Date
								};
		}

		private void cbReportType_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (SelectedReportType == null) return;
			if (SelectedReportType.ID == (int)RealEstate.Common.Enumerations.ReportTypes.ByBroker)
			{
				LoadBrokerData();
			}
			else //by agency
			{
				StatisticData = Session.Inst.BEManager.GetAgencyReportData(SearchCriteria, Session.Inst.OfflineMode);
			}
		}

		private void cbBrokers_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			LoadBrokerData();
		}

		private void LoadBrokerData()
		{
			if (SelectedBroker == null)
			{
				StatisticData = new ReportData();
				return;
			}
			SearchCriteria.BrokerID = SelectedBroker.ID;
			StatisticData = Session.Inst.BEManager.GetBrokerReportData(SearchCriteria, Session.Inst.OfflineMode);
		}

		private void btnPrint_Click(object sender, RoutedEventArgs e)
		{
			if (SelectedReportType == null) return;
			BrokerStatisticReport brokerReport = new BrokerStatisticReport();
			brokerReport.RegData("ReportData", StatisticData);
			brokerReport.StartDate = SearchCriteria.StartDate;
			brokerReport.EndDate = SearchCriteria.EndDate;
			brokerReport.AddedDemandsCountLabel = CultureResources.Inst["AddedClientsCountP"];
			brokerReport.AddedEstatesCountLabel = CultureResources.Inst["AddedEstatesCountP"];
			brokerReport.EstatesCountLabel = CultureResources.Inst["AllEstatesCountP"];
			brokerReport.DemandsCountLabel = CultureResources.Inst["AllClientsCountP"];
			brokerReport.UpdatedEstatesCountLabel = CultureResources.Inst["UpdatedEstatesCountP"];
			brokerReport.UpdatedDemandsCountLabel = CultureResources.Inst["UpdatedClientsCountP"];
			brokerReport.SoldEstatesCountLabel = CultureResources.Inst["SoldEstatesCountP"];
			brokerReport.RentedEstatesCountLabel = CultureResources.Inst["ArendedEstatesCountP"];
			brokerReport.ShowedClientsCountLabel = CultureResources.Inst["ShowedClientsCountP"];
			brokerReport.ShowedEstatesCountLabel = CultureResources.Inst["ShowedEstatesCountP"];

			if (SelectedReportType.ID == (int)RealEstate.Common.Enumerations.ReportTypes.ByBroker)
			{
				brokerReport.BrokerName = SelectedBroker.FullName;
			}
			brokerReport.Show(true);
		}

		private void btnPrintByBrokers_Click(object sender, RoutedEventArgs e)
		{
			RealtorReportByBrokers brokerReport = new RealtorReportByBrokers();

			brokerReport.StartDate = SearchCriteria.StartDate;
			brokerReport.EndDate = SearchCriteria.EndDate;
			brokerReport.AddedDemandsCountLabel = CultureResources.Inst["AddedClientsCountP"];
			brokerReport.AddedEstatesCountLabel = CultureResources.Inst["AddedEstatesCountP"];
			brokerReport.EstatesCountLabel = CultureResources.Inst["AllEstatesCountP"];
			brokerReport.DemandsCountLabel = CultureResources.Inst["AllClientsCountP"];
			brokerReport.UpdatedEstatesCountLabel = CultureResources.Inst["UpdatedEstatesCountP"];
			brokerReport.UpdatedDemandsCountLabel = CultureResources.Inst["UpdatedClientsCountP"];
			brokerReport.SoldEstatesCountLabel = CultureResources.Inst["SoldEstatesCountP"];
			brokerReport.RentedEstatesCountLabel = CultureResources.Inst["ArendedEstatesCountP"];
			brokerReport.ShowedClientsCountLabel = CultureResources.Inst["ShowedClientsCountP"];
			brokerReport.ShowedEstatesCountLabel = CultureResources.Inst["ShowedEstatesCountP"];
			brokerReport.BrokerLabel = CultureResources.Inst["Broker"];
			List<ReportData> brokersData = Session.Inst.BEManager.GetReportByBrokers(SearchCriteria, Session.Inst.OfflineMode);
			brokerReport.RegData("ReportData", brokersData);
			brokerReport.Show(true);
		}

		private void DatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
		{
			if (SelectedReportType == null)
			{
				cbReportType.Focus();
				return;
			}
			if (SelectedReportType.ID == (int)RealEstate.Common.Enumerations.ReportTypes.ByBroker)
			{
				LoadBrokerData();
			}
			else //by agency
			{
				StatisticData = Session.Inst.BEManager.GetAgencyReportData(SearchCriteria, Session.Inst.OfflineMode);
			}
		}

		private void btnSearch_Click(object sender, RoutedEventArgs e)
		{
			if (SelectedReportType == null)
			{
				cbReportType.Focus();
				return;
			}
			if (SelectedReportType.ID == (int)RealEstate.Common.Enumerations.ReportTypes.ByBroker)
			{
				LoadBrokerData();
			}
			else //by agency
			{
				StatisticData = Session.Inst.BEManager.GetAgencyReportData(SearchCriteria, Session.Inst.OfflineMode);
			}
		}
	}


}
