using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace UserControls
{
	/// <summary>
	/// Interaction logic for VideoViewer.xaml
	/// </summary>
	public partial class VideoViewer : Window
	{


		public ObservableCollection<string> Videos
		{
			get { return (ObservableCollection<string>)GetValue(VideosProperty); }
			set { SetValue(VideosProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Videos.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty VideosProperty =
			DependencyProperty.Register("Videos", typeof(ObservableCollection<string>), typeof(VideoViewer), new UIPropertyMetadata(null, OnVideosChanged));

		private static void OnVideosChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			VideoViewer viewer  = d as VideoViewer;
			if (viewer != null)
			{
				viewer.Videos = (ObservableCollection<string>) e.NewValue;
			}
		}


		public VideoViewer(ObservableCollection<string> videos)
		{
			InitializeComponent();
			Videos = videos;	
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void Image_MouseUp(object sender, MouseButtonEventArgs e)
		{
			player.Source = new Uri(((Image)sender).Tag.ToString(), UriKind.RelativeOrAbsolute);
			StartTimer();
			player.Play();
		}

		void OnMouseDownPlayMedia(object sender, MouseButtonEventArgs args)
		{
			player.Play();
			InitializePropertyValues();
			StartTimer();
		}

		public void StartTimer()
		{
			System.Windows.Threading.DispatcherTimer myDispatcherTimer = new System.Windows.Threading.DispatcherTimer();
			myDispatcherTimer.Interval = new TimeSpan(0, 0, 0, 1, 0); // 1 Second
			myDispatcherTimer.Tick += Each_Tick;
			myDispatcherTimer.Start();
		}

		public void Each_Tick(object sender, EventArgs eventArgs)
		{
			timelineSlider.Value = player.Position.TotalMilliseconds;
		}

		void OnMouseDownPauseMedia(object sender, MouseButtonEventArgs args)
		{
			player.Pause();
		}

		void OnMouseDownStopMedia(object sender, MouseButtonEventArgs args)
		{
			player.Stop();
		}

		private void ChangeMediaVolume(object sender, RoutedPropertyChangedEventArgs<double> args)
		{
			player.Volume = (double)volumeSlider.Value;
		}

		private void Element_MediaOpened(object sender, EventArgs e)
		{
			timelineSlider.Maximum = player.NaturalDuration.TimeSpan.TotalMilliseconds;
			player.Height = player.NaturalVideoHeight;
			player.Width = player.NaturalVideoWidth;
		}

		private void Element_MediaEnded(object sender, EventArgs e)
		{
			player.Stop();
		}

		private void SeekToMediaPosition(object sender, RoutedPropertyChangedEventArgs<double> args)
		{
			int SliderValue = (int)timelineSlider.Value;

			TimeSpan ts = new TimeSpan(0, 0, 0, 0, SliderValue);
			player.Position = ts;
		}

		void InitializePropertyValues()
		{
			player.Volume = volumeSlider.Value;
		}
	}
}
