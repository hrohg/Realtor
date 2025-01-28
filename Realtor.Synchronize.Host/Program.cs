using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace Realtor.Synchronize.Host
{
	static class Program
	{
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		static void Main()
		{
			RealtorDataUpdate service = new RealtorDataUpdate();
			if (Environment.UserInteractive)
			{
				service.StartService();
				Console.WriteLine("Service started !");
				Console.Write("Press any key to close service...");
				Console.ReadLine();
				service.StopService();
				return;
			}
			ServiceBase[] ServicesToRun = new ServiceBase[] { service };
			ServiceBase.Run(ServicesToRun);
		}
	}
}
