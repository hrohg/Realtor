using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;

namespace RealEstate.Common
{
	public static class Constants
	{
		public const string LastLoggedUserName = "LLUNM.dat";
		public static string ShowableColumnsFilePath { get { return "SCols.dat"; } }
		public static string SettingsFilePath { get { return "Settings.dat"; } }
		public static string FavoritesFilePath { get { return "FavoriteEstates.xml"; } }
		public const string SettingsContainerFilePath = "SetCon.dat";
		public const string DababaseFolderPath = @"C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA";

		/// <summary>
		/// C:/Program Files/Kostandyan/Realtor/
		/// </summary>
		public static string ApplicationExecutablePath
		{
			get
			{
				return Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) + @"\";
			}
		}

		public static string BusinessDatFilePath
		{
			get { return ApplicationExecutablePath + "Business.dat"; }
		}

		public static string BusinessDatTempFilePath
		{
			get { return ApplicationExecutablePath + "BusinessTemp.dat"; }
		}

		static string imagesFolderPath;
		public static string ImagesFolderPath
		{
			get
			{
				if (string.IsNullOrEmpty(imagesFolderPath))
				{
					imagesFolderPath = System.Configuration.ConfigurationManager.AppSettings["ImagesFolder"] + @"\";
				}
				return imagesFolderPath;
			}
		}

		static string videosFolder;

		private static string localImagesFolderPath;
		public static string LocalImagesFolderPath
		{
			get
			{
				if (string.IsNullOrEmpty(localImagesFolderPath))
				{
					localImagesFolderPath = System.Configuration.ConfigurationManager.AppSettings["LocalImagesFolder"] + @"\";
				}
				return localImagesFolderPath;
			}
		}


		private static string localVideosFolderPath;

		private static DateTime _SQLAcceptedMinDateValue;
		public static DateTime SQLAcceptedMinDateValue
		{
			get
			{
				if (_SQLAcceptedMinDateValue == DateTime.MinValue)
				{
					_SQLAcceptedMinDateValue = new DateTime(1753, 1, 2);
				}
				return _SQLAcceptedMinDateValue;
			}
		}

		public static string LocalVideosFolderPath
		{
			get
			{
				if (string.IsNullOrEmpty(localVideosFolderPath))
				{
					localVideosFolderPath = System.Configuration.ConfigurationManager.AppSettings["LocalVideosFolder"] + @"\";
				}
				return localVideosFolderPath;
			}
		}

		public static string PrintColumnsFilePath
		{
			get { return "PCols.dat"; }
		}
		public const string BusinessFileName = "RealEstate.Business.dll";

		public static string ConfigFilePath
		{
			get { return ApplicationExecutablePath + "RealEstateApp.exe.config"; }
		}

		public static string VideosFolderPath
		{
			get
			{
				if (string.IsNullOrEmpty(videosFolder))
				{
					videosFolder = System.Configuration.ConfigurationManager.AppSettings["VideosFolder"] + @"\";
				}
				return videosFolder;
			}
		}

		public static string WebImagesFolderPath
		{
			get
			{
				return "~/EstateImages/";
			}
		}


	}
}
