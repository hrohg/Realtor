using System;
using System.Windows;
using System.Windows.Input;
using LocalizationResources;
using Microsoft.Win32;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for ExpirationDateManagement.xaml
	/// </summary>
	public partial class ExpirationDateManagement : Window
	{


		public bool PasswordOK
		{
			get { return (bool)GetValue(PasswordOKProperty); }
			set { SetValue(PasswordOKProperty, value); }
		}

		// Using a DependencyProperty as the backing store for PasswordOK.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty PasswordOKProperty =
			DependencyProperty.Register("PasswordOK", typeof(bool), typeof(ExpirationDateManagement), new UIPropertyMetadata(false));



		public DateTime ExpirationDate
		{
			get { return (DateTime)GetValue(ExpirationDateProperty); }
			set { SetValue(ExpirationDateProperty, value); }
		}

		// Using a DependencyProperty as the backing store for ExpirationDate.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ExpirationDateProperty =
			DependencyProperty.Register("ExpirationDate", typeof(DateTime), typeof(ExpirationDateManagement), new UIPropertyMetadata(DateTime.MinValue));

		public ExpirationDateManagement()
		{
			InitializeComponent();
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			var en_password = new RealtorSecurity().GenerateCode(password.Password);
			PasswordOK = en_password == "NVX5b42EG0TsNvxbUwEd1CdHu2I7+sN+";
			if (!PasswordOK) password.Password = string.Empty;
		}

		private void expWin_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape) Close();
		}

		private void Btn_DeleteExpDate_CLick(object sender, RoutedEventArgs e)
		{
			ExpirationDate = DateTime.MaxValue;
			SetExpirationDate();
		}

		private void SetExpirationDate()
		{
			if (ExpirationDate == DateTime.MinValue) return;
			using (RegistryKey registry = Registry.CurrentUser.OpenSubKey(SecurityObject.RegistryFolder))
			{
				if (registry == null) return;
			}

			using (RegistryKey registry = Registry.CurrentUser.CreateSubKey(SecurityObject.RegistryFolder))
			{
				var date = StringEncription.GetEncryptedDate(ExpirationDate);
				registry.SetValue(SecurityObject.ExpirationDateKey, date);
				MessageBox.Show("OK");
			}
		}

		private void password_KeyUp(object sender, KeyEventArgs e)
		{
			if(e.Key == Key.Enter)
			{
				Button_Click(sender, new RoutedEventArgs());
			}
		}

		private void expWin_Loaded(object sender, RoutedEventArgs e)
		{
			password.Focus();
			var date = new RealtorSecurity().GetExpirationDate();
			if (!date.HasValue) date = DateTime.MinValue;
			ExpirationDate = date.Value;
		}

		private void Btn_Set_CLick(object sender, RoutedEventArgs e)
		{
			SetExpirationDate();
		}
	}
}
