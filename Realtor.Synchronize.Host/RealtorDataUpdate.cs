using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceModel;
using System.ServiceProcess;
using System.Text;

namespace Realtor.Synchronize.Host
{
	public partial class RealtorDataUpdate : ServiceBase
	{
		private ServiceHost service;
		public RealtorDataUpdate()
		{
			InitializeComponent();
		}

		protected override void OnStart(string[] args)
		{
			if (service != null)
			{
				service.Close();
			}
			service = new ServiceHost(typeof(DataUpdateServiceHost));
			service.Open();
		}

		protected override void OnStop()
		{
			if (service != null)
			{
				service.Close();
			}
			service = null;
		}

		internal void StartService()
		{
			OnStart(null);
		}

		internal void StopService()
		{
			OnStop();
		}
	}
}
