using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Windows;

namespace UpdateModule
{
	/// <summary>
	/// Interaction logic for App.xaml
	/// </summary>
	public partial class App : Application
	{
		private void Application_Startup(object sender, StartupEventArgs e)
		{
			var processes = Process.GetProcessesByName("RealEstateApp");
			if (processes.Length > 0)
			{
				processes[0].Kill();
			}
		}
	}
}
