using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for CityManagement.xaml
	/// </summary>
	public partial class CityManagement : Window
	{

		public List<LanguageEntity> Languages
		{
			get { return (List<LanguageEntity>)GetValue(LanguagesProperty); }
			set { SetValue(LanguagesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Languages.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty LanguagesProperty =
			DependencyProperty.Register("Languages", typeof(List<LanguageEntity>), typeof(CityManagement), new UIPropertyMetadata(null, OnLanguagesChanged));

		private static void OnLanguagesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			CityManagement form = d as CityManagement;
			if (form != null)
			{
				form.Languages = (List<LanguageEntity>)e.NewValue;
			}
		}

		public ObservableCollection<City> Cities
		{
			get { return (ObservableCollection<City>)GetValue(CitiesProperty); }
			set { SetValue(CitiesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Cities.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty CitiesProperty =
			DependencyProperty.Register("Cities", typeof(ObservableCollection<City>), typeof(CityManagement), new UIPropertyMetadata(null, OnCitiesChanged));

		private static void OnCitiesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			CityManagement form = d as CityManagement;
			if (form != null)
			{
				form.Cities = (ObservableCollection<City>)e.NewValue;
			}
		}

		public List<State> States
		{
			get { return (List<State>)GetValue(StatesProperty); }
			set { SetValue(StatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for States.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StatesProperty =
			DependencyProperty.Register("States", typeof(List<State>), typeof(CityManagement), new UIPropertyMetadata(null, OnStatesChanged));

		private static void OnStatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			CityManagement form = d as CityManagement;
			if (form != null)
			{
				form.States = (List<State>)e.NewValue;
			}
		}

		public CityManagement()
		{
			InitializeComponent();
		}

		private void CityManagement_OnLoaded(object sender, RoutedEventArgs e)
		{
			LoadStates();
			LoadLanguages();
		}

		private void LoadLanguages()
		{
			Languages = LanguageEntity.GetLanguages();
		}

		private void LoadStates()
		{
			States = Session.Inst.BEManager.GetStates(Session.Inst.User, Session.Inst.OfflineMode).OrderBy(s => s.Name).ToList();
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as City;
			if (bt == null) return;
			if (bt.CityID == 1)
			{
				MessageBox.Show(string.Format(CultureResources.Inst["YouCanNotDeleteXCity"], bt.Name), CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			if (Session.Inst.BEManager.DeleteCity(bt))
			{
				LoadCities(cbStates.SelectedItem as State);
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

		private void dgCities_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			if (cbStates.SelectedItem == null)
			{
				MessageBox.Show(CultureResources.Inst["PleaseSelectRegion"], CultureResources.Inst["SelectRegion"], MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}
			City city = e.Row.Item as City;
			if (city == null || string.IsNullOrEmpty(city.Name))
			{
				e.Cancel = true;
				return;
			}
			city.StateID = ((State)cbStates.SelectedItem).ID;
			if (city.CityID > 0)
			{
				if (!Session.Inst.BEManager.UpdateCity(city))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddCity(city))
				{
					e.Cancel = true;
				}
			}
		}

		private void cbStates_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (cbStates.SelectedItem != null)
			{
				LoadCities(cbStates.SelectedItem as State);
			}
		}

		private void LoadCities(State selectedState)
		{
			Cities = new ObservableCollection<City>(Session.Inst.BEManager.GetCities(selectedState, Session.Inst.OfflineMode).OrderBy(s => s.Name));
		}

		private void cityManagement_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}

	}
}
