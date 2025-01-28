using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RealEstate.Common
{
    public class ConfigSettings : BindableObject
    {
        #region VideoFolderPath - Описание свойства (summary)
        public const string VideoFolderPathProperty = "VideoFolderPath";

        /// <summary>Описание свойства (summary)</summary>
        public string VideoFolderPath
        {
            get { return fieldVideoFolderPath; }
            set
            {
                if (fieldVideoFolderPath == value) return;
                fieldVideoFolderPath = value;
                OnPropertyChanged(VideoFolderPathProperty);
            }
        }
        private string fieldVideoFolderPath;
        #endregion

        #region ImagesFolderPath - Описание свойства (summary)
        public const string ImagesFolderPathProperty = "ImagesFolderPath";

        /// <summary>Описание свойства (summary)</summary>
        public string ImagesFolderPath
        {
            get { return fieldImagesFolderPath; }
            set
            {
                if (fieldImagesFolderPath == value) return;
                fieldImagesFolderPath = value;
                OnPropertyChanged(ImagesFolderPathProperty);
            }
        }
        private string fieldImagesFolderPath;
        #endregion

        #region DatabasePassword - Описание свойства (summary)
        public const string DatabasePasswordProperty = "DatabasePassword";

        /// <summary>Описание свойства (summary)</summary>
        public string DatabasePassword
        {
            get { return fieldDatabasePassword; }
            set
            {
                if (fieldDatabasePassword == value) return;
                fieldDatabasePassword = value;
                OnPropertyChanged(DatabasePasswordProperty);
            }
        }
        private string fieldDatabasePassword;
        #endregion

        #region ServerIP - Описание свойства (summary)
        public const string ServerIPProperty = "ServerIP";

        /// <summary>Описание свойства (summary)</summary>
        public string ServerIP
        {
            get { return fieldServerIP; }
            set
            {
                if (fieldServerIP == value) return;
                fieldServerIP = value;
                OnPropertyChanged(ServerIPProperty);
            }
        }

        private string fieldServerIP;
        #endregion

		#region CompanyName - Описание свойства (summary)
		public const string CompanyNameProperty = "CompanyName";

		/// <summary>Описание свойства (summary)</summary>
		public string CompanyName
		{
			get { return fieldCompanyName; }
			set
			{
				if (fieldCompanyName == value) return;
				fieldCompanyName = value;
				OnPropertyChanged(CompanyNameProperty);
			}
		}
		private string fieldCompanyName;
		#endregion

        public bool IsValid
        {
            get
            {
                return !string.IsNullOrEmpty(ImagesFolderPath) && !string.IsNullOrEmpty(VideoFolderPath) && !string.IsNullOrEmpty(ServerIP) && !string.IsNullOrEmpty(DatabasePassword);
            }
        }

        public const string VideoFolderPathIdentificator = "~~~vfp~~~";
        public const string ImageFolderPathIdentificator = "~~~ifp~~~";
        public const string ServerIPIdentificator = "~~~sip~~~";
		public const string DatabasePasswordIdentificator = "~~~dbp~~~";
		public const string CompanyNameIdentificator = "~~~cmp~~~";
    }
}
