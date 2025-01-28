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
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;
using Shared.Helpers;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for DeletedEstatesWindow.xaml
	/// </summary>
	public partial class DeletedEstatesWindow : Window
	{
		public DeletedEstatesWindow()
		{
			InitializeComponent();
			SearchCriteria = new SoldRentedEstateCriteria();
		}
        
		public ObservableCollection<Estate> DeletedEstates
		{
			get { return (ObservableCollection<Estate>)GetValue(DeletedEstatesProperty); }
			set { SetValue(DeletedEstatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for DeletedEstates.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty DeletedEstatesProperty =
			DependencyProperty.Register("DeletedEstates", typeof(ObservableCollection<Estate>), typeof(DeletedEstatesWindow), new UIPropertyMetadata(null, OnDeletedEstatesChanged));

		private static void OnDeletedEstatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((DeletedEstatesWindow) d).DeletedEstates = (ObservableCollection<Estate>) e.NewValue;
		}

		public List<Currency> Currencies
		{
			get { return (List<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(DeletedEstatesWindow), new UIPropertyMetadata(null, OnCurrenciesChanged));

		private static void OnCurrenciesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			DeletedEstatesWindow view = d as DeletedEstatesWindow;
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
			DependencyProperty.Register("Regions", typeof(List<Region>), typeof(DeletedEstatesWindow), new UIPropertyMetadata(null, OnRegionsChanged));

		private static void OnRegionsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			DeletedEstatesWindow view = d as DeletedEstatesWindow;
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
			DependencyProperty.Register("SearchCriteria", typeof(SoldRentedEstateCriteria), typeof(DeletedEstatesWindow), new UIPropertyMetadata(null, OnSearchCriteriaChanged));

		private static void OnSearchCriteriaChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			DeletedEstatesWindow view = d as DeletedEstatesWindow;
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
			DependencyProperty.Register("EstateTypes", typeof(List<EstateType>), typeof(DeletedEstatesWindow), new UIPropertyMetadata(null, OnEstateTypesChanged));

		private static void OnEstateTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			DeletedEstatesWindow view = d as DeletedEstatesWindow;
			if (view != null)
			{
				view.EstateTypes = (List<EstateType>)e.NewValue;
			}
		}

		private void mnuOpen_Click(object sender, RoutedEventArgs e)
		{
			EstateView view = new EstateView(dgEstates.SelectedItem as Estate);
			view.Show();
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
			DeletedEstates = Session.Inst.BEManager.GetDeletedEstates(SearchCriteria, Session.Inst.OfflineMode);
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
			EstateView view = new EstateView(dgEstates.SelectedItem as Estate);
			view.Show();
		}

		private void mnuReturnToEstates(object sender, RoutedEventArgs e)
		{
			if (Session.Inst.BEManager.ReturnDeletedEstateToEstatesList(dgEstates.SelectedItem as Estate))
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
			//UpdateList();
		}

		private void dpDateTo_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
		{
			//UpdateList();
		}

		private void txtPriceFrom_TextChanged(object sender, TextChangedEventArgs e)
		{
			//UpdateList();
		}

        private void btnSeach_Click(object sender, RoutedEventArgs e)
        {
            UpdateList();
        }

		private void btnClearSeach_Click(object sender, RoutedEventArgs e)
		{
			this.SearchCriteria = new SoldRentedEstateCriteria();
		}

	}
}
