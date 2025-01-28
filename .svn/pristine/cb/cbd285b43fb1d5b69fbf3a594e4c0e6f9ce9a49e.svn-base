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
using System.Windows.Navigation;
using System.Windows.Shapes;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;

namespace UserControls
{

	/// <summary>
	/// Interaction logic for BlackList.xaml
	/// </summary>
	public partial class BlackList : UserControl
	{

		#region Dependency Properties

		public ObservableCollection<BlackListItem> BlackListItems
		{
			get { return (ObservableCollection<BlackListItem>)GetValue(BlackListItemsProperty); }
			set { SetValue(BlackListItemsProperty, value); }
		}

		#region BlackListItems
		// Using a DependencyProperty as the backing store for BlackListItems.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty BlackListItemsProperty =
			DependencyProperty.Register("BlackListItems", typeof(ObservableCollection<BlackListItem>), typeof(BlackList), new UIPropertyMetadata(null, OnBlackListItemChanged));

		private static void OnBlackListItemChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			BlackList list = d as BlackList;
			if (list != null)
			{
				list.BlackListItems = (ObservableCollection<BlackListItem>)e.NewValue;
			}
		}
		#endregion

		#region Search Criteria

		public BlackListSearchCriteria SearchCriteria
		{
			get { return (BlackListSearchCriteria)GetValue(SearchCriteriaProperty); }
			set { SetValue(SearchCriteriaProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SearchCriteria.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SearchCriteriaProperty =
			DependencyProperty.Register("SearchCriteria", typeof(BlackListSearchCriteria), typeof(BlackList), new UIPropertyMetadata(null, OnSearchCriteriaChanged));

		private static void OnSearchCriteriaChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			BlackList blackList = d as BlackList;
			if (blackList != null)
			{
				blackList.SearchCriteria = (BlackListSearchCriteria)e.NewValue;
			}
		}

		#endregion

		#endregion

		public BlackList()
		{
			InitializeComponent();
			SearchCriteria = new BlackListSearchCriteria();
		}

		private void blackList_Loaded(object sender, RoutedEventArgs e)
		{
			LoadList();
		}

		private void LoadList()
		{
			//if (!string.IsNullOrEmpty(SearchCriteria.TelephonesString))
			//{
			//    SearchCriteria.Telephones = SearchCriteria.TelephonesString.Split(new[] {',', ';', ' '}, StringSplitOptions.RemoveEmptyEntries).ToList();
			//}
			BlackListItems = Session.Inst.BEManager.GetBlackListItems(SearchCriteria, Session.Inst.OfflineMode);
		}

		private void mnuEdit_Click(object sender, RoutedEventArgs e)
		{
			btnEdit_Click(sender, e);
		}

		private void btnDelete_Click(object sender, RoutedEventArgs e)
		{
			if (dgBlackList.SelectedItem == null)
			{
				MessageBox.Show(CultureResources.Inst["PleaseSelectItemFirst"], CultureResources.Inst["Attention"], MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}
			var item = dgBlackList.SelectedItem as BlackListItem;
			if (MessageBox.Show(string.Format(CultureResources.Inst["AreYouSureYouWontToDeleteXDetails"], item.Name), CultureResources.Inst["ConfirmDelete"], MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No) != MessageBoxResult.Yes)
			{
				return;
			}


			if (!Session.Inst.BEManager.DeleteBlackListItem(item))
			{
				//todo: show error message
			}
			else
			{
				LoadList();
			}
		}

		private void btnAdd_Click(object sender, RoutedEventArgs e)
		{
			var blackListItem = new BlackListItem();
			var window = new BlackListItemDetails(blackListItem);
			if (window.ShowDialog() ?? false)
			{
				LoadList();
			}
		}

		private void btnEdit_Click(object sender, RoutedEventArgs e)
		{
			if (dgBlackList.SelectedItem == null)
			{
				MessageBox.Show(CultureResources.Inst["PleaseSelectItemFirst"], CultureResources.Inst["Attention"], MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}
			var selectedItem = dgBlackList.SelectedItem as BlackListItem;
			var window = new BlackListItemDetails(selectedItem.Clone());
			if (window.ShowDialog() ?? false)
			{
				//BlackListItems[BlackListItems.IndexOf(selectedItem)] = itemClone;
				LoadList();
			}
		}

		private void mnuDelete_Click(object sender, RoutedEventArgs e)
		{
			btnDelete_Click(sender, e);
		}

		private void btnSearch_Click(object sender, RoutedEventArgs e)
		{
			LoadList();
		}

		private void btnClear_Click(object sender, RoutedEventArgs e)
		{
			SearchCriteria = new BlackListSearchCriteria();
			LoadList();
		}

		private void txtName_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Enter)
			{
				btnSearch_Click(sender, new RoutedEventArgs());
			}
		}
	}
}
