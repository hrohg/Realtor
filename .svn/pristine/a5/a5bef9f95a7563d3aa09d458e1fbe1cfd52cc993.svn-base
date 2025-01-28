using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for UploadImagesSelectionForm.xaml
	/// </summary>
	public partial class UploadImagesSelectionForm : Window
	{
		public Estate Estate
		{
			get { return (Estate)GetValue(EstateProperty); }
			set { SetValue(EstateProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Estate.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty EstateProperty =
			DependencyProperty.Register("Estate", typeof(Estate), typeof(UploadImagesSelectionForm), new UIPropertyMetadata(null, OnEstateChanged));

		private static void OnEstateChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			UploadImagesSelectionForm form = d as UploadImagesSelectionForm;
			form.Estate = (Estate)e.NewValue;
		}



		public List<SelectibleImage> RealEstateImages
		{
			get { return (List<SelectibleImage>)GetValue(RealEstateImagesProperty); }
			set { SetValue(RealEstateImagesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for RealEstateImages.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RealEstateImagesProperty =
			DependencyProperty.Register("RealEstateImages", typeof(List<SelectibleImage>), typeof(UploadImagesSelectionForm), new PropertyMetadata(null, OnRealEstateImagesChanged));

		private static void OnRealEstateImagesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((UploadImagesSelectionForm)d).RealEstateImages = (List<SelectibleImage>)e.NewValue;
		}


		private UploadImagesSelectionForm()
		{
			InitializeComponent();
		}

		public UploadImagesSelectionForm(Estate estate)
		{
			InitializeComponent();
			Estate = estate;

			if (Estate == null)
			{
				MessageBox.Show("Խնդրում ենք ընտրել հայտ", CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				Close();
				return;
			}
			if (estate.EstateImages != null)
			{
				RealEstateImages = AddEditRealEstate.GetImagesFileNames(Estate.EstateImages.Where(s => s.IsDeleted == null || s.IsDeleted == false)).Select(s => new SelectibleImage { IsSelected = true, Image = s }).ToList();
			}
			if (RealEstateImages.Count > 0)
			{
				RealEstateImages[0].IsMain = true;
			}
		}

		private void btnUpload_Click(object sender, RoutedEventArgs e)
		{
			//var mainImage = RealEstateImages.FirstOrDefault(s => s.IsMain && s.IsSelected);
			//if(mainImage == null)
			//{
			//	MessageBox.Show("Խնդրում ենք ընտրել գլխավոր նկար ընտրված նկարներից", "Գլխավոր նկար", MessageBoxButton.OK, MessageBoxImage.Error);
			//	return;
			//}
			this.Cursor = Cursors.Wait;
			this.DialogResult = true;
			Close();
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void Window_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Escape)
			{
				Close();
			}
		}

		private void miMakeMain_Click(object sender, RoutedEventArgs e)
		{
			if (RealEstateImages == null || RealEstateImages.Count == 0) return;
			RealEstateImages.ForEach(s => s.IsMain = false);
			((SelectibleImage)((MenuItem)sender).Tag).IsMain = true;

		}
	}

	public class SelectibleImage : BindableObject
	{
		#region IsSelected - Описание свойства (summary)
		public const string IsSelectedProperty = "IsSelected";

		/// <summary>Описание свойства (summary)</summary>
		public bool IsSelected
		{
			get { return fieldIsSelected; }
			set
			{
				if (fieldIsSelected == value) return;
				fieldIsSelected = value;
				OnPropertyChanged(IsSelectedProperty);
			}
		}
		private bool fieldIsSelected;
		#endregion

		#region Image - Описание свойства (summary)
		public const string ImageProperty = "Image";

		/// <summary>Описание свойства (summary)</summary>
		public EstateImage Image
		{
			get { return fieldImage; }
			set
			{
				if (fieldImage == value) return;
				fieldImage = value;
				OnPropertyChanged(ImageProperty);
			}
		}
		private EstateImage fieldImage;
		#endregion

		#region IsMain - Описание свойства (summary)
		public const string IsMainProperty = "IsMain";

		/// <summary>Описание свойства (summary)</summary>
		public bool IsMain
		{
			get { return fieldIsMain; }
			set
			{
				if (fieldIsMain == value) return;
				fieldIsMain = value;
				OnPropertyChanged(IsMainProperty);
			}
		}
		private bool fieldIsMain;
		#endregion


	}
}
