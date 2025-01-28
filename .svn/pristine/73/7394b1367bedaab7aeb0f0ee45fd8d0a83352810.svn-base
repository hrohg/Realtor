using System;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;


namespace RealEstate.Common
{
    public static class ExtensionMethods
    {
        public static bool Validate(this Estate estate)
        {
            estate.ErrorMessage = string.Empty;
            bool OK = true;
            if (estate.EstateTypeID == 0)
            {
                estate.ErrorMessage = "- " + CultureResources.Inst["SelectEstateType"];
                OK = false;
            }
            if (!estate.OrderTypeID.HasValue)
            {
                estate.ErrorMessage = "- " + CultureResources.Inst["SelectOrderType"];
                OK = false;
            }
            if (estate.EstateTypeID == 1)// apt
            {
                if (!estate.RoomCount.HasValue || estate.RoomCount.Value <= 0)
                {
                    estate.ErrorMessage = "- " + CultureResources.Inst["TheRoomsCount"];
                    OK = false;
                }

            }
            if (estate.EstateTypeID == 2) //house
            {
                if (!estate.BuildingFloorsCount.HasValue || estate.BuildingFloorsCount.Value <= 0)
                {
                    estate.ErrorMessage = "- " + CultureResources.Inst["TheBuildingFloors"];
                    OK = false;
                }
            }

            if (estate.EstateTypeID == 3) //earth
            {
                if (!estate.TotalSquare.HasValue || estate.TotalSquare.Value <= 0)
                {
                    estate.ErrorMessage = "- " + CultureResources.Inst["TheSquare"];
                    OK = false;
                }
            }

            //if (!estate.Price.HasValue || Price.Value <= 0m)
            //{
            //    estate.ErrorMessage += "\n- Գինը";
            //    OK = false;
            //}
            if (estate.Price.HasValue && (estate.CurrencyID.GetValueOrDefault(0) == 0))
            {
                estate.ErrorMessage += Environment.NewLine + "- " + CultureResources.Inst["TheCurrency"];
                OK = false;
            }
            if (string.IsNullOrEmpty(estate.PhonePrimary) && string.IsNullOrEmpty(estate.PhoneSecondary))
            {
                estate.ErrorMessage += Environment.NewLine + "- " + CultureResources.Inst["SellerPhone"];
                OK = false;
            }
            return OK;
        }

        public static string FullAddressStringWithoutRegion(this Estate estate)
        {
            string str = string.Empty;
            bool isFirst = true;
            if (estate.IsOverseas ?? false)
            {
                if (estate.Country != null && !string.IsNullOrWhiteSpace(estate.Country.Name))
                {
                    str = estate.Country.Name;
                    isFirst = false;
                }
                if (estate.City != null && !string.IsNullOrWhiteSpace(estate.City.Name))
                {
                    if (isFirst)
                    {
                        str = estate.City.Name;
                    }
                    else
                    {
                        str += ", " + estate.City.Name;
                    }
                }
                return string.IsNullOrWhiteSpace(str) ? estate.Address : str + ", " + estate.Address;
            }

            if (estate.State != null && estate.State.ID != 1)
            {
                if (!string.IsNullOrEmpty(estate.State.Name))
                {
                    str = estate.State.Name;
                    isFirst = false;
                }
                if (estate.City != null && !string.IsNullOrEmpty(estate.City.Name))
                {
                    if (isFirst || estate.City.CityID == 1)
                    {
                        str = estate.City.Name;
                        if (isFirst)
                        {
                            isFirst = false;
                        }
                    }
                    else
                    {
                        str += string.Format(", {0}", estate.City.Name);
                    }
                }
                if (estate.Region != null && !string.IsNullOrEmpty(estate.Region.Name))
                {
                    if (isFirst)
                    {
                        str += estate.Region.Name;
                        isFirst = false;
                    }
                    else
                    {
                        str += string.Format(", {0} ", estate.Region.Name);
                    }
                }
            }

            if (estate.Street != null && !string.IsNullOrEmpty(estate.Street.Name))
            {
                if (isFirst)
                {
                    str += estate.Street.Name;
                    isFirst = false;
                }
                else
                {
                    str += string.Format(", {0} ", estate.Street.Name);
                }
            }
            if (!string.IsNullOrEmpty(estate.HomeNumber))
            {
                if (isFirst)
                {
                    str += string.Format(" {0} ", estate.HomeNumber);
                    isFirst = false;
                }
                else
                {
                    str += string.Format(" {0} ", estate.HomeNumber);
                }
            }
            if (!string.IsNullOrEmpty(estate.AptNumber))
            {
                if (isFirst)
                {
                    str += string.Format("- {0}", estate.AptNumber);
                }
                else
                {
                    str += string.Format("- {0}", estate.AptNumber);
                }
            }
            if (!string.IsNullOrEmpty(estate.LandNumber))
            {
                if (isFirst)
                {
                    str += estate.LandNumber;
                }
                else
                {
                    str += string.Format(" - {0}", estate.LandNumber);
                }
            }
            return str;
        }

        public static string FullAddressString(this Estate estate)
        {
            string str = string.Empty;
            bool isFirst = true;

            if (estate.IsOverseas ?? false)
            {
                if(estate.Country != null && !string.IsNullOrWhiteSpace(estate.Country.Name))
                {
                    str = estate.Country.Name;
                    isFirst = false;
                }
                if(estate.City != null && !string.IsNullOrWhiteSpace(estate.City.Name))
                {
                    if (isFirst)
                    {
                        str = estate.City.Name;
                    }
                    else
                    {
                        str += ", " + estate.City.Name;
                    }
                }
                return string.IsNullOrWhiteSpace(str) ? estate.Address : str + ", " + estate.Address;
            }
            
            if (estate.State != null && !string.IsNullOrEmpty(estate.State.Name))
            {
                str = estate.State.Name;
                isFirst = false;
            }
            if (estate.City != null && !string.IsNullOrEmpty(estate.City.Name))
            {
                if (isFirst || estate.City.CityID == 1)
                {
                    str = estate.City.Name;
                    if (isFirst)
                    {
                        isFirst = false;
                    }
                }
                else
                {
                    str += string.Format(", {0}", estate.City.Name);
                }
            }
            if (estate.Region != null && !string.IsNullOrEmpty(estate.Region.Name))
            {
                if (isFirst)
                {
                    str += estate.Region.Name;
                    isFirst = false;
                }
                else
                {
                    str += string.Format(", {0}", estate.Region.Name);
                }
            }
            if (estate.Street != null && !string.IsNullOrEmpty(estate.Street.Name))
            {
                if (isFirst)
                {
                    str += estate.Street.Name;
                    isFirst = false;
                }
                else
                {
                    str += string.Format(", {0}", estate.Street.Name);
                }
            }
            if (!string.IsNullOrEmpty(estate.HomeNumber))
            {
                if (isFirst)
                {
                    str += string.Format("{0} ", estate.HomeNumber);
                    isFirst = false;
                }
                else
                {
                    str += string.Format(" {0} ", estate.HomeNumber);
                }
            }
            if (!string.IsNullOrEmpty(estate.AptNumber))
            {
                if (isFirst)
                {
                    str += string.Format("- {0}", estate.AptNumber);
                }
                else
                {
                    str += string.Format("- {0}", estate.AptNumber);
                }
            }
            if (!string.IsNullOrEmpty(estate.LandNumber))
            {
                if (isFirst)
                {
                    str += estate.LandNumber;
                }
                else
                {
                    str += string.Format(" - {0}", estate.LandNumber);
                }
            }
            return str;
        }

        public static bool IsValid(this NeededEstate demand)
        {

            bool OK = true;
            if (demand.NeededEstateTypes == null || demand.NeededEstateTypes.Count == 0)
            {
                demand.ErrorMessage = "- " + CultureResources.Inst["SelectEstateType"];
                OK = false;
            }

            if (demand.PriceFrom.HasValue && demand.PriceTo.HasValue && demand.PriceFrom > demand.PriceTo)
            {
                demand.ErrorMessage += Environment.NewLine + "- " + CultureResources.Inst["PriceIntervalIsNotCorrect"];
                OK = false;
            }
            if (demand.FloorFrom.HasValue && demand.FloorTo.HasValue && demand.FloorFrom.Value > demand.FloorTo.Value)
            {
                demand.ErrorMessage += Environment.NewLine + "- " + CultureResources.Inst["FloorIntervalIsNotCorrect"];
                OK = false;
            }
            if (demand.RoomCountFrom.HasValue && demand.RoomCountTo.HasValue && demand.RoomCountFrom.Value > demand.RoomCountTo.Value)
            {
                demand.ErrorMessage += Environment.NewLine + "- " + CultureResources.Inst["RoomsCountIsNotCorrect"];
                OK = false;
            }
            if (string.IsNullOrEmpty(demand.Telephone1) & string.IsNullOrEmpty(demand.Telephone2))
            {
                demand.ErrorMessage += Environment.NewLine + "- " + CultureResources.Inst["InputPhoneNumber"];
                OK = false;
            }
            return OK;
        }
    }

}
