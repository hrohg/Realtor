using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Windows;
using System.Windows.Input;
using RealEstate.Common;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for Login.xaml
	/// </summary>
	public partial class Login : Window
	{
		public User User { get; set; }

		public Login()
		{
			InitializeComponent();
		}

		private void btnLogin_Click(object sender, RoutedEventArgs e)
		{
			User = Session.Inst.BEManager.Login(txtUsername.Text, txtPassword.Password, Session.Inst.OfflineMode);
			if (User == null)
			{
				lblErrorMessage.Visibility = Visibility.Visible;
				txtPassword.Password = string.Empty;
			}
			else
			{
				DialogResult = true;
				System.Threading.Thread thread = new System.Threading.Thread(SaveLastLoggedUserName);
				thread.Start(txtUsername.Text);
				Close();
			}
		}

		private void SaveLastLoggedUserName(object userName)
		{
			string lastLoggedUserName = string.Format(@"{0}\{1}", Constants.ApplicationExecutablePath, Constants.LastLoggedUserName);
			FileStream fs = new FileStream(lastLoggedUserName, FileMode.Create);

			BinaryFormatter formatter = new BinaryFormatter();
			try
			{
				formatter.Serialize(fs, userName.ToString());
			}
			catch
			{
			}
			finally
			{
				fs.Close();
			}
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void txtUsername_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Enter)
			{
				btnLogin_Click(sender, new RoutedEventArgs());
			}
		}

		private void loginForm_Loaded(object sender, RoutedEventArgs e)
		{
			var lastLoggedUserName = GetLastLoggedUserName();
			if(!string.IsNullOrEmpty( lastLoggedUserName))
			{
				txtUsername.Text = lastLoggedUserName;
				txtPassword.Focus();
			}
			else
			{
				txtUsername.Focus();
			}
		}

		private string GetLastLoggedUserName()
		{
			string settingsFilePath = string.Format(@"{0}\{1}", Constants.ApplicationExecutablePath, Constants.LastLoggedUserName);
			if (File.Exists(settingsFilePath))
			{
				FileStream fileStream = new FileStream(settingsFilePath, FileMode.Open);
				try
				{
					BinaryFormatter serializer = new BinaryFormatter();
					return (string)serializer.Deserialize(fileStream);
				}
				catch (Exception)
				{
					return string.Empty;
				}
				finally
				{
					fileStream.Close();
				}
			}
			return string.Empty;
		}
	}
}
