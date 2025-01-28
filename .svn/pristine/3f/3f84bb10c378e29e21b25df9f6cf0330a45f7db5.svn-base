using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for Users.xaml
	/// </summary>
	public partial class Users : Window
	{
		private ObservableCollection<User> AppUsers
		{
			get { return (ObservableCollection<User>)GetValue(UsersProperty); }
			set { SetValue(UsersProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Users.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty UsersProperty =
			DependencyProperty.Register("AppUsers", typeof(ObservableCollection<User>), typeof(Users), new UIPropertyMetadata(null, OnUsersChanged));

		private static void OnUsersChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			Users form = sender as Users;
			if (form != null)
			{
				form.AppUsers = (ObservableCollection<User>)e.NewValue;
			}
		}


		public Users()
		{
			InitializeComponent();
			var users = Session.Inst.BEManager.GetUsers(Session.Inst.OfflineMode);
			if(!Session.Inst.User.IsDirector)
			{
				AppUsers = new ObservableCollection<User>(users.Where(s => !s.IsDirector));
			}
			else
			{
				AppUsers = users;
			}
		}

		private void btnAdd_Click(object sender, RoutedEventArgs e)
		{
			EditUserForm editForm = new EditUserForm();
			if (editForm.ShowDialog() ?? false)
			{
				//Translator.TranslateUsers(new List<User> { editForm.EditUser });
				AppUsers.Add(editForm.EditUser);
			}
		}

		private void btnEditUser_Click(object sender, RoutedEventArgs e)
		{
			EditUserForm editForm = new EditUserForm(((Button)sender).Tag as User);
			if (editForm.ShowDialog() ?? false)
			{
				//Translator.TranslateUsers(new List<User> { editForm.EditUser });
				AppUsers = Session.Inst.BEManager.GetUsers(Session.Inst.OfflineMode);
			}
		}

		private void btnClose_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void usersForm_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
		{
			if (e.Key == System.Windows.Input.Key.Escape)
			{
				Close();
			}
		}

		private void btnDeleteUser_Click(object sender, RoutedEventArgs e)
		{
			var user = ((Button)sender).Tag as User;
			if (user.UserName.ToLower() == "admin")
			{
				MessageBox.Show(CultureResources.Inst["YouCanNotDeleteAdmin"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			if (MessageBox.Show(string.Format(CultureResources.Inst["AreYouSureYouWontToDeleteXDetails"], user.FullName), CultureResources.Inst["ConfirmDelete"], MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
			{
				if (Session.Inst.BEManager.DeleteUser(user))
				{
					AppUsers = Session.Inst.BEManager.GetUsers(Session.Inst.OfflineMode);
				}
				else
				{
					MessageBox.Show(CultureResources.Inst["UserDataNotSaved"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				}
			}
		}
	}
}
