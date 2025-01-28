using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Linq;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Media.Imaging;
using AK.Converters;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using RealEstate.DataAccess.Interfaces;
using Shared.Helpers;
using System.Windows.Media;


namespace Shared.Converters
{

	[ValueConversion(typeof(Boolean), typeof(Visibility))]
	public class BoolToVisibilityInvertConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value != null && (bool)value)
			{
				return Visibility.Collapsed;
			}
			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(Boolean), typeof(Visibility))]
	public class BoolToVisibilityWithHiddenInvertConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value != null && (bool)value)
			{
				return Visibility.Hidden;
			}
			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(Boolean), typeof(Visibility))]
	public class BoolToVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value == null || !(bool)value)
			{
				return Visibility.Collapsed;
			}
			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(EstateType), typeof(Visibility))]
	public class RealEstateTypeToAptVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var estateType = (EstateType)value;
				return (estateType.EstateTypeID == 2 || estateType.EstateTypeID == 3) ? Visibility.Collapsed : Visibility.Visible;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(Estate), typeof(String))]
	public class RealEstateToEstateTypeConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value != null)
			{
				Estate estate = (Estate)value;
				if (estate.EstateType != null)
				{
					return estate.EstateType.TypeName;
				}
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(int), typeof(Visibility))]
	public class ImagesCountToVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value != null)
			{
				return ((ICollection<EstateImage>)value).Count > 0 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(List<EstateImage>), typeof(String))]
	public class ImagesListToOneImageSourceConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value != null)
			{
				var images = value as ICollection<EstateImage>;
				if (images != null && images.Count > 0)
				{
					return string.Format("{0}{1}.{2}", Constants.ImagesFolderPath, images.ElementAt(0).ImageID, (ImageTypes)images.ElementAt(0).ImageTypeID);
				}
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(List<EstateImage>), typeof(Int32))]
	public class ImagesToImageCountConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value != null)
			{
				var images = (ICollection<EstateImage>)value;
				var imagescount = images.Count > 0 ? images.Count.ToString() : string.Empty;
				return string.Format("({0})", imagescount);
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(Estate), typeof(String))]
	public class RealEstateToToolTipStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value != null)
			{
				StringBuilder toolTip = new StringBuilder("Ունի: ");
				var estate = (Estate)value;
				if (estate.IsHasGas.GetValueOrDefault(false))
				{
					toolTip.AppendFormat(" {0},", CultureResources.Inst["Gas"]);
				}
				if (estate.IsWoterAlways.GetValueOrDefault(false))
				{
					toolTip.AppendFormat(" {0},", CultureResources.Inst["AlwaysWater"]);
				}
				if (estate.ExpandingPosibility.GetValueOrDefault(false))
				{
					toolTip.AppendFormat(" {0},", CultureResources.Inst["ExpandPosibility"]);
				}
				if (estate.GasPosibility.GetValueOrDefault(false))
				{
					toolTip.AppendFormat(" {0},", CultureResources.Inst["GasPosibility"]);
				}
				if (estate.HasEuroWindows.GetValueOrDefault(false))
				{
					toolTip.AppendFormat(" {0},", CultureResources.Inst["EuroWindows"]);
				}
				if (estate.HasGarage.GetValueOrDefault(false))
				{
					toolTip.AppendFormat(" {0},", CultureResources.Inst["Garage"]);
				}
				if (estate.IsHasGarden.GetValueOrDefault(false))
				{
					toolTip.AppendFormat(" {0},", CultureResources.Inst["HomeEarthPlace"]);
				}
				if (estate.HasPadval.GetValueOrDefault(false))
				{
					toolTip.AppendFormat(" {0},", CultureResources.Inst["Podval"]);
				}
				if (estate.IsOutDoorFromSteel.GetValueOrDefault(false))
				{
					toolTip.AppendFormat(" {0},", CultureResources.Inst["SteelDoor"]);
				}
				string str = toolTip.ToString();
				if (str.EndsWith(","))
				{
					str = str.Remove(str.Length - 1);
					return str;
				}
				return string.Empty;
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion

	}

	public class NullToBoolConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value == null) return false;
			return (bool)value;
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value != null && (bool)value)
			{
				return value;
			}
			return null;
		}

		#endregion
	}

	public class EstateTypeToNotEarthPlaceEnabilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			if (value == null)
			{
				return false;
			}
			return ((EstateType)value).EstateTypeID != 3; // not earth place
		}

		public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class EstateTypeToNotEarthPlaceVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return Visibility.Collapsed;
			}
			return ((EstateType)value).EstateTypeID != 3 ? Visibility.Visible : Visibility.Collapsed; // not earth place
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class EstateTypeToEarthPlaceVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return Visibility.Visible;
			}
			return ((EstateType)value).EstateTypeID == 3 ? Visibility.Visible : Visibility.Collapsed; // earth place
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class HasItemsToEnabilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var list = value as IList;
				return list != null && list.Count > 0;
			}
			return false;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}


	public class EstateTypeToFloorVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return Visibility.Visible;
			}
			return (((EstateType)value).EstateTypeID != 3 && ((EstateType)value).EstateTypeID != 2) ? Visibility.Visible : Visibility.Collapsed; // ! earth place && !house
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class GasPosibilityVisibilityConverter : IMultiValueConverter
	{
		#region IMultiValueConverter Members

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length > 1)
			{
				var isGasChecked = (bool)values[0];
				var selectedEstateType = (EstateType)values[1];
				if (selectedEstateType != null && selectedEstateType.EstateTypeID == 3)
				{
					return Visibility.Collapsed;
				}

				return isGasChecked ? Visibility.Collapsed : Visibility.Visible;
			}
			return Visibility.Visible;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class ErrorsArrayToErrorString : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value is IEnumerable<ValidationError>)
			{
				string result = "";
				IEnumerable<ValidationError> enumerable = (IEnumerable<ValidationError>)value;
				foreach (ValidationError error in enumerable)
				{
					result += error.ErrorContent + "\n";
				}
				return result.Trim();
			}
			return string.Format("{0} - {1}", CultureResources.Inst["{0}"], value);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new InvalidOperationException();
		}

		#endregion
	}

	public class EstateTypeIDToEarthPlaceTypesVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return (int)value == 3 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class EstateTypeIDToOfficePlaceTypesVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return (int)value == 4 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}
	public class EstateTypeToHouseItemsVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return ((EstateType)value).EstateTypeID == 2 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class OrderTypeIDToPricePerDayVisibilityConverter : IMultiValueConverter
	{
		#region IMultiValueConverter Members

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Count() == 2)
			{
				if (values[1] != null && (int)values[1] == 3) return Visibility.Collapsed;
				return (values[0] != null && (int)values[0] == 2) ? Visibility.Visible : Visibility.Collapsed;
			}

			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}


	public class DateTimeToFormattedDateTimeConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return ((DateTime)value).ToString("dd.MM.yyyy");
			}
			return null;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class StringEmptyToNullConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return string.Empty;
			}
			return value;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null || string.IsNullOrEmpty(value.ToString()))
			{
				return null;
			}
			return value;
		}

		#endregion
	}

	public class RoleIDToRoleConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return CultureResources.Inst[((Roles)value).ToString()];
			}
			return CultureResources.Inst[Roles.Broker.ToString()];
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return value;
		}

		#endregion
	}

	public class NeededEstateTypesToStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var estateTypes = ((EntitySet<NeededEstateType>)value).ToList();
				string str = estateTypes.Aggregate(string.Empty, (current, estateType) => current + string.Format("{0}, ", estateType.EstateType.TypeName));
				return str.TrimEnd(',', ' ');
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class NeededRegionsToStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var neededRegions = (EntitySet<NeededRegion>)value;
				var regions = neededRegions.ToList();
				string str = string.Empty;
				str = regions.Aggregate(str, (current, region) => current + string.Format("{0}, ", region.Region.Name));
				return str.TrimEnd(',', ' ');
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class UserToTranslatedUserConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var user = (User)value;
				//Translator.TranslateUser(user);
				return user.Name;
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class EstateToFloorViewConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var estate = (Estate)value;
				var addFloor = estate.FloorAdditional.HasValue ? " - " + estate.FloorAdditional : string.Empty;
				if (estate.BuildingFloorsCount.HasValue && estate.Floor.HasValue)
				{
					return string.Format("{0}{2}/ {1}", estate.Floor, estate.BuildingFloorsCount, addFloor);
				}
				if (estate.Floor.HasValue)
				{
					return string.Format("{0}{1}", estate.Floor, addFloor);
				}
				if (estate.BuildingFloorsCount.HasValue)
				{
					return estate.BuildingFloorsCount.ToString();
				}
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class EstateToFloorViewForListConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var estate = (Estate)value;
				return estate.FLoorFull;
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class NullToVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				decimal d;
				if (decimal.TryParse(value.ToString(), out d))
				{
					return d > 0 ? Visibility.Visible : Visibility.Collapsed;
				}
				int i;
				if (int.TryParse(value.ToString(), out i))
				{
					return i > 0 ? Visibility.Visible : Visibility.Collapsed;
				}
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class EstateToRegionStateStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is Estate)
			{
				Estate estate = (Estate)value;
				string str = string.Empty;
				if (estate.State != null && estate.State.ID != 1)
				{
					if (!string.IsNullOrEmpty(estate.State.Name))
					{
						str += estate.State.Name;
					}
					if (estate.City != null && !string.IsNullOrEmpty(estate.City.Name))
					{
						str += string.Format("{0}{1}", string.IsNullOrEmpty(str) ? string.Empty : ", ", estate.City.Name);
					}
					if (estate.Region != null && !string.IsNullOrEmpty(estate.Region.Name))
					{
						str += string.Format("{0}{1}", string.IsNullOrEmpty(str) ? string.Empty : ", ", estate.Region.Name);
					}
					return str;
				}
				return estate.Region != null ? estate.Region.Name : string.Empty;
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class StringToIntConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return AKConvert.ToInt32(value);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return AKConvert.ToInt32(value);
		}

		#endregion
	}

	public class DaylyArendVisibilityConverter : IMultiValueConverter
	{
		#region IMultiValueConverter Members

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Count() == 2)
			{
				if ((Visibility)values[1] == Visibility.Collapsed)
				{
					return Visibility.Collapsed;
				}
				return new BoolToVisibilityConverter().Convert(values[0], targetType, parameter, culture);
			}
			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class IntToVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && (int)value > 0)
			{
				return Visibility.Visible;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class FilePathToFileNameConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return Path.GetFileName(value.ToString());
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class EstateTypeToEarchPlaseAndHouseVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && ((int)value == 2 || (int)value == 3))
			{
				return Visibility.Visible;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class EstateToEstateShorInfoConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				Estate estate = (Estate)value;
				return string.Format("{0}, {1}", estate.EstateType.TypeName, estate.ShortAddressString);
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class EstateTypeIDToAptHomeHeaderVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				if ((int)value == 1)
				{
					return CultureResources.Inst["Building"];
				}
			}
			return CultureResources.Inst["Apt"];
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(EstateType), typeof(Visibility))]
	public class RealEstateTypeToElectricityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var estateType = (EstateType)value;
				return (estateType.EstateTypeID == 1) ? Visibility.Collapsed : Visibility.Visible;
			}
			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	[ValueConversion(typeof(EstateType), typeof(Visibility))]
	public class EarthPlaceSelectedToItemVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var estateType = (EstateType)value;
				return (estateType.EstateTypeID == 1) ? Visibility.Collapsed : Visibility.Visible;
			}
			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class IsRentToStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				bool isForRent;
				if (bool.TryParse(value.ToString(), out isForRent))
				{
					return isForRent ? CultureResources.Inst["Rent"] : CultureResources.Inst["Buy"];
				}

				return value;
			}
			return CultureResources.Inst["Buy"];
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class StringToOneRowStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				string valStr = value.ToString().Replace(Environment.NewLine, " ");
				if (valStr.Length > 50)
				{
					valStr = valStr.Substring(0, 50) + "...";
				}
				return valStr;
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class UploadVisibilityConverter : IMultiValueConverter
	{
		#region IMultiValueConverter Members

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length == 2)
			{
				if ((bool)values[0] && (bool)values[1])
				{
					return Visibility.Visible;
				}
			}
			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class BrokersRegionsToStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is EntitySet<BrokersRegion>)
			{
				var regions = ((EntitySet<BrokersRegion>)value).Select(s => s.Region);
				StringBuilder regionsString = new StringBuilder();
				foreach (Region region in regions)
				{
					regionsString.AppendFormat("{0}, ", region.Name);
				}
				return regionsString.ToString().TrimEnd(',', ' ');
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class RoleToRegionsVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				if ((Roles)((int)value) != Roles.Broker)
				{
					return Visibility.Collapsed;
				}
			}
			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class EstateToActionButtonTextConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return (int)value > 0 ? CultureResources.Inst["Save"] : CultureResources.Inst["Add"];
			}
			return CultureResources.Inst["Add"];
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class BrokerOrderTypesToStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is EntitySet<BrokerOrderType>)
			{
				var orderTypes = ((EntitySet<BrokerOrderType>)value).Select(s => s.OrderType);
				StringBuilder orderTypeString = new StringBuilder();
				foreach (OrderType orderType in orderTypes)
				{
					orderTypeString.AppendFormat("{0}, ", orderType.Name);
				}
				return orderTypeString.ToString().TrimEnd(',', ' ');
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class BrokerEstateTypesToStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is EntitySet<BrokerEstateType>)
			{
				var estateTypes = ((EntitySet<BrokerEstateType>)value).Select(s => s.EstateType);
				StringBuilder estatesString = new StringBuilder();
				foreach (EstateType estateType in estateTypes)
				{
					estatesString.AppendFormat("{0}, ", estateType.TypeName);
				}
				return estatesString.ToString().TrimEnd(',', ' ');
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class BrokerStatesToStringConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is EntitySet<BrokerState>)
			{
				var states = ((EntitySet<BrokerState>)value).Select(s => s.State);
				StringBuilder statesString = new StringBuilder();
				foreach (var state in states)
				{
					statesString.AppendFormat("{0}, ", state.Name);
				}
				return statesString.ToString().TrimEnd(',', ' ');
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class NeededBuildingTypesToVisibleWhenOfficeSelectedConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return Visibility.Collapsed;
			var neededBuildingTypes = value as EntitySet<NeededBuildingType>;
			int officeID = 4;
			if (neededBuildingTypes.FirstOrDefault(s => s.BuildingTypeID == officeID) != null)
			{
				return Visibility.Visible;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	//public class EstateToPriceToolTipConverter : IValueConverter
	//{
	//    #region IValueConverter Members

	//    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
	//    {
	//        if (value != null && value is Estate)
	//        {
	//            var selectedEstate = ((Estate)value);
	//            if (!selectedEstate.PriceInAMD.HasValue) return string.Empty;

	//            return OtherCurrenciesValues(selectedEstate.PriceInAMD.Value, selectedEstate.Currency);
	//        }
	//        return string.Empty;
	//    }

	//    private string OtherCurrenciesValues(decimal priceInAMD, Currency selectedCurrency)
	//    {
	//        StringBuilder sb = new StringBuilder();
	//        var selectedCurrencyID = selectedCurrency != null ? selectedCurrency.CurrencyID : 1;
	//        var currencies = Session.Inst.Instance.Currencies.Where(s => s.CurrencyID != selectedCurrencyID);
	//        if (currencies == null) return string.Empty;
	//        foreach (var currency in currencies)
	//        {
	//            sb.AppendLine(string.Format("{1}: {0}", (long)(priceInAMD / currency.ValueInAMD), currency.Name));
	//        }
	//        return sb.ToString();
	//    }

	//    public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
	//    {
	//        throw new NotImplementedException();
	//    }

	//    #endregion
	//}

	public class OrderTypeToExchangeVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return (int)value == 2 ? Visibility.Collapsed : Visibility.Visible;
			}
			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class AptAndHomeRentVisibilityConverter : IMultiValueConverter
	{
		#region IMultiValueConverter Members

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length == 2)
			{
				int estateTypeID = AKConvert.ToInt32(values[0]);
				int orderTypeID = AKConvert.ToInt32(values[1]);
				if (estateTypeID == 3 || estateTypeID == 4)//earth
				{
					return Visibility.Collapsed;
				}

				return orderTypeID == 2 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class AptRentVisibilityConverter : IMultiValueConverter
	{
		#region IMultiValueConverter Members

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length == 2)
			{
				int estateTypeID = AKConvert.ToInt32(values[0]);
				int orderTypeID = AKConvert.ToInt32(values[1]);
				if (estateTypeID != 1)//apt
				{
					return Visibility.Collapsed;
				}

				return orderTypeID == 2 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class NotEarthPlaceRentVisibilityConverter : IMultiValueConverter
	{
		#region IMultiValueConverter Members

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length == 2)
			{
				int estateTypeID = AKConvert.ToInt32(values[0]);
				int orderTypeID = AKConvert.ToInt32(values[1]);
				if (estateTypeID == 3)//earth
				{
					return Visibility.Collapsed;
				}

				return orderTypeID == 2 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class VisibilityMultiConverter : IMultiValueConverter
	{
		#region IMultiValueConverter Members

		public object Convert(object[] value, Type targetType, object parameter, CultureInfo culture)
		{
			int? index = parameter != null ? (int?)int.Parse(parameter.ToString()) : null;
			for (int i = 0; i < value.Length; i++)
			{
				if (value[i] is Visibility)
				{
					if (index.HasValue && i != index && value[index.Value] is Visibility && ((Visibility)value[index.Value] == Visibility.Visible) && ((Visibility)value[i] == Visibility.Visible)) return Visibility.Visible;
					if (!index.HasValue && (Visibility)value[i] == Visibility.Collapsed) return Visibility.Collapsed;
				}
			}

			return !index.HasValue ? Visibility.Visible : Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class ShowingColumnsToVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && parameter != null)
			{
				var showableColumns = value as IEnumerable<ShowableColumn>;
				if (showableColumns == null) return Visibility.Collapsed;
				var columnID = System.Convert.ToInt32(parameter);

				var column = showableColumns.FirstOrDefault(s => s.ID == columnID);
				if (column == null) return Visibility.Visible;
				return column.Show ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class BoolToClientModeCheckBoxToolTipTextConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && (bool)value)
			{
				return string.Format("{0} {1}", CultureResources.Inst["Off"], CultureResources.Inst["ClientShowMode"]);
			}
			return string.Format("{0} {1}", CultureResources.Inst["On"], CultureResources.Inst["ClientShowMode"]);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class FullAddressVisibilityConverter : IMultiValueConverter
	{
		#region IMultiValueConverter Members

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length == 2)
			{
				var showAddress = values[0] != DependencyProperty.UnsetValue && (bool)values[0];
				bool isClientShowingMode = (bool)values[1];
				if (isClientShowingMode)
				{
					return Visibility.Collapsed;
				}
				return showAddress ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Visible;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class BoolInvertConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return false;
			}
			return !(bool)value;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null)
			{
				return false;
			}
			return !(bool)value;
		}

		#endregion
	}

	public class VideoObjToVideoFilePathConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return new Uri(value.ToString());
			}
			return null;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class BoolToVideoPlayerButtonImageSourceConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && (bool)value)
			{
				return new BitmapImage(new Uri("pack://application:,,,/Shared;component/Images/pause.png"));
			}
			return new BitmapImage(new Uri("pack://application:,,,/Shared;component/Images/play.png"));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class SeekToSliderPositionConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return 0;
			TimeSpan ts = (TimeSpan)value;
			return ts.TotalMilliseconds;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return new TimeSpan();
			int SliderValue = System.Convert.ToInt32(value);
			return new TimeSpan(0, 0, 0, 0, SliderValue);

		}

		#endregion
	}

	public class SelectedItemsCountToContextMenuItemVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return (int)value != 1 ? Visibility.Collapsed : Visibility.Visible;
			}
			return Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class VisibleWhenAppartmentConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is EstateType)
			{
				return ((EstateType)value).EstateTypeID == 1 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class VisibleWhenAppartmentOrHouseConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is EstateType)
			{
				var typeID = ((EstateType)value).EstateTypeID;
				return typeID == 1 || typeID == 2 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class VisibleWhenHouseConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is EstateType)
			{
				return ((EstateType)value).EstateTypeID == 2 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class VisibleWhenOfficePlaceConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is EstateType)
			{
				return ((EstateType)value).EstateTypeID == 4 ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class StrignEmptyToVisibilityConverter : IValueConverter
	{
		#region IValueConverter Members

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return value != null && !string.IsNullOrEmpty(value.ToString()) ? Visibility.Visible : Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}

		#endregion
	}

	public class HasValueToVisibilityConverter : ConverterMarkupExtension<HasValueToVisibilityConverter>
	{
		#region IValueConverter Members

		public override object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			bool notreverse = true;
			if (parameter != null && parameter.ToString() == "!") notreverse = false;

			if (value != null)
			{
				bool result;
				if (value is long || value is int || value is long?)
				{
					result = notreverse ? (long.Parse(value.ToString()) > 0) : !(long.Parse(value.ToString()) > 0);
				}
				else if (value is double)
				{
					result = notreverse ? (double.Parse(value.ToString()) > 0d) : !(double.Parse(value.ToString()) > 0d);
				}
				else if (value is string)
				{
					result = notreverse ? !string.IsNullOrEmpty((string)value) : string.IsNullOrEmpty((string)value);
				}
				else if (value is DateTime || value is DateTime?)
				{
					result = notreverse ? !((DateTime)value).IsEmpty() : ((DateTime)value).IsEmpty();
				}
				else return notreverse ? Visibility.Collapsed : Visibility.Visible;

				return !result ? Visibility.Collapsed : Visibility.Visible;
			}

			return notreverse ? Visibility.Collapsed : Visibility.Visible;
		}

		public override object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return Convert(value, targetType, parameter, culture);
		}

		#endregion
	}

	public class EstateToEstateFullAddressStringWithoutRegionConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return ((Estate)value).FullAddressStringWithoutRegion();
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}


	public class EstateToSquaresStringConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null && value is Estate)
			{
				var estate = value as Estate;
				string square = string.Empty;
				if (estate.TotalSquare.HasValue)
				{
					square = estate.TotalSquare.ToString();
				}
				if (estate.Square.HasValue)
				{
					square += " / " + estate.Square;
				}
				return square;
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class EstateToFullAddressStringConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return (value as Estate).FullAddressString();
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class EstateToRoomsCountStringConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var estate = value as Estate;
				var roomsCount = string.Empty;
				if (estate.RoomCount.HasValue)
				{
					roomsCount = estate.RoomCount.ToString();
				}
				if (estate.MakedRooms.HasValue)
				{
					roomsCount += " -> " + estate.MakedRooms;
				}
				return roomsCount;
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class BlackListNumbersToViewStringConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var list = value as EntitySet<BlackListNumber>;
				return string.Join(", ", list.Select(s => s.Phone));
			}
			return string.Empty;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class IsNullToEnabledConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			return value != null;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class IsEstateToContextMenuVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				var list = value as ObservableCollection<IDemandEstateDisplayData>;
				if (list.Count > 0)
				{
					return list[0] is Estate;
				}
			}
			return false;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class NeededRemontsToStringConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return string.Empty;
			var remonts = value as EntitySet<NeededRemont>;
			if (remonts == null) return string.Empty;
			return string.Join(", ", remonts.Select(s => s.Remont.Name));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class NeededProjectsToStringConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return string.Empty;
			var projects = value as EntitySet<NeededProject>;
			if (projects == null) return string.Empty;
			return string.Join(", ", projects.Select(s => s.Project.Name));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class NeededBuildingTypesToStringConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return string.Empty;
			var buildingTypes = value as EntitySet<NeededBuildingType>;
			if (buildingTypes == null) return string.Empty;
			return string.Join(", ", buildingTypes.Select(s => s.BuildingType.Name));
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class RoleToObjectVisibilityConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length > 1)
			{
				if ((bool)values[2]) return Visibility.Collapsed; //offline mode

				var isAdmin = (bool)values[0];
				if (isAdmin)
				{
					return Visibility.Visible;
				}
				bool allowBrokerAddData;
				if (!bool.TryParse(values[1].ToString(), out allowBrokerAddData))
				{
					return Visibility.Collapsed;
				}

				return allowBrokerAddData ? Visibility.Visible : Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class ElementsCountToTextColorConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return ((int)value) > 11 ? "Red" : "Green";
			}
			return "Red";
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class ElementsCountToVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value != null)
			{
				return ((int)value) > 11 ? Visibility.Collapsed : Visibility.Visible;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class ReportTypeToBrokerVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return Visibility.Collapsed;
			ReportTypeEntity reportType = (ReportTypeEntity)value;
			return reportType.ID == (int)ReportTypes.ByAgency ? Visibility.Collapsed : Visibility.Visible;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class ReportTypeToAgencyVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return Visibility.Collapsed;
			ReportTypeEntity reportType = (ReportTypeEntity)value;
			return reportType.ID == (int)ReportTypes.ByAgency ? Visibility.Visible : Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class IsSoldToBackgroundColorConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return Brushes.White;
			var estate = value as Estate;
			if (estate.IsSelledOrOrended ?? false) return Brushes.LightBlue;
			if (estate.IsUploadedToWeb ?? false) return Brushes.Lavender;
			return Brushes.White;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class IsAdminOrDirectorToObjectVisibilityConverter : IMultiValueConverter
	{

		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length > 1)
			{
				if ((bool)values[1]) return Visibility.Collapsed; //offline mode

				if ((bool)values[0])
				{
					return Visibility.Visible;
				}
			}
			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class DataUpdateButtonVisibilityConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length > 1)
			{
				var isOfflineMode = (bool)values[0];
				var serverIP = values[1].ToString();
				if (serverIP == "127.0.0.1" || serverIP.ToUpper() == "LOCALHOST")
				{
					return Visibility.Collapsed;
				}
				return isOfflineMode ? Visibility.Collapsed : Visibility.Visible;
			}
			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class ServerIPToItemVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return Visibility.Collapsed;
			var serverIP = value.ToString();
			if (serverIP == "127.0.0.1" || serverIP.ToUpper() == "LOCALHOST")
			{
				return Visibility.Visible;
			}
			return Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class SiteDataUpdateButtonVisibilityConverter : IMultiValueConverter
	{
		public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
		{
			if (values != null && values.Length > 1)
			{
				var isWebEnabled = (bool?)values[0];
				if (isWebEnabled ?? false)
				{
					var serverIP = values[1].ToString();
					if (serverIP == "127.0.0.1" || serverIP.ToUpper() == "LOCALHOST")
					{
						return Visibility.Visible;
					}
				}
				return Visibility.Collapsed;
			}
			return Visibility.Collapsed;
		}

		public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class DisplayColumnsVisibilityConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return Visibility.Visible;
			var list = (List<UserDisplayColumn>)value;
			return list[0].Show ? Visibility.Visible : Visibility.Collapsed;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class IsMainToBorderThiknessConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return new Thickness(1);
			return (bool) value ? new Thickness(3) : new Thickness(1);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}
	
	public class IsMainToToolTipConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null) return null;
			return (bool)value ? "Գլխավոր" : null;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

	public class LastModifiedDateToTextColorConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			var date = value as DateTime?;
			if (date > DateTime.Now.AddDays(-1))
			{
				return Brushes.Red;
			}
			return Brushes.Black;
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			throw new NotImplementedException();
		}
	}

    public class CollectionToVisibilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null) return Visibility.Collapsed;
            var collection = value as IList;
            if (collection == null) return Visibility.Collapsed;
            return collection.Count > 0 ? Visibility.Visible : Visibility.Collapsed;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

    public class EstateImagesToPhotoVisibilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null) return Visibility.Collapsed;
            var images = (EntitySet<EstateImage>) value;
            return images.Count(s => s.IsDeleted == null || s.IsDeleted == false) > 0 ? Visibility.Visible : Visibility.Collapsed;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }

}
