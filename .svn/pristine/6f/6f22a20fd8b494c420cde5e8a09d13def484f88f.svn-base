using System.Collections.Generic;
using System.Collections.ObjectModel;
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
	/// Interaction logic for RentedEstates.xaml
	/// </summary>
	public partial class RentedEstates : Window
	{
		public List<Currency> Currencies
		{
			get { return (List<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(RentedEstates), new UIPropertyMetadata(null, OnCurrenciesChanged));

		private static void OnCurrenciesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RentedEstates view = d as RentedEstates;
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
			DependencyProperty.Register("Regions", typeof(List<Region>), typeof(RentedEstates), new UIPropertyMetadata(null, OnRegionsChanged));

		private static void OnRegionsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RentedEstates view = d as RentedEstates;
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
			DependencyProperty.Register("SearchCriteria", typeof(SoldRentedEstateCriteria), typeof(RentedEstates), new UIPropertyMetadata(null, OnSearchCriteriaChanged));

		private static void OnSearchCriteriaChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RentedEstates view = d as RentedEstates;
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
			DependencyProperty.Register("EstateTypes", typeof(List<EstateType>), typeof(RentedEstates), new UIPropertyMetadata(null, OnEstateTypesChanged));

		private static void OnEstateTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RentedEstates view = d as RentedEstates;
			if (view != null)
			{
				view.EstateTypes = (List<EstateType>)e.NewValue;
			}
		}

		public ObservableCollection<RentedEstate> RentEstates
		{
			get { return (ObservableCollection<RentedEstate>)GetValue(RentEstatesProperty); }
			set { SetValue(RentEstatesProperty, value); }
		}

		public static readonly DependencyProperty RentEstatesProperty =
			DependencyProperty.Register("RentEstates", typeof(ObservableCollection<RentedEstate>), typeof(RentedEstates), new UIPropertyMetadata(null, OnRentedEstatesChanged));

		private static void OnRentedEstatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RentedEstates form = d as RentedEstates;
			if (form != null)
			{
				form.RentEstates = (ObservableCollection<RentedEstate>)e.NewValue;
			}
		}

		private void LoadData()
		{
			var regions = Session.Inst.BEManager.GetRegions(1, Session.Inst.User, Session.Inst.OfflineMode);
			regions.Insert(0, new Region { RegionID = -1, Name = CultureResources.Inst["All"] });
			Regions = regions;

			var estateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
            estateTypes.Insert(0, new EstateType { EstateTypeID = -1, TypeName = CultureResources.Inst["All"] });
			EstateTypes = estateTypes;
			Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
		}

		public RentedEstates()
		{
			InitializeComponent();
			SearchCriteria = new SoldRentedEstateCriteria();
		}

		private void mnuDelete_Click(object sender, RoutedEventArgs e)
		{
			if (Session.Inst.BEManager.ReturnRentedEstateToEstatesList(dgEstates.SelectedItem as RentedEstate))
			{
				UpdateList();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void mnuEdit_Click(object sender, RoutedEventArgs e)
		{
			if (dgEstates.SelectedItem == null) return;
			if (new RentEstateDetails(dgEstates.SelectedItem as RentedEstate).ShowDialog() ?? false)
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
			if (SearchCriteria.PricePerDayFrom.HasValue)
			{
				if (cbCurrencies.SelectedItem != null)
				{
					SearchCriteria.PricePerDayFromInAMD = CalculationHelper.GetPriceInAMD(SearchCriteria.PricePerDayFrom,
																					cbCurrencies.SelectedItem as Currency);
				}
				else
				{
					SearchCriteria.PricePerDayFromInAMD = SearchCriteria.PricePerDayFrom;
				}
			}
			if (SearchCriteria.PricePerDayTo.HasValue)
			{
				if (cbCurrencies.SelectedItem != null)
				{
					SearchCriteria.PricePerDayToInAMD = CalculationHelper.GetPriceInAMD(SearchCriteria.PricePerDayTo,
																					cbCurrencies.SelectedItem as Currency);
				}
				else
				{
					SearchCriteria.PricePerDayToInAMD = SearchCriteria.PricePerDayTo;
				}
			}

			RentEstates = new ObservableCollection<RentedEstate>(Session.Inst.BEManager.GetRentedEstates(SearchCriteria, Session.Inst.OfflineMode));
		}

		private void mnuOpen_Click(object sender, RoutedEventArgs e)
		{
			new EstateView((dgEstates.SelectedItem as RentedEstate).Estate).Show();
		}

		private void dgEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
		{
			if (dgEstates.SelectedItem == null) return;
			new EstateView((dgEstates.SelectedItem as RentedEstate).Estate).Show();
		}

		private void rentedEstatesForm_Loaded(object sender, RoutedEventArgs e)
		{
			LoadData();
			UpdateList();
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			UpdateList();
		}

		private void btnClearSeach_Click(object sender, RoutedEventArgs e)
		{
			SearchCriteria = new SoldRentedEstateCriteria();
			UpdateList();
		}

		private void txtPriceFrom_TextChanged(object sender, TextChangedEventArgs e)
		{
			UpdateList();
		}

		private void dpDateTo_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
		{
			UpdateList();
		}

		private void mnuDeleteRentInfo_Click(object sender, RoutedEventArgs e)
		{
			if (dgEstates.SelectedItem == null) return;

			if(MessageBox.Show(CultureResources.Inst["AreYouSureYouWantToDeleteRentInfo"],CultureResources.Inst["ConfirmDelete"], MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.No)
			{
				return;
			}
			
			if (Session.Inst.BEManager.DeleteRentedEstate(dgEstates.SelectedItem as RentedEstate))
			{
				UpdateList();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}
	}
}
