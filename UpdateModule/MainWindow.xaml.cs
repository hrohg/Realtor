using System;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Windows;
using Ionic.Zip;
using UpdateModule.FtpHelper;
using Path = System.IO.Path;

namespace UpdateModule
{
	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{


		public String ProcessMessage
		{
			get { return (String)GetValue(ProcessMessageProperty); }
			set { SetValue(ProcessMessageProperty, value); }
		}

		// Using a DependencyProperty as the backing store for ProcessMessage.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ProcessMessageProperty =
			DependencyProperty.Register("ProcessMessage", typeof(String), typeof(MainWindow), new UIPropertyMetadata(string.Empty, OnProcessMessageChanged));

		private static void OnProcessMessageChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			MainWindow wnd = (MainWindow)d;
			if (wnd != null)
			{
				wnd.ProcessMessage = (string)e.NewValue;
			}
		}

		public double DownloadPercent
		{
			get { return (double)GetValue(DownloadPercentProperty); }
			set { SetValue(DownloadPercentProperty, value); }
		}

		// Using a DependencyProperty as the backing store for DownloadPercent.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty DownloadPercentProperty =
			DependencyProperty.Register("DownloadPercent", typeof(double), typeof(MainWindow), new UIPropertyMetadata(0D, OnDownloadPercentChanged));

		private static void OnDownloadPercentChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			MainWindow wnd = (MainWindow)d;
			if (wnd != null)
			{
				wnd.DownloadPercent = (double)e.NewValue;
			}
		}


		public MainWindow()
		{
			InitializeComponent();
			worker = new BackgroundWorker { WorkerReportsProgress = true };
			worker.DoWork += worker_DoWork;
			worker.RunWorkerCompleted += worker_RunWorkerCompleted;
			worker.ProgressChanged += worker_ProgressChanged;
		}

		void worker_ProgressChanged(object sender, ProgressChangedEventArgs e)
		{
			DownloadPercent = e.ProgressPercentage;
		}

		void worker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
		{
			OpenRealtorAndClose();
		}

		private void OpenRealtorAndClose()
		{
			var realtorMainFilePath = ApplicationExecutablePath + "RealEstateApp.exe";
			Process.Start(realtorMainFilePath);
			CloseApplication();
		}

		void worker_DoWork(object sender, DoWorkEventArgs e)
		{
			DoDownload();
		}

		private BackgroundWorker worker;
		//private string ApplicationExecutablePath = @"F:\WORK\Arsen\Realtor\RealEstateApp\bin\Release\";
		private string ApplicationExecutablePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) + @"\";

		private void Window_Loaded(object sender, RoutedEventArgs e)
		{
			worker.RunWorkerAsync();
		}

		private bool CheckInternet()
		{
			try
			{
				System.Net.IPHostEntry ipHostEntry = System.Net.Dns.GetHostByName("www.google.com");
				return true;
			}
			catch
			{
				return false;
			}
		}

		private const string LocalizationZipFileName = "Localization.zip";

		private void DoDownload()
		{
			if (!CheckInternet())
			{
				MessageBox.Show("Your computer is not conneted to internet, please connect ot internet for chekincg updates ", "No internet access", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}
			string server = ConfigurationManager.AppSettings["UpdatePath"];
			string user = "realtor";
			string pass = "Litnw3mB6F9Cz";
			Dispatcher.BeginInvoke((Action)(() => { ProcessMessage = "Checking new version..."; }));
			FTP ftp = new FTP(server, user, pass);
			try
			{
				ftp.Connect();
				var versionFilePath = ApplicationExecutablePath + "uversion.txt";
				ftp.OpenDownload("Version.txt", versionFilePath, true);
				while (ftp.DoDownload() > 0)
				{
					//perc = (int)((ftp.BytesTotal * 100) / ftp.FileSize);
				}
				string version = string.Empty;
				using (var file = File.OpenText(versionFilePath))
				{
					version = file.ReadToEnd();
					file.Close();
				}

				try
				{
					File.Delete(versionFilePath);
				}
				catch { }

				//var realtorMainFilePath = @"F:\WORK\Arsen\Realtor\RealEstateApp\bin\Release\RealEstateApp.exe";
				var message = string.Empty;

				var localVersion = GetMainFileVersion();

				var tempFolderPath = ApplicationExecutablePath + @"_tempD\";

				if (Directory.Exists(tempFolderPath))
				{
					Directory.Delete(tempFolderPath, true);
				}

				Directory.CreateDirectory(tempFolderPath);

				if (localVersion != version)
				{

					Dispatcher.BeginInvoke((Action)(() => { ProcessMessage = "New version available"; }));

					var filesList = ftp.List();

					for (int i = 0; i < filesList.Count; i++)
					{
						var strs = filesList[i].ToString().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
						if (strs.Length > 0)
						{
							Dispatcher.BeginInvoke((Action)(() => { ProcessMessage = string.Format("Downloading updates {0} of {1}", i + 1, filesList.Count); }));
							var fileName = strs.Last();

							ftp.OpenDownload(fileName, tempFolderPath + fileName, true);
							while (ftp.DoDownload() > 0)
							{
								var percent = (int)((ftp.BytesTotal * 100) / ftp.FileSize);
							}
							int downloadedPercent = (i + 1) * 100 / filesList.Count;
							worker.ReportProgress(downloadedPercent);
						}
					}
					worker.ReportProgress(100);
					Dispatcher.BeginInvoke((Action)(() => { ProcessMessage = "Installing updates..."; }));
					var downloadedFiles = Directory.GetFiles(tempFolderPath);
					foreach (var file in downloadedFiles)
					{
						var currentFileName = Path.GetFileName(file);
						if (currentFileName == "dts.dat" || currentFileName == LocalizationZipFileName) continue;
						File.Copy(file, ApplicationExecutablePath + currentFileName, true);
					}

					CopyLocalizationFiles(tempFolderPath);
					ExecuteScripts(tempFolderPath);
					Dispatcher.BeginInvoke((Action)(() => { ProcessMessage = "Finishing installation..."; }));
					foreach (var file in Directory.GetFiles(tempFolderPath))
					{
						try
						{
							File.Delete(file);
						}
						catch (Exception)
						{
						}
					}
					Directory.Delete(tempFolderPath, true);
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.ToString());
			}
		}

		private void CopyLocalizationFiles(string tempFolderPath)
		{
			var localizationZipFilePath = Path.Combine(tempFolderPath, LocalizationZipFileName);
			
			if (!File.Exists(localizationZipFilePath))
			{
				return;
			}

			string LocalizationTempFolderName = Path.Combine(tempFolderPath + "tmpLoc");
			var localizationTempFolderPath = Path.Combine(tempFolderPath, LocalizationTempFolderName);
			if (Directory.Exists(localizationTempFolderPath)) Directory.Delete(localizationTempFolderPath, true);
			Directory.CreateDirectory(localizationTempFolderPath);

			using(ZipFile zipfile = ZipFile.Read(localizationZipFilePath))
			{
				foreach(var e in zipfile   )
				{
					e.Extract(LocalizationTempFolderName, ExtractExistingFileAction.OverwriteSilently);
				}   
			}   
			

			new xDirectory().StartCopy(localizationTempFolderPath, ApplicationExecutablePath, true);
		}

		private void ExecuteScripts(string tempFolderPath)
		{
			string server = ConfigurationManager.AppSettings["ServerIP"];
			if (server != "127.0.0.1") return;

			string connectionString = ConfigurationManager.ConnectionStrings["REDBConnectionString"].ConnectionString;
			if (string.IsNullOrEmpty(connectionString)) return;

			Dispatcher.BeginInvoke((Action)(() => { ProcessMessage = "Cheking database changes..."; }));
			var updateFiles = Directory.GetFiles(tempFolderPath);
			var scriptFile = updateFiles.FirstOrDefault(s => Path.GetFileName(s) == "dts.dat");
			if (string.IsNullOrEmpty(scriptFile)) return;

			Dispatcher.BeginInvoke((Action)(() => { ProcessMessage = "Executing scripts..."; }));
			string commandText = string.Empty;
			using (var reader = File.OpenText(scriptFile))
			{
				commandText = reader.ReadToEnd();
				reader.Close();
			}

			SqlConnection connection = null;
			try
			{
				connection = new SqlConnection(connectionString);
				SqlCommand command = new SqlCommand();
				command.Connection = connection;
				connection.Open();
				command.CommandText = commandText;
				command.ExecuteNonQuery();
			}
			catch (Exception ex)
			{
				var msg = ex.ToString();
			}
			finally
			{
				if (connection != null)
				{
					connection.Close();
				}
			}
		}

		private string GetMainFileVersion()
		{
			var realtorMainFilePath = ApplicationExecutablePath + "RealEstateApp.exe";
			var mainAssembly = System.Reflection.Assembly.Load(System.IO.File.ReadAllBytes(realtorMainFilePath)).GetName();
			return mainAssembly.Version.ToString();
		}

		private void CloseApplication()
		{
			Application.Current.Shutdown();
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			OpenRealtorAndClose();
		}
	}
}
