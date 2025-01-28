using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Input;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using Realtor.UploadService.Facade;
using Shared.Helpers;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for RentEstateDetails.xaml
	/// </summary>
	public partial class RentEstateDetails : Window
	{


		public RentedEstate RentEstate
		{
			get { return (RentedEstate)GetValue(RentEstateProperty); }
			set { SetValue(RentEstateProperty, value); }
		}

		// Using a DependencyProperty as the backing store for RentEstate.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RentEstateProperty =
			DependencyProperty.Register("RentEstate", typeof(RentedEstate), typeof(RentEstateDetails), new UIPropertyMetadata(null, OnRentEstateChanged));

		private static void OnRentEstateChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RentEstateDetails form = d as RentEstateDetails;
			if (form != null)
			{
				form.RentEstate = (RentedEstate)e.NewValue;
			}
		}


		public List<Currency> Currencies
		{
			get { return (List<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(RentEstateDetails), new UIPropertyMetadata(null, OnCurrenciesChanged));

		private static void OnCurrenciesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RentEstateDetails form = d as RentEstateDetails;
			if (form != null)
			{
				form.Currencies = (List<Currency>)e.NewValue;
			}
		}


		public List<User> Brokers
		{
			get { return (List<User>)GetValue(BrokersProperty); }
			set { SetValue(BrokersProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Brokers.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty BrokersProperty =
			DependencyProperty.Register("Brokers", typeof(List<User>), typeof(RentEstateDetails), new UIPropertyMetadata(null, OnBrokersChanged));

		private static void OnBrokersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			RentEstateDetails form = d as RentEstateDetails;
			if (form != null)
			{
				form.Brokers = (List<User>)e.NewValue;
			}
		}

		public RentEstateDetails()
		{
			InitializeComponent();
			if (RentEstate == null)
			{
				RentEstate = new RentedEstate();
			}
		}

		public RentEstateDetails(Estate estate)
			: this()
		{
			this.RentEstate.Estate = estate;
			RentEstate.CurrencyID = estate.CurrencyID;
			RentEstate.Price = estate.Price;
			RentEstate.PricePerDay = estate.PricePerDay;
			RentEstate.StartDate = DateTime.Now;
		}

		public RentEstateDetails(RentedEstate rentedEstate)
			: this()
		{
			this.RentEstate = rentedEstate;
		}

		private void rentDetailsForm_Loaded(object sender, RoutedEventArgs e)
		{
			Brokers = Session.Inst.BEManager.GetBrokers(Session.Inst.OfflineMode);
			Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
		}

		private void rentDetailsForm_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				DialogResult = false;
				Close();
			}
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			if (!RentEstate.CurrencyID.HasValue)
			{
				RentEstate.CurrencyID = 1; //AMD
				RentEstate.PriceInAMD = RentEstate.Price;
				RentEstate.PricePerDayInAMD = RentEstate.PricePerDay;
			}
			else
			{
				var selectedCurrency = cbCurrency.SelectedItem as Currency;
				RentEstate.PriceInAMD = CalculationHelper.GetPriceInAMD(RentEstate.Price, selectedCurrency);
				RentEstate.PricePerDayInAMD = CalculationHelper.GetPriceInAMD(RentEstate.PricePerDay, selectedCurrency);
			}

			if (!RentEstate.IsValid)
			{
				MessageBox.Show(CultureResources.Inst["PleaseCorrectlyFillFields"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			if (RentEstate.ID > 0)
			{
				if (Session.Inst.BEManager.UpdateRentedEstate(RentEstate))
				{
					MessageBox.Show(CultureResources.Inst["YourChangesSuccessfullySaved"], "", MessageBoxButton.OK,
									MessageBoxImage.Information);
					Close();
				}
				else
				{
					MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK,
									MessageBoxImage.Error);
				}
			}
			else
			{
				if (Session.Inst.BEManager.EstateMarkAsRented(RentEstate))
				{
					MessageBox.Show(CultureResources.Inst["YourChangesSuccessfullySaved"], "", MessageBoxButton.OK,
									MessageBoxImage.Information);
					DialogResult = true;
					if (Session.Inst.IsWebEnabled ?? false)
					{
						ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.MarkSoldOrRented(RentEstate.EstateID));
					}
					Close();
				}
				else
				{
					MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK,
									MessageBoxImage.Error);
				}
			}
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			DialogResult = false;
			Close();
		}
	}
}
