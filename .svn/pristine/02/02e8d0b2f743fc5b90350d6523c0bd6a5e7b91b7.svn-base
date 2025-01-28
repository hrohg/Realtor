using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Forms;
using RealEstate.Common;
using UserControls;
using MessageBox = System.Windows.Forms.MessageBox;

namespace RealEstateApp
{
	public partial class ConfigValuesWinForm : Form
	{
		public ConfigSettings SettingsData { get; set; }

		public ConfigValuesWinForm()
		{
			InitializeComponent();
		}

		private void btnImages_Click(object sender, EventArgs e)
		{
			System.Windows.Forms.FolderBrowserDialog dialog = new System.Windows.Forms.FolderBrowserDialog
			{
				Description = "Backup folder",
				RootFolder = Environment.SpecialFolder.MyComputer,
				ShowNewFolderButton = true
			};
			if (dialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
			{
				SettingsData.ImagesFolderPath = dialog.SelectedPath;
			}
		}

		private void btnOK_Click(object sender, EventArgs e)
		{
			SettingsData.DatabasePassword = txtPassword.Text;
			SettingsData.ServerIP = txtServerIP.Text;
			SettingsData.ImagesFolderPath = txtImageFolder.Text;
			SettingsData.VideoFolderPath = txtVideoFolder.Text;
			SettingsData.CompanyName = txtCompanyName.Text;

			if (!SettingsData.IsValid)
			{
				MessageBox.Show("Please fill all fields", "Fill fields", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			ChangeConfigSettings();
			Close();
		}

		private void ChangeConfigSettings()
		{
			try
			{
				string configContent = string.Empty;
				using (StreamReader reader = File.OpenText(Constants.ConfigFilePath))
				{
					configContent = reader.ReadToEnd();
					configContent = configContent.Replace(ConfigSettings.DatabasePasswordIdentificator, SettingsData.DatabasePassword)
												.Replace(ConfigSettings.ImageFolderPathIdentificator, SettingsData.ImagesFolderPath)
												.Replace(ConfigSettings.ServerIPIdentificator, SettingsData.ServerIP)
												.Replace(ConfigSettings.VideoFolderPathIdentificator, SettingsData.VideoFolderPath)
												.Replace(ConfigSettings.CompanyNameIdentificator, SettingsData.CompanyName);
				}

				using (StreamWriter writer = new StreamWriter(Constants.ConfigFilePath, false))
				{
					writer.Write(configContent);
					writer.Close();
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show("config" + ex.ToString());
			}
		}

		private void ConfigValuesWinForm_Load(object sender, EventArgs e)
		{
			SettingsData = new ConfigSettings();
		}
	}
}
