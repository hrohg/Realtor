using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using RealEstate.Common;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for MapWindow.xaml
	/// </summary>
	public partial class MapWindow : Window
	{
		public MapWindow(string pdfFilePath, string header)
		{
			InitializeComponent();
			this.Title = header;
			mapPlace.Child = new PDFViewWinFormsControl(pdfFilePath);
		}

		private void Window_KeyUp(object sender, KeyEventArgs e)
		{
			if(e.Key == Key.Escape)
			{
				Close();
			}
		}
	}
}
