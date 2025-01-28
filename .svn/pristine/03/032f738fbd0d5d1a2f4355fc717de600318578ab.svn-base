using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Business.Managers;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using Shared.Helpers;
using UserControls.Helpers;
using System.Collections;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for FavoriteEstates.xaml
	/// </summary>
	public partial class FavoriteEstates : UserControl
	{
		public ObservableCollection<FavoriteEstate> FavoriteEstatesList
		{
			get { return (ObservableCollection<FavoriteEstate>)GetValue(FavoriteEstatesListProperty); }
			set { SetValue(FavoriteEstatesListProperty, value); }
		}

		// Using a DependencyProperty as the backing store for FavoriteEstatesList.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty FavoriteEstatesListProperty =
			DependencyProperty.Register("FavoriteEstatesList", typeof(ObservableCollection<FavoriteEstate>), typeof(FavoriteEstates), new UIPropertyMetadata(null, OnFavoriteEstatesListChanged));

		private static void OnFavoriteEstatesListChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			FavoriteEstates fe = d as FavoriteEstates;
			if (fe != null)
			{
				fe.FavoriteEstatesList = (ObservableCollection<FavoriteEstate>)e.NewValue;
				if (fe.FavoriteEstatesList != null)
				{
					fe.Estates = Session.Inst.BEManager.GetEstatesByIDs(fe.FavoriteEstatesList.Select(s => s.EstateID).ToList(), Session.Inst.OfflineMode, Session.Inst.User);
				}
				else
				{
					fe.Estates = null;
				}
			}
		}


		public ObservableCollection<Estate> Estates
		{
			get { return (ObservableCollection<Estate>)GetValue(EstatesProperty); }
			set { SetValue(EstatesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Estates.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstatesProperty =
			DependencyProperty.Register("Estates", typeof(ObservableCollection<Estate>), typeof(FavoriteEstates), new UIPropertyMetadata(null, OnEstatesChanged));

		private static void OnEstatesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			FavoriteEstates fe = sender as FavoriteEstates;
			if (fe != null)
			{
				fe.Estates = (ObservableCollection<Estate>)e.NewValue;
			}
		}


		public FavoriteEstates()
		{
			InitializeComponent();
		}

		private void mnuDeleteFromFavorites_Click(object sender, RoutedEventArgs e)
		{
			if (dgEstates.SelectedItems != null && dgEstates.SelectedItems.Count > 0)
			{
				Session.Inst.BEManager.DeleteFavoriteEstate(dgEstates.SelectedItems.Cast<Estate>().Select(s => s.EstateID).ToList());
				RefreshFavoriteEstates();
			}
		}

		public void RefreshFavoriteEstates()
		{
			FavoriteEstatesList = GetFavoriteEstates();
		}

		private ObservableCollection<FavoriteEstate> GetFavoriteEstates()
		{
			return Session.Inst.BEManager.GetFavoriteEstates(Session.Inst.User.ID, Session.Inst.OfflineMode);
		}

		private void favoriteList_Loaded(object sender, RoutedEventArgs e)
		{
			if (FavoriteEstatesList == null && Session.Inst.User.ID > 0)
			{
				FavoriteEstatesList = GetFavoriteEstates();
			}
		}

		private void lvRealEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
		{
			new EstateView(dgEstates.SelectedItem as Estate).Show();
		}

		public void CheckEstateToUpdateList(Estate realEstate)
		{
			var estate = Estates.FirstOrDefault(s => s.EstateID == realEstate.EstateID);
			if (estate == null) return;
			Estates.Remove(estate);
			Estates.Add(realEstate);
		}

		private void mnuSaveAsXML_Click(object sender, RoutedEventArgs e)
		{
			RealtorFileManager.SaveFile(dgEstates.SelectedItems);
		}

		private void mnuOpen_Click(object sender, RoutedEventArgs e)
		{
			EstateView view = new EstateView((Estate)dgEstates.SelectedItem);
			view.Show();
		}

		private void mnuDelete_Click(object sender, RoutedEventArgs e)
		{
			if (MessageBox.Show(CultureResources.Inst["AreYouSureYouWantToDeleteThisEstate"], CultureResources.Inst["ConfirmDelete"], MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No) == MessageBoxResult.Yes)
			{
				var estate = dgEstates.SelectedItem as Estate;
				if (Session.Inst.BEManager.DeleteEstate(estate))
				{
					//MessageBox.Show(CultureResources.Inst["EstateDeletedSuccessfully"], CultureResources.Inst["Deleted"], MessageBoxButton.OK);
					Estates.Remove(estate);
					RefreshFavoriteEstates();
					Session.Inst.EstatesCount--;
				}
			}
		}

		private void mnuSelectDemands_Click(object sender, RoutedEventArgs e)
		{
			DemandsForEstate form = new DemandsForEstate(dgEstates.SelectedItems);
			form.ShowDialog();
		}

		private void btnExportToExcel_Click(object sender, RoutedEventArgs e)
		{
			dgEstates.ExportToExcel();
		}

		private void btnPrint_Click(object sender, RoutedEventArgs e)
		{
			//PrintDialog printDialog = new PrintDialog();
			//if (printDialog.ShowDialog() ?? false)
			//{
			//    dgEstates.Arrange(new Rect(5, 5, printDialog.PrintableAreaWidth, printDialog.PrintableAreaHeight));
			//    printDialog.PrintVisual(dgEstates, string.Empty);
			//}
			PrintColumnsSelectionForm form = new PrintColumnsSelectionForm(Estates.ToList());
			form.ShowDialog();
		}

        private void btnSettings_Click(object sender, RoutedEventArgs e)
        {
            var result = new EstateListColumnsSelection().ShowDialog();
            if (result ?? false)
            {
                var columns = RealtorSettingsManager.GetDisplayColumns(Session.Inst.User, Session.Inst.OfflineMode);
                foreach (UserDisplayColumn column in columns)
                {
                    column.ColumnName = CultureResources.Inst[column.ColumnName];
                }
                Session.Inst.ApplicationSettings.ShowingColumns = new ObservableCollection<UserDisplayColumn>(columns);
                //InitializeGridColumns();
                //RefreshEstates();
            }
        }

		private void MenuItem_ContextMenuOpening(object sender, ContextMenuEventArgs e)
		{
			if (dgEstates.SelectedItems != null && dgEstates.SelectedItems.Count != 1)
			{
				mnuOpen.Visibility = mnuDelete.Visibility = mnuSaveAsXML.Visibility = Visibility.Collapsed;
			}
			else
			{
				mnuOpen.Visibility = mnuDelete.Visibility = mnuSaveAsXML.Visibility = Visibility.Visible;
			}

			if(Session.Inst.OfflineMode)
			{
				mnuOpen.Visibility = mnuDelete.Visibility = Visibility.Collapsed;
			}
		}

		private void dgEstates_DragEnter(object sender, System.Windows.DragEventArgs e)
		{
			if (!e.Data.GetDataPresent("Estates") || sender == e.Source)
			{
				e.Effects = DragDropEffects.None;
			}
		}

		private void dgEstates_Drop(object sender, System.Windows.DragEventArgs e)
		{
			if (e.Data.GetDataPresent("Estates"))
			{

				var estates = e.Data.GetData("Estates") as IList;
				if (estates != null)
				{
					Session.Inst.BEManager.AddToFavoriteEstates(Session.Inst.User.ID, estates.OfType<Estate>().Select(s => s.EstateID).ToList());
					RefreshFavoriteEstates();
				}
			}
		}
	}
}
