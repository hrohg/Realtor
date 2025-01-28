using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for BlackListItemDetails.xaml
	/// </summary>
	public partial class BlackListItemDetails : Window
	{
		#region DependencyProperties

		public BlackListItem AddEditBlackListItem
		{
			get { return (BlackListItem)GetValue(AddEditBlackListItemProperty); }
			set { SetValue(AddEditBlackListItemProperty, value); }
		}

		// Using a DependencyProperty as the backing store for AddEditBlackListItem.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty AddEditBlackListItemProperty =
			DependencyProperty.Register("AddEditBlackListItem", typeof(BlackListItem), typeof(BlackListItemDetails), new UIPropertyMetadata(null, OnAddEditBlackListItemChanged));

		private static void OnAddEditBlackListItemChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			BlackListItemDetails listItemDetails = d as BlackListItemDetails;
			if (listItemDetails != null)
			{
				listItemDetails.AddEditBlackListItem = (BlackListItem)e.NewValue;
			}
		}

		#endregion

		public BlackListItemDetails()
		{
			InitializeComponent();
		}

		public BlackListItemDetails(BlackListItem blackListItem)
			: this()
		{
			this.AddEditBlackListItem = blackListItem;
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var number = ((Button)sender).CommandParameter as BlackListNumber;
			if (number == null) return;

			if (Session.Inst.BEManager.DeleteBlackListNumber(number))
			{
				AddEditBlackListItem.BlackListNumbers.Remove(number);
				number = null;
				//todo: remove item from grid (vervi dzevov chi linum)
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void itemDetails_Loaded(object sender, RoutedEventArgs e)
		{

		}

		private void itemDetails_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				DialogResult = false;
				this.Close();
			}
		}

		private void btCancel_Click(object sender, RoutedEventArgs e)
		{
			DialogResult = false;
			this.Close();
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			if (string.IsNullOrEmpty(AddEditBlackListItem.Name))
			{
				MessageBox.Show(CultureResources.Inst["PleaseInputName"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				txtName.Focus();
				return;
			}

			if (AddEditBlackListItem.BlackListNumbers.Count == 0)
			{
				MessageBox.Show(CultureResources.Inst["PleaseInputNumbers"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				dgNumbers.Focus();
				return;
			}

			if (AddEditBlackListItem.ID > 0)
			{
				if (!Session.Inst.BEManager.UpdateBlackListItem(AddEditBlackListItem))
				{
					MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
					return;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddBlackListItem(AddEditBlackListItem))
				{
					MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
					return;
				}
			}
			DialogResult = true;
			//this.Close();
		}

		private void itemDetails_Closing(object sender, System.ComponentModel.CancelEventArgs e)
		{
			if (!closeStoryBoardCompleted)
			{
				closeStoryBoardCompleted = true;
				var storyBoard = this.Resources["closeStoryBoard"] as BeginStoryboard;
				storyBoard.Storyboard.Begin();
				//e.Cancel = true;
			}
		}

		private bool closeStoryBoardCompleted = false;
		private void closeAnimation_Completed(object sender, EventArgs e)
		{
			closeStoryBoardCompleted = true;
			this.Close();
		}

	}
}
