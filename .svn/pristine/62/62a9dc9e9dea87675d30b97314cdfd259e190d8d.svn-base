using System;
using System.IO;
using System.Windows;
using mshtml;
using RealEstate.Common;
using RealEstate.Common.Cultures;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for GoogleMapViewer.xaml
	/// </summary>
	public partial class GoogleMapViewer : Window
	{

		private string PlaceName { get; set; }

		public string Lat
		{
			get { return (string)GetValue(LatProperty); }
			set { SetValue(LatProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Lat.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty LatProperty =
			DependencyProperty.Register("Lat", typeof(string), typeof(GoogleMapViewer), new UIPropertyMetadata(string.Empty, OnLatChanged));

		private static void OnLatChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var form = d as GoogleMapViewer;
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
			DependencyProperty.Register("Lng", typeof(string), typeof(GoogleMapViewer), new UIPropertyMetadata(string.Empty, OnLngChanged));

		private static void OnLngChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			var form = d as GoogleMapViewer;
			if (form != null)
			{
				form.Lng = (string)e.NewValue;
			}
		}

		public GoogleMapViewer()
		{
			InitializeComponent();
			//browser.DocumentCompleted += asdlkfj;
		}

		public GoogleMapViewer(string placeName)
			: this()
		{
			PlaceName = placeName;
		}

		private void CheckInternet()
		{
			try
			{
				System.Net.IPHostEntry hostEntry = System.Net.Dns.GetHostByName("www.google.com");
			}
			catch
			{
				MessageBox.Show(CultureResources.Inst["YouAreNotConnectedToTheInternet"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				DialogResult = false;
				this.Close();
			}
		}

		private void WindowLoaded(object sender, RoutedEventArgs e)
		{
			CheckInternet();
			var filePath = Constants.ApplicationExecutablePath + "GoogleMap.htm";
			string html = string.Empty;
			using (var file = File.OpenText(filePath))
			{
				html = file.ReadToEnd();
				file.Close();
			}
			html = html.Replace("__xxxxxxxxxxxx__", PlaceName ?? string.Empty);
			browser.NavigateToString(html);
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			try
			{
				var documentElement = ((HTMLDocument)browser.Document).documentElement;
				HTMLInputElement input = documentElement.document.getElementById("hfMarker_location");
				//(40.183652668849234, 44.512729517166115)
				var location = input.value.Trim('(', ')').Split(new[] { ',', ' ' }, StringSplitOptions.RemoveEmptyEntries);
				Lat = location[0];
				Lng = location[1];
				this.DialogResult = true;
			}
			catch
			{
				MessageBox.Show(CultureResources.Inst["ErrorInSavePlaceCheckInternet"], CultureResources.Inst["Error"]);
				DialogResult = false;
			}
			finally
			{
				Close();
			}
		}

	}
}
