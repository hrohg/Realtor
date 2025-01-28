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

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for ConvenientManagement.xaml
	/// </summary>
	public partial class ConvenientManagement : Window
	{


		public ObservableCollection<Convenient> Convenients
		{
			get { return (ObservableCollection<Convenient>)GetValue(ConvenientsProperty); }
			set { SetValue(ConvenientsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Convenients.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ConvenientsProperty =
			DependencyProperty.Register("Convenients", typeof(ObservableCollection<Convenient>), typeof(ConvenientManagement), new UIPropertyMetadata(null));


		public ConvenientManagement()
		{
			InitializeComponent();
		}

		private void convManagement_Loaded(object sender, RoutedEventArgs e)
		{
			LoadConvenients();
		}

		private void LoadConvenients()
		{
			Convenients = new ObservableCollection<Convenient>(Session.Inst.BEManager.GetConvenients(Session.Inst.OfflineMode));
		}


		private void convManagement_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}

		private void dgConvenients_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			Convenient convenient = e.Row.Item as Convenient;
			if (convenient == null || string.IsNullOrEmpty(convenient.Name))
			{
				e.Cancel = true;
				return;
			}

			if (convenient.ID > 0)
			{
				if (!Session.Inst.BEManager.UpdateConvenient(convenient))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddConvenient(convenient))
				{
					e.Cancel = true;
				}
			}
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as Convenient;
			if (bt == null) return;

			if (Session.Inst.BEManager.DeleteConvenient(bt))
			{
				LoadConvenients();
			}
			else
			{
				//MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}
	}
}
