using System;
using System.Collections.Generic;
using System.IO;
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
using LocalizationResources;
using Microsoft.Win32;

namespace CodeGenerator
{
	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		public MainWindow()
		{
			InitializeComponent();
		}

		private void btnGeterate_Click(object sender, RoutedEventArgs e)
		{
			txtGeneratedCode.Text = GetCode();
		}

		private string GetCode()
		{
			if (string.IsNullOrEmpty(txtString.Text))
			{
				MessageBox.Show("Please input text");
				return string.Empty;
			}
			if ((cbTypes.SelectedItem as ComboBoxItem).Content.ToString() == "Ժամանակ")
			{
				DateTime dt;
				if (!DateTime.TryParseExact(txtString.Text, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None, out dt))
				{
					MessageBox.Show("Date is not in correct format");
					return string.Empty;
				}
				return new RealtorSecurity().GenerateExpirationDateCode(dt);
			}

			return new RealtorSecurity().GenerateCode(txtString.Text);
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			this.Close();
		}

		private void bbtnSaveInFile_Click(object sender, RoutedEventArgs e)
		{
			SaveFileDialog dialog = new SaveFileDialog { AddExtension = true, DefaultExt = "arc", RestoreDirectory = true };
			if (dialog.ShowDialog() ?? false)
			{
				if (!string.IsNullOrEmpty(dialog.FileName))
				{
					var code = GetCode();
					if (!string.IsNullOrEmpty(code))
					{
						try
						{
							FileStream fs = new FileStream(dialog.FileName, FileMode.Create);
							TextWriter writer = new StreamWriter(fs, new UTF8Encoding());
							writer.Write(code);
							writer.Close();
						}
						catch (Exception)
						{
							MessageBox.Show("Error in save file");
						}
					}
				}
			}
		}

		private void btnGenerateSerialNumbers_Click(object sender, RoutedEventArgs e)
		{
			StringBuilder serials = new StringBuilder();
			for (int i = 0; i < 20; i++)
			{
				serials.AppendLine(RandomSNKGenerator.GetSerialKeyAlphaNumaric(SNKeyLength.SN20));
			}
			SaveFileDialog dialog = new SaveFileDialog { AddExtension = true, DefaultExt = "txt", RestoreDirectory = true };
			if (dialog.ShowDialog() ?? false)
			{
				if (!string.IsNullOrEmpty(dialog.FileName))
				{
					using(StreamWriter writer = File.CreateText(dialog.FileName))
					{
						writer.Write(serials.ToString());
						writer.Close();
					}
				}
			}
		}

	}
}
