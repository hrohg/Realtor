using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for StatesManagement.xaml
	/// </summary>
	public partial class StatesManagement : Window
	{

		public ObservableCollection<State> States
		{
			get { return (ObservableCollection<State>)GetValue(StatesProperty); }
			set { SetValue(StatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for States.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty StatesProperty =
			DependencyProperty.Register("States", typeof(ObservableCollection<State>), typeof(StatesManagement), new UIPropertyMetadata(null, OnStatesChanges));

		private static void OnStatesChanges(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			StatesManagement form = d as StatesManagement;
			if (form != null)
			{
				form.States = (ObservableCollection<State>)e.NewValue;
			}
		}


		public StatesManagement()
		{
			InitializeComponent();
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as State;
			if (bt == null) return;
			if (bt.ID == 1)
			{
				MessageBox.Show(string.Format(CultureResources.Inst["YouCanNotDeleteX"], bt.Name), "", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}
			if (Session.Inst.BEManager.DeleteState(bt))
			{
				LoadStates();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void LoadStates()
		{
			States = new ObservableCollection<State>(Session.Inst.BEManager.GetStates(Session.Inst.User, Session.Inst.OfflineMode).OrderBy(s => s.Name));
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void dgStates_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			State state = e.Row.Item as State;
			if (state == null || string.IsNullOrEmpty(state.Name))
			{
				e.Cancel = true;
				return;
			}

			if (state.ID > 0)
			{
				if (!Session.Inst.BEManager.UpdateState(state))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddState(state))
				{
					e.Cancel = true;
				}
			}
		}

		private void statesManagement_Loaded(object sender, RoutedEventArgs e)
		{
			LoadStates();
		}

		private void statesManagement_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}
	}
}
