using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Configuration.Install;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.AccessControl;
using System.Windows.Forms;
using System.Xml.Linq;
using LocalizationResources;
using Microsoft.Win32;
using RealEstate.Common;
using RealEstateApp;
using RealEstateApp.Properties;


namespace SecurityTest
{
	[RunInstaller(true)]
	public partial class RealtorInstaller : System.Configuration.Install.Installer
	{
		public RealtorInstaller()
		{
			InitializeComponent();
			this.AfterInstall += RealtorInstaller_AfterInstall;
			this.AfterUninstall += RealtorInstaller_AfterUninstall;
		}

		void RealtorInstaller_AfterUninstall(object sender, InstallEventArgs e)
		{
			//try
			//{
			//    Registry.CurrentUser.DeleteSubKeyTree(SecurityObject.RegistryFolder);
			//}
			//catch { }
		}

		private void RealtorInstaller_AfterInstall(object sender, InstallEventArgs e)
		{
			CreateRegistryKeys();
			ModifyConfigFile();
			//EncriptBusiness();
		}

		private void EncriptBusiness()
		{
			string hardID = new SecurityObject().GetHardUniqueID();
			GCHandle gch = GCHandle.Alloc(hardID, GCHandleType.Pinned);

			var dllFilePath = Constants.ApplicationExecutablePath + "RealEstate.Business.dll";
			FileStream fileStream = null;
			if (StringEncription.EncryptFile(dllFilePath, Constants.BusinessDatFilePath, hardID))
			{
				try
				{
					File.Delete(dllFilePath);
					fileStream = File.Create(dllFilePath);
				}
				finally
				{
					if (fileStream != null)
					{
						fileStream.Close();
					}
				}
			}

			StringEncription.ZeroMemory(gch.AddrOfPinnedObject(), hardID.Length * 2);
			gch.Free();

			CreateAccessForDatFile();
		}

		private void CreateAccessForDatFile()
		{
			FileInfo flInf = new System.IO.FileInfo(Constants.BusinessDatFilePath);
			FileSystemRights fr = FileSystemRights.Read | FileSystemRights.ReadAndExecute | FileSystemRights.Modify;
			FileSystemAccessRule accRule = new FileSystemAccessRule("everyone", fr, InheritanceFlags.None, PropagationFlags.NoPropagateInherit, AccessControlType.Allow);
			FileSecurity flsec = flInf.GetAccessControl(AccessControlSections.Access);
			Boolean result;
			flsec.ModifyAccessRule(AccessControlModification.Add, accRule, out result);
			if (!result)
			{
				throw new Exception("Cannot set access on settings file: " + Constants.BusinessDatFilePath);
			}
			flInf.SetAccessControl(flsec);
		}

		private void CreateDatabase()
		{
			SqlConnection connection = null;
			try
			{
				string connectionString = string.Empty;
				using (var file = File.OpenText(Constants.ConfigFilePath))
				{
					var configContent = file.ReadToEnd();
					XDocument configXML = XDocument.Parse(configContent);
					file.Close();

					var conStrings = configXML.Element("configuration").Element("connectionStrings");
					var adds = conStrings.Elements("add");
					connectionString = adds.FirstOrDefault(s => (string)s.Attribute("name") == "MasterDBConnectionString").Attribute("connectionString").Value;
				}
				if (string.IsNullOrEmpty(connectionString))
				{
					MessageBox.Show("connection string empty");
					return;
				}
				connection = new SqlConnection(connectionString);
				SqlCommand command = new SqlCommand(Resources.redbt);

				connection.Open();
				command.ExecuteNonQuery();
			}
			catch (Exception ex)
			{
				MessageBox.Show("Failed to create a database => " + ex.ToString(), "Create database error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
			finally
			{
				if (connection != null)
				{
					connection.Close();
				}
			}
		}

		private void ModifyConfigFile()
		{
			//ConfigValuesWinForm form = new ConfigValuesWinForm();
			//form.ShowDialog();
		}

		private static void CreateRegistryKeys()
		{
			using (RegistryKey registry = Registry.CurrentUser.OpenSubKey(SecurityObject.RegistryFolder))
			{
				if (registry != null) return;
			}

			using (RegistryKey registry = Registry.CurrentUser.CreateSubKey(SecurityObject.RegistryFolder))
			{
				registry.SetValue(SecurityObject.LastAccessDateKey, StringEncription.GetEncryptedDate(DateTime.Now.Date));
				registry.SetValue(SecurityObject.ApplicationRegistryEntryKey, new SecurityObject().GetAppEncriptedKey());
				registry.SetValue(SecurityObject.ExpirationDateKey, StringEncription.GetEncryptedDate(DateTime.Now.AddYears(10)));
			}
		}
	}
}
