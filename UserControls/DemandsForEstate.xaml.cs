using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.DataAccess;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for DemandsForEstate.xaml
	/// </summary>
	public partial class DemandsForEstate : Window
	{



		public List<NeededEstate> Demands
		{
			get { return (List<NeededEstate>)GetValue(DemandsProperty); }
			set { SetValue(DemandsProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Demands.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty DemandsProperty =
			DependencyProperty.Register("Demands", typeof(List<NeededEstate>), typeof(DemandsForEstate), new UIPropertyMetadata(null, OnDemandsChanged));

		private static void OnDemandsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			DemandsForEstate form = d as DemandsForEstate;
			if (form != null)
			{
				form.Demands = (List<NeededEstate>)e.NewValue;
			}
		}


		public List<Estate> Estates
		{
			get { return (List<Estate>)GetValue(EstatesProperty); }
			set { SetValue(EstatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Estates.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstatesProperty =
			DependencyProperty.Register("Estates", typeof(List<Estate>), typeof(DemandsForEstate), new UIPropertyMetadata(null, OnEstatesChanged));

		private static void OnEstatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			DemandsForEstate form = d as DemandsForEstate;
			if (form != null)
			{
				form.Estates = (List<Estate>)e.NewValue;
				if (form.Estates.Count > 0)
				{
					form.dgEstates.SelectedIndex = 0;
				}
			}
		}


		public DemandsForEstate()
		{
			InitializeComponent();
		}

		public DemandsForEstate(IList estates)
			: this()
		{
			Estates = estates.OfType<Estate>().ToList();
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void dgEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
		{
			EstateView view = new EstateView(dgEstates.SelectedItem as Estate);
			view.Show();
		}

		private void dgEstates_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			Demands = Session.Inst.BEManager.GetDemandsForEstate(dgEstates.SelectedItem as Estate, Session.Inst.User, Session.Inst.OfflineMode);
		}
	}
}
