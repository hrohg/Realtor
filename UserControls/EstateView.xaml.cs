using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Linq;
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
using FluidKit.Controls;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for EstateView.xaml
	/// </summary>
	public partial class EstateView : Window
	{
		public ObservableCollection<String> Videos
		{
			get { return (ObservableCollection<String>)GetValue(VideosProperty); }
			set { SetValue(VideosProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Videos.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty VideosProperty =
			DependencyProperty.Register("Videos", typeof(ObservableCollection<String>), typeof(EstateView), new UIPropertyMetadata(null, OnVideosChanged));

		private static void OnVideosChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EstateView view = d as EstateView;
			if (view != null)
			{
				view.Videos = (ObservableCollection<string>)e.NewValue;
			}
		}

		public ObservableCollection<String> Images
		{
			get { return (ObservableCollection<String>)GetValue(ImagesProperty); }
			set { SetValue(ImagesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Images.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ImagesProperty =
			DependencyProperty.Register("Images", typeof(ObservableCollection<String>), typeof(EstateView), new UIPropertyMetadata(null, OnImagesChanged));

		private static void OnImagesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((EstateView)d).Images = (ObservableCollection<string>)e.NewValue;
		}


		public Estate REstate
		{
			get { return (Estate)GetValue(REstateProperty); }
			set { SetValue(REstateProperty, value); }
		}

		// Using a DependencyProperty as the backing store for REstate.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty REstateProperty =
			DependencyProperty.Register("REstate", typeof(Estate), typeof(EstateView), new UIPropertyMetadata(null, OnREstateChanged));

		private static void OnREstateChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
		{
			EstateView view = sender as EstateView;
			if (view != null)
			{
				view.REstate = (Estate)e.NewValue;
				view.InitializeEstate();
			}
		}



		public List<OldPrice> OldPrices
		{
			get { return (List<OldPrice>)GetValue(OldPricesProperty); }
			set { SetValue(OldPricesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for OldPrices.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty OldPricesProperty =
			DependencyProperty.Register("OldPrices", typeof(List<OldPrice>), typeof(EstateView), new PropertyMetadata(null));



		public EstateView()
		{
			InitializeComponent();
			InitializeEstate();
			//imageViewer.Layout = new Carousel();
			//imageViewer.Focus();
		}

		public EstateView(Estate estateToShow)
			: this()
		{
			REstate = estateToShow;
		}

		private void InitializeEstate()
		{
			if (REstate == null) return;

			if (REstate.EstateType == null)
			{
				REstate.EstateType = new EstateType();
			}
			if (REstate.BuildingType == null)
			{
				REstate.BuildingType = new BuildingType();
			}
			//if (REstate.EstateImages != null)
			//{
			//    Images = AddEditRealEstate.GetImagesFileNames(REstate.EstateImages.AsEnumerable());
			//    //imageViewer.Layout = new VForm();
			//    //imageViewer.SelectedIndex = 0;
			//}
			//else
			//{
			//    REstate.EstateImages = new EntitySet<EstateImage>();
			//}
			if (REstate.EstateVideos == null || REstate.EstateVideos.Count == 0)
			{
				Videos = new ObservableCollection<string>();
			}
			else
			{
				Videos = new ObservableCollection<string>(REstate.EstateVideos.Where(s => s.IsDeleted == null || s.IsDeleted == false).Select(s => string.Format("{0}{1}{2}", Constants.VideosFolderPath, s.ID, s.FileExtension)));
			}
			if (REstate.OrderType == null)
			{
				REstate.OrderType = new OrderType();
			}
			if (REstate.Project == null)
			{
				REstate.Project = new Project();
			}
			if (REstate.Region == null)
			{
				REstate.Region = new Region();
			}
			if (REstate.Remont == null)
			{
				REstate.Remont = new Remont();
			}
			if (REstate.Street == null)
			{
				REstate.Street = new Street();
			}

			LoadEstateAttributes();
		}

		private void LoadEstateAttributes()
		{
			if (!string.IsNullOrEmpty(REstate.Status))
			{
				AddAdvancedAttribute(CultureResources.Inst["Code"], REstate.Code);
			}
			if (!string.IsNullOrEmpty(REstate.Status))
			{
				AddAdvancedAttribute(CultureResources.Inst["Status"], REstate.Status);
			}
			if (REstate.Project != null && !string.IsNullOrEmpty(REstate.Project.Name))
			{
				AddAdvancedAttribute(CultureResources.Inst["TheProject"], REstate.Project.Name);
			}

			if (REstate.BuildingType != null && !string.IsNullOrEmpty(REstate.BuildingType.Name))
			{
				AddAdvancedAttribute(CultureResources.Inst["TheBuildingType"], REstate.BuildingType.Name);
			}

			if (REstate.Remont != null && !string.IsNullOrEmpty(REstate.Remont.Name))
			{
				AddAdvancedAttribute(CultureResources.Inst["TheRoomState"], REstate.Remont.Name);
			}

			if (REstate.PadvalSquare.GetValueOrDefault(0) > 0)
			{
				AddAdvancedAttribute(CultureResources.Inst["PodvalSquare"], REstate.PadvalSquare.ToString());
			}

			if (REstate.GardenSquare.GetValueOrDefault(0) > 0)
			{
				AddAdvancedAttribute(CultureResources.Inst["EarthPlaceSquare"], REstate.GardenSquare.ToString());
			}
			if (REstate.GarageTypeID.GetValueOrDefault(0) > 0)
			{
				AddAdvancedAttribute(CultureResources.Inst["GarageType"], CultureResources.Inst[((GarageType)REstate.GarageTypeID.Value).ToString()]);
			}
			if (!string.IsNullOrEmpty(REstate.InformationSource))
			{
				AddAdvancedAttribute(CultureResources.Inst["InformationSource"], REstate.InformationSource);
			}
			if (REstate.EstateConvenients.Count > 0 || !string.IsNullOrEmpty(REstate.AdditionalConvenients))
			{
				var convenients = REstate.EstateConvenients.Select(s => s.Convenient).Select(s => s.Name).ToList();
				convenients.Add(REstate.AdditionalConvenients);
				AddAdvancedAttribute(CultureResources.Inst["ConvenientFor"], string.Format("{0} {1}", string.Join(", ", convenients), CultureResources.Inst["for"]));
			}
			if (REstate.LandFront.HasValue)
			{
				AddAdvancedAttribute(CultureResources.Inst["LandFront"], REstate.LandFront.ToString());
			}
			if (REstate.Canalisation ?? false)
			{
				AddAttribute(CultureResources.Inst["Canalisation"]);
			}
			if (REstate.ExpandingPosibility ?? false)
			{
				AddAttribute(CultureResources.Inst["ExpandPosibility"]);
			}
			if (REstate.GasPosibility ?? false)
			{
				AddAttribute(CultureResources.Inst["GasPosibility"]);
			}
			if (REstate.HasEuroWindows ?? false)
			{
				AddAttribute(CultureResources.Inst["EuroWindows"]);
			}
			if (REstate.HasGarage ?? false)
			{
				AddAttribute(CultureResources.Inst["Garage"]);
			}
			if (REstate.HasPadval ?? false)
			{
				AddAttribute(CultureResources.Inst["Podval"]);
			}
			if (REstate.IsHasGarden ?? false)
			{
				AddAttribute(CultureResources.Inst["Earth_place"]);
			}
			if (REstate.IsHasGas ?? false)
			{
				AddAttribute(CultureResources.Inst["Gas"]);
			}
			if (REstate.IsWoterAlways ?? false)
			{
				AddAttribute(CultureResources.Inst["AlwaysWater"]);
			}
			if (REstate.IsHasElectricityPosibility ?? false)
			{
				AddAttribute(CultureResources.Inst["ElectricityPosibility"]);
			}
			if (REstate.IsHasVoroqmanJur ?? false)
			{
				AddAttribute(CultureResources.Inst["VorogmanJur"]);
			}
			if (REstate.IsInNewBuilding ?? false)
			{
				AddAttribute(CultureResources.Inst["NewBuilding"]);
			}
			if (REstate.IsHasConditioner ?? false)
			{
				AddAttribute(CultureResources.Inst["Conditioner"]);
			}
			if (REstate.IsHasFurniture ?? false)
			{
				AddAttribute(CultureResources.Inst["Furniture"]);
			}
			if (REstate.IsHasWasher ?? false)
			{
				AddAttribute(CultureResources.Inst["Washer"]);
			}
			if (REstate.IsHasParking ?? false)
			{
				AddAttribute(CultureResources.Inst["Parking"]);
			}
			if (REstate.IsHasPool ?? false)
			{
				AddAttribute(CultureResources.Inst["Pool"]);
			}
			if (REstate.IsHasTrees ?? false)
			{
				AddAttribute(CultureResources.Inst["Trees"]);
			}
			if (REstate.IsHasFencing ?? false)
			{
				AddAttribute(CultureResources.Inst["Parisp"]);
			}
			if (REstate.IsHasGate ?? false)
			{
				AddAttribute(CultureResources.Inst["Gate"]);
			}
			if (REstate.IsHasPlayRoom ?? false)
			{
				AddAttribute(CultureResources.Inst["PlayRoom"]);
			}
			if (REstate.IsHasOfficeRoom ?? false)
			{
				AddAttribute(CultureResources.Inst["OfficeRoom"]);
			}
			if (REstate.Nisha ?? false)
			{
				AddAttribute(CultureResources.Inst["Նիշա"]);
			}
			if (REstate.IsEmpty ?? false)
			{
				AddAttribute(CultureResources.Inst["Empty"]);
			}
			if (REstate.OpenBalcony ?? false)
			{
				AddAttribute(CultureResources.Inst["OpenBalcony"]);
			}
			if (REstate.ClosedBalcony ?? false)
			{
				AddAttribute(CultureResources.Inst["CloseBalcony"]);
			}
			if (REstate.FrontBalcony ?? false)
			{
				AddAttribute(CultureResources.Inst["FrontBalcony"]);
			}
			if (REstate.Xordanoc ?? false)
			{
				AddAttribute(CultureResources.Inst["Xordanoc"]);
			}
			if (REstate.IsHasJakuzi ?? false)
			{
				AddAttribute(CultureResources.Inst["Jakuzi"]);
			}

			if (REstate.IsHasInternet ?? false)
			{
				AddAttribute(CultureResources.Inst["Internet"]);
			}
			if (REstate.IsHasRefrigerator ?? false)
			{
				AddAttribute(CultureResources.Inst["Refrigerator"]);
			}
			if (REstate.IsHasAntena ?? false)
			{
				AddAttribute(CultureResources.Inst["Antena"]);
			}
			if (REstate.IsHasTV ?? false)
			{
				AddAttribute(CultureResources.Inst["TV"]);
			}
			if (REstate.IsHasDVD ?? false)
			{
				AddAttribute(CultureResources.Inst["DVD"]);
			}
			if (REstate.IsHasAriston ?? false)
			{
				AddAttribute(CultureResources.Inst["Ariston"]);
			}
			if (REstate.IsHasGeyser ?? false)
			{
				AddAttribute(CultureResources.Inst["Geiser"]);
			}
			if (REstate.IsHasGasHeater ?? false)
			{
				AddAttribute(CultureResources.Inst["GasVararan"]);
			}
			if (REstate.Arevkox ?? false)
			{
				AddAttribute(CultureResources.Inst["Arevkox"]);
			}
			if (REstate.IsHasWarmingSystem ?? false)
			{
				AddAttribute(CultureResources.Inst["WarmingSystem"]);
			}
			if (REstate.IsHasHeatedFloors ?? false)
			{
				AddAttribute(CultureResources.Inst["HeatingFloor"]);
			}
			if (REstate.IsHasThreePhaseElectricity ?? false)
			{
				AddAttribute(CultureResources.Inst["ThreePhaseElectricity"]);
			}
			if (REstate.IsHasBed ?? false)
			{
				AddAttribute(CultureResources.Inst["Bed"]);
			}
			if (REstate.IsHasService ?? false)
			{
				AddAttribute(CultureResources.Inst["Service"]);
			}
			if (REstate.InFirstLine ?? false)
			{
				AddAttribute(CultureResources.Inst["FirstLine"]);
			}
			if (REstate.InNullableFloor ?? false)
			{
				AddAttribute(CultureResources.Inst["NullableFloor"]);
			}
			if (REstate.IsInElitarBuilding ?? false)
			{
				AddAttribute(CultureResources.Inst["ElitarBuilding"]);
			}
			if (REstate.IsHasSecuritySystem ?? false)
			{
				AddAttribute(CultureResources.Inst["SecuritySystem"]);
			}
			if (REstate.IsHasKitchen ?? false)
			{
				AddAttribute(CultureResources.Inst["Kitchen"]);
			}
			if (REstate.IsHasWC ?? false)
			{
				AddAttribute(CultureResources.Inst["WC"]);
			}
			if (REstate.IsHasWaterContainer ?? false)
			{
				AddAttribute(CultureResources.Inst["WaterContainer"]);
			}
			if (REstate.EuroDesign ?? false)
			{
				AddAttribute(CultureResources.Inst["EuroDesign"]);
			}
			if (REstate.Dishwasher ?? false)
			{
				AddAttribute(CultureResources.Inst["Dishwasher"]);
			}
			if (REstate.Tile ?? false)
			{
				AddAttribute(CultureResources.Inst["Tile"]);
			}
			if (REstate.Metlax ?? false)
			{
				AddAttribute(CultureResources.Inst["Metlax"]);
			}
			if (REstate.LodgeBalcony ?? false)
			{
				AddAttribute(CultureResources.Inst["LodgeBalcony"]);
			}
			if (REstate.Domophone ?? false)
			{
				AddAttribute(CultureResources.Inst["Domophone"]);
			}
			if (REstate.Lift ?? false)
			{
				AddAttribute(CultureResources.Inst["Lift"]);
			}
			if (REstate.NotPopulated ?? false)
			{
				AddAttribute(CultureResources.Inst["NotPopulated"]);
			}
			if (REstate.SeparateRooms ?? false)
			{
				AddAttribute(CultureResources.Inst["SeparateRooms"]);
			}
			if (REstate.IsCeilingRepaired ?? false)
			{
				AddAttribute(CultureResources.Inst["CeilingRepaired"]);
			}
			if (REstate.IsElectricityCablesChanged ?? false)
			{
				AddAttribute(CultureResources.Inst["ElectricityCablesChanged"]);
			}
			if (REstate.IsPipesChanged?? false)
			{
				AddAttribute(CultureResources.Inst["PipesChanged"]);
			}
		}

		private void AddAdvancedAttribute(string title, string value)
		{
			AdvancedAttributes.Add(string.Format("{0}: {1}", title, value));
			if (spAdvancedAttributes.Children.Count < 4)
			{
				spAdvancedAttributes.Children.Add(new EstateAdvancedAttributeTemplate(title, value));
			}
			else
			{
				spAdvancedAttributesRight.Children.Add(new EstateAdvancedAttributeTemplate(title, value));
			}
		}

		private List<string> AdvancedAttributes = new List<string>();
		private List<string> Attributes = new List<string>();
		private void AddAttribute(string attributeName)
		{
			Attributes.Add(attributeName);
			if (spAttributes.Children.Count < 13)
			{
				spAttributes.Children.Add(new EstateAttributeTemplate(attributeName));
			}
			else
			{
				spAttributesRight.Children.Add(new EstateAttributeTemplate(attributeName));
			}
		}

		private void estateView_KeyUp(object sender, KeyEventArgs e)
		{
			switch (e.Key)
			{
				case Key.Escape:
				Close();
				break;
				case Key.C:
					if(Keyboard.Modifiers == ModifierKeys.Control)
					{
						CopyEstateToClipboard(REstate);
					}
					break;
			}
		}

		private void CopyEstateToClipboard(Estate estate)
		{
			StringBuilder text = new StringBuilder();
			text.AppendLine(string.Join(Environment.NewLine, AdvancedAttributes));
			text.AppendLine(string.Join(",", Attributes));
			Clipboard.Clear();
			Clipboard.SetText(text.ToString(), TextDataFormat.UnicodeText);
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void imageViewer_MouseDoubleClick(object sender, MouseButtonEventArgs e)
		{

			var imageViewerWindow = new ImageViewer();
			imageViewerWindow.Images = Images;
			imageViewerWindow.ShowDialog();
		}

		//private void mnuOpenFolder_Click(object sender, RoutedEventArgs e)
		//{
		//    var directory = System.IO.Path.GetDirectoryName(Images[imageViewer.SelectedIndex]);
		//    if (!Directory.Exists(directory))
		//    {
		//        return;
		//    }

		//    string argument = "/select, " + Images[imageViewer.SelectedIndex];
		//    System.Diagnostics.Process.Start("explorer.exe", argument);
		//}

		//private void mnuSaveImages(object sender, RoutedEventArgs e)
		//{
		//    System.Windows.Forms.FolderBrowserDialog dialog = new System.Windows.Forms.FolderBrowserDialog
		//    {
		//        Description = CultureResources.Inst["FolderToSaveImages"],
		//        RootFolder = Environment.SpecialFolder.MyComputer,
		//        ShowNewFolderButton = true
		//    };

		//    if (dialog.ShowDialog() != System.Windows.Forms.DialogResult.OK)
		//    {
		//        return;
		//    }

		//    CopyImages(dialog.SelectedPath);
		//}

		private void CopyImages(string folderToCopy)
		{
			foreach (string image in Images)
			{
				try
				{
					File.Copy(image, string.Format("{0}\\{1}", folderToCopy, System.IO.Path.GetFileName(image)), true);
				}
				catch { }
			}
		}

		private void btnVideo_Click(object sender, RoutedEventArgs e)
		{
			VideoViewer viewer = new VideoViewer(Videos) { Title = this.Title };
			viewer.ShowDialog();
		}

		private void btnPlaceOnMap_Click(object sender, RoutedEventArgs e)
		{
			new GoogleAddressViewer(REstate.Lat, REstate.Lng).ShowDialog();
		}

		private void btnImages_Click(object sender, RoutedEventArgs e)
		{
			Images = new ObservableCollection<string>(AddEditRealEstate.GetImagesFileNames(REstate.EstateImages.Where(s => s.IsDeleted == null || s.IsDeleted == false)).Select(s => s.ImageFilePath));
			var imageViewerWindow = new ImageViewer();
			imageViewerWindow.Images = Images;
			imageViewerWindow.ShowDialog();
		}


		private void mnuCopy_Click(object sender, RoutedEventArgs e)
		{
			CopyEstateToClipboard(REstate);
		}

	}
}