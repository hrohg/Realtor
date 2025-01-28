using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for CurrencyManagement.xaml
	/// </summary>
	public partial class CurrencyManagement : Window
	{


		public ObservableCollection<Currency> Currencies
		{
			get { return (ObservableCollection<Currency>)GetValue(CurrenciesProperty); }
			set { SetValue(CurrenciesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CurrenciesProperty =
			DependencyProperty.Register("Currencies", typeof(ObservableCollection<Currency>), typeof(CurrencyManagement), new UIPropertyMetadata(null, OnCurrenciesChanged));

		private static void OnCurrenciesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			CurrencyManagement form = d as CurrencyManagement;
			if (form != null)
			{
				form.Currencies = (ObservableCollection<Currency>)e.NewValue;
			}
		}

		public CurrencyManagement()
		{
			InitializeComponent();
		}

		private void CurrencyManagement_OnLoaded(object sender, RoutedEventArgs e)
		{
			LoadCurrencies();
		}

		private void LoadCurrencies()
		{
			Currencies = new ObservableCollection<Currency>(Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode));
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as Currency;
			if (bt == null) return;

			if(bt.CurrencyID == 1)
			{
				MessageBox.Show(CultureResources.Inst["YouCanNotDeleteThisCurrency"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			if (Session.Inst.BEManager.DeleteCurrency(bt))
			{
				LoadCurrencies();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void dgCurrency_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			Currency currency = e.Row.Item as Currency;
			if (currency == null || string.IsNullOrEmpty(currency.Name) || currency.ValueInAMD <= 0)
			{
				e.Cancel = true;
				return;
			}

			if (currency.CurrencyID > 0)
			{
				if (!Session.Inst.BEManager.UpdateCurrency(currency))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddCurrency(currency))
				{
					e.Cancel = true;
				}
			}
		}

		private void currencyManagement_KeyUp(object sender, KeyEventArgs e)
		{
			if(e.Key == Key.Escape)
			{
				Close();
			}
		}
	}
}
