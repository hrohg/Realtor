using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;
using UserControls;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for BuildingTypesManagement.xaml
	/// </summary>
	public partial class BuildingTypesManagement : Window
	{

		public ObservableCollection<BuildingType> BuildingTypes
		{
			get { return (ObservableCollection<BuildingType>)GetValue(BuildingTypesProperty); }
			set { SetValue(BuildingTypesProperty, value); }
		}

		// Using a DependencyProperty as the backing store for BuildingTypes.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty BuildingTypesProperty =
			DependencyProperty.Register("BuildingTypes", typeof(ObservableCollection<BuildingType>), typeof(BuildingTypesManagement), new UIPropertyMetadata(null, OnBuildingTypesChanged));

		private static void OnBuildingTypesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			BuildingTypesManagement form = d as BuildingTypesManagement;
			if (form != null)
			{
				form.BuildingTypes = (ObservableCollection<BuildingType>)e.NewValue;
			}
		}

		public BuildingTypesManagement()
		{
			InitializeComponent();
		}

		private void btnOk_Click(object sender, RoutedEventArgs e)
		{
			Close();
		}

		private void buildingTypeManagement_Loaded(object sender, RoutedEventArgs e)
		{
			LoadBuildingTypes();
		}

		private void LoadBuildingTypes()
		{
			BuildingTypes = new ObservableCollection<BuildingType>(Session.Inst.BEManager.GetBuildingTypes(Session.Inst.OfflineMode));
		}

		private void dgBuildingTypes_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
		{
			BuildingType buildingType = e.Row.Item as BuildingType;
			if (buildingType == null || string.IsNullOrEmpty(buildingType.Name))
			{
				e.Cancel = true;
				return;
			}

			if (buildingType.BuildingTypeID > 0)
			{
				if (!Session.Inst.BEManager.UpdateBuildingType(buildingType))
				{
					e.Cancel = true;
				}
			}
			else
			{
				if (!Session.Inst.BEManager.AddBuildingType(buildingType))
				{
					e.Cancel = true;
				}
			}
		}

		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			var bt = ((Button)sender).CommandParameter as BuildingType;
			if (bt == null) return;

			if(Session.Inst.BEManager.DeleteBuildingType(bt))
			{
				LoadBuildingTypes();
			}
			else
			{
				//MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
				MessageBox.Show(CultureResources.Inst["CommandIsNotCompletedSuccessfully"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}

		private void buildingTypeManagement_KeyUp(object sender, KeyEventArgs e)
		{
			if(e.Key == Key.Escape)
			{
				Close();
			}
		}
	}
}
