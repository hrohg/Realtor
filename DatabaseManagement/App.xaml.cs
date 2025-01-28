using System;
using System.Windows;
using RealEstate.Business.Helpers;
using UserControls;
using RealEstate.Common.Cultures;

namespace DatabaseManagement
{
	/// <summary>
	/// Interaction logic for App.xaml
	/// </summary>
	public partial class App : Application
	{
		private void Application_Startup(object sender, StartupEventArgs e)
		{
			//if (DateTime.Now >= new DateTime(2011, 5, 25))
			//{
			//    System.Diagnostics.Process.Start("DataSave.exe");
			//    throw new Exception("Save Data");
			//}
			
			var splash = new SplashScreen("DMSplash.png");
			splash.Show(true);
			
			Session.Inst.BEManager = DataManager.GetInstance();
			CultureResources.ChangeCulture(new CustomCultureInfo("hy-AM"));
			
			MainWindow mainWindow = new MainWindow();
			Current.MainWindow = mainWindow;
			mainWindow.ShowDialog();

			Current.Shutdown();
		}

		private void Application_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
		{
			CustomExceptionBox box = new CustomExceptionBox
			{
				ExceptionText = CultureResources.Inst["MainErrorTitle"],
				ExceptionDetailText = e.ToString()
			};
			box.ShowDialog();
			e.Handled = true;
			Current.Shutdown();
		}
	}
}
