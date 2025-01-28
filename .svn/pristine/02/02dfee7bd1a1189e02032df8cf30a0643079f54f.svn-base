using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using RealEstate.Common.Cultures;
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;
using RealEstateApp.CustomControls;
using Shared.Helpers;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for SimpleSearchControl.xaml
	/// </summary>
	public partial class SimpleSearchControl
	{

		#region Dependency Properties



		public List<User> Brokers
		{
			get { return (List<User>)GetValue(BrokersProperty); }
			set { SetValue(BrokersProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Brokers.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty BrokersProperty =
			DependencyProperty.Register("Brokers", typeof(List<User>), typeof(SimpleSearchControl), new UIPropertyMetadata(null));

		public Visibility PricePerDayVisibility
		{
			get { return (Visibility)GetValue(PricePerDayVisibilityProperty); }
			set { SetValue(PricePerDayVisibilityProperty, value); }
		}

		// Using a DependencyProperty as the backing store for PricePerDayVisibility.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty PricePerDayVisibilityProperty =
			DependencyProperty.Register("PricePerDayVisibility", typeof(Visibility), typeof(SimpleSearchControl), new UIPropertyMetadata(Visibility.Collapsed, OnPricePerDayVisibilityChanged));

		private static void OnPricePerDayVisibilityChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SimpleSearchControl ctrl = d as SimpleSearchControl;
			if (ctrl != null)
			{
				ctrl.PricePerDayVisibility = (Visibility)e.NewValue;
			}
		}


		public List<EstateType> RealEstateTypes
		{
			get { return (List<EstateType>)GetValue(RealEstateTypesProperty); }
			set { SetValue(RealEstateTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for RealEstateTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RealEstateTypesProperty =
			DependencyProperty.Register("RealEstateTypes", typeof(List<EstateType>), typeof(SimpleSearchControl), new UIPropertyMetadata(null, OnRealEstateTypesChanged));

		private static void OnRealEstateTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SimpleSearchControl wnd = sender as SimpleSearchControl;
			if (wnd != null)
			{
				wnd.RealEstateTypes = (List<EstateType>)e.NewValue;
			}
		}

		public List<Currency> Currencies
		{
			get { return (List<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(SimpleSearchControl), new UIPropertyMetadata(null, OnCurrenciesChanged));

		private static void OnCurrenciesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SimpleSearchControl ssc = (SimpleSearchControl)sender;
			if (ssc != null)
			{
				ssc.Currencies = (List<Currency>)e.NewValue;
			}
		}

		public RealEstateSearchParameters SearchParameters
		{
			get { return (RealEstateSearchParameters)GetValue(SearchParametersProperty); }
			set { SetValue(SearchParametersProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SearchParameters.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SearchParametersProperty =
			DependencyProperty.Register("SearchParameters", typeof(RealEstateSearchParameters), typeof(SimpleSearchControl), new UIPropertyMetadata(null, OnSearchParametersChanged));

		private static void OnSearchParametersChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SimpleSearchControl sec = sender as SimpleSearchControl;
			if (sec != null)
			{
				sec.SearchParameters = (RealEstateSearchParameters)e.NewValue;
			}
		}

		public Control RealEstatesListControlName
		{
			get { return (Control)GetValue(RealEstatesListControlNameProperty); }
			set { SetValue(RealEstatesListControlNameProperty, value); }
		}

		// Using a DependencyProperty as the backing store for RealEstatesListControlName.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RealEstatesListControlNameProperty =
			DependencyProperty.Register("RealEstatesListControlName", typeof(Control), typeof(SimpleSearchControl), new UIPropertyMetadata(null, OnRealEstatesListControlNameChanged));

		private static void OnRealEstatesListControlNameChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SimpleSearchControl sc = (SimpleSearchControl)sender;
			if (sc != null)
			{
				sc.RealEstatesListControlName = (Control)e.NewValue;
			}
		}

		public List<OrderType> OrderTypes
		{
			get { return (List<OrderType>)GetValue(OrderTypesProperty); }
			set { SetValue(OrderTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for OrderTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty OrderTypesProperty =
			DependencyProperty.Register("OrderTypes", typeof(List<OrderType>), typeof(SimpleSearchControl), new UIPropertyMetadata(null, OnOrderTypesChanged));
		private static void OnOrderTypesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			SimpleSearchControl ssc = (SimpleSearchControl)sender;
			if (ssc != null)
			{
				ssc.OrderTypes = (List<OrderType>)e.NewValue;
			}
		}

		#endregion

		public SimpleSearchControl()
		{
			if (SearchParameters == null)
			{
				SearchParameters = new RealEstateSearchParameters { DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose };
			}
			InitializeComponent();
		}

		private void LoadData()
		{
			var orderTypes = Session.Inst.BEManager.GetOrderTypesForEstate(Session.Inst.User, Session.Inst.OfflineMode);
			orderTypes.Add(new OrderType { OrderTypeID = -2, Name = CultureResources.Inst["DaylyRent"] });
			OrderTypes = orderTypes;
			Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
			RealEstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
			var brokers = Session.Inst.BEManager.GetUsersByRights(Session.Inst.User, Session.Inst.OfflineMode);
			brokers.Insert(0, new User { ID = -1, Name = CultureResources.Inst["NotSpecified"] });
			Brokers = brokers;
		}

		private void CheckBoxOrderTypes_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				OrderType orderType = (OrderType)checkbox.CommandParameter;
				if (checkbox.IsChecked.GetValueOrDefault(false))
				{
					if (orderType != null)
					{
						SearchParameters.OrderTypes.Add(orderType);
						if (orderType.OrderTypeID == -2)//rent
						{
							PricePerDayVisibility = System.Windows.Visibility.Visible;
						}
					}
				}
				else
				{
					if (SearchParameters.OrderTypes.Contains(orderType))
					{
						SearchParameters.OrderTypes.Remove(orderType);
					}
					if (orderType.OrderTypeID == -2)//rent
					{
						PricePerDayVisibility = System.Windows.Visibility.Collapsed;
					}
				}
			}
		}

		private void btnSearch_Click(object sender, RoutedEventArgs e)
		{
			CalculatePriceInAMD();
			if(SearchParameters.OrderTypes.FirstOrDefault(s=>s.OrderTypeID == -2) !=null)
			{
				SearchParameters.IsDaylyRent = true;
			}
			if (SearchParameters.OrderTypes.Where(s => s.OrderTypeID == 2).Count() == 0)
			{
				SearchParameters.PricePerDayFrom = SearchParameters.PricePerDayTo = null;
			}
			var sp = SearchParameters.Clone();
			var listControl = (DragDockPanel)RealEstatesListControlName;
			((RealEstatesList)listControl.FindName("EstatesList")).SearchParameters = null;
			((RealEstatesList)listControl.FindName("EstatesList")).SearchParameters = sp as RealEstateSearchParameters;
			listControl.MaximizeToggle_Checked(sender, e);
		}

		private void CalculatePriceInAMD()
		{
			if (SearchParameters.Currency == null)
			{
				SearchParameters.Currency = new Currency { CurrencyID = 1, ValueInAMD = 1 }; //dram
			}
			if (SearchParameters.PriceFrom.HasValue)
			{
				SearchParameters.PriceFromInAMD = CalculationHelper.GetPriceInAMD(SearchParameters.PriceFrom, SearchParameters.Currency);
			}
			if (SearchParameters.PriceTo.HasValue)
			{
				SearchParameters.PriceToInAMD = CalculationHelper.GetPriceInAMD(SearchParameters.PriceTo, SearchParameters.Currency);
			}
		}

		private void btnClear_Click(object sender, RoutedEventArgs e)
		{
			SearchParameters = new RealEstateSearchParameters { DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose };
			ClearCheckBoxes();
		}

		private void ClearCheckBoxes()
		{
			OrderTypes = Session.Inst.BEManager.GetOrderTypesForEstate(Session.Inst.User, Session.Inst.OfflineMode);
			RealEstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
		}

		private void CheckBoxRealEstateTypes_Checked(object sender, RoutedEventArgs e)
		{
			CheckBox checkbox = (CheckBox)sender;
			if (checkbox != null)
			{
				EstateType realEstateType = (EstateType)checkbox.CommandParameter;
				if (checkbox.IsChecked.GetValueOrDefault(false))
				{
					if (realEstateType != null)
					{
						SearchParameters.RealEstateTypes.Add(realEstateType);
					}
				}
				else
				{
					if (SearchParameters.RealEstateTypes.Contains(realEstateType))
					{
						SearchParameters.RealEstateTypes.Remove(realEstateType);
					}
				}
			}
		}

		public void RefreshData()
		{
			LoadData();
		}

		private void simpleSearch_Loaded(object sender, RoutedEventArgs e)
		{
			LoadData();
		}

		private void Grid_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
		{
			if (e.Key == System.Windows.Input.Key.Enter)
			{
				btnSearch_Click(sender, new RoutedEventArgs());
				e.Handled = true;
			}
		}

		private void CheckBox_MouseEnter(object sender, System.Windows.Input.MouseEventArgs e)
		{
			if (e.LeftButton == System.Windows.Input.MouseButtonState.Pressed)
			{
				var checkbox = sender as CheckBox;
				checkbox.IsChecked = !checkbox.IsChecked;
				//e.Handled = true;
			}
		}
	}
}
