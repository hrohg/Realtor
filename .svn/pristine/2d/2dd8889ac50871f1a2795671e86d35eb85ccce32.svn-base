using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;

namespace RealEstate.Business.Managers
{
	public class DataManagerBase
	{
		private static string _localConnectionString;
		protected static string LocalConnectionString
		{
			get
			{
				if(string.IsNullOrEmpty(_localConnectionString))
				{
					_localConnectionString = ConfigurationManager.ConnectionStrings["LocalConnectionString"].ConnectionString;
				}
				return _localConnectionString;
			}
		}

		private static string _redbConnectionString;
		protected static string REDBConnectionString
		{
			get
			{
				if(string.IsNullOrEmpty(_redbConnectionString))
				{
					_redbConnectionString = ConfigurationManager.ConnectionStrings["RealEstate.DataAccess.Properties.Settings.REDBConnectionString"].ConnectionString;
				}
				return _redbConnectionString;
			}
		}

		protected static string GetConnectionString(bool isOfflineMode)
		{
			return isOfflineMode ? LocalConnectionString : REDBConnectionString;
		}
	}
}
