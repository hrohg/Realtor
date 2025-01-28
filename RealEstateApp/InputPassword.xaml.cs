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
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using RealEstate.Common.Cultures;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for InputPassword.xaml
	/// </summary>
	public partial class InputPassword : Window
	{
		public string Password { get; set; }

		public InputPassword()
		{
			InitializeComponent();
			pswPassword.Focus();
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			if(string.IsNullOrEmpty( pswPassword.Password ))
			{
				MessageBox.Show(CultureResources.Inst["InputPassword"], "", MessageBoxButton.OK, MessageBoxImage.Error);
				pswPassword.Focus();
				return;
			}
			if(string.IsNullOrEmpty(pswRepeatPassword.Password))
			{
				MessageBox.Show(CultureResources.Inst["InputPassword"], "", MessageBoxButton.OK, MessageBoxImage.Error);
				pswRepeatPassword.Focus();
				return;
			}
			if(pswPassword.Password == pswRepeatPassword.Password)
			{
				DialogResult = true;
				Password = pswPassword.Password;
				Close();
			}
			else
			{
				Password = string.Empty;
				MessageBox.Show(CultureResources.Inst["PasswordIsIncorrect"], "", MessageBoxButton.OK, MessageBoxImage.Error);
				pswRepeatPassword.Password = string.Empty;
				pswRepeatPassword.Focus();
				return;
			}
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			DialogResult = false;
			Close();
		}
	}
}
