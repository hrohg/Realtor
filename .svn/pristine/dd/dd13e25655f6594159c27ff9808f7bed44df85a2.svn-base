using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices;
using System.Security.AccessControl;
using System.Xml.Linq;
using LocalizationResources;
using Microsoft.Win32;

namespace SecurityTest
{
	class Program
	{
		public static void Main(string[] args)
		{
			using (RegistryKey registry = Registry.CurrentUser.OpenSubKey(SecurityObject.RegistryFolder))
			{
				if (registry == null) return;
			}

			using (RegistryKey registry = Registry.CurrentUser.CreateSubKey(SecurityObject.RegistryFolder))
			{
                registry.SetValue(SecurityObject.LastAccessDateKey, StringEncription.GetEncryptedDate(DateTime.Now.Date));
                registry.SetValue(SecurityObject.ApplicationRegistryEntryKey, new SecurityObject().GetAppEncriptedKey());
				var date = StringEncription.GetEncryptedDate(DateTime.Now.AddDays(80));
				registry.SetValue(SecurityObject.ExpirationDateKey, date);
			}
		}
	}

	
}
