using System.ComponentModel;
using System.Threading;
using AK.Converters;
using RealEstate.Business.Helpers;
using RealEstate.Business.Managers;
using RealEstate.Common;
using RealEstate.DataAccess;
using Realtor.DTL;

namespace UserControls
{
	public class Session : INotifyPropertyChanged
	{
		private Session()
		{
			ApplicationSettings = ApplicationSettings.Default;
			User = new User();
			IsClientShowingMode = false;

		}

		private static Session _inst;

		public static Session Inst
		{
			get { return _inst ?? (_inst = new Session()); }
		}


		private DataManager _beManager;

		public DataManager BEManager
		{
			get { return _beManager; }
			set { _beManager = value; }
		}

		private ApplicationSettings applicationSettings;
		public ApplicationSettings ApplicationSettings
		{
			get
			{
				if (applicationSettings == null)
				{
					var settings = ApplicationSettings.GetSettingsFromFile();
					applicationSettings = settings ?? ApplicationSettings.Default;
				}
				return applicationSettings;
			}
			set
			{
				applicationSettings = value;
				OnPropertyChanged("ApplicationSettings");
			}


		}

		#region IsWithoutVerification - Описание свойства (summary)
		public const string IsWithoutVerificationProperty = "IsWithoutVerification";

		/// <summary>Описание свойства (summary)</summary>
		public bool IsWithoutVerification
		{
			get { return fieldIsWithoutVerification; }
			set
			{
				if (fieldIsWithoutVerification == value) return;
				fieldIsWithoutVerification = value;
				OnPropertyChanged(IsWithoutVerificationProperty);
			}
		}
		private bool fieldIsWithoutVerification = true;
		#endregion

		#region MainSettings - Описание свойства (summary)
		public const string MainSettingsProperty = "MainSettings";

		/// <summary>Описание свойства (summary)</summary>
		public RealtorSetting MainSettings
		{
			get
			{
				if (fieldMainSettings == null)
				{
					fieldMainSettings = RealtorSettingsManager.GetSettings(OfflineMode) ?? new RealtorSetting();
				}
				return fieldMainSettings;
			}
			set
			{
				if (fieldMainSettings == value) return;
				fieldMainSettings = value;
				OnPropertyChanged(MainSettingsProperty);
			}
		}
		private RealtorSetting fieldMainSettings;
		#endregion



		private User _user;
		public User User
		{
			get { return _user; }
			set
			{
				_user = value;
				OnPropertyChanged("User");
			}
		}

		private bool _IsClientShowingMode;
		public bool IsClientShowingMode
		{
			get { return _IsClientShowingMode; }
			set
			{
				if (_IsClientShowingMode == value) return;
				_IsClientShowingMode = value;
				OnPropertyChanged("IsClientShowingMode");
			}
		}

		public event PropertyChangedEventHandler PropertyChanged;

		public void OnPropertyChanged(string propertyName)
		{
			if (PropertyChanged != null)
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}

		private int _estatesCount = -1;
		public int EstatesCount
		{
			get
			{
				if (_estatesCount < 0)
				{
					EstatesCount = BEManager.GetEstatesCount(Session.Inst.OfflineMode);
				}
				return _estatesCount;
			}
			set
			{
				_estatesCount = value;
				OnPropertyChanged("EstatesCount");
			}
		}

		private int _demandsCount = -1;
		public int DemandsCount
		{
			get
			{
				if (_demandsCount < 0)
				{
					DemandsCount = Session.Inst.BEManager.GetAllDemansCount(Session.Inst.OfflineMode);
				}
				return _demandsCount;
			}
			set
			{
				_demandsCount = value;
				OnPropertyChanged("DemandsCount");
			}
		}

		public bool IsRussian
		{
			get
			{
				return Thread.CurrentThread.CurrentCulture.Name == "ru-RU";
			}
		}

		private string _serverIp;
		public string ServerIP
		{
			get
			{
				if (string.IsNullOrEmpty(_serverIp))
				{
					_serverIp = System.Configuration.ConfigurationManager.AppSettings["ServerIP"];
				}
				return _serverIp;
			}
			set
			{
				_serverIp = value;
				OnPropertyChanged("ServerIP");
			}
		}

		#region IsWebEnabled - Описание свойства (summary)
		public const string IsWebEnabledProperty = "IsWebEnabled";

		public bool? IsWebEnabled
		{

			get
			{
				if (!fieldIsWebEnabled.HasValue)
				{
					fieldIsWebEnabled = AKConvert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings["IsWebEnabled"]);
				}
				return fieldIsWebEnabled;
			}
			set
			{
				if (fieldIsWebEnabled == value) return;
				fieldIsWebEnabled = value;
				OnPropertyChanged(IsWebEnabledProperty);
			}
		}
		private bool? fieldIsWebEnabled;

		#endregion

		public void Update()
		{
			EstatesCount = Session.Inst.BEManager.GetEstatesCount(Session.Inst.OfflineMode);
			DemandsCount = Session.Inst.BEManager.GetAllDemansCount(OfflineMode);
			if (User != null)
			{
				User = Session.Inst.BEManager.GetUser(User.ID, Session.Inst.OfflineMode);
			}
			MainSettings = RealtorSettingsManager.GetSettings(OfflineMode) ?? new RealtorSetting();
		}

		#region OfflineMode - Описание свойства (summary)
		public const string OfflineModeProperty = "OfflineMode";

		/// <summary>Описание свойства (summary)</summary>
		public bool OfflineMode
		{
			get { return fieldOfflineMode; }
			set
			{
				if (fieldOfflineMode == value) return;
				fieldOfflineMode = value;
				OnPropertyChanged(OfflineModeProperty);
			}
		}
		private bool fieldOfflineMode;
		#endregion

	}
}