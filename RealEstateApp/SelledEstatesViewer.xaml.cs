using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Common.Cultures;
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;
using Shared.Helpers;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for SelledEstatesViewer.xaml
	/// </summary>
	public partial class SelledEstatesViewer : Window
	{


		public List<Currency> Currencies
		{
			get { return (List<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(SelledEstatesViewer), new UIPropertyMetadata(null, OnCurrenciesChanged));

		private static void OnCurrenciesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SelledEstatesViewer view = d as SelledEstatesViewer;
			if (view != null)
			{
				view.Currencies = (List<Currency>)e.NewValue;
			}
		}


		public List<Region> Regions
		{
			get { return (List<Region>)GetValue(RegionsProperty); }
			set { SetValue(RegionsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Regions.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RegionsProperty =
			DependencyProperty.Register("Regions", typeof(List<Region>), typeof(SelledEstatesViewer), new UIPropertyMetadata(null, OnRegionsChanged));

		private static void OnRegionsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SelledEstatesViewer view = d as SelledEstatesViewer;
			if (view != null)
			{
				view.Regions = (List<Region>)e.NewValue;
			}
		}


		public SoldRentedEstateCriteria SearchCriteria
		{
			get { return (SoldRentedEstateCriteria)GetValue(SearchCriteriaProperty); }
			set { SetValue(SearchCriteriaProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SearchCriteria.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SearchCriteriaProperty =
			DependencyProperty.Register("SearchCriteria", typeof(SoldRentedEstateCriteria), typeof(SelledEstatesViewer), new UIPropertyMetadata(null, OnSearchCriteriaChanged));

		private static void OnSearchCriteriaChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SelledEstatesViewer view = d as SelledEstatesViewer;
			if (view != null)
			{
				view.SearchCriteria = (SoldRentedEstateCriteria)e.NewValue;
			}
		}


		public List<EstateType> EstateTypes
		{
			get { return (List<EstateType>)GetValue(EstateTypesProperty); }
			set { SetValue(EstateTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for EstateTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstateTypesProperty =
			DependencyProperty.Register("EstateTypes", typeof(List<EstateType>), typeof(SelledEstatesViewer), new UIPropertyMetadata(null, OnEstateTypesChanged));

		private static void OnEstateTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SelledEstatesViewer view = d as SelledEstatesViewer;
			if (view != null)
			{
				view.EstateTypes = (List<EstateType>)e.NewValue;
			}
		}


		public List<SelledEstate> SelledEstates
		{
			get { return (List<SelledEstate>)GetValue(SelledEstatesProperty); }
			set { SetValue(SelledEstatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SelledEstates.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SelledEstatesProperty =
			DependencyProperty.Register("SelledEstates", typeof(List<SelledEstate>), typeof(SelledEstatesViewer), new UIPropertyMetadata(null, OnSeleedEstatesChanged));

		private static void OnSeleedEstatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SelledEstatesViewer form = d as SelledEstatesViewer;
			if (form != null)
			{
				form.SelledEstates = (List<SelledEstate>)e.NewValue;
                
			}
		}


		public SelledEstatesViewer()
		{
			InitializeComponent();
			SearchCriteria = new SoldRentedEstateCriteria();
            
		}

		private void mnuOpen_Click(object sender, RoutedEventArgs e)
		{
			EstateView view = new EstateView((dgEstates.SelectedItem as SelledEstate).Estate);
			view.Show();
		}

		private void mnuEdit_Click(object sender, RoutedEventArgs e)
		{
			SelledEstateDetails form = new SelledEstateDetails(dgEstates.SelectedItem as SelledEstate);
			if (form.ShowDialog() ?? false)
			{
				UpdateList();
			}
		}

		private void UpdateList()
		{
			if (SearchCriteria.PriceFrom.HasValue)
			{
				if (cbCurrencies.SelectedItem != null)
				{
					SearchCriteria.PriceFromInAMD = CalculationHelper.GetPriceInAMD(SearchCriteria.PriceFrom,
																					cbCurrencies.SelectedItem as Currency);
				}
				else
				{
					SearchCriteria.PriceFromInAMD = SearchCriteria.PriceFrom;
				}
			}
			if (SearchCriteria.PriceTo.HasValue)
			{
				if (cbCurrencies.SelectedItem != null)
				{
					SearchCriteria.PriceToInAMD = CalculationHelper.GetPriceInAMD(SearchCriteria.PriceTo,
																					cbCurrencies.SelectedItem as Currency);
				}
				else
				{
					SearchCriteria.PriceToInAMD = SearchCriteria.PriceTo;
				}
			}
			SelledEstates = Session.Inst.BEManager.GetSoldEstates(SearchCriteria, Session.Inst.OfflineMode);
		}

		private void Window_Loaded(object sender, RoutedEventArgs e)
		{
			LoadData();
			UpdateList();
		}

		private void LoadData()
		{
			Regions = Session.Inst.BEManager.GetRegions(1, Session.Inst.User, Session.Inst.OfflineMode);
			EstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
			Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
		}

		private void dgEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
		{
			EstateView view = new EstateView((dgEstates.SelectedItem as SelledEstate).Estate);
			view.Show();
		}

		private void mnuReturnToEstates(object sender, RoutedEventArgs e)
		{
			if (Session.Inst.BEManager.ReturnSelledEstateToEstatesList(dgEstates.SelectedItem as SelledEstate))
			{
				UpdateList();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			UpdateList();
		}

		private void dpDateTo_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
		{
			UpdateList();
		}

		private void txtPriceFrom_TextChanged(object sender, TextChangedEventArgs e)
		{
			UpdateList();
		}

		private void btnClearSeach_Click(object sender, RoutedEventArgs e)
		{
			this.SearchCriteria = new SoldRentedEstateCriteria();
		}

	    private void btnSeach_Click(object sender, RoutedEventArgs e)
	    {
	        UpdateList();
	    }
	}
}
