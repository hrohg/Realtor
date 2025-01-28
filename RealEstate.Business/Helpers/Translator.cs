using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using Realtor.DTO;

namespace RealEstate.Business.Helpers
{
	public class Translator
	{
		public static CultureInfo CurrentCulture
		{
			get
			{
				return Thread.CurrentThread.CurrentCulture;
			}
		}

		//    public static void TranslateEstateTypes(List<EstateType> estateTypes)
		//    {
		//        foreach (var estateType in estateTypes)
		//        {
		//            estateType.TypeName = CultureResources.Inst[estateType.TypeName];
		//        }
		//    }

		//    public static void TranslateCities(List<City> cities)
		//    {
		//        foreach (var city in cities)
		//        {
		//            city.Name = IsRussian ? city.NameRU : city.NameARM;
		//        }
		//    }

		//    protected static bool IsRussian
		//    {
		//        get
		//        {
		//            return CurrentCulture.Name == "ru-RU";
		//        }
		//    }

		//    public static void TranslateRegions(List<Region> regions)
		//    {
		//        foreach (Region region in regions)
		//        {
		//            region.Name = IsRussian ? region.NameRU : region.NameARM;
		//        }
		//    }

		//    public static void TranslateRemonts(List<Remont> remonts)
		//    {
		//        foreach (Remont remont in remonts)
		//        {
		//            remont.Name = IsRussian ? remont.NameRU : remont.NameARM;
		//        }
		//    }

		//    public static void TranslateBuildingTypes(List<BuildingType> buildingTypes)
		//    {
		//        foreach (BuildingType buildingType in buildingTypes)
		//        {
		//            buildingType.Name = IsRussian ? buildingType.NameRU : buildingType.NameARM;
		//        }
		//    }

		//    public static void TranslateOrderTypes(List<OrderType> orderTypes)
		//    {
		//        foreach (OrderType orderType in orderTypes)
		//        {
		//            orderType.Name = IsRussian ? orderType.NameRU : orderType.NameArm;
		//        }
		//    }

		//    public static void TranslateProjects(List<Project> projects)
		//    {
		//        foreach (Project project in projects)
		//        {
		//            project.Name = IsRussian ? project.NameRU : project.NameARM;
		//        }
		//    }

		//    public static void TranslateStreets(List<Street> streets)
		//    {
		//        foreach (Street street in streets)
		//        {
		//            street.Name = IsRussian ? street.NameRU : street.NameARM;
		//        }
		//    }

		//    public static void TranslateBackStreets(Street street)
		//    {
		//        if (IsRussian)
		//        {
		//            street.NameRU = street.Name;
		//        }
		//        else
		//        {
		//            street.NameARM = street.Name;
		//        }
		//    }

		//    public static void TranslateEstates(List<Estate> estates)
		//    {
		//        foreach (Estate estate in estates)
		//        {
		//            if (estate.BuildingType != null)
		//            {
		//                estate.BuildingType.Name = IsRussian ? estate.BuildingType.NameRU : estate.BuildingType.NameARM;
		//            }
		//            if (estate.City != null)
		//            {
		//                estate.City.Name = IsRussian ? estate.City.NameRU : estate.City.NameARM;
		//            }
		//            if (estate.EstateType != null)
		//            {
		//                estate.EstateType.TypeName = CultureResources.Inst[estate.EstateType.TypeName];
		//            }
		//            if (estate.OrderType != null)
		//            {
		//                estate.OrderType.Name = IsRussian ? estate.OrderType.NameRU : estate.OrderType.NameArm;
		//            }
		//            if (estate.Project != null)
		//            {
		//                estate.Project.Name = IsRussian ? estate.Project.NameRU : estate.Project.NameARM;
		//            }
		//            if (estate.Region != null)
		//            {
		//                estate.Region.Name = IsRussian ? estate.Region.NameRU : estate.Region.NameARM;
		//            }
		//            if (estate.Remont != null)
		//            {
		//                estate.Remont.Name = IsRussian ? estate.Remont.NameRU : estate.Remont.NameARM;
		//            }
		//            if (estate.Street != null)
		//            {
		//                estate.Street.Name = IsRussian ? estate.Street.NameRU : estate.Street.NameARM;
		//            }
		//        }
		//    }

		//    public static void TranslateStates(List<State> states)
		//    {
		//        foreach (State state in states)
		//        {
		//            state.Name = IsRussian ? state.NameRU : state.NameArm;
		//        }
		//    }

		public static void TranslateEarthPlaceTypes(List<EarthPlaceTypeEntity> earthPlaceTypes)
		{
			foreach (var earthPlaceType in earthPlaceTypes)
			{
				earthPlaceType.Name = CultureResources.Inst[earthPlaceType.Name];
			}
		}

		//    public static void TranslateGarageTypes(List<GarageTypeEntity> garageTypes)
		//    {
		//        foreach (GarageTypeEntity garageType in garageTypes)
		//        {
		//            garageType.Name = CultureResources.Inst[garageType.Name];
		//        }
		//    }

		public static void TranslateOfficeTypes(List<OfficePlaceTypeEntity> officePlaceTypes)
		{
			foreach (OfficePlaceTypeEntity officePlaceType in officePlaceTypes)
			{
				officePlaceType.Name = CultureResources.Inst[officePlaceType.Name];
			}
		}

		public static void TranslateRoles(List<Role> roles)
		{
			foreach (Role role in roles)
			{
				role.Name = CultureResources.Inst[role.Name];
			}
		}

		//    public static void TranslateUsers(List<User> users)
		//    {
		//        foreach (User user in users.Where(user => user != null))
		//        {
		//            user.Name = IsRussian ? user.NameRu : user.NameArm;
		//            user.Family = IsRussian ? user.FamilyRu : user.FamilyArm;
		//        }
		//    }

		//    public static void TranslateUser(User user)
		//    {
		//        user.Name = IsRussian ? user.NameRu : user.NameArm;
		//        user.Family = IsRussian ? user.FamilyRu : user.FamilyArm;
		//    }

		internal static void TranslateGarageTypes(List<GarageTypeEntity> garageTypes)
		{
			foreach (GarageTypeEntity garageTypeEntity in garageTypes)
			{
				garageTypeEntity.Name = CultureResources.Inst[garageTypeEntity.Name];
			}
		}

		public static void TranslateReportTypes(List<ReportTypeEntity> reportTypes)
		{
			foreach (var reportType in reportTypes)
			{
				reportType.Name = CultureResources.Inst[reportType.Name];
			}
		}

		public static EstateDto GetEstateDto(Estate estate)
		{
			EstateDto dto = new EstateDto();
			dto.AddDate = estate.AddDate.GetValueOrDefault(DateTime.Now);
			dto.AdditionalConvenients = estate.AdditionalConvenients;
			dto.AdditionalInformation = estate.AdditionalDetailsSite;
			dto.AptNumber = estate.AptNumber;
			dto.Arevkox = estate.Arevkox;
			dto.BrokerFullName = estate.User != null ? estate.User.FullName : string.Empty;
			dto.BrokerPhone = estate.User != null ? estate.User.Telephone1 + " " + estate.User.Telephone2 : string.Empty;
			dto.BuildingFloorsCount = estate.BuildingFloorsCount;
			dto.BuildingTypeID = estate.BuildingTypeID;
			dto.BuildingTypeName = estate.BuildingType != null ? estate.BuildingType.Name : string.Empty;
			dto.Canalisation = estate.Canalisation;
			dto.CityID = estate.CityID;
			dto.CityName = estate.City != null ? estate.City.Name : string.Empty;
			dto.ClientName = estate.ClientName;
			dto.ClosedBalcony = estate.ClosedBalcony;
			dto.Code = estate.Code;
			dto.ConvenientsIds = estate.EstateConvenients != null ? estate.EstateConvenients.Select(s => s.ConvenientID).ToList() : new List<int>();
			dto.ConvenientsListString = estate.EstateConvenients != null ? estate.EstateConvenients.Select(s => s.Convenient.Name).ToList() : new List<string>();
			dto.CurrencyID = estate.CurrencyID;
			dto.CurrencyName = estate.Currency != null ? estate.Currency.Name : string.Empty;
			dto.Dishwasher = estate.Dishwasher;
			dto.Domophone = estate.Domophone;
			dto.EarthPlaceTypeID = estate.EarthPlaceTypeID;
			dto.EarthPlaceTypeName = estate.EarthPlaceTypeID != null ? ((EarthPlaceType)estate.EarthPlaceTypeID).ToString() : string.Empty;
			dto.Electricity = estate.Electricity;
			dto.Email = estate.Email;
			dto.EstateTypeID = estate.EstateTypeID;
			dto.EstateTypeName = estate.EstateType != null ? estate.EstateType.TypeName : string.Empty;
			dto.EuroDesign = estate.EuroDesign;
			dto.ExchangeWith = estate.ExchangeWith;
			dto.ExpandingPosibility = estate.ExpandingPosibility;
			dto.Floor = estate.Floor;
			dto.FloorAdditional = estate.FloorAdditional;
			dto.FrontBalcony = estate.FrontBalcony;
			dto.GarageTypeID = estate.GarageTypeID;
			dto.GarageTypeName = estate.GarageTypeID != null ? ((GarageType)estate.GarageTypeID).ToString() : string.Empty;
			dto.GardenSquare = estate.GardenSquare;
			dto.GasPosibility = estate.GasPosibility;
			dto.HasEuroWindows = estate.HasEuroWindows;
			dto.HasGarage = estate.HasGarage;
			dto.HasPadval = estate.HasPadval;
			dto.Height = estate.Height;
			dto.HomeNumber = estate.HomeNumber;
			dto.IDInRealtor = estate.EstateID;
			dto.InFirstLine = estate.InFirstLine;
			dto.InformationSource = estate.InformationSource;
			dto.InNullableFloor = estate.InNullableFloor;
			dto.IsCeilingRepaired = estate.IsCeilingRepaired;
			dto.IsElectricityCablesChanged = estate.IsElectricityCablesChanged;
			dto.IsEmpty = estate.IsEmpty;
			dto.IsExchangePossible = estate.IsExchangePossible;
			dto.IsHasAntena = estate.IsHasAntena;
			dto.IsHasAriston = estate.IsHasAriston;
			dto.IsHasBed = estate.IsHasBed;
			dto.IsHasCanalisationPosibility = estate.IsHasCanalisationPosibility;
			dto.IsHasConditioner = estate.IsHasConditioner;
			dto.IsHasDrinkWater = estate.IsHasDrinkWater;
			dto.IsHasDVD = estate.IsHasDVD;
			dto.IsHasElectricityPosibility = estate.IsHasElectricityPosibility;
			dto.IsHasFencing = estate.IsHasFencing;
			dto.IsHasFurniture = estate.IsHasFurniture;
			dto.IsHasGarden = estate.IsHasGarden;
			dto.IsHasGas = estate.IsHasGas;
			dto.IsHasGasHeater = estate.IsHasGasHeater;
			dto.IsHasGate = estate.IsHasGate;
			dto.IsHasGeyser = estate.IsHasGeyser;
			dto.IsHasHeatedFloors = estate.IsHasHeatedFloors;
			dto.IsHasIntercome = estate.IsHasIntercome;
			dto.IsHasInternet = estate.IsHasInternet;
			dto.IsHasJakuzi = estate.IsHasJakuzi;
			dto.IsHasKitchen = estate.IsHasKitchen;
			dto.IsHasLodgeBalcony = estate.IsHasLodgeBalcony;
			dto.IsHasOfficeRoom = estate.IsHasOfficeRoom;
			dto.IsHasParking = estate.IsHasParking;
			dto.IsHasPlayRoom = estate.IsHasPlayRoom;
			dto.IsHasPool = estate.IsHasPool;
			dto.IsHasRefrigerator = estate.IsHasRefrigerator;
			dto.IsHasSauna = estate.IsHasSauna;
			dto.IsHasSecuritySystem = estate.IsHasSecuritySystem;
			dto.IsHasService = estate.IsHasService;
			dto.IsHasShowerCab = estate.IsHasShowerCab;
			dto.IsHasSomething = estate.IsHasSomething;
			dto.IsHasTechnique = estate.IsHasTechnique;
			dto.IsHasThreePhaseElectricity = estate.IsHasThreePhaseElectricity;
			dto.IsHasTrees = estate.IsHasTrees;
			dto.IsHasTV = estate.IsHasTV;
			dto.IsHasVoroqmanJur = estate.IsHasVoroqmanJur;
			dto.IsHasWarmingSystem = estate.IsHasWarmingSystem;
			dto.IsHasWasher = estate.IsHasWasher;
			dto.IsHasWaterContainer = estate.IsHasWaterContainer;
			dto.IsHasWC = estate.IsHasWC;
			dto.IsInElitarBuilding = estate.IsInElitarBuilding;
			dto.IsInNewBuilding = estate.IsInNewBuilding;
			dto.IsOutDoorFromSteel = estate.IsOutDoorFromSteel;
			dto.IsPipesChanged = estate.IsPipesChanged;
			dto.IsWoterAlways = estate.IsWoterAlways;
			dto.LandFront = estate.LandFront;
			dto.LandNumber = estate.LandNumber;
			dto.LastModifiedDate = estate.LastModifiedDate;
			dto.Lat = estate.Lat;
			dto.Lift = estate.Lift;
			dto.Lng = estate.Lng;
			dto.LodgeBalcony = estate.LodgeBalcony;
			dto.MakedRooms = estate.MakedRooms;
			dto.Metlax = estate.Metlax;
			dto.Nisha = estate.Nisha;
			dto.NotPopulated = estate.NotPopulated;
			dto.OfficePlaceTypeID = estate.OfficePlaceTypeID;
			dto.OfficePlaceTypeName = estate.OfficePlaceTypeID.HasValue ? ((OfficePlaceType)estate.OfficePlaceTypeID).ToString() : string.Empty;
			dto.OpenBalcony = estate.OpenBalcony;
			dto.OrderTypeID = estate.OrderTypeID.Value;
			dto.OrderTypeName = estate.OrderType.Name;
			dto.PadvalSquare = estate.PadvalSquare;
			dto.PhonePrimary = estate.PhonePrimary;
			dto.PhoneSecondary = estate.PhoneSecondary;
			dto.PlaceName = estate.PlaceNameSite;
			dto.Price = estate.Price;
			dto.PricePerDay = estate.PricePerDay;
			dto.ProjectID = estate.ProjectID;
			dto.ProjectName = estate.ProjectID.HasValue ? estate.Project.Name : string.Empty;
			dto.Rating = estate.Rating;
			dto.RegionID = estate.RegionID;
			dto.RegionName = estate.RegionID.HasValue ? estate.Region.Name : string.Empty;
			dto.RemontID = estate.RemontID;
			dto.RemontName = estate.RemontID.HasValue ? estate.Remont.Name : string.Empty;
			dto.RoofingID = estate.RoofingID;
			dto.RoofingName = estate.RoofingID.HasValue ? estate.Roofing.Name : string.Empty;
			dto.RoomCount = estate.RoomCount;
			dto.SellerName = estate.SellerName;
			dto.SeparateRooms = estate.SeparateRooms;
			dto.Square = estate.Square;
			dto.StateID = estate.StateID;
			dto.StateName = estate.StateID.HasValue ? estate.State.Name : string.Empty;
			dto.StreetID = estate.StreetID;
			dto.StreetName = estate.StreetID.HasValue ? estate.Street.Name : string.Empty;
			dto.Tile = estate.Tile;
			dto.TotalSquare = estate.TotalSquare;
			dto.UserID = estate.BrokerID;
			dto.Xordanoc = estate.Xordanoc;
			dto.Convenients = estate.ConvenientsList != null ? estate.ConvenientsList.Select(s => s.ConvenientID).ToList() : null;
			dto.EstateImages = estate.EstateImages != null ? estate.EstateImages.Where(s => s.ShowInSite && (s.IsDeleted == null || s.IsDeleted == false)).Select(s => new ImageDto
																		 {
																			 ID = s.ImageID,
																			 IsMain = s.IsMain.GetValueOrDefault(false),
																			 ImageType = ((ImageTypes)s.ImageTypeID.GetValueOrDefault(1)).ToString()
																		 }).ToList() : null;
			dto.OperationalSignificanceID = estate.OperationalSignificanceID;
			dto.SignificanceOfTheUseID = estate.SignificanceOfTheUseID;
			dto.OperationalSignificanceName = estate.OperationalSignificance != null
				                                  ? estate.OperationalSignificance.Name
				                                  : string.Empty;
			dto.SignificanceOfTheUseName = estate.SignificanceOfTheUse != null
				                               ? estate.SignificanceOfTheUse.Name
				                               : string.Empty;
		    dto.CountryID = estate.CountryID;
		    dto.CountryName = estate.Country != null ? estate.Country.Name : string.Empty;
		    dto.Address = estate.Address;
			return dto;
		}

		public static BuildingTypeDto GetBuildingTypeDto(BuildingType buildingType)
		{
			if (buildingType == null) return null;
			return new BuildingTypeDto
					{
						BuildingTypeID = buildingType.BuildingTypeID,
						IsDeleted = buildingType.IsDeleted ?? false,
						LastModifiedDate = buildingType.LastModifiedDate,
						NameAm = buildingType.NameAm,
						NameEn = buildingType.NameEn,
						NameRu = buildingType.NameRu,
						NameIr = buildingType.NameCz,
					};
		}

		public static CityDto GetCityDto(City city)
		{
			if (city == null) return null;

			return new CityDto
					{
						CityID = city.CityID,
						IsDeleted = city.IsDeleted ?? false,
						StateID = city.StateID ?? 0,
						LastModifiedDate = city.LastModifiedDate,
						NameAm = city.NameAm,
						NameEn = city.NameEn,
						NameRu = city.NameRu,
						NameIr = city.NameCz,
					};
		}

		public static CurrencyDto GetCurrencyDto(Currency currency)
		{
			if (currency == null) return null;
			return new CurrencyDto
					{
						CurrencyID = currency.CurrencyID,
						ValueInAMD = currency.ValueInAMD,
						IsDeleted = currency.IsDeleted ?? false,
						LastModifiedDate = currency.LastModifiedDate,
						NameAm = currency.NameAm,
						NameEn = currency.NameEn,
						NameRu = currency.NameRu,
						NameIr = currency.NameCz,
					};
		}

		public static ProjectDto GetProjectDto(Project project)
		{
			if (project == null) return null;
			return new ProjectDto
					{
						ProjectID = project.ProjectID,
						IsDeleted = project.IsDeleted ?? false,
						LastModifiedDate = project.LastModifiedDate,
						NameAm = project.NameAm,
						NameEn = project.NameEn,
						NameRu = project.NameRu,
						NameIr = project.NameCz,
					};
		}

		public static RemontDto GetRemontDto(Remont remont)
		{
			if (remont == null) return null;

			return new RemontDto
					{
						RemontID = remont.RemontID,
						IsDeleted = remont.IsDeleted ?? false,
						LastModifiedDate = remont.LastModifiedDate,
						NameAm = remont.NameAm,
						NameEn = remont.NameEn,
						NameRu = remont.NameRu,
						NameIr = remont.NameCz,
					};
		}

		public static RoofingtDto GetRoofingtDto(Roofing roofing)
		{
			if (roofing == null) return null;

			return new RoofingtDto
					{
						ID = roofing.ID,
						IsDeleted = roofing.IsDeleted ?? false,
						LastModifiedDate = roofing.LastModifiedDate,
						NameAm = roofing.NameAm,
						NameEn = roofing.NameEn,
						NameRu = roofing.NameRu,
						NameIr = roofing.NameCz,
					};
		}

		public static StateDto GetStateDto(State state)
		{
			if (state == null) return null;

			return new StateDto
					{
						ID = state.ID,
						IsDeleted = state.IsDeleted ?? false,
						LastModifiedDate = state.LastModifiedDate,
						NameAm = state.NameAm,
						NameEn = state.NameEn,
						NameRu = state.NameRu,
						NameIr = state.NameCz,
					};
		}

		public static RegionDto GetRegionDto(Region region)
		{
			if (region == null) return null;
			return new RegionDto
					{
						RegionID = region.RegionID,
						CityID = region.CityID,
						IsDeleted = region.IsDeleted ?? false,
						LastModifiedDate = region.LastModifiedDate,
						NameAm = region.NameAm,
						NameEn = region.NameEn,
						NameRu = region.NameRu,
						NameIr = region.NameCz,
					};
		}
		public static StreetDto GetStreetDto(Street street)
		{
			if (street == null) return null;

			return new StreetDto
					{
						RegionID = street.RegionID ?? 0,
						StreetID = street.StreetID,
						IsDeleted = street.IsDeleted ?? false,
						LastModifiedDate = street.LastModifiedDate,
						NameAm = street.NameAm,
						NameEn = street.NameEn,
						NameRu = street.NameRu,
						NameIr = street.NameCz,
					};
		}

		public static ConvenientDto GetConvenientDto(Convenient conv)
		{
			if (conv == null) return null;

			return new ConvenientDto
					{
						ID = conv.ID,
						IsDeleted = conv.IsDeleted ?? false,
						LastModifiedDate = conv.LastModifiedDate,
						NameAm = conv.NameAm,
						NameEn = conv.NameEn,
						NameRu = conv.NameRu,
						NameIr = conv.NameCz,
					};
		}
	}
}
