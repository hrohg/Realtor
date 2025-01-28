using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using RealEstate.Business.Managers;

namespace ImageCleaner
{
    class Program
    {
        static void Main(string[] args)
        {
            var processes = Process.GetProcessesByName("RealEstateApp");
            if (processes.Length > 0)
            {
                processes[0].Kill();
            }

            var imagesPaths = Directory.GetFiles(ConfigurationManager.AppSettings["ImagesFolder"]);
            Console.WriteLine("Cleaning started...");
            
            foreach (string image in imagesPaths)
            {
                if (ImageManager.IsImageDeleted(Path.GetFileNameWithoutExtension(image)))
                {
                    try
                    {
                        File.Delete(image);
                        Console.WriteLine("Cleaned: " + image);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Image: {0}, Cleaned error: {1}", image, ex);
                    }
                }
            }
            Console.WriteLine();
            Console.WriteLine("Cleaning finished. Press any key to start Realtor...");
            Console.ReadKey();

            var realtorMainFilePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) + @"\" + "RealEstateApp.exe";
            try
            {
                Process.Start(realtorMainFilePath);
            }
            catch { }
            return;
        }
    }
}
