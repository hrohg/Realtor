using System;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Realtor.DTO
{
	[DataContract]
	[Serializable]
	public class EstateDto
	{
		#region Properties

		#region AddDate - Описание свойства (summary)
		public const string AddDateProperty = "AddDate";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public DateTime AddDate
		{
			get { return fieldAddDate; }
			set
			{
				if (fieldAddDate == value) return;
				fieldAddDate = value;
			}
		}
		private DateTime fieldAddDate;
		#endregion

		#region AdditionalConvenients - Описание свойства (summary)
		public const string AdditionalConvenientsProperty = "AdditionalConvenients";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string AdditionalConvenients
		{
			get { return fieldAdditionalConvenients; }
			set
			{
				if (fieldAdditionalConvenients == value) return;
				fieldAdditionalConvenients = value;
			}
		}
		private string fieldAdditionalConvenients;
		#endregion

		#region AdditionalInformation - Описание свойства (summary)
		public const string AdditionalInformationProperty = "AdditionalInformation";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string AdditionalInformation
		{
			get { return fieldAdditionalInformation; }
			set
			{
				if (fieldAdditionalInformation == value) return;
				fieldAdditionalInformation = value;
			}
		}
		private string fieldAdditionalInformation;
		#endregion

		#region AptNumber - Описание свойства (summary)
		public const string AptNumberProperty = "AptNumber";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string AptNumber
		{
			get { return fieldAptNumber; }
			set
			{
				if (fieldAptNumber == value) return;
				fieldAptNumber = value;
			}
		}
		private string fieldAptNumber;
		#endregion

		#region Arevkox - Описание свойства (summary)
		public const string ArevkoxProperty = "Arevkox";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Arevkox
		{
			get { return fieldArevkox; }
			set
			{
				if (fieldArevkox == value) return;
				fieldArevkox = value;
			}
		}
		private bool? fieldArevkox;
		#endregion

		#region BuildingFloorsCount - Описание свойства (summary)
		public const string BuildingFloorsCountProperty = "BuildingFloorsCount";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? BuildingFloorsCount
		{
			get { return fieldBuildingFloorsCount; }
			set
			{
				if (fieldBuildingFloorsCount == value) return;
				fieldBuildingFloorsCount = value;
			}
		}
		private int? fieldBuildingFloorsCount;
		#endregion

		#region BuildingTypeID - Описание свойства (summary)
		public const string BuildingTypeIDProperty = "BuildingTypeID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? BuildingTypeID
		{
			get { return fieldBuildingTypeID; }
			set
			{
				if (fieldBuildingTypeID == value) return;
				fieldBuildingTypeID = value;
			}
		}
		private int? fieldBuildingTypeID;
		#endregion

		#region BuildingTypeName - Описание свойства (summary)
		public const string BuildingTypeNameProperty = "BuildingTypeName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string BuildingTypeName
		{
			get { return fieldBuildingTypeName; }
			set
			{
				if (fieldBuildingTypeName == value) return;
				fieldBuildingTypeName = value;
			}
		}
		private string fieldBuildingTypeName;
		#endregion

		#region Canalisation - Описание свойства (summary)
		public const string CanalisationProperty = "Canalisation";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Canalisation
		{
			get { return fieldCanalisation; }
			set
			{
				if (fieldCanalisation == value) return;
				fieldCanalisation = value;
			}
		}
		private bool? fieldCanalisation;
		#endregion

		#region CityID - Описание свойства (summary)
		public const string CityIDProperty = "CityID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? CityID
		{
			get { return fieldCityID; }
			set
			{
				if (fieldCityID == value) return;
				fieldCityID = value;
			}
		}
		private int? fieldCityID;
		#endregion

		#region CityName - Описание свойства (summary)
		public const string CityNameProperty = "CityName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string CityName
		{
			get { return fieldCityName; }
			set
			{
				if (fieldCityName == value) return;
				fieldCityName = value;
			}
		}
		private string fieldCityName;
		#endregion

		#region ClientName - Описание свойства (summary)
		public const string ClientNameProperty = "ClientName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string ClientName
		{
			get { return fieldClientName; }
			set
			{
				if (fieldClientName == value) return;
				fieldClientName = value;
			}
		}
		private string fieldClientName;
		#endregion

		#region ClosedBalcony - Описание свойства (summary)
		public const string ClosedBalconyProperty = "ClosedBalcony";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? ClosedBalcony
		{
			get { return fieldClosedBalcony; }
			set
			{
				if (fieldClosedBalcony == value) return;
				fieldClosedBalcony = value;
			}
		}
		private bool? fieldClosedBalcony;
		#endregion

		#region Code - Описание свойства (summary)
		public const string CodeProperty = "Code";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string Code
		{
			get { return fieldCode; }
			set
			{
				if (fieldCode == value) return;
				fieldCode = value;
			}
		}
		private string fieldCode;
		#endregion

		#region ConvenientsListString - Описание свойства (summary)
		public const string ConvenientsListStringProperty = "ConvenientsListString";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public List<string> ConvenientsListString
		{
			get { return fieldConvenientsListString; }
			set
			{
				if (fieldConvenientsListString == value) return;
				fieldConvenientsListString = value;
			}
		}
		private List<string> fieldConvenientsListString;
		#endregion

		#region ConvenientsIds - Описание свойства (summary)
		public const string ConvenientsIdsProperty = "ConvenientsIds";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public List<int> ConvenientsIds
		{
			get { return fieldConvenientsIds; }
			set
			{
				if (fieldConvenientsIds == value) return;
				fieldConvenientsIds = value;
			}
		}
		private List<int> fieldConvenientsIds;
		#endregion

		#region CurrencyID - Описание свойства (summary)
		public const string CurrencyIDProperty = "CurrencyID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? CurrencyID
		{
			get { return fieldCurrencyID; }
			set
			{
				if (fieldCurrencyID == value) return;
				fieldCurrencyID = value;
			}
		}
		private int? fieldCurrencyID;
		#endregion

		#region CurrencyName - Описание свойства (summary)
		public const string CurrencyNameProperty = "CurrencyName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string CurrencyName
		{
			get { return fieldCurrencyName; }
			set
			{
				if (fieldCurrencyName == value) return;
				fieldCurrencyName = value;
			}
		}
		private string fieldCurrencyName;
		#endregion

		#region Dishwasher - Описание свойства (summary)
		public const string DishwasherProperty = "Dishwasher";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Dishwasher
		{
			get { return fieldDishwasher; }
			set
			{
				if (fieldDishwasher == value) return;
				fieldDishwasher = value;
			}
		}
		private bool? fieldDishwasher;
		#endregion

		#region Domophone - Описание свойства (summary)
		public const string DomophoneProperty = "Domophone";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Domophone
		{
			get { return fieldDomophone; }
			set
			{
				if (fieldDomophone == value) return;
				fieldDomophone = value;
			}
		}
		private bool? fieldDomophone;
		#endregion

		#region EarthPlaceTypeID - Описание свойства (summary)
		public const string EarthPlaceTypeIDProperty = "EarthPlaceTypeID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? EarthPlaceTypeID
		{
			get { return fieldEarthPlaceTypeID; }
			set
			{
				if (fieldEarthPlaceTypeID == value) return;
				fieldEarthPlaceTypeID = value;
			}
		}
		private int? fieldEarthPlaceTypeID;
		#endregion

		#region EarthPlaceTypeName - Описание свойства (summary)
		public const string EarthPlaceTypeNameProperty = "EarthPlaceTypeName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string EarthPlaceTypeName
		{
			get { return fieldEarthPlaceTypeName; }
			set
			{
				if (fieldEarthPlaceTypeName == value) return;
				fieldEarthPlaceTypeName = value;
			}
		}
		private string fieldEarthPlaceTypeName;
		#endregion

		#region Electricity - Описание свойства (summary)
		public const string ElectricityProperty = "Electricity";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Electricity
		{
			get { return fieldElectricity; }
			set
			{
				if (fieldElectricity == value) return;
				fieldElectricity = value;
			}
		}
		private bool? fieldElectricity;
		#endregion

		#region Email - Описание свойства (summary)
		public const string EmailProperty = "Email";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string Email
		{
			get { return fieldEmail; }
			set
			{
				if (fieldEmail == value) return;
				fieldEmail = value;
			}
		}
		private string fieldEmail;
		#endregion

		#region IDInRealtor - Описание свойства (summary)
		public const string IDInRealtorProperty = "IDInRealtor";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int IDInRealtor
		{
			get { return fieldIDInRealtor; }
			set
			{
				if (fieldIDInRealtor == value) return;
				fieldIDInRealtor = value;
			}
		}
		private int fieldIDInRealtor;
		#endregion

		#region EstateTypeID - Описание свойства (summary)
		public const string EstateTypeIDProperty = "EstateTypeID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int EstateTypeID
		{
			get { return fieldEstateTypeID; }
			set
			{
				if (fieldEstateTypeID == value) return;
				fieldEstateTypeID = value;
			}
		}
		private int fieldEstateTypeID;
		#endregion

		#region EstateTypeName - Описание свойства (summary)
		public const string EstateTypeNameProperty = "EstateTypeName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string EstateTypeName
		{
			get { return fieldEstateTypeName; }
			set
			{
				if (fieldEstateTypeName == value) return;
				fieldEstateTypeName = value;
			}
		}
		private string fieldEstateTypeName;
		#endregion

		#region EuroDesign - Описание свойства (summary)
		public const string EuroDesignProperty = "EuroDesign";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? EuroDesign
		{
			get { return fieldEuroDesign; }
			set
			{
				if (fieldEuroDesign == value) return;
				fieldEuroDesign = value;
			}
		}
		private bool? fieldEuroDesign;
		#endregion

		#region ExchangeWith - Описание свойства (summary)
		public const string ExchangeWithProperty = "ExchangeWith";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string ExchangeWith
		{
			get { return fieldExchangeWith; }
			set
			{
				if (fieldExchangeWith == value) return;
				fieldExchangeWith = value;
			}
		}
		private string fieldExchangeWith;
		#endregion

		#region ExpandingPosibility - Описание свойства (summary)
		public const string ExpandingPosibilityProperty = "ExpandingPosibility";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? ExpandingPosibility
		{
			get { return fieldExpandingPosibility; }
			set
			{
				if (fieldExpandingPosibility == value) return;
				fieldExpandingPosibility = value;
			}
		}
		private bool? fieldExpandingPosibility;
		#endregion

		#region Floor - Описание свойства (summary)
		public const string FloorProperty = "Floor";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? Floor
		{
			get { return fieldFloor; }
			set
			{
				if (fieldFloor == value) return;
				fieldFloor = value;
			}
		}
		private int? fieldFloor;
		#endregion

		#region FloorAdditional - Описание свойства (summary)
		public const string FloorAdditionalProperty = "FloorAdditional";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? FloorAdditional
		{
			get { return fieldFloorAdditional; }
			set
			{
				if (fieldFloorAdditional == value) return;
				fieldFloorAdditional = value;
			}
		}
		private int? fieldFloorAdditional;
		#endregion

		#region FrontBalcony - Описание свойства (summary)
		public const string FrontBalconyProperty = "FrontBalcony";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? FrontBalcony
		{
			get { return fieldFrontBalcony; }
			set
			{
				if (fieldFrontBalcony == value) return;
				fieldFrontBalcony = value;
			}
		}
		private bool? fieldFrontBalcony;
		#endregion

		#region GarageTypeID - Описание свойства (summary)
		public const string GarageTypeIDProperty = "GarageTypeID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? GarageTypeID
		{
			get { return fieldGarageTypeID; }
			set
			{
				if (fieldGarageTypeID == value) return;
				fieldGarageTypeID = value;
			}
		}
		private int? fieldGarageTypeID;
		#endregion

		#region GarageTypeName - Описание свойства (summary)
		public const string GarageTypeNameProperty = "GarageTypeName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string GarageTypeName
		{
			get { return fieldGarageTypeName; }
			set
			{
				if (fieldGarageTypeName == value) return;
				fieldGarageTypeName = value;
			}
		}
		private string fieldGarageTypeName;
		#endregion

		#region GardenSquare - Описание свойства (summary)
		public const string GardenSquareProperty = "GardenSquare";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? GardenSquare
		{
			get { return fieldGardenSquare; }
			set
			{
				if (fieldGardenSquare == value) return;
				fieldGardenSquare = value;
			}
		}
		private int? fieldGardenSquare;
		#endregion

		#region GasPosibility - Описание свойства (summary)
		public const string GasPosibilityProperty = "GasPosibility";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? GasPosibility
		{
			get { return fieldGasPosibility; }
			set
			{
				if (fieldGasPosibility == value) return;
				fieldGasPosibility = value;
			}
		}
		private bool? fieldGasPosibility;
		#endregion

		#region HasEuroWindows - Описание свойства (summary)
		public const string HasEuroWindowsProperty = "HasEuroWindows";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? HasEuroWindows
		{
			get { return fieldHasEuroWindows; }
			set
			{
				if (fieldHasEuroWindows == value) return;
				fieldHasEuroWindows = value;
			}
		}
		private bool? fieldHasEuroWindows;
		#endregion

		#region HasGarage - Описание свойства (summary)
		public const string HasGarageProperty = "HasGarage";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? HasGarage
		{
			get { return fieldHasGarage; }
			set
			{
				if (fieldHasGarage == value) return;
				fieldHasGarage = value;
			}
		}
		private bool? fieldHasGarage;
		#endregion

		#region HasPadval - Описание свойства (summary)
		public const string HasPadvalProperty = "HasPadval";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? HasPadval
		{
			get { return fieldHasPadval; }
			set
			{
				if (fieldHasPadval == value) return;
				fieldHasPadval = value;
			}
		}
		private bool? fieldHasPadval;
		#endregion

		#region Height - Описание свойства (summary)
		public const string HeightProperty = "Height";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public float? Height
		{
			get { return fieldHeight; }
			set
			{
				if (fieldHeight == value) return;
				fieldHeight = value;
			}
		}
		private float? fieldHeight;
		#endregion

		#region HomeNumber - Описание свойства (summary)
		public const string HomeNumberProperty = "HomeNumber";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string HomeNumber
		{
			get { return fieldHomeNumber; }
			set
			{
				if (fieldHomeNumber == value) return;
				fieldHomeNumber = value;
			}
		}
		private string fieldHomeNumber;
		#endregion

		#region InFirstLine - Описание свойства (summary)
		public const string InFirstLineProperty = "InFirstLine";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? InFirstLine
		{
			get { return fieldInFirstLine; }
			set
			{
				if (fieldInFirstLine == value) return;
				fieldInFirstLine = value;
			}
		}
		private bool? fieldInFirstLine;
		#endregion

		#region InformationSource - Описание свойства (summary)
		public const string InformationSourceProperty = "InformationSource";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string InformationSource
		{
			get { return fieldInformationSource; }
			set
			{
				if (fieldInformationSource == value) return;
				fieldInformationSource = value;
			}
		}
		private string fieldInformationSource;
		#endregion

		#region InNullableFloor - Описание свойства (summary)
		public const string InNullableFloorProperty = "InNullableFloor";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? InNullableFloor
		{
			get { return fieldInNullableFloor; }
			set
			{
				if (fieldInNullableFloor == value) return;
				fieldInNullableFloor = value;
			}
		}
		private bool? fieldInNullableFloor;
		#endregion

		#region IsCeilingRepaired - Описание свойства (summary)
		public const string IsCeilingRepairedProperty = "IsCeilingRepaired";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsCeilingRepaired
		{
			get { return fieldIsCeilingRepaired; }
			set
			{
				if (fieldIsCeilingRepaired == value) return;
				fieldIsCeilingRepaired = value;
			}
		}
		private bool? fieldIsCeilingRepaired;
		#endregion

		#region IsElectricityCablesChanged - Описание свойства (summary)
		public const string IsElectricityCablesChangedProperty = "IsElectricityCablesChanged";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsElectricityCablesChanged
		{
			get { return fieldIsElectricityCablesChanged; }
			set
			{
				if (fieldIsElectricityCablesChanged == value) return;
				fieldIsElectricityCablesChanged = value;
			}
		}
		private bool? fieldIsElectricityCablesChanged;
		#endregion

		#region IsEmpty - Описание свойства (summary)
		public const string IsEmptyProperty = "IsEmpty";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsEmpty
		{
			get { return fieldIsEmpty; }
			set
			{
				if (fieldIsEmpty == value) return;
				fieldIsEmpty = value;
			}
		}
		private bool? fieldIsEmpty;
		#endregion

		#region IsExchangePossible - Описание свойства (summary)
		public const string IsExchangePossibleProperty = "IsExchangePossible";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsExchangePossible
		{
			get { return fieldIsExchangePossible; }
			set
			{
				if (fieldIsExchangePossible == value) return;
				fieldIsExchangePossible = value;
			}
		}
		private bool? fieldIsExchangePossible;
		#endregion

		#region IsHasAntena - Описание свойства (summary)
		public const string IsHasAntenaProperty = "IsHasAntena";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasAntena
		{
			get { return fieldIsHasAntena; }
			set
			{
				if (fieldIsHasAntena == value) return;
				fieldIsHasAntena = value;
			}
		}
		private bool? fieldIsHasAntena;
		#endregion

		#region IsHasAriston - Описание свойства (summary)
		public const string IsHasAristonProperty = "IsHasAriston";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasAriston
		{
			get { return fieldIsHasAriston; }
			set
			{
				if (fieldIsHasAriston == value) return;
				fieldIsHasAriston = value;
			}
		}
		private bool? fieldIsHasAriston;
		#endregion

		#region IsHasBed - Описание свойства (summary)
		public const string IsHasBedProperty = "IsHasBed";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasBed
		{
			get { return fieldIsHasBed; }
			set
			{
				if (fieldIsHasBed == value) return;
				fieldIsHasBed = value;
			}
		}
		private bool? fieldIsHasBed;
		#endregion

		#region IsHasCanalisationPosibility - Описание свойства (summary)
		public const string IsHasCanalisationPosibilityProperty = "IsHasCanalisationPosibility";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasCanalisationPosibility
		{
			get { return fieldIsHasCanalisationPosibility; }
			set
			{
				if (fieldIsHasCanalisationPosibility == value) return;
				fieldIsHasCanalisationPosibility = value;
			}
		}
		private bool? fieldIsHasCanalisationPosibility;
		#endregion

		#region IsHasConditioner - Описание свойства (summary)
		public const string IsHasConditionerProperty = "IsHasConditioner";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasConditioner
		{
			get { return fieldIsHasConditioner; }
			set
			{
				if (fieldIsHasConditioner == value) return;
				fieldIsHasConditioner = value;
			}
		}
		private bool? fieldIsHasConditioner;
		#endregion

		#region IsHasDrinkWater - Описание свойства (summary)
		public const string IsHasDrinkWaterProperty = "IsHasDrinkWater";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasDrinkWater
		{
			get { return fieldIsHasDrinkWater; }
			set
			{
				if (fieldIsHasDrinkWater == value) return;
				fieldIsHasDrinkWater = value;
			}
		}
		private bool? fieldIsHasDrinkWater;
		#endregion

		#region IsHasDVD - Описание свойства (summary)
		public const string IsHasDVDProperty = "IsHasDVD";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasDVD
		{
			get { return fieldIsHasDVD; }
			set
			{
				if (fieldIsHasDVD == value) return;
				fieldIsHasDVD = value;
			}
		}
		private bool? fieldIsHasDVD;
		#endregion

		#region IsHasElectricityPosibility - Описание свойства (summary)
		public const string IsHasElectricityPosibilityProperty = "IsHasElectricityPosibility";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasElectricityPosibility
		{
			get { return fieldIsHasElectricityPosibility; }
			set
			{
				if (fieldIsHasElectricityPosibility == value) return;
				fieldIsHasElectricityPosibility = value;
			}
		}
		private bool? fieldIsHasElectricityPosibility;
		#endregion

		#region IsHasFencing - Описание свойства (summary)
		public const string IsHasFencingProperty = "IsHasFencing";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasFencing
		{
			get { return fieldIsHasFencing; }
			set
			{
				if (fieldIsHasFencing == value) return;
				fieldIsHasFencing = value;
			}
		}
		private bool? fieldIsHasFencing;
		#endregion

		#region IsHasFurniture - Описание свойства (summary)
		public const string IsHasFurnitureProperty = "IsHasFurniture";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasFurniture
		{
			get { return fieldIsHasFurniture; }
			set
			{
				if (fieldIsHasFurniture == value) return;
				fieldIsHasFurniture = value;
			}
		}
		private bool? fieldIsHasFurniture;
		#endregion

		#region IsHasGarden - Описание свойства (summary)
		public const string IsHasGardenProperty = "IsHasGarden";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasGarden
		{
			get { return fieldIsHasGarden; }
			set
			{
				if (fieldIsHasGarden == value) return;
				fieldIsHasGarden = value;
			}
		}
		private bool? fieldIsHasGarden;
		#endregion

		#region IsHasGas - Описание свойства (summary)
		public const string IsHasGasProperty = "IsHasGas";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasGas
		{
			get { return fieldIsHasGas; }
			set
			{
				if (fieldIsHasGas == value) return;
				fieldIsHasGas = value;
			}
		}
		private bool? fieldIsHasGas;
		#endregion

		#region IsHasGasHeater - Описание свойства (summary)
		public const string IsHasGasHeaterProperty = "IsHasGasHeater";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasGasHeater
		{
			get { return fieldIsHasGasHeater; }
			set
			{
				if (fieldIsHasGasHeater == value) return;
				fieldIsHasGasHeater = value;
			}
		}
		private bool? fieldIsHasGasHeater;
		#endregion

		#region IsHasGate - Описание свойства (summary)
		public const string IsHasGateProperty = "IsHasGate";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasGate
		{
			get { return fieldIsHasGate; }
			set
			{
				if (fieldIsHasGate == value) return;
				fieldIsHasGate = value;
			}
		}
		private bool? fieldIsHasGate;
		#endregion

		#region IsHasGeyser - Описание свойства (summary)
		public const string IsHasGeyserProperty = "IsHasGeyser";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasGeyser
		{
			get { return fieldIsHasGeyser; }
			set
			{
				if (fieldIsHasGeyser == value) return;
				fieldIsHasGeyser = value;
			}
		}
		private bool? fieldIsHasGeyser;
		#endregion

		#region IsHasHeatedFloors - Описание свойства (summary)
		public const string IsHasHeatedFloorsProperty = "IsHasHeatedFloors";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasHeatedFloors
		{
			get { return fieldIsHasHeatedFloors; }
			set
			{
				if (fieldIsHasHeatedFloors == value) return;
				fieldIsHasHeatedFloors = value;
			}
		}
		private bool? fieldIsHasHeatedFloors;
		#endregion

		#region IsHasIntercome - Описание свойства (summary)
		public const string IsHasIntercomeProperty = "IsHasIntercome";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasIntercome
		{
			get { return fieldIsHasIntercome; }
			set
			{
				if (fieldIsHasIntercome == value) return;
				fieldIsHasIntercome = value;
			}
		}
		private bool? fieldIsHasIntercome;
		#endregion

		#region IsHasInternet - Описание свойства (summary)
		public const string IsHasInternetProperty = "IsHasInternet";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasInternet
		{
			get { return fieldIsHasInternet; }
			set
			{
				if (fieldIsHasInternet == value) return;
				fieldIsHasInternet = value;
			}
		}
		private bool? fieldIsHasInternet;
		#endregion

		#region IsHasJakuzi - Описание свойства (summary)
		public const string IsHasJakuziProperty = "IsHasJakuzi";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasJakuzi
		{
			get { return fieldIsHasJakuzi; }
			set
			{
				if (fieldIsHasJakuzi == value) return;
				fieldIsHasJakuzi = value;
			}
		}
		private bool? fieldIsHasJakuzi;
		#endregion

		#region IsHasKitchen - Описание свойства (summary)
		public const string IsHasKitchenProperty = "IsHasKitchen";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasKitchen
		{
			get { return fieldIsHasKitchen; }
			set
			{
				if (fieldIsHasKitchen == value) return;
				fieldIsHasKitchen = value;
			}
		}
		private bool? fieldIsHasKitchen;
		#endregion

		#region IsHasLodgeBalcony - Описание свойства (summary)
		public const string IsHasLodgeBalconyProperty = "IsHasLodgeBalcony";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasLodgeBalcony
		{
			get { return fieldIsHasLodgeBalcony; }
			set
			{
				if (fieldIsHasLodgeBalcony == value) return;
				fieldIsHasLodgeBalcony = value;
			}
		}
		private bool? fieldIsHasLodgeBalcony;
		#endregion

		#region IsHasOfficeRoom - Описание свойства (summary)
		public const string IsHasOfficeRoomProperty = "IsHasOfficeRoom";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasOfficeRoom
		{
			get { return fieldIsHasOfficeRoom; }
			set
			{
				if (fieldIsHasOfficeRoom == value) return;
				fieldIsHasOfficeRoom = value;
			}
		}
		private bool? fieldIsHasOfficeRoom;
		#endregion

		#region IsHasParking - Описание свойства (summary)
		public const string IsHasParkingProperty = "IsHasParking";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasParking
		{
			get { return fieldIsHasParking; }
			set
			{
				if (fieldIsHasParking == value) return;
				fieldIsHasParking = value;
			}
		}
		private bool? fieldIsHasParking;
		#endregion

		#region IsHasPlayRoom - Описание свойства (summary)
		public const string IsHasPlayRoomProperty = "IsHasPlayRoom";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasPlayRoom
		{
			get { return fieldIsHasPlayRoom; }
			set
			{
				if (fieldIsHasPlayRoom == value) return;
				fieldIsHasPlayRoom = value;
			}
		}
		private bool? fieldIsHasPlayRoom;
		#endregion

		#region IsHasPool - Описание свойства (summary)
		public const string IsHasPoolProperty = "IsHasPool";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasPool
		{
			get { return fieldIsHasPool; }
			set
			{
				if (fieldIsHasPool == value) return;
				fieldIsHasPool = value;
			}
		}
		private bool? fieldIsHasPool;
		#endregion

		#region IsHasRefrigerator - Описание свойства (summary)
		public const string IsHasRefrigeratorProperty = "IsHasRefrigerator";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasRefrigerator
		{
			get { return fieldIsHasRefrigerator; }
			set
			{
				if (fieldIsHasRefrigerator == value) return;
				fieldIsHasRefrigerator = value;
			}
		}
		private bool? fieldIsHasRefrigerator;
		#endregion

		#region IsHasSauna - Описание свойства (summary)
		public const string IsHasSaunaProperty = "IsHasSauna";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasSauna
		{
			get { return fieldIsHasSauna; }
			set
			{
				if (fieldIsHasSauna == value) return;
				fieldIsHasSauna = value;
			}
		}
		private bool? fieldIsHasSauna;
		#endregion

		#region IsHasSecuritySystem - Описание свойства (summary)
		public const string IsHasSecuritySystemProperty = "IsHasSecuritySystem";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasSecuritySystem
		{
			get { return fieldIsHasSecuritySystem; }
			set
			{
				if (fieldIsHasSecuritySystem == value) return;
				fieldIsHasSecuritySystem = value;
			}
		}
		private bool? fieldIsHasSecuritySystem;
		#endregion

		#region IsHasService - Описание свойства (summary)
		public const string IsHasServiceProperty = "IsHasService";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasService
		{
			get { return fieldIsHasService; }
			set
			{
				if (fieldIsHasService == value) return;
				fieldIsHasService = value;
			}
		}
		private bool? fieldIsHasService;
		#endregion

		#region IsHasShowerCab - Описание свойства (summary)
		public const string IsHasShowerCabProperty = "IsHasShowerCab";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasShowerCab
		{
			get { return fieldIsHasShowerCab; }
			set
			{
				if (fieldIsHasShowerCab == value) return;
				fieldIsHasShowerCab = value;
			}
		}
		private bool? fieldIsHasShowerCab;
		#endregion

		#region IsHasSomething - Описание свойства (summary)
		public const string IsHasSomethingProperty = "IsHasSomething";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasSomething
		{
			get { return fieldIsHasSomething; }
			set
			{
				if (fieldIsHasSomething == value) return;
				fieldIsHasSomething = value;
			}
		}
		private bool? fieldIsHasSomething;
		#endregion

		#region IsHasTechnique - Описание свойства (summary)
		public const string IsHasTechniqueProperty = "IsHasTechnique";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasTechnique
		{
			get { return fieldIsHasTechnique; }
			set
			{
				if (fieldIsHasTechnique == value) return;
				fieldIsHasTechnique = value;
			}
		}
		private bool? fieldIsHasTechnique;
		#endregion

		#region IsHasThreePhaseElectricity - Описание свойства (summary)
		public const string IsHasThreePhaseElectricityProperty = "IsHasThreePhaseElectricity";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasThreePhaseElectricity
		{
			get { return fieldIsHasThreePhaseElectricity; }
			set
			{
				if (fieldIsHasThreePhaseElectricity == value) return;
				fieldIsHasThreePhaseElectricity = value;
			}
		}
		private bool? fieldIsHasThreePhaseElectricity;
		#endregion

		#region IsHasTrees - Описание свойства (summary)
		public const string IsHasTreesProperty = "IsHasTrees";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasTrees
		{
			get { return fieldIsHasTrees; }
			set
			{
				if (fieldIsHasTrees == value) return;
				fieldIsHasTrees = value;
			}
		}
		private bool? fieldIsHasTrees;
		#endregion

		#region IsHasTV - Описание свойства (summary)
		public const string IsHasTVProperty = "IsHasTV";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasTV
		{
			get { return fieldIsHasTV; }
			set
			{
				if (fieldIsHasTV == value) return;
				fieldIsHasTV = value;
			}
		}
		private bool? fieldIsHasTV;
		#endregion

		#region IsHasVoroqmanJur - Описание свойства (summary)
		public const string IsHasVoroqmanJurProperty = "IsHasVoroqmanJur";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasVoroqmanJur
		{
			get { return fieldIsHasVoroqmanJur; }
			set
			{
				if (fieldIsHasVoroqmanJur == value) return;
				fieldIsHasVoroqmanJur = value;
			}
		}
		private bool? fieldIsHasVoroqmanJur;
		#endregion

		#region IsHasWarmingSystem - Описание свойства (summary)
		public const string IsHasWarmingSystemProperty = "IsHasWarmingSystem";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasWarmingSystem
		{
			get { return fieldIsHasWarmingSystem; }
			set
			{
				if (fieldIsHasWarmingSystem == value) return;
				fieldIsHasWarmingSystem = value;
			}
		}
		private bool? fieldIsHasWarmingSystem;
		#endregion

		#region IsHasWasher - Описание свойства (summary)
		public const string IsHasWasherProperty = "IsHasWasher";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasWasher
		{
			get { return fieldIsHasWasher; }
			set
			{
				if (fieldIsHasWasher == value) return;
				fieldIsHasWasher = value;
			}
		}
		private bool? fieldIsHasWasher;
		#endregion

		#region IsHasWaterContainer - Описание свойства (summary)
		public const string IsHasWaterContainerProperty = "IsHasWaterContainer";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasWaterContainer
		{
			get { return fieldIsHasWaterContainer; }
			set
			{
				if (fieldIsHasWaterContainer == value) return;
				fieldIsHasWaterContainer = value;
			}
		}
		private bool? fieldIsHasWaterContainer;
		#endregion

		#region IsHasWC - Описание свойства (summary)
		public const string IsHasWCProperty = "IsHasWC";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsHasWC
		{
			get { return fieldIsHasWC; }
			set
			{
				if (fieldIsHasWC == value) return;
				fieldIsHasWC = value;
			}
		}
		private bool? fieldIsHasWC;
		#endregion

		#region IsInElitarBuilding -
		public const string IsInElitarBuildingProperty = "IsInElitarBuilding";

		/// <summary></summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsInElitarBuilding
		{
			get { return fieldIsInElitarBuilding; }
			set
			{
				if (fieldIsInElitarBuilding == value) return;
				fieldIsInElitarBuilding = value;
			}
		}
		private bool? fieldIsInElitarBuilding;
		#endregion

		#region IsInNewBuilding - Описание свойства (summary)
		public const string IsInNewBuildingProperty = "IsInNewBuilding";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsInNewBuilding
		{
			get { return fieldIsInNewBuilding; }
			set
			{
				if (fieldIsInNewBuilding == value) return;
				fieldIsInNewBuilding = value;
			}
		}
		private bool? fieldIsInNewBuilding;
		#endregion

		#region IsOutDoorFromSteel - Описание свойства (summary)
		public const string IsOutDoorFromSteelProperty = "IsOutDoorFromSteel";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsOutDoorFromSteel
		{
			get { return fieldIsOutDoorFromSteel; }
			set
			{
				if (fieldIsOutDoorFromSteel == value) return;
				fieldIsOutDoorFromSteel = value;
			}
		}
		private bool? fieldIsOutDoorFromSteel;
		#endregion

		#region IsPipesChanged - Описание свойства (summary)
		public const string IsPipesChangedProperty = "IsPipesChanged";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsPipesChanged
		{
			get { return fieldIsPipesChanged; }
			set
			{
				if (fieldIsPipesChanged == value) return;
				fieldIsPipesChanged = value;
			}
		}
		private bool? fieldIsPipesChanged;
		#endregion

		#region IsWoterAlways - Описание свойства (summary)
		public const string IsWoterAlwaysProperty = "IsWoterAlways";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? IsWoterAlways
		{
			get { return fieldIsWoterAlways; }
			set
			{
				if (fieldIsWoterAlways == value) return;
				fieldIsWoterAlways = value;
			}
		}
		private bool? fieldIsWoterAlways;
		#endregion

		#region LandFront - Описание свойства (summary)
		public const string LandFrontProperty = "LandFront";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public double? LandFront
		{
			get { return fieldLandFront; }
			set
			{
				if (fieldLandFront == value) return;
				fieldLandFront = value;
			}
		}
		private double? fieldLandFront;
		#endregion

		#region LandNumber - Описание свойства (summary)
		public const string LandNumberProperty = "LandNumber";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string LandNumber
		{
			get { return fieldLandNumber; }
			set
			{
				if (fieldLandNumber == value) return;
				fieldLandNumber = value;
			}
		}
		private string fieldLandNumber;
		#endregion

		#region LastModifiedDate - Описание свойства (summary)
		public const string LastModifiedDateProperty = "LastModifiedDate";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public DateTime? LastModifiedDate
		{
			get { return fieldLastModifiedDate; }
			set
			{
				if (fieldLastModifiedDate == value) return;
				fieldLastModifiedDate = value;
			}
		}
		private DateTime? fieldLastModifiedDate;
		#endregion

		#region Lat - Описание свойства (summary)
		public const string LatProperty = "Lat";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string Lat
		{
			get { return fieldLat; }
			set
			{
				if (fieldLat == value) return;
				fieldLat = value;
			}
		}
		private string fieldLat;
		#endregion

		#region Lng - Описание свойства (summary)
		public const string LngProperty = "Lng";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string Lng
		{
			get { return fieldLng; }
			set
			{
				if (fieldLng == value) return;
				fieldLng = value;
			}
		}
		private string fieldLng;
		#endregion

		#region Lift - Описание свойства (summary)
		public const string LiftProperty = "Lift";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Lift
		{
			get { return fieldLift; }
			set
			{
				if (fieldLift == value) return;
				fieldLift = value;
			}
		}
		private bool? fieldLift;
		#endregion

		#region LodgeBalcony - Описание свойства (summary)
		public const string LodgeBalconyProperty = "LodgeBalcony";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? LodgeBalcony
		{
			get { return fieldLodgeBalcony; }
			set
			{
				if (fieldLodgeBalcony == value) return;
				fieldLodgeBalcony = value;
			}
		}
		private bool? fieldLodgeBalcony;
		#endregion

		#region MakedRooms - Описание свойства (summary)
		public const string MakedRoomsProperty = "MakedRooms";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? MakedRooms
		{
			get { return fieldMakedRooms; }
			set
			{
				if (fieldMakedRooms == value) return;
				fieldMakedRooms = value;
			}
		}
		private int? fieldMakedRooms;
		#endregion

		#region Metlax - Описание свойства (summary)
		public const string MetlaxProperty = "Metlax";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Metlax
		{
			get { return fieldMetlax; }
			set
			{
				if (fieldMetlax == value) return;
				fieldMetlax = value;
			}
		}
		private bool? fieldMetlax;
		#endregion

		#region Nisha - Описание свойства (summary)
		public const string NishaProperty = "Nisha";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Nisha
		{
			get { return fieldNisha; }
			set
			{
				if (fieldNisha == value) return;
				fieldNisha = value;
			}
		}
		private bool? fieldNisha;
		#endregion

		#region NotPopulated - Описание свойства (summary)
		public const string NotPopulatedProperty = "NotPopulated";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? NotPopulated
		{
			get { return fieldNotPopulated; }
			set
			{
				if (fieldNotPopulated == value) return;
				fieldNotPopulated = value;
			}
		}
		private bool? fieldNotPopulated;
		#endregion

		#region OfficePlaceTypeID - Описание свойства (summary)
		public const string OfficePlaceTypeIDProperty = "OfficePlaceTypeID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? OfficePlaceTypeID
		{
			get { return fieldOfficePlaceTypeID; }
			set
			{
				if (fieldOfficePlaceTypeID == value) return;
				fieldOfficePlaceTypeID = value;
			}
		}
		private int? fieldOfficePlaceTypeID;
		#endregion

		#region OfficePlaceTypeName - Описание свойства (summary)
		public const string OfficePlaceTypeNameProperty = "OfficePlaceTypeName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string OfficePlaceTypeName
		{
			get { return fieldOfficePlaceTypeName; }
			set
			{
				if (fieldOfficePlaceTypeName == value) return;
				fieldOfficePlaceTypeName = value;
			}
		}
		private string fieldOfficePlaceTypeName;
		#endregion

		#region OpenBalcony - Описание свойства (summary)
		public const string OpenBalconyProperty = "OpenBalcony";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? OpenBalcony
		{
			get { return fieldOpenBalcony; }
			set
			{
				if (fieldOpenBalcony == value) return;
				fieldOpenBalcony = value;
			}
		}
		private bool? fieldOpenBalcony;
		#endregion

		#region OrderTypeID - Описание свойства (summary)
		public const string OrderTypeIDProperty = "OrderTypeID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int OrderTypeID
		{
			get { return fieldOrderTypeID; }
			set
			{
				if (fieldOrderTypeID == value) return;
				fieldOrderTypeID = value;
			}
		}
		private int fieldOrderTypeID;
		#endregion

		#region OrderTypeName - Описание свойства (summary)
		public const string OrderTypeNameProperty = "OrderTypeName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string OrderTypeName
		{
			get { return fieldOrderTypeName; }
			set
			{
				if (fieldOrderTypeName == value) return;
				fieldOrderTypeName = value;
			}
		}
		private string fieldOrderTypeName;
		#endregion

		#region PadvalSquare - Описание свойства (summary)
		public const string PadvalSquareProperty = "PadvalSquare";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? PadvalSquare
		{
			get { return fieldPadvalSquare; }
			set
			{
				if (fieldPadvalSquare == value) return;
				fieldPadvalSquare = value;
			}
		}
		private int? fieldPadvalSquare;
		#endregion

		#region PhonePrimary - Описание свойства (summary)
		public const string PhonePrimaryProperty = "PhonePrimary";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string PhonePrimary
		{
			get { return fieldPhonePrimary; }
			set
			{
				if (fieldPhonePrimary == value) return;
				fieldPhonePrimary = value;
			}
		}
		private string fieldPhonePrimary;
		#endregion

		#region PhoneSecondary - Описание свойства (summary)
		public const string PhoneSecondaryProperty = "PhoneSecondary";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string PhoneSecondary
		{
			get { return fieldPhoneSecondary; }
			set
			{
				if (fieldPhoneSecondary == value) return;
				fieldPhoneSecondary = value;
			}
		}
		private string fieldPhoneSecondary;
		#endregion

		#region PlaceName - Описание свойства (summary)
		public const string PlaceNameProperty = "PlaceName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string PlaceName
		{
			get { return fieldPlaceName; }
			set
			{
				if (fieldPlaceName == value) return;
				fieldPlaceName = value;
			}
		}
		private string fieldPlaceName;
		#endregion

		#region Price - Описание свойства (summary)
		public const string PriceProperty = "Price";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public long? Price
		{
			get { return fieldPrice; }
			set
			{
				if (fieldPrice == value) return;
				fieldPrice = value;
			}
		}
		private long? fieldPrice;
		#endregion

		#region PricePerDay - Описание свойства (summary)
		public const string PricePerDayProperty = "PricePerDay";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? PricePerDay
		{
			get { return fieldPricePerDay; }
			set
			{
				if (fieldPricePerDay == value) return;
				fieldPricePerDay = value;
			}
		}
		private int? fieldPricePerDay;
		#endregion

		#region PriceTypeID - Описание свойства (summary)
		public const string PriceTypeIDProperty = "PriceTypeID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]

		public int? PriceTypeID
		{
			get { return fieldPriceTypeID; }
			set
			{
				if (fieldPriceTypeID == value) return;
				fieldPriceTypeID = value;
			}
		}
		[NonSerialized]
		private int? fieldPriceTypeID;
		#endregion

		#region ProjectID - Описание свойства (summary)
		public const string ProjectIDProperty = "ProjectID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? ProjectID
		{
			get { return fieldProjectID; }
			set
			{
				if (fieldProjectID == value) return;
				fieldProjectID = value;
			}
		}
		private int? fieldProjectID;
		#endregion

		#region ProjectName - Описание свойства (summary)
		public const string ProjectNameProperty = "ProjectName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string ProjectName
		{
			get { return fieldProjectName; }
			set
			{
				if (fieldProjectName == value) return;
				fieldProjectName = value;
			}
		}
		private string fieldProjectName;
		#endregion

		#region Rating - Описание свойства (summary)
		public const string RatingProperty = "Rating";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? Rating
		{
			get { return fieldRating; }
			set
			{
				if (fieldRating == value) return;
				fieldRating = value;
			}
		}
		private int? fieldRating;
		#endregion

		#region RegionID - Описание свойства (summary)
		public const string RegionIDProperty = "RegionID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? RegionID
		{
			get { return fieldRegionID; }
			set
			{
				if (fieldRegionID == value) return;
				fieldRegionID = value;
			}
		}
		private int? fieldRegionID;
		#endregion

		#region RegionName - Описание свойства (summary)
		public const string RegionNameProperty = "RegionName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public String RegionName
		{
			get { return fieldRegionName; }
			set
			{
				if (fieldRegionName == value) return;
				fieldRegionName = value;
			}
		}
		private String fieldRegionName;
		#endregion

		#region RemontID - Описание свойства (summary)
		public const string RemontIDProperty = "RemontID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? RemontID
		{
			get { return fieldRemontID; }
			set
			{
				if (fieldRemontID == value) return;
				fieldRemontID = value;
			}
		}
		private int? fieldRemontID;
		#endregion

		#region RemontName - Описание свойства (summary)
		public const string RemontNameProperty = "RemontName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string RemontName
		{
			get { return fieldRemontName; }
			set
			{
				if (fieldRemontName == value) return;
				fieldRemontName = value;
			}
		}
		private string fieldRemontName;
		#endregion

		#region RoofingID - Описание свойства (summary)
		public const string RoofingIDProperty = "RoofingID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? RoofingID
		{
			get { return fieldRoofingID; }
			set
			{
				if (fieldRoofingID == value) return;
				fieldRoofingID = value;
			}
		}
		private int? fieldRoofingID;
		#endregion

		#region RoofingName - Описание свойства (summary)
		public const string RoofingNameProperty = "RoofingName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string RoofingName
		{
			get { return fieldRoofingName; }
			set
			{
				if (fieldRoofingName == value) return;
				fieldRoofingName = value;
			}
		}
		private string fieldRoofingName;
		#endregion

		#region RoomCount - Описание свойства (summary)
		public const string RoomCountProperty = "RoomCount";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? RoomCount
		{
			get { return fieldRoomCount; }
			set
			{
				if (fieldRoomCount == value) return;
				fieldRoomCount = value;
			}
		}
		private int? fieldRoomCount;
		#endregion

		#region SellerName - Описание свойства (summary)
		public const string SellerNameProperty = "SellerName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string SellerName
		{
			get { return fieldSellerName; }
			set
			{
				if (fieldSellerName == value) return;
				fieldSellerName = value;
			}
		}
		private string fieldSellerName;
		#endregion

		#region SeparateRooms - Описание свойства (summary)
		public const string SeparateRoomsProperty = "SeparateRooms";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? SeparateRooms
		{
			get { return fieldSeparateRooms; }
			set
			{
				if (fieldSeparateRooms == value) return;
				fieldSeparateRooms = value;
			}
		}
		private bool? fieldSeparateRooms;
		#endregion

		#region Square - Описание свойства (summary)
		public const string SquareProperty = "Square";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public float? Square
		{
			get { return fieldSquare; }
			set
			{
				if (fieldSquare == value) return;
				fieldSquare = value;
			}
		}
		private float? fieldSquare;
		#endregion

		#region StateID - Описание свойства (summary)
		public const string StateIDProperty = "StateID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? StateID
		{
			get { return fieldStateID; }
			set
			{
				if (fieldStateID == value) return;
				fieldStateID = value;
			}
		}
		private int? fieldStateID;
		#endregion

		#region StateName - Описание свойства (summary)
		public const string StateNameProperty = "StateName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string StateName
		{
			get { return fieldStateName; }
			set
			{
				if (fieldStateName == value) return;
				fieldStateName = value;
			}
		}
		private string fieldStateName;
		#endregion

		#region StreetID - Описание свойства (summary)
		public const string StreetIDProperty = "StreetID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? StreetID
		{
			get { return fieldStreetID; }
			set
			{
				if (fieldStreetID == value) return;
				fieldStreetID = value;
			}
		}
		private int? fieldStreetID;
		#endregion

		#region StreetName - Описание свойства (summary)
		public const string StreetNameProperty = "StreetName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string StreetName
		{
			get { return fieldStreetName; }
			set
			{
				if (fieldStreetName == value) return;
				fieldStreetName = value;
			}
		}
		private string fieldStreetName;
		#endregion

		#region Tile - Описание свойства (summary)
		public const string TileProperty = "Tile";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Tile
		{
			get { return fieldTile; }
			set
			{
				if (fieldTile == value) return;
				fieldTile = value;
			}
		}
		private bool? fieldTile;
		#endregion

		#region TotalSquare - Описание свойства (summary)
		public const string TotalSquareProperty = "TotalSquare";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public float? TotalSquare
		{
			get { return fieldTotalSquare; }
			set
			{
				if (fieldTotalSquare == value) return;
				fieldTotalSquare = value;
			}
		}
		private float? fieldTotalSquare;
		#endregion

		#region UserID - Описание свойства (summary)
		public const string UserIDProperty = "UserID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? UserID
		{
			get { return fieldUserID; }
			set
			{
				if (fieldUserID == value) return;
				fieldUserID = value;
			}
		}
		private int? fieldUserID;
		#endregion

		#region BrokerFullName - Описание свойства (summary)
		public const string BrokerFullNameProperty = "BrokerFullName";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string BrokerFullName
		{
			get { return fieldBrokerFullName; }
			set
			{
				if (fieldBrokerFullName == value) return;
				fieldBrokerFullName = value;
			}
		}
		private string fieldBrokerFullName;
		#endregion

		#region BrokerPhone - Описание свойства (summary)
		public const string BrokerPhoneProperty = "BrokerPhone";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string BrokerPhone
		{
			get { return fieldBrokerPhone; }
			set
			{
				if (fieldBrokerPhone == value) return;
				fieldBrokerPhone = value;
			}
		}
		private string fieldBrokerPhone;
		#endregion

		#region Xordanoc - Описание свойства (summary)
		public const string XordanocProperty = "Xordanoc";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool? Xordanoc
		{
			get { return fieldXordanoc; }
			set
			{
				if (fieldXordanoc == value) return;
				fieldXordanoc = value;
			}
		}
		private bool? fieldXordanoc;
		#endregion

		#region Convenients - Описание свойства (summary)
		public const string ConvenientsProperty = "Convenients";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public List<int> Convenients
		{
			get { return fieldConvenients; }
			set
			{
				if (fieldConvenients == value) return;
				fieldConvenients = value;
			}
		}
		private List<int> fieldConvenients;
		#endregion

		#region EstateImages
		public const string EstateImagesProperty = "EstateImages";

		[DataMember]
		public List<ImageDto> EstateImages
		{
			get { return fieldEstateImages; }
			set { fieldEstateImages = value; }
		}
		private List<ImageDto> fieldEstateImages;
		#endregion

		#endregion

		[DataMember]
		public int? OperationalSignificanceID { get; set; }

		[DataMember]
		public string OperationalSignificanceName { get; set; }
		
		[DataMember]
		public int? SignificanceOfTheUseID { get; set; }

		[DataMember]
		public string SignificanceOfTheUseName { get; set; }

        [DataMember]
	    public int? CountryID { get; set; }
        
        [DataMember]
        public string CountryName { get; set; }

        [DataMember]
	    public string Address { get; set; }
	}
}
