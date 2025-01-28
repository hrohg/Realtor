using System.Collections.Generic;
using System.Windows;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using Realtor.UploadService.Facade;
using Shared.Helpers;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for SelledEstateDetails.xaml
	/// </summary>
	public partial class SelledEstateDetails : Window
	{

		public List<Currency> Currencies
		{
			get { return (List<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(SelledEstateDetails), new UIPropertyMetadata(null, OnCurrenciesChanged));

		private static void OnCurrenciesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SelledEstateDetails form = d as SelledEstateDetails;
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
			DependencyProperty.Register("Brokers", typeof(List<User>), typeof(SelledEstateDetails), new UIPropertyMetadata(null, OnBrokersChanged));

		private static void OnBrokersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SelledEstateDetails form = d as SelledEstateDetails;
			if (form != null)
			{
				form.Brokers = (List<User>)e.NewValue;
			}
		}


		public SelledEstate SellEstate
		{
			get { return (SelledEstate)GetValue(SellEstateProperty); }
			set { SetValue(SellEstateProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SellEstate.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SellEstateProperty =
			DependencyProperty.Register("SellEstate", typeof(SelledEstate), typeof(SelledEstateDetails), new UIPropertyMetadata(OnSellEstateChanged));

		private static void OnSellEstateChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			SelledEstateDetails form = d as SelledEstateDetails;
			if (form != null)
			{
				form.SellEstate = (SelledEstate)e.NewValue;
				if(form.SellEstate!=null && form.SellEstate.Estate!=null)
				{
					form.Title = string.Format("{0}, {1}", form.SellEstate.Estate.EstateType.TypeName, form.SellEstate.Estate.ShortAddressString);
				}
			}
		}


		public SelledEstateDetails()
		{
			InitializeComponent();
			if (SellEstate == null)
			{
				SellEstate = new SelledEstate();
			}
		}

		public SelledEstateDetails(Estate estate)
			: this()
		{
			SellEstate.EstateID = estate.EstateID;
			SellEstate.Price = estate.Price;
			if(estate.CurrencyID.HasValue)
			{
				SellEstate.CurrencyID = estate.CurrencyID;
			}
		}

		public SelledEstateDetails(SelledEstate selledEstate)
			: this()
		{
			SellEstate = selledEstate;
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			if (!SellEstate.CurrencyID.HasValue)
			{
				SellEstate.CurrencyID = 1; //AMD
				SellEstate.PriceInAMD = SellEstate.Price;
			}
			else
			{
				var selectedCurrency = cbCurrency.SelectedItem as Currency;
				SellEstate.PriceInAMD = CalculationHelper.GetPriceInAMD(SellEstate.Price, selectedCurrency);
			}

			if (!SellEstate.IsValid)
			{
                MessageBox.Show(CultureResources.Inst["PleaseCorrectlyFillFields"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			if (SellEstate.ID > 0)
			{
				if(Session.Inst.BEManager.UpdateSelledEstate(SellEstate))
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
				if (Session.Inst.BEManager.EstateMarkAsSelled(SellEstate))
				{
					DialogResult = true;
					if (Session.Inst.IsWebEnabled ?? false)
					{
						ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.MarkSoldOrRented(SellEstate.EstateID));
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

		private void sellInfo_Loaded(object sender, RoutedEventArgs e)
		{
			Brokers = Session.Inst.BEManager.GetBrokers(Session.Inst.OfflineMode);
			Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
		}
	}
}
