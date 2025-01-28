using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;
using System.Windows;
using LocalizationResources;
using RealEstate.Business.Helpers;
using RealEstate.Business.Managers;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using Realtor.DTL;
using Shared.Helpers;
using UserControls;


namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for App.xaml
	/// </summary>
	public partial class App
	{
		private void Application_Startup(object sender, StartupEventArgs e)
		{
			try
			{
				var splash = new SplashScreen("Application.png");
				splash.Show(true);

				try
				{
					var test = RealtorSettingsManager.GetSettings(false);
				}
				catch (SqlException ex)
				{
					if (IsServer())
					{
						throw new Exception(ex.ToString());
					}
					Session.Inst.OfflineMode = true;
				}

				LoadServices();
				SettingsContainer settings = LoadSettings();
				if (settings != null && !string.IsNullOrEmpty(settings.LastSelectedLanguage))
				{
					CultureResources.ChangeCulture(new CustomCultureInfo(settings.LastSelectedLanguage));
				}
				else
				{
					CultureResources.ChangeCulture(new CustomCultureInfo("hy-AM"));
				}
				//CultureResources.ChangeCulture(new CustomCultureInfo("hy-AM"));
				MainWindow mainWindow = new MainWindow();


				//var ok = VerifyAppInfo(sender, e);
				//var ok = VerifyAppCopy();  
                var ok = true;
				if (!ok)
				{
					ShutdownApplication();
				}

				Login loginForm = new Login();

				if (loginForm.ShowDialog() ?? false)
				{
					Session.Inst.User = loginForm.User;
					Current.MainWindow = mainWindow;

					if (e.Args.Length > 0 && File.Exists(e.Args[0]))
					{

					}
					mainWindow.ShowDialog();
				}
				DeleteDatFile();
				Current.Shutdown();
			}
			catch (Exception ex)
			{
				if (!CultureResources.HasCulture)
				{
					CultureResources.ChangeCulture(new CustomCultureInfo("en-US"));
				}
				CustomExceptionBox box = new CustomExceptionBox
											{
												ExceptionText = CultureResources.Inst["SendErrorMessage"],
												ExceptionDetailText = ex.ToString()
											};
				box.ShowDialog();
				if (Current != null)
				{
					DeleteDatFile();
					Current.Shutdown();
				}
			}
		}

		private bool IsServer()
		{
			return ConfigurationManager.AppSettings["ServerID"] == "127.0.0.1";
		}

		public static void ShutdownApplication()
		{
			DeleteDatFile();
			Current.Shutdown();
		}

		private void LoadServices()
		{
			Session.Inst.BEManager = DataManager.GetInstance();
			return;
			try
			{
				Cryptography cryptography = new Cryptography(new SecurityObject().GetHardUniqueID());
				if (!cryptography.Decrypt(Constants.BusinessDatFilePath, Constants.BusinessDatTempFilePath))
				{
					new SimpleExceptionBox("This is not a valid copy of realtor, for details please visit www.kostandyan.com").ShowDialog();
				}

				using (var stream = File.Open(Constants.BusinessDatTempFilePath, FileMode.Open))
				{
					//byte[] assembly = new byte[stream.Length];
					//stream.Read(assembly, 0, (int)stream.Length);
					//Assembly be = Assembly.Load(assembly);

					//Type type = be.GetType("RealEstate.Business.Helpers.DataManager", true);
					//MethodInfo mi = type.GetMethod("GetInstance", BindingFlags.Static | BindingFlags.Public);
					//Session.Inst.BEManager = (IDataManager)mi.Invoke(null, null);
					Session.Inst.BEManager = DataManager.GetInstance();
				}
			}
			catch (Exception ex)
			{
				//new SimpleExceptionBox(ex.Message).ShowDialog();
				new SimpleExceptionBox("This is not a valid copy of realtor, for details please visit www.kostandyan.com").ShowDialog();
				if (Current != null)
				{
					DeleteDatFile();
					Current.Shutdown();
				}
			}
		}

		private static void DeleteDatFile()
		{
			try
			{
				File.Delete(Constants.BusinessDatTempFilePath);
			}
			catch { }
		}

		private SettingsContainer LoadSettings()
		{
			return SettingsContainer.GetSettings();
		}

		private bool VerifyAppCopy()
		{
			RealtorSecurity security = new RealtorSecurity();
			if (!security.VerifyAppValidation())
			{
				ShowError(CultureResources.Inst["ItsNotAValidCopyOfRealtor"]);
				return false;
			}
			DateTime? expDate = new RealtorSecurity().GetExpirationDate();
			CustomExceptionBox box = new CustomExceptionBox{ ExceptionText = "Trial period ended"};
			if (expDate.GetValueOrDefault(DateTime.Now) <= DateTime.Now.Date)
			{
				box.ShowDialog();
				return false;
			}
			return true;
		}

		private bool VerifyAppInfo(object sender, StartupEventArgs e)
		{
			RealtorSecurity security = new RealtorSecurity();

			if (e.Args.Length > 0 && File.Exists(e.Args[0]))
			{
				string filePath = e.Args[0];
				string extension = Path.GetExtension(filePath);
				if (extension == ".arc")
				{

					string code = string.Empty;
					using (StreamReader reader = File.OpenText(filePath))
					{
						code = reader.ReadToEnd();
						reader.Close();
					}
					if (string.IsNullOrEmpty(code))
					{
						throw new Exception("WrongFileOrFileIsCorrupted");
					}
					DateTime? expirationDate;
					if (!security.ValidateExpirationDateCode(code, out expirationDate))
					{
						throw new Exception(CultureResources.Inst["IncorrectExpirationDateCode"]);
					}

					MessageBox.Show(string.Format(CultureResources.Inst["CodeEnteredExpirationDateX"], expirationDate.Value.ToString(StringEncription.DateFormat)), "Կոդը ընդունված է", MessageBoxButton.OK, MessageBoxImage.Information);
				}
			}


			Session.Inst.IsWithoutVerification = false;

			if (!security.VerifyAppValidation())
			{
				ShowError(CultureResources.Inst["ItsNotAValidCopyOfRealtor"]);
				return false;
			}

			if (!security.VerifyLastAccessDate())
			{
				ShowError(CultureResources.Inst["ComputerDateIsIncorrect"]);
				return false;
			}

			string errorMessage;
			while (true)
			{
				errorMessage = string.Empty;
				bool? OK = security.VerifyExpirationDate(out errorMessage);
				if (OK == null)
				{
					ShowError(errorMessage);
					return false;
				}

				if (OK == false)
				{
					ExpirationCodeWindow dialog = null;
					dialog = new ExpirationCodeWindow();
					if (!(dialog.ShowDialog() ?? false))
					{
						return false;
					}
				}
				else
				{
					break;
				}
			}

			if (!string.IsNullOrEmpty(errorMessage))
			{
				//MessageBox.Show(errorMessage, "Ակտիվացման ժամկետ", MessageBoxButton.OK, MessageBoxImage.Information);
				SimpleExceptionBox box = new SimpleExceptionBox(errorMessage);
				box.Title = CultureResources.Inst["ActivationDate"];
				box.ShowDialog();
			}
			return true;
		}

		private void ShowError(string message)
		{
			SimpleExceptionBox box = new SimpleExceptionBox(message);
			box.ShowDialog();
			if (Current != null)
			{
				DeleteDatFile();
				Current.Shutdown();
			}
		}

		private void Application_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
		{
			CustomExceptionBox box = new CustomExceptionBox
			{
				ExceptionText = CultureResources.Inst["SendErrorMessage"],
				ExceptionDetailText = e.ToString()
			};
			box.ShowDialog();
			e.Handled = true;
			DeleteDatFile();
			Current.Shutdown();
		}
	}
}
