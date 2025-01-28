using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using RealEstate.Business.Managers;
using RealEstate.Common;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using Shared.Helpers;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for PrintColumnsSelectionForm.xaml
	/// </summary>
	public partial class PrintColumnsSelectionForm : Window
	{
		#region Dependency Properties

		public ObservableCollection<ShowableColumn> LeftSource
		{
			get { return (ObservableCollection<ShowableColumn>)GetValue(LeftSourceProperty); }
			set { SetValue(LeftSourceProperty, value); }
		}

		// Using a DependencyProperty as the backing store for LeftSource.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty LeftSourceProperty =
			DependencyProperty.Register("LeftSource", typeof(ObservableCollection<ShowableColumn>), typeof(PrintColumnsSelectionForm), new UIPropertyMetadata(null, OnLeftSourceChanged));

		private static void OnLeftSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((PrintColumnsSelectionForm)d).LeftSource = (ObservableCollection<ShowableColumn>)e.NewValue;
		}

		public ObservableCollection<ShowableColumn> RightSource
		{
			get { return (ObservableCollection<ShowableColumn>)GetValue(RightSourceProperty); }
			set { SetValue(RightSourceProperty, value); }
		}

		// Using a DependencyProperty as the backing store for RightSource.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty RightSourceProperty =
			DependencyProperty.Register("RightSource", typeof(ObservableCollection<ShowableColumn>), typeof(PrintColumnsSelectionForm), new UIPropertyMetadata(null, OnRightSourceChanged));

		private static void OnRightSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			((PrintColumnsSelectionForm)d).RightSource = (ObservableCollection<ShowableColumn>)e.NewValue;
		}

		#endregion

		#region Properties

		private List<Estate> Estates { get; set; }

		private bool IsColumnsChanged { get; set; }

		#endregion

		public PrintColumnsSelectionForm(List<Estate> estates)
		{
			InitializeComponent();
			Estates = estates;
		}

		private void printForm_Loaded(object sender, RoutedEventArgs e)
		{
			var columns = FileManager.GetPrintableColumns().ToList();
			var otherItem = columns.FirstOrDefault(s => s.ID == 24);
			if (otherItem != null)
			{
				columns.Remove(otherItem);
			}
			var buildingFloorsCount = columns.FirstOrDefault(s => s.ID == 11);
			if (buildingFloorsCount != null)
			{
				columns.Remove(buildingFloorsCount);
			}

			LeftSource = new ObservableCollection<ShowableColumn>(columns.Where(s => !s.Show));
			RightSource = new ObservableCollection<ShowableColumn>(columns.Where(s => s.Show));
			IsColumnsChanged = false;
		}

		private void btnMoveToRight_Click(object sender, RoutedEventArgs e)
		{
			if (lstLeft.SelectedItems == null || lstLeft.SelectedItems.Count == 0) return;

			var selectedITems = lstLeft.SelectedItems.OfType<ShowableColumn>().ToList();
			foreach (ShowableColumn column in selectedITems)
			{
				RightSource.Add(column);
				LeftSource.Remove(column);
			}
			IsColumnsChanged = true;
		}

		private void btnMoveToLeft_Click(object sender, RoutedEventArgs e)
		{
			if (lstRight.SelectedItems == null || lstRight.SelectedItems.Count == 0) return;

			var selectedITems = lstRight.SelectedItems.OfType<ShowableColumn>().ToList();
			foreach (ShowableColumn column in selectedITems)
			{
				RightSource.Remove(column);
				LeftSource.Add(column);
			}
			IsColumnsChanged = true;
		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			this.DialogResult = false;
			this.Close();
		}

		private void btnPrint_Click(object sender, RoutedEventArgs e)
		{
			if (RightSource.Count == 0)
			{
				MessageBox.Show("You must select columns", "Attention", MessageBoxButton.OK, MessageBoxImage.Warning);
				return;
			}

			PrintEstates printData = GetPrintDataSource();
			printData.Show(true);
			if (IsColumnsChanged)
			{
				SaveColumnsPlaces();
			}
			this.Close();
		}

		private void SaveColumnsPlaces()
		{
			FileManager.SavePrintableColumns(RightSource, LeftSource);
		}

		private PrintEstates GetPrintDataSource()
		{
			var selectedITems = lstRight.ItemsSource.OfType<ShowableColumn>().ToList();
			PrintEstates printDataSource = new PrintEstates();
			EstatePrintHeaders headers = GetHeader(selectedITems);
			var data = GetPrintData(selectedITems);
			printDataSource.RegData("EstatesHeaders", headers);
			printDataSource.RegData("EstatesSource", data);
			return printDataSource;
		}

		private List<EstatePrintData> GetPrintData(List<ShowableColumn> columns)
		{
			List<List<string>> data = new List<List<string>>();

			for (int i = 0; i < columns.Count; i++)
			{
				#region Estate Column Selection
				switch (columns[i].ID)
				{
					case 1: //code
						data.Add(Estates.Select(s => s.Code).ToList());
						break;
					case 2: //OrderType
						data.Add(Estates.Select(s => s.OrderType != null ? s.OrderType.Name : string.Empty).ToList());
						break;
					case 3: //Room
						data.Add(Estates.Select(s => s.Rooms).ToList());
						break;
					case 4: //EstateType
						data.Add(Estates.Select(s => s.EstateType != null ? s.EstateType.TypeName : string.Empty).ToList());
						break;
					case 5: //StateOrRegion
						data.Add(Estates.Select(s => s.StateAndOrRegion).ToList());
						break;
					case 6: //PlaceName
						data.Add(Estates.Select(s => s.PlaceName).ToList());
						break;
					case 7: //Street
						data.Add(Estates.Select(s => s.Street != null ? s.Street.Name : string.Empty).ToList());
						break;
					case 8: //Address
						data.Add(Estates.Select(s => s.ShortAddressString).ToList());
						break;
					case 9: //AddressFull
						data.Add(Estates.Select(s => s.FullAddressStringWithoutRegion()).ToList());
						break;
					case 10: //Square
						data.Add(Estates.Select(s => s.TotalSquare.HasValue ? s.TotalSquare.ToString() : string.Empty).ToList());
						break;
					//case 11: //BuildingFloorsCount
					//    data.Add(Estates.Select(s => s.BuildingFloorsCount.HasValue ? s.BuildingFloorsCount.ToString() : string.Empty).ToList());
					//    break;
					case 12: //Floor
						data.Add(Estates.Select(s => s.FLoorFull).ToList());
						break;
					case 13: //Price
						data.Add(Estates.Select(s => s.Price.HasValue ? s.Price.ToString() : string.Empty).ToList());
						break;
					case 14: //PricePerDay
						data.Add(Estates.Select(s => s.PricePerDay.HasValue ? s.PricePerDay.ToString() : string.Empty).ToList());
						break;
					case 15: //Currency
						data.Add(Estates.Select(s => s.Currency != null ? s.Currency.Name : string.Empty).ToList());
						break;
					case 16: //Added
						data.Add(Estates.Select(s => s.AddDate.HasValue ? s.AddDate.Value.ToString("dd.MM.yyyy") : string.Empty).ToList());
						break;
					case 17: //Updated
						data.Add(Estates.Select(s => s.LastModifiedDate.HasValue ? s.LastModifiedDate.Value.ToString("dd.MM.yyyy") : string.Empty).ToList());
						break;
					case 18: //Height
						data.Add(Estates.Select(s => s.Height.HasValue ? s.Height.ToString() : string.Empty).ToList());
						break;
					case 19: //Seller
						data.Add(Estates.Select(s => s.SellerInfo).ToList());
						break;
					case 20: //AdditionalInformation
						data.Add(Estates.Select(s => s.AdditionalInformation).ToList());
						break;
					case 21: //Rating
						data.Add(Estates.Select(s => s.Rating.HasValue ? s.Rating.ToString() : string.Empty).ToList());
						break;
					case 22: //Broker
						data.Add(Estates.Select(s => s.User != null ? s.User.FullName : string.Empty).ToList());
						break;
					case 23: //InfSource
						data.Add(Estates.Select(s => s.InformationSource).ToList());
						break;
					case 24: //Other details (icons)
						break;
					case 25: // status
						data.Add(Estates.Select(s => s.Status).ToList());
						break;
					case 26: // RemontType
						data.Add(Estates.Select(s => s.Remont != null ? s.Remont.Name : string.Empty).ToList());
						break;
					case 27: // Project
						data.Add(Estates.Select(s => s.Project != null ? s.Project.Name : string.Empty).ToList());
						break;
					case 28: // BuildingType
						data.Add(Estates.Select(s => s.BuildingType != null ? s.BuildingType.Name : string.Empty).ToList());
						break;
				}
				#endregion
			}

			List<EstatePrintData> list = new List<EstatePrintData>();

			for (int i = 0; i < Estates.Count; i++)
			{
				EstatePrintData dataItem = new EstatePrintData();
				if (columns.Count > 0)
				{
					dataItem.Column1 = data[0][i];
				}
				if (columns.Count > 1)
				{
					dataItem.Column2 = data[1][i];
				}
				if (columns.Count > 2)
				{
					dataItem.Column3 = data[2][i];
				}
				if (columns.Count > 3)
				{
					dataItem.Column4 = data[3][i];
				}
				if (columns.Count > 4)
				{
					dataItem.Column5 = data[4][i];
				}
				if (columns.Count > 5)
				{
					dataItem.Column6 = data[5][i];
				}
				if (columns.Count > 6)
				{
					dataItem.Column7 = data[6][i];
				}
				if (columns.Count > 7)
				{
					dataItem.Column8 = data[7][i];
				}
				if (columns.Count > 8)
				{
					dataItem.Column9 = data[8][i];
				}
				if (columns.Count > 9)
				{
					dataItem.Column10 = data[9][i];
				}
				if (columns.Count > 10)
				{
					dataItem.Column11 = data[10][i];
				}

				list.Add(dataItem);
			}
			return list;
		}

		private EstatePrintHeaders GetHeader(List<ShowableColumn> selectedITems)
		{
			var header = new EstatePrintHeaders();

			if (selectedITems.Count > 0)
			{
				header.Header1 = selectedITems[0].ColumnName;
			}
			if (selectedITems.Count > 1)
			{
				header.Header2 = selectedITems[1].ColumnName;
			}
			if (selectedITems.Count > 2)
			{
				header.Header3 = selectedITems[2].ColumnName;
			}
			if (selectedITems.Count > 3)
			{
				header.Header4 = selectedITems[3].ColumnName;
			}
			if (selectedITems.Count > 4)
			{
				header.Header5 = selectedITems[4].ColumnName;
			}
			if (selectedITems.Count > 5)
			{
				header.Header6 = selectedITems[5].ColumnName;
			}
			if (selectedITems.Count > 6)
			{
				header.Header7 = selectedITems[6].ColumnName;
			}
			if (selectedITems.Count > 7)
			{
				header.Header8 = selectedITems[7].ColumnName;
			}
			if (selectedITems.Count > 8)
			{
				header.Header9 = selectedITems[8].ColumnName;
			}
			if (selectedITems.Count > 9)
			{
				header.Header10 = selectedITems[9].ColumnName;
			}
			if (selectedITems.Count > 10)
			{
				header.Header11 = selectedITems[10].ColumnName;
			}

			return header;
		}

		private void btnMoveUp_Click(object sender, RoutedEventArgs e)
		{
			var item = ((Button)sender).Tag as ShowableColumn;
			var itemIndex = RightSource.IndexOf(item);
			if (itemIndex > 0)
			{
				var temp = RightSource[itemIndex - 1];
				RightSource[itemIndex - 1] = item;
				RightSource[itemIndex] = temp;
			}
		}

		private void btnMoveDown_Click(object sender, RoutedEventArgs e)
		{
			var item = ((Button)sender).Tag as ShowableColumn;
			var itemIndex = RightSource.IndexOf(item);
			if (itemIndex != RightSource.Count - 1)
			{
				var temp = RightSource[itemIndex + 1];
				RightSource[itemIndex + 1] = item;
				RightSource[itemIndex] = temp;
			}
		}
	}
}
