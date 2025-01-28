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
using RealEstate.DataAccess;
using UserControls;
using DataGridRowEditEndingEventArgs = Microsoft.Windows.Controls.DataGridRowEditEndingEventArgs;

namespace RealEstateApp
{
    /// <summary>
    /// Interaction logic for CountriesManagement.xaml
    /// </summary>
    public partial class CountriesManagement : Window
    {

        #region Dependency properties



        public ObservableCollection<City> Cities
        {
            get { return (ObservableCollection<City>)GetValue(CitiesProperty); }
            set { SetValue(CitiesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Cities.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CitiesProperty =
            DependencyProperty.Register("Cities", typeof(ObservableCollection<City>), typeof(CountriesManagement), new UIPropertyMetadata(null, OnCitiesChanged));

        private static void OnCitiesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((CountriesManagement)d).Cities = (ObservableCollection<City>)e.NewValue;
            
        }


        public Country SelectedCountry
        {
            get { return (Country)GetValue(SelectedCountryProperty); }
            set { SetValue(SelectedCountryProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SelectedCountry.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedCountryProperty =
            DependencyProperty.Register("SelectedCountry", typeof(Country), typeof(CountriesManagement), new UIPropertyMetadata(null, OnSelectedCountryChanged));

        private static void OnSelectedCountryChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var wnd = d as CountriesManagement;
            wnd.SelectedCountry = (Country) e.NewValue;
            wnd.Cities = Session.Inst.BEManager.GetCitiesByCountry(wnd.SelectedCountry.ID, Session.Inst.OfflineMode);
        }


        public ObservableCollection<Country> Countries
        {
            get { return (ObservableCollection<Country>)GetValue(CountriesProperty); }
            set { SetValue(CountriesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Countries.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CountriesProperty =
            DependencyProperty.Register("Countries", typeof(ObservableCollection<Country>), typeof(CountriesManagement), new UIPropertyMetadata(null, OnCountriesChanged));

        private static void OnCountriesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((CountriesManagement)d).Countries = (ObservableCollection<Country>)e.NewValue;
        }

        #endregion
        public CountriesManagement()
        {
            InitializeComponent();
            //LoadCountries();
        }

        private void ButtonDelete_Click(object sender, RoutedEventArgs e)
        {
            var bt = ((Button)sender).CommandParameter as Country;
            if (bt == null) return;
            //if (bt.CityID == 1)
            //{
            //    MessageBox.Show(string.Format(CultureResources.Inst["YouCanNotDeleteXCity"], bt.Name), CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
            //    return;
            //}

            if (Session.Inst.BEManager.DeleteCountry(bt))
            {
                LoadCountries();
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

        private void dgCountries_RowEditEnding(object sender, System.Windows.Controls.DataGridRowEditEndingEventArgs e)
        {
            Country country = e.Row.Item as Country;
            if (country == null || string.IsNullOrEmpty(country.Name))
            {
                e.Cancel = true;
                return;
            }
            if (country.ID > 0)
            {
                if (!Session.Inst.BEManager.UpdateCountry(country))
                {
                    e.Cancel = true;
                }
            }
            else
            {
                if (!Session.Inst.BEManager.AddCountry(country))
                {
                    e.Cancel = true;
                }
            }
        }



        private void LoadCountries()
        {
            Countries = new ObservableCollection<Country>(Session.Inst.BEManager.GetCountries(Session.Inst.OfflineMode).OrderBy(s => s.Name));
            dgCountries.ItemsSource = Countries;
        }

        private void countryManagement_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                Close();
            }
        }

        private void countryManagement_Loaded(object sender, RoutedEventArgs e)
        {
            LoadCountries();
        }

        private void dgCities_RowEditEnding(object sender, System.Windows.Controls.DataGridRowEditEndingEventArgs e)
        {
            if(dgCountries.SelectedItem == null)
            {
                MessageBox.Show("Ընտրեք երկիրը", CultureResources.Inst["Attention"], MessageBoxButton.OK, MessageBoxImage.Asterisk);
                return;
            }
            City city = e.Row.Item as City;
            if (city == null || string.IsNullOrEmpty(city.Name))
            {
                e.Cancel = true;
                return;
            }
            if (city.CityID > 0)
            {
                if (!Session.Inst.BEManager.UpdateCity(city))
                {
                    e.Cancel = true;
                }
            }
            else
            {
                
                city.CountryID = (dgCountries.SelectedItem as Country).ID;
                if (!Session.Inst.BEManager.AddCity(city))
                {
                    e.Cancel = true;
                }
            }
        }
    }
}
