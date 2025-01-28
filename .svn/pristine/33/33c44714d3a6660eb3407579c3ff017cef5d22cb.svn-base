using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using RealEstate.DataAccess;


namespace RealEstate.Common.Helpers
{
    public class RealEstateSearchParameters : SearchCriteriaBase, ICloneable
    {
        private int? _roomCountFrom;
        public int? RoomCountFrom
        {
            get { return _roomCountFrom; }
            set
            {
                if (RoomCountTo.GetValueOrDefault(0) > 0 && value > RoomCountTo)
                {
                    throw new Exception("Значение должно быть больше чем 'Количество комнат - ДО'");
                }
                _roomCountFrom = value;
                OnPropertyChanged("RoomCountFrom");
            }
        }

        private int? _roomCountTo;
        public int? RoomCountTo
        {
            get { return _roomCountTo; }
            set
            {
                _roomCountTo = value;
                OnPropertyChanged("RoomCountTo");
            }
        }

        private int? _floorFrom;
        public int? FloorFrom
        {
            get { return _floorFrom; }
            set
            {
                _floorFrom = value;
                OnPropertyChanged("FloorFrom");
            }
        }

        private int? _floorTo;
        public int? FloorTo
        {
            get { return _floorTo; }
            set
            {
                _floorTo = value;
                OnPropertyChanged("FloorTo");
            }
        }

        private long? _priceFrom;
        public long? PriceFrom
        {
            get { return _priceFrom; }
            set
            {
                _priceFrom = value;
                OnPropertyChanged("PriceFrom");
            }
        }

        private long? _priceFromInAmd;
        public long? PriceFromInAMD
        {
            get { return _priceFromInAmd; }
            set
            {
                _priceFromInAmd = value;
                OnPropertyChanged("PriceFromInAMD");
            }
        }

        private int? _pricePerDayFrom;
        public int? PricePerDayFrom
        {
            get { return _pricePerDayFrom; }
            set
            {
                _pricePerDayFrom = value;
                OnPropertyChanged("PricePerDayFrom");
            }
        }

        private int? _pricePerDayTo;
        public int? PricePerDayTo
        {
            get { return _pricePerDayTo; }
            set
            {
                _pricePerDayTo = value;
                OnPropertyChanged("PricePerDayTo");
            }
        }

        #region PricePerDayFromInAMD - Описание свойства (summary)
        public const string PricePerDayFromInAMDProperty = "PricePerDayFromInAMD";

        /// <summary>Описание свойства (summary)</summary>
        public int? PricePerDayFromInAMD
        {
            get { return fieldPricePerDayFromInAMD; }
            set
            {
                if (fieldPricePerDayFromInAMD == value) return;
                fieldPricePerDayFromInAMD = value;
                OnPropertyChanged(PricePerDayFromInAMDProperty);
            }
        }
        private int? fieldPricePerDayFromInAMD;
        #endregion

        #region PricePerDayToInAMD - Описание свойства (summary)
        public const string PricePerDayToInAMDProperty = "PricePerDayToInAMD";

        /// <summary>Описание свойства (summary)</summary>
        public int? PricePerDayToInAMD
        {
            get { return fieldPricePerDayToInAMD; }
            set
            {
                if (fieldPricePerDayToInAMD == value) return;
                fieldPricePerDayToInAMD = value;
                OnPropertyChanged(PricePerDayToInAMDProperty);
            }
        }
        private int? fieldPricePerDayToInAMD;
        #endregion

        private long? _priceTo;
        public long? PriceTo
        {
            get { return _priceTo; }
            set
            {
                _priceTo = value;
                OnPropertyChanged("PriceTo");
            }
        }

        private long? _priceToInAmd;
        public long? PriceToInAMD
        {
            get { return _priceToInAmd; }
            set
            {
                _priceToInAmd = value;
                OnPropertyChanged("PriceToInAMD");
            }
        }

        private int? _squareFrom;

        public int? SquareFrom
        {
            get { return _squareFrom; }
            set
            {
                _squareFrom = value;
                OnPropertyChanged("SquareFrom");
            }
        }

        private int? _squareTo;
        public int? SquareTo
        {
            get { return _squareTo; }
            set
            {
                _squareTo = value;
                OnPropertyChanged("SquareTo");
            }
        }

        private bool _isHasGarage;
        public bool IsHasGarage
        {
            get { return _isHasGarage; }
            set
            {
                _isHasGarage = value;
                OnPropertyChanged("IsHasGarage");
            }
        }

        private bool _isWoterAlways;
        public bool IsWoterAlways
        {
            get { return _isWoterAlways; }
            set
            {
                _isWoterAlways = value;
                OnPropertyChanged("IsWoterAlways");
            }
        }

        private bool _isHasGas;
        public bool IsHasGas
        {
            get { return _isHasGas; }
            set
            {
                _isHasGas = value;
                OnPropertyChanged("IsHasGas");
            }
        }

        private bool _isHasExpandingPosibility;

        public bool IsHasExpandingPosibility
        {
            get { return _isHasExpandingPosibility; }
            set
            {
                _isHasExpandingPosibility = value;
                OnPropertyChanged("IsHasExpandingPosibility");
            }
        }

        private bool _isHasEuroWindows;
        public bool IsHasEuroWindows
        {
            get { return _isHasEuroWindows; }
            set
            {
                _isHasEuroWindows = value;
                OnPropertyChanged("IsHasEuroWindows");
            }
        }

        private bool _isHasPodval;
        public bool IsHasPodval
        {
            get { return _isHasPodval; }
            set
            {
                _isHasPodval = value;
                OnPropertyChanged("IsHasPodval");
            }
        }

        private List<OrderType> _orderTypes;
        public List<OrderType> OrderTypes
        {
            get { return _orderTypes; }
            set
            {
                _orderTypes = value;
                OnPropertyChanged("OrderTypes");
            }
        }

        private List<EstateType> _realEstateTypes;
        public List<EstateType> RealEstateTypes
        {
            get { return _realEstateTypes; }
            set
            {
                _realEstateTypes = value;
                OnPropertyChanged("RealEstateTypes");
            }
        }

        private List<Region> _regions;
        public List<Region> Regions
        {
            get { return _regions; }
            set
            {
                _regions = value;
                OnPropertyChanged("Regions");
            }
        }

        private List<Street> _streets;
        public List<Street> Streets
        {
            get { return _streets; }
            set
            {
                _streets = value;
                OnPropertyChanged("Streets");
            }
        }

        private List<Remont> _remonts;
        public List<Remont> Remonts
        {
            get { return _remonts; }
            set
            {
                _remonts = value;
                OnPropertyChanged("Remonts");
            }
        }

        private List<Project> _projects;
        public List<Project> Projects
        {
            get { return _projects; }
            set
            {
                _projects = value;
                OnPropertyChanged("Projects");
            }
        }

        #region BuildingTypes - Описание свойства (summary)
        public const string BuildingTypesProperty = "BuildingTypes";

        /// <summary>Описание свойства (summary)</summary>
        public List<BuildingType> BuildingTypes
        {
            get { return fieldBuildingTypes; }
            set
            {
                if (fieldBuildingTypes == value) return;
                fieldBuildingTypes = value;
                OnPropertyChanged(BuildingTypesProperty);
            }
        }
        private List<BuildingType> fieldBuildingTypes;
        #endregion

        private string _placeName;
        public string PlaceName
        {
            get { return _placeName; }
            set
            {
                _placeName = value;
                OnPropertyChanged("PlaceName");
            }
        }

        public int? CountryID
        {
            get { return _countryID; }
            set
            {
                _countryID = value;
                OnPropertyChanged("CountryID");
            }
        }

        public bool IsOverseas
        {
            get { return _isOverseas; }
            set
            {
                _isOverseas = value;
                OnPropertyChanged("IsOverseas");
            }
        }

        private string _code;
        public string Code
        {
            get { return _code; }
            set
            {
                _code = value;
                OnPropertyChanged("Code");
            }
        }

        #region TelephoneOrName - Описание свойства (summary)
        public const string TelephoneOrNameProperty = "TelephoneOrName";

        /// <summary>Описание свойства (summary)</summary>
        [System.Runtime.Serialization.DataMember]
        public string TelephoneOrName
        {
            get { return fieldTelephoneOrName; }
            set
            {
                if (fieldTelephoneOrName == value) return;
                fieldTelephoneOrName = value;
                OnPropertyChanged(TelephoneOrNameProperty);
            }
        }
        private string fieldTelephoneOrName;
        #endregion



        private int? _stateId;
        public int? StateID
        {
            get { return _stateId; }
            set
            {
                _stateId = value;
                OnPropertyChanged("StateID");
            }
        }

        private int? _cityId;
        public int? CityID
        {
            get { return _cityId; }
            set
            {
                _cityId = value;
                OnPropertyChanged("CityID");
            }
        }

        public bool IsInNewBuilding
        {
            get { return fieldIsInNewBuilding; }
            set
            {
                if (fieldIsInNewBuilding == value) return;
                fieldIsInNewBuilding = value;
                OnPropertyChanged("IsInNewBuilding");
            }
        }
        private bool fieldIsInNewBuilding;



        private Currency _currency;
        public Currency Currency
        {
            get { return _currency; }
            set
            {
                _currency = value;
                OnPropertyChanged("Currency");
            }
        }

        private bool _isHasWasher;
        public bool IsHasWasher
        {
            get { return _isHasWasher; }
            set
            {
                _isHasWasher = value;
                OnPropertyChanged("IsHasWasher");
            }
        }

        private bool _isHasConditioner;
        public bool IsHasConditioner
        {
            get { return _isHasConditioner; }
            set
            {
                _isHasConditioner = value;
                OnPropertyChanged("IsHasConditioner");
            }
        }

        private bool _isHasFurniture;
        public bool IsHasFurniture
        {
            get { return _isHasFurniture; }
            set
            {
                _isHasFurniture = value;
                OnPropertyChanged("IsHasFurniture");
            }
        }

        private bool _isPossibleExchange;
        public bool IsPossibleExchange
        {
            get { return _isPossibleExchange; }
            set
            {
                _isPossibleExchange = value;
                OnPropertyChanged("IsPossibleExchange");
            }
        }

        #region IsWithPhoto - Описание свойства (summary)
        public const string IsWithPhotoProperty = "IsWithPhoto";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsWithPhoto
        {
            get { return fieldIsWithPhoto; }
            set
            {
                if (fieldIsWithPhoto == value) return;
                fieldIsWithPhoto = value;
                OnPropertyChanged(IsWithPhotoProperty);
            }
        }
        private bool fieldIsWithPhoto;
        #endregion



        #region IsHasWarmingSystem - Описание свойства (summary)
        public const string IsHasWarmingSystemProperty = "IsHasWarmingSystem";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsHasWarmingSystem
        {
            get { return fieldIsHasWarmingSystem; }
            set
            {
                if (fieldIsHasWarmingSystem == value) return;
                fieldIsHasWarmingSystem = value;
                OnPropertyChanged(IsHasWarmingSystemProperty);
            }
        }
        private bool fieldIsHasWarmingSystem;
        #endregion

        #region IsHasThreePhaseElectricity - Описание свойства (summary)
        public const string IsHasThreePhaseElectricityProperty = "IsHasThreePhaseElectricity";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsHasThreePhaseElectricity
        {
            get { return fieldIsHasThreePhaseElectricity; }
            set
            {
                if (fieldIsHasThreePhaseElectricity == value) return;
                fieldIsHasThreePhaseElectricity = value;
                OnPropertyChanged(IsHasThreePhaseElectricityProperty);
            }
        }
        private bool fieldIsHasThreePhaseElectricity;
        #endregion

        #region InNullableFloor - Описание свойства (summary)
        public const string InNullableFloorProperty = "InNullableFloor";

        /// <summary>Описание свойства (summary)</summary>
        public bool InNullableFloor
        {
            get { return fieldInNullableFloor; }
            set
            {
                if (fieldInNullableFloor == value) return;
                fieldInNullableFloor = value;
                OnPropertyChanged(InNullableFloorProperty);
            }
        }
        private bool fieldInNullableFloor;
        #endregion

        #region InFirstLine - Описание свойства (summary)
        public const string InFirstLineProperty = "InFirstLine";

        /// <summary>Описание свойства (summary)</summary>
        public bool InFirstLine
        {
            get { return fieldInFirstLine; }
            set
            {
                if (fieldInFirstLine == value) return;
                fieldInFirstLine = value;
                OnPropertyChanged(InFirstLineProperty);
            }
        }
        private bool fieldInFirstLine;
        #endregion

        #region IsHasJakuzi - Описание свойства (summary)
        public const string IsHasJakuziProperty = "IsHasJakuzi";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsHasJakuzi
        {
            get { return fieldIsHasJakuzi; }
            set
            {
                if (fieldIsHasJakuzi == value) return;
                fieldIsHasJakuzi = value;
                OnPropertyChanged(IsHasJakuziProperty);
            }
        }
        private bool fieldIsHasJakuzi;
        #endregion

        #region IsHasPool - Описание свойства (summary)
        public const string IsHasPoolProperty = "IsHasPool";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsHasPool
        {
            get { return fieldIsHasPool; }
            set
            {
                if (fieldIsHasPool == value) return;
                fieldIsHasPool = value;
                OnPropertyChanged(IsHasPoolProperty);
            }
        }
        private bool fieldIsHasPool;
        #endregion

        #region IsHasPlayingRoom - Описание свойства (summary)
        public const string IsHasPlayingRoomProperty = "IsHasPlayingRoom";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsHasPlayingRoom
        {
            get { return fieldIsHasPlayingRoom; }
            set
            {
                if (fieldIsHasPlayingRoom == value) return;
                fieldIsHasPlayingRoom = value;
                OnPropertyChanged(IsHasPlayingRoomProperty);
            }
        }
        private bool fieldIsHasPlayingRoom;
        #endregion

        #region IsEmpty - Описание свойства (summary)
        public const string IsEmptyProperty = "IsEmpty";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsEmpty
        {
            get { return fieldIsEmpty; }
            set
            {
                if (fieldIsEmpty == value) return;
                fieldIsEmpty = value;
                OnPropertyChanged(IsEmptyProperty);
            }
        }
        private bool fieldIsEmpty;
        #endregion

        #region IsHasWarmingFloors - Описание свойства (summary)
        public const string IsHasWarmingFloorsProperty = "IsHasWarmingFloors";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsHasWarmingFloors
        {
            get { return fieldIsHasWarmingFloors; }
            set
            {
                if (fieldIsHasWarmingFloors == value) return;
                fieldIsHasWarmingFloors = value;
                OnPropertyChanged(IsHasWarmingFloorsProperty);
            }
        }
        private bool fieldIsHasWarmingFloors;
        #endregion

        #region IsHasGasHeater - Описание свойства (summary)
        public const string IsHasGasHeaterProperty = "IsHasGasHeater";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsHasGasHeater
        {
            get { return fieldIsHasGasHeater; }
            set
            {
                if (fieldIsHasGasHeater == value) return;
                fieldIsHasGasHeater = value;
                OnPropertyChanged(IsHasGasHeaterProperty);
            }
        }
        private bool fieldIsHasGasHeater;
        #endregion

        #region EstateConvenients - Описание свойства (summary)
        public const string EstateConvenientsProperty = "EstateConvenients";

        /// <summary>Описание свойства (summary)</summary>
        public List<Convenient> EstateConvenients
        {
            get { return fieldEstateConvenients; }
            set
            {
                if (fieldEstateConvenients == value) return;
                fieldEstateConvenients = value;
                OnPropertyChanged(EstateConvenientsProperty);
            }
        }
        private List<Convenient> fieldEstateConvenients;
        #endregion

        #region Status - Описание свойства (summary)
        public const string StatusProperty = "Status";

        /// <summary>Описание свойства (summary)</summary>
        public string Status
        {
            get { return fieldStatus; }
            set
            {
                if (fieldStatus == value) return;
                fieldStatus = value;
                OnPropertyChanged(StatusProperty);
            }
        }
        private string fieldStatus;
        #endregion

        #region RegionID - Описание свойства (summary)
        public const string RegionIDProperty = "RegionID";

        /// <summary>Описание свойства (summary)</summary>
        public int? RegionID
        {
            get { return fieldRegionID; }
            set
            {
                if (fieldRegionID == value) return;
                fieldRegionID = value;
                OnPropertyChanged(RegionIDProperty);
            }
        }
        private int? fieldRegionID;
        #endregion

        #region StreetID - Описание свойства (summary)
        public const string StreetIDProperty = "StreetID";

        /// <summary>Описание свойства (summary)</summary>
        public int? StreetID
        {
            get { return fieldStreetID; }
            set
            {
                if (fieldStreetID == value) return;
                fieldStreetID = value;
                OnPropertyChanged(StreetIDProperty);
            }
        }
        private int? fieldStreetID;
        #endregion

        #region HomeNumber - Описание свойства (summary)
        public const string HomeNumberProperty = "HomeNumber";

        /// <summary>Описание свойства (summary)</summary>
        public string HomeNumber
        {
            get { return fieldHomeNumber; }
            set
            {
                if (fieldHomeNumber == value) return;
                fieldHomeNumber = value;
                OnPropertyChanged(HomeNumberProperty);
            }
        }
        private string fieldHomeNumber;
        #endregion

        #region AptNumber - Описание свойства (summary)
        public const string AptNumberProperty = "AptNumber";

        /// <summary>Описание свойства (summary)</summary>
        public string AptNumber
        {
            get { return fieldAptNumber; }
            set
            {
                if (fieldAptNumber == value) return;
                fieldAptNumber = value;
                OnPropertyChanged(AptNumberProperty);
            }
        }
        private string fieldAptNumber;
        #endregion

        #region DaysBeforeToRentClose - Описание свойства (summary)
        public const string DaysBeforeToRentCloseProperty = "DaysBeforeToRentClose";

        /// <summary>Описание свойства (summary)</summary>
        public int DaysBeforeToRentClose
        {
            get { return fieldDaysBeforeToRentClose; }
            set
            {
                if (fieldDaysBeforeToRentClose == value) return;
                fieldDaysBeforeToRentClose = value;
                OnPropertyChanged(DaysBeforeToRentCloseProperty);
            }
        }
        private int fieldDaysBeforeToRentClose;
        #endregion

        #region IsHasBalcony - Описание свойства (summary)
        public const string IsHasBalconyProperty = "IsHasBalcony";

        /// <summary>Описание свойства (summary)</summary>
        public bool IsHasBalcony
        {
            get { return fieldIsHasBalcony; }
            set
            {
                if (fieldIsHasBalcony == value) return;
                fieldIsHasBalcony = value;
                OnPropertyChanged(IsHasBalconyProperty);
            }
        }
        private bool fieldIsHasBalcony;
        #endregion

        #region Start - Описание свойства (summary)
        public const string StartProperty = "Start";

        /// <summary>Описание свойства (summary)</summary>
        [System.Runtime.Serialization.DataMember]
        public int Start
        {
            get { return fieldStart; }
            set
            {
                if (fieldStart == value) return;
                fieldStart = value;
                OnPropertyChanged(StartProperty);
            }
        }
        private int fieldStart;
        #endregion

        #region ItemsCountPerPage - Описание свойства (summary)
        public const string ItemsCountPerPageProperty = "ItemsCountPerPage";

        /// <summary>Описание свойства (summary)</summary>
        public int ItemsCountPerPage
        {
            get { return fieldItemsCountPerPage; }
            set
            {
                if (fieldItemsCountPerPage == value) return;
                fieldItemsCountPerPage = value;
                OnPropertyChanged(ItemsCountPerPageProperty);
            }
        }
        private int fieldItemsCountPerPage;
        #endregion

        #region BrokerID - Описание свойства (summary)
        public const string BrokerIDProperty = "BrokerID";

        /// <summary>Описание свойства (summary)</summary>
        public int? BrokerID
        {
            get { return fieldBrokerID; }
            set
            {
                if (fieldBrokerID == value) return;
                fieldBrokerID = value;
                OnPropertyChanged(BrokerIDProperty);
            }
        }

        public bool IsForCheckAddress { get; set; }

        private int? fieldBrokerID;
        #endregion

        #region StreetName - Описание свойства (summary)
        public const string StreetNameProperty = "StreetName";

        /// <summary>Описание свойства (summary)</summary>
        public string StreetName
        {
            get { return fieldStreetName; }
            set
            {
                if (fieldStreetName == value) return;
                fieldStreetName = value;
                OnPropertyChanged(StreetNameProperty);
            }
        }
        private string fieldStreetName;
        #endregion

        #region IsDaylyRent - Описание свойства (summary)
        public const string IsDaylyRentProperty = "IsDaylyRent";

        /// <summary>Описание свойства (summary)</summary>
        [System.Runtime.Serialization.DataMember]
        public bool IsDaylyRent
        {
            get { return fieldIsDaylyRent; }
            set
            {
                if (fieldIsDaylyRent == value) return;
                fieldIsDaylyRent = value;
                OnPropertyChanged(IsDaylyRentProperty);
            }
        }
        private bool fieldIsDaylyRent;
        private bool _isOverseas;
        private int? _countryID;

        #endregion



        public RealEstateSearchParameters()
        {
            Estate este = new Estate();

            OrderTypes = new List<OrderType>();
            RealEstateTypes = new List<EstateType>();
            Regions = new List<Region>();
            Streets = new List<Street>();
            Remonts = new List<Remont>();
            Projects = new List<Project>();
            EstateConvenients = new List<Convenient>();
            BuildingTypes = new List<BuildingType>();
            Start = 0;
            ItemsCountPerPage = 100;
        }

        public static RealEstateSearchParameters GetSearchParameter(NeededEstate demand)
        {
            if (demand == null) return null;

            return new RealEstateSearchParameters
                    {
                        Currency = demand.Currency,
                        PriceFrom = demand.PriceFrom,
                        PriceTo = demand.PriceTo,
                        FloorFrom = demand.FloorFrom,
                        FloorTo = demand.FloorTo,
                        RealEstateTypes = demand.NeededEstateTypes != null ? demand.NeededEstateTypes.Select(s => s.EstateType).ToList() : new List<EstateType>(),
                        Regions = demand.NeededRegions != null ? demand.NeededRegions.Select(s => s.Region).ToList() : new List<Region>(),
                        PriceFromInAMD = demand.PriceFromInAMD,
                        PriceToInAMD = demand.PriceToInAMD,
                        RoomCountFrom = demand.RoomCountFrom,
                        RoomCountTo = demand.RoomCountTo,
                        SquareFrom = demand.SquareFrom,
                        SquareTo = demand.SquareTo,
                        OrderTypes = new List<OrderType> { new OrderType { OrderTypeID = demand.IsNeedForRent.GetValueOrDefault(false) ? 2 : 1 } },
                        Projects = demand.ProjectsList != null ? demand.ProjectsList.Select(s => new Project { ProjectID = s.ProjectID }).ToList() : new List<Project>(),
                        BuildingTypes = demand.BuildingTypesList != null ? demand.BuildingTypesList.Select(s => new BuildingType { BuildingTypeID = s.BuildingTypeID }).ToList() : new List<BuildingType>(),
                        Remonts = demand.RemontsList != null ? demand.RemontsList.Select(s => new Remont { RemontID = s.NeededRemontID }).ToList() : new List<Remont>(),
                        IsEmpty = demand.IsEmpty ?? false,
                        IsPossibleExchange = demand.IsExchangePossible ?? false,
                        IsHasGarage = demand.IsHasGarage ?? false,
                        IsHasGas = demand.IsHasGas ?? false,
                        IsHasPodval = demand.IsHasPodval ?? false,
                        IsHasThreePhaseElectricity = demand.IsHasThreePhaseElectricity ?? false,
                        InFirstLine = demand.IsInFirstLine ?? false,
                        IsInNewBuilding = demand.IsInNewBuilding ?? false,
                        InNullableFloor = demand.IsInNullableFloor ?? false
                    };

        }

        public object Clone()
        {
            return new RealEstateSearchParameters
                    {
                        CityID = this.CityID,
                        Code = this.Code,
                        Currency = this.Currency,
                        Error = this.Error,
                        FloorFrom = this.FloorFrom,
                        FloorTo = this.FloorTo,
                        IsHasEuroWindows = this.IsHasEuroWindows,
                        IsHasExpandingPosibility = this.IsHasExpandingPosibility,
                        IsHasGarage = this.IsHasGarage,
                        IsHasGas = this.IsHasGas,
                        IsHasPodval = this.IsHasPodval,
                        IsInNewBuilding = this.IsInNewBuilding,
                        IsWoterAlways = this.IsWoterAlways,
                        OrderTypes = this.OrderTypes,
                        PlaceName = this.PlaceName,
                        PriceFrom = this.PriceFrom,
                        PriceFromInAMD = this.PriceFromInAMD,
                        PricePerDayFrom = this.PricePerDayFrom,
                        PricePerDayTo = this.PricePerDayTo,
                        PriceTo = this.PriceTo,
                        PriceToInAMD = this.PriceToInAMD,
                        Projects = this.Projects,
                        RealEstateTypes = this.RealEstateTypes,
                        Regions = this.Regions,
                        Remonts = this.Remonts,
                        RoomCountFrom = this.RoomCountFrom,
                        RoomCountTo = this.RoomCountTo,
                        SquareFrom = this.SquareFrom,
                        SquareTo = this.SquareTo,
                        StateID = this.StateID,
                        Streets = this.Streets,
                        BuildingTypes = this.BuildingTypes,
                        TelephoneOrName = this.TelephoneOrName,
                        IsHasConditioner = this.IsHasConditioner,
                        IsHasFurniture = this.IsHasFurniture,
                        IsHasWasher = this.IsHasWasher,
                        IsPossibleExchange = this.IsPossibleExchange,
                        IsHasWarmingSystem = this.IsHasWarmingSystem,
                        IsHasThreePhaseElectricity = this.IsHasThreePhaseElectricity,
                        InNullableFloor = this.InNullableFloor,
                        InFirstLine = this.InFirstLine,
                        IsHasJakuzi = this.IsHasJakuzi,
                        IsHasPool = this.IsHasPool,
                        IsHasPlayingRoom = this.IsHasPlayingRoom,
                        IsEmpty = this.IsEmpty,
                        IsHasWarmingFloors = this.IsHasWarmingFloors,
                        IsHasGasHeater = this.IsHasGasHeater,
                        Status = this.Status,
                        RegionID = this.RegionID,
                        StreetID = this.StreetID,
                        HomeNumber = this.HomeNumber,
                        AptNumber = this.AptNumber,
                        DaysBeforeToRentClose = this.DaysBeforeToRentClose,
                        IsHasBalcony = this.IsHasBalcony,
                        BrokerID = this.BrokerID,
                        IsForCheckAddress = this.IsForCheckAddress,
                        StreetName = this.StreetName,
                        ItemsCountPerPage = this.ItemsCountPerPage,
                        Start = this.Start,
                        IsDaylyRent = this.IsDaylyRent,
                        IsOverseas = this.IsOverseas,
                        CountryID = this.CountryID,
                    };
        }
    }
}
