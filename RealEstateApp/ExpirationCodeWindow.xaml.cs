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
using LocalizationResources;
using RealEstate.Common.Cultures;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for ExpirationCodeWindow.xaml
	/// </summary>
	public partial class ExpirationCodeWindow : Window
	{
		public ExpirationCodeWindow()
		{
			InitializeComponent();
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			if (string.IsNullOrEmpty(txtCode.Text))
			{
				MessageBox.Show(CultureResources.Inst["InputCode"]);
				return;
			}
			RealtorSecurity security = new RealtorSecurity();
			DateTime? expirationDate;
			if (!security.ValidateExpirationDateCode(txtCode.Text, out expirationDate))
			{
				MessageBox.Show(CultureResources.Inst["EnteredCodeIsNotValid"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}

			MessageBox.Show(string.Format(CultureResources.Inst["CodeEnteredExpirationDateX"], expirationDate.Value.ToString(StringEncription.DateFormat)), CultureResources.Inst["CodeInputed"], MessageBoxButton.OK, MessageBoxImage.Information);
			DialogResult = true;
			Close();
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			DialogResult = false;
			Close();
		}

		private void Window_Loaded(object sender, RoutedEventArgs e)
		{
			var expirationDate = new RealtorSecurity().GetExpirationDate();
			if (expirationDate.HasValue)
			{
				var interval = expirationDate.Value.Date - DateTime.Now.Date;
				var daysCount = interval.Days;
				if (daysCount <= 0)
				{
					tblkExpirationDate.Text = CultureResources.Inst["DateIsExpairedInputNewCode"];
					tblkExpirationDate.Foreground = Brushes.Red;
				}
				else
				{
					tblkExpirationDate.Text = string.Format(CultureResources.Inst["DateExpiredOnXDaysY"], daysCount, expirationDate);
				}
			}
			else
			{
				tblkExpirationDate.Text = CultureResources.Inst["IncorrectParams"];
				btnOK.IsEnabled = txtCode.IsEnabled = false;
			}
		}
	}
}
