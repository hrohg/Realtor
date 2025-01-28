using System;
using System.Collections.Generic;
using System.IO;
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
using RealEstate.Common.Cultures;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for GoogleAddressViewer.xaml
	/// </summary>
	public partial class GoogleAddressViewer : Window
	{

		public string Lat
		{
			get { return (string)GetValue(LatProperty); }
			set { SetValue(LatProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Lat.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty LatProperty =
			DependencyProperty.Register("Lat", typeof(string), typeof(GoogleAddressViewer), new UIPropertyMetadata(string.Empty, OnLatChanged));

		private static void OnLatChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var form = d as GoogleAddressViewer;
			if (form != null)
			{
				form.Lat = (string)e.NewValue;
			}
		}

		public string Lng
		{
			get { return (string)GetValue(LngProperty); }
			set { SetValue(LngProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Lng.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty LngProperty =
			DependencyProperty.Register("Lng", typeof(string), typeof(GoogleAddressViewer), new UIPropertyMetadata(string.Empty, OnLngChanged));

		private static void OnLngChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var form = d as GoogleAddressViewer;
			if (form != null)
			{
				form.Lng = (string)e.NewValue;
			}
		}

		public GoogleAddressViewer(string lat, string lng)
			: this()
		{
			this.Lat = lat;
			this.Lng = lng;
		}

		/// <summary>
		/// Do not use this constructor
		/// </summary>
		public GoogleAddressViewer()
		{
			InitializeComponent();
		}

		private void CheckInternet()
		{
			try
			{
				System.Net.IPHostEntry ipHostEntry = System.Net.Dns.GetHostByName("www.google.com");
			}
			catch
			{
				MessageBox.Show(CultureResources.Inst["YouAreNotConnectedToTheInternet"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				DialogResult = false;
				this.Close();
			}
		}

		private void Window_Loaded(object sender, RoutedEventArgs e)
		{
			CheckInternet();
			string html = string.Empty;
			using (var file = File.OpenText(Constants.ApplicationExecutablePath + "GoogleAddressShower.htm"))
			{
				html = file.ReadToEnd();
				file.Close();
			}
			html = html.Replace("XX_Lat_XX", Lat).Replace("XX_Lng_XX", Lng);
			browser.NavigateToString(html);
		}
	}
}
