using System;
using System.Windows;
using System.Windows.Input;
using RealEstate.Business.Managers;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for SettingsForm.xaml
	/// </summary>
	public partial class SettingsForm : Window
	{
		public RealtorSetting SettingsData
		{
			get { return (RealtorSetting)GetValue(SettingsDataProperty); }
			set { SetValue(SettingsDataProperty, value); }
		}

		// Using a DependencyProperty as the backing store for SettingsData.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty SettingsDataProperty =
			DependencyProperty.Register("SettingsData", typeof(RealtorSetting), typeof(SettingsForm), new UIPropertyMetadata(null, OnSettingsDataChanged));

		private static void OnSettingsDataChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((SettingsForm)d).SettingsData = (RealtorSetting)e.NewValue;
		}


		public SettingsForm()
		{
			InitializeComponent();
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			if (SettingsData.RatingFrom > SettingsData.RatingTo)
			{
				MessageBox.Show(CultureResources.Inst["RatingFromCanNotBeGreaterThenRatingTo"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}

			if (RealtorSettingsManager.SaveSettings(SettingsData))
			{
				DialogResult = true;
				Close();
			}
			else
			{
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void btnSelectBackupFolder_Click(object sender, RoutedEventArgs e)
		{
			System.Windows.Forms.FolderBrowserDialog dialog = new System.Windows.Forms.FolderBrowserDialog
																{
																	Description = "Backup folder",
																	RootFolder = Environment.SpecialFolder.MyComputer,
																	ShowNewFolderButton = true
																};
			if (dialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
			{
				Session.Inst.ApplicationSettings.BackupFolderPath = dialog.SelectedPath;
			}
		}

		private void settings_Loaded(object sender, RoutedEventArgs e)
		{
			SettingsData = RealtorSettingsManager.GetSettings(Session.Inst.OfflineMode) ?? new RealtorSetting();
		}


		private void settings_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
		{
			if (e.Key == Key.Escape) this.Close();
			if (Keyboard.Modifiers == System.Windows.Input.ModifierKeys.Control  && e.Key == Key.F12)
			{
				new ExpirationDateManagement().ShowDialog();
			}
		}
	}
}
