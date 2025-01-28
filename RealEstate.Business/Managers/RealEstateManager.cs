﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Common;
using System.Linq;
using System.Text;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;
using Realtor.DTO;

namespace RealEstate.Business.Managers
{
    public class EstateManager : DataManagerBase
    {
        public static ObservableCollection<Estate> GetSearchedRealEstates(RealEstateSearchParameters searchParameters, User user, out int totalItems, bool isOfflineMode)
        {
            var estates = GetSearchedRealEstates(searchParameters, out totalItems, isOfflineMode);
            //estates = GetFilteredByUserAccessesEstates(estates, user);
            if (user == null)
            {
                totalItems = 0;
                return new ObservableCollection<Estate>();
            }
            if (user.IsBroker)
            {
                estates = GetUserEstates(estates, user);
            }
            return new ObservableCollection<Estate>(estates.ToList());
        }

        public static List<Estate> GetUserEstates(IEnumerable<Estate> estates, User user)
        {
            estates = GetFilteredByUserAccessesEstatess(estates, user);
            var settings = RealtorSettingsManager.GetSettings();
            if (settings.ShowOpenAddressToBrokers)
            {
                return estates.ToList();
            }
            foreach (Estate estate in estates)
            {
                if (estate.BrokerID != user.ID)
                {
                    estate.HomeNumber = string.Empty;
                    estate.AptNumber = string.Empty;
                    estate.SellerName = string.Empty;
                    estate.PhonePrimary = string.Empty;
                    estate.PhoneSecondary = string.Empty;
                    estate.LandNumber = string.Empty;
                }
            }
            return estates.ToList();
        }

        private static IEnumerable<Estate> GetFilteredByUserAccessesEstatess(IEnumerable<Estate> estates, User user)
        {
            if (user == null) return null;

            if (user.IsAdminOrDirector)
            {
                return estates;
            }

            var stateIds = user.BrokerStates.Select(s => s.StateID).ToList();
            var regionIDs = user.BrokersRegions.Select(s => s.RegionID).ToList();

            estates = estates.Where(s => s.StateID.HasValue && (stateIds.Contains(s.StateID.Value) || (regionIDs.Count > 0 ? (s.StateID == 1) : false)));
            estates = estates.Where(s => (s.RegionID.HasValue && regionIDs.Contains(s.RegionID.Value) && s.StateID.HasValue && s.StateID == 1) || (s.StateID.HasValue && s.StateID.Value != 1));

            var estateTypeIDs = user.BrokerEstateTypes.Select(s => s.EstateTypeID).ToList();
            estates = estates.Where(s => estateTypeIDs.Contains(s.EstateTypeID));

            var orderTypeIDs = user.BrokerOrderTypes.Select(s => s.OrderTypeID).ToList();
            estates = estates.Where(s => s.OrderTypeID.HasValue && orderTypeIDs.Contains(s.OrderTypeID.Value));
            return estates;
        }

        private static IEnumerable<Estate> GetSearchedRealEstates(RealEstateSearchParameters searchParameters, out int totalItems, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            var estates = db.Estates.Where(s => s.IsDeleted == null || s.IsDeleted == false).AsQueryable();
            if (searchParameters == null)
            {
                totalItems = estates.Count();
                return estates.AsEnumerable();
            }
            if (searchParameters.IsForCheckAddress)
            {
                if (searchParameters.StateID.HasValue)
                {
                    estates = estates.Where(s => s.StateID == searchParameters.StateID);
                }
                if (searchParameters.CityID.HasValue)
                {
                    estates = estates.Where(s => s.CityID == searchParameters.CityID);
                }
                if (searchParameters.RegionID.HasValue)
                {
                    estates = estates.Where(s => s.RegionID == searchParameters.RegionID);
                }
                if (searchParameters.StreetID.HasValue)
                {
                    estates = estates.Where(s => s.StreetID == searchParameters.StreetID);
                }
                if (!string.IsNullOrEmpty(searchParameters.HomeNumber))
                {
                    estates = estates.Where(s => s.HomeNumber == searchParameters.HomeNumber);
                }
                if (!string.IsNullOrEmpty(searchParameters.AptNumber))
                {
                    estates = estates.Where(s => s.AptNumber == searchParameters.AptNumber);
                }
                totalItems = estates.Count();
                return estates;
            }
            if (!string.IsNullOrEmpty(searchParameters.Code))
            {
                estates = estates.Where(s => s.Code.StartsWith(searchParameters.Code));
                if (searchParameters.ItemsCountPerPage > 0)
                {
                    totalItems = estates.Count();
                    return estates.OrderByDescending(s => s.AddDate).Skip(searchParameters.Start).Take(searchParameters.ItemsCountPerPage);
                }
                totalItems = estates.Count();
                return estates.OrderByDescending(s => s.AddDate);
            }
            if (!string.IsNullOrEmpty(searchParameters.TelephoneOrName))
            {
                estates = estates.Where(s => s.PhonePrimary.Contains(searchParameters.TelephoneOrName) ||
                                                s.PhoneSecondary.Contains(searchParameters.TelephoneOrName) ||
                                                s.SellerName.Contains(searchParameters.TelephoneOrName));

                totalItems = estates.Count();
                if (searchParameters.ItemsCountPerPage > 0)
                {
                    return estates.OrderByDescending(s => s.AddDate).Skip(searchParameters.Start).Take(searchParameters.ItemsCountPerPage);
                }
                return estates.OrderByDescending(s => s.AddDate);
            }
            if (!string.IsNullOrEmpty(searchParameters.StreetName))
            {
                estates = estates.Where(s => s.Street.NameAm.Contains(searchParameters.StreetName) ||
                                             s.Street.NameEn.Contains(searchParameters.StreetName) ||
                                             s.Street.NameRu.Contains(searchParameters.StreetName) ||
                                             s.Street.NameCz.Contains(searchParameters.StreetName) ||
                                             s.Street.NameKz.Contains(searchParameters.StreetName));
            }
            if (searchParameters.CountryID.HasValue)
            {
                estates = estates.Where(s => s.CountryID == searchParameters.CountryID);
            }
            if (searchParameters.IsWithPhoto)
            {
                estates = estates.Where(s => s.EstateImages.Count > 0);
            }
            if (searchParameters.IsDaylyRent)
            {
                estates = estates.Where(s => s.PricePerDay != null);
            }
            if (searchParameters.StateID.HasValue && searchParameters.StateID.Value > 0)
            {
                estates = estates.Where(s => s.StateID == searchParameters.StateID);
            }
            if (searchParameters.CityID.HasValue && searchParameters.CityID.Value > 0)
            {
                estates = estates.Where(s => s.CityID == searchParameters.CityID);
            }
            if (searchParameters.RegionID.HasValue)
            {
                estates = estates.Where(s => s.RegionID == searchParameters.RegionID);
            }
            if (searchParameters.StreetID.HasValue)
            {
                estates = estates.Where(s => s.StreetID == searchParameters.StreetID);
            }
            if (!string.IsNullOrEmpty(searchParameters.HomeNumber))
            {
                estates = estates.Where(s => s.HomeNumber == searchParameters.HomeNumber);
            }
            if (!string.IsNullOrEmpty(searchParameters.AptNumber))
            {
                estates = estates.Where(S => S.AptNumber == searchParameters.AptNumber);
            }
            if (searchParameters.FloorFrom.HasValue)
            {
                estates = estates.Where(s => s.Floor >= searchParameters.FloorFrom);
            }
            if (searchParameters.FloorTo.HasValue)
            {
                estates = estates.Where(s => s.Floor <= searchParameters.FloorTo);
            }
            if (searchParameters.SquareFrom.HasValue)
            {
                estates = estates.Where(s => s.TotalSquare >= searchParameters.SquareFrom);
            }
            if (searchParameters.SquareTo.HasValue)
            {
                estates = estates.Where(s => s.TotalSquare <= searchParameters.SquareTo);
            }
            if (searchParameters.IsHasEuroWindows)
            {
                estates = estates.Where(s => s.HasEuroWindows == searchParameters.IsHasEuroWindows);
            }
            if (searchParameters.IsHasExpandingPosibility)
            {
                estates = estates.Where(s => s.ExpandingPosibility == searchParameters.IsHasExpandingPosibility);
            }
            if (searchParameters.IsHasGarage)
            {
                estates = estates.Where(s => s.HasGarage == searchParameters.IsHasGarage);
            }
            if (searchParameters.IsHasGas)
            {
                estates = estates.Where(s => s.IsHasGas == searchParameters.IsHasGas);
            }
            if (searchParameters.IsInNewBuilding)
            {
                estates = estates.Where(s => s.IsInNewBuilding == searchParameters.IsInNewBuilding);
            }
            if (searchParameters.IsHasPodval)
            {
                estates = estates.Where(s => s.HasPadval == searchParameters.IsHasPodval);
            }
            if (searchParameters.IsWoterAlways)
            {
                estates = estates.Where(s => s.IsWoterAlways == searchParameters.IsWoterAlways);
            }
            if (searchParameters.OrderTypes != null)
            {
                var daylyRent = searchParameters.OrderTypes.FirstOrDefault(s => s.OrderTypeID == -2);
                if (daylyRent != null)
                {
                    searchParameters.OrderTypes.Remove(daylyRent);
                }
                if (searchParameters.OrderTypes.Count > 0)
                {
                    estates = estates.Where(s => searchParameters.OrderTypes.Contains(s.OrderType));
                }
            }
            if (searchParameters.Currency == null)
            {
                searchParameters.Currency = CurrencyManager.GetCurrency(1, isOfflineMode);
            }
            if (searchParameters.PriceFrom.HasValue)
            {
                searchParameters.PriceFromInAMD = searchParameters.Currency.ValueInAMD * searchParameters.PriceFrom.Value;
                estates = estates.Where(s => s.PriceInAMD >= searchParameters.PriceFromInAMD);
            }
            if (searchParameters.PriceTo.HasValue)
            {
                searchParameters.PriceToInAMD = searchParameters.Currency.ValueInAMD * searchParameters.PriceTo;
                estates = estates.Where(s => s.PriceInAMD <= searchParameters.PriceToInAMD);
            }
            if (searchParameters.PricePerDayFrom.HasValue)
            {
                searchParameters.PricePerDayFromInAMD = searchParameters.Currency.ValueInAMD * searchParameters.PricePerDayFrom;
                estates = estates.Where(s => s.PricePerDayInAMD >= searchParameters.PricePerDayFromInAMD);
            }
            if (searchParameters.PricePerDayTo.HasValue)
            {
                searchParameters.PricePerDayToInAMD = searchParameters.Currency.ValueInAMD * searchParameters.PricePerDayTo;
                estates = estates.Where(s => s.PricePerDayInAMD <= searchParameters.PricePerDayToInAMD);
            }
            if (searchParameters.Projects != null && searchParameters.Projects.Count > 0)
            {
                estates = estates.Where(s => searchParameters.Projects.Contains(s.Project));
            }
            if (searchParameters.RealEstateTypes != null && searchParameters.RealEstateTypes.Count > 0)
            {
                estates = estates.Where(s => searchParameters.RealEstateTypes.Contains(s.EstateType));
            }
            if (searchParameters.Regions != null && searchParameters.Regions.Count > 0)
            {
                estates = estates.Where(s => searchParameters.Regions.Contains(s.Region));
            }
            if (searchParameters.Remonts != null && searchParameters.Remonts.Count > 0)
            {
                estates = estates.Where(s => searchParameters.Remonts.Contains(s.Remont));
            }
            if (searchParameters.BuildingTypes != null && searchParameters.BuildingTypes.Count > 0)
            {
                estates = estates.Where(s => searchParameters.BuildingTypes.Contains(s.BuildingType));
            }
            if (searchParameters.RoomCountFrom.HasValue)
            {
                estates = estates.Where(s => s.RoomCount >= searchParameters.RoomCountFrom || s.MakedRooms >= searchParameters.RoomCountFrom);
            }
            if (searchParameters.RoomCountTo.HasValue)
            {
                estates = estates.Where(s => s.RoomCount <= searchParameters.RoomCountTo || s.MakedRooms <= searchParameters.RoomCountFrom);
            }
            if (searchParameters.Streets != null && searchParameters.Streets.Count > 0)
            {
                estates = estates.Where(s => s.Street != null && searchParameters.Streets.Contains(s.Street));
            }
            if (!string.IsNullOrEmpty(searchParameters.PlaceName))
            {
                estates = estates.Where(s => s.PlaceName.Contains(searchParameters.PlaceName));
            }
            if (searchParameters.IsHasWasher)
            {
                estates = estates.Where(s => s.IsHasWasher == true);
            }
            if (searchParameters.IsHasFurniture)
            {
                estates = estates.Where(s => s.IsHasFurniture == true);
            }
            if (searchParameters.IsHasConditioner)
            {
                estates = estates.Where(s => s.IsHasConditioner == true);
            }
            if (searchParameters.IsPossibleExchange)
            {
                estates = estates.Where(s => s.IsExchangePossible == true);
            }
            if (searchParameters.IsHasThreePhaseElectricity)
            {
                estates = estates.Where(s => s.IsHasThreePhaseElectricity == true);
            }
            if (searchParameters.IsHasWarmingSystem)
            {
                estates = estates.Where(s => s.IsHasWarmingSystem == true);
            }
            if (searchParameters.InNullableFloor)
            {
                estates = estates.Where(s => s.InNullableFloor == true);
            }
            if (searchParameters.InFirstLine)
            {
                estates = estates.Where(s => s.InFirstLine == true);
            }
            if (searchParameters.IsHasJakuzi)
            {
                estates = estates.Where(s => s.IsHasJakuzi == true);
            }
            if (searchParameters.IsHasPool)
            {
                estates = estates.Where(s => s.IsHasPool == true);
            }
            if (searchParameters.IsHasPlayingRoom)
            {
                estates = estates.Where(s => s.IsHasPlayRoom == true);
            }
            if (searchParameters.IsEmpty)
            {
                estates = estates.Where(s => s.IsEmpty == true);
            }
            if (searchParameters.IsHasWarmingFloors)
            {
                estates = estates.Where(s => s.IsHasHeatedFloors == true);
            }
            if (searchParameters.IsHasGasHeater)
            {
                estates = estates.Where(s => s.IsHasGasHeater == true);
            }
            if (!string.IsNullOrEmpty(searchParameters.Status))
            {
                estates = estates.Where(s => s.Status == searchParameters.Status);
            }
            if (searchParameters.IsHasBalcony)
            {
                estates = estates.Where(s => s.OpenBalcony == true || s.ClosedBalcony == true);
            }
            if (searchParameters.DaysBeforeToRentClose > 0)
            {
                estates = from est in estates
                          let rent = est.RentedEstates.Where(s => s.EndDate.HasValue)
                          where (est.IsSelledOrOrended == null || est.IsSelledOrOrended == false) ||
                            (est.IsSelledOrOrended == true && rent.Any(s => s.EndDate.Value.AddDays(-searchParameters.DaysBeforeToRentClose) <= DateTime.Now))
                          select est;
            }
            else
            {
                estates = estates.Where(s => s.IsSelledOrOrended == null || s.IsSelledOrOrended == false);
            }
            if (searchParameters.BrokerID.HasValue && searchParameters.BrokerID > 0)
            {
                estates = estates.Where(s => s.BrokerID == searchParameters.BrokerID);
            }
            if (searchParameters.EstateConvenients != null && searchParameters.EstateConvenients.Count > 0)
            {
                var convenientIDs = searchParameters.EstateConvenients.Select(s => s.ID).ToList();
                //estates = db.EstateConvenients.Join(estates, s => s.Estate, n => n, (s, n) => s).Where((s, n) => convenientIDs.Contains(s.ConvenientID)).Select(s => s.Estate);
                var ests = new List<Estate>();
                foreach (var convenientID in convenientIDs)
                {
                    var filteredEstates = estates.Where(s => s.EstateConvenients.Any(e => e.ConvenientID == convenientID));
                    foreach (var filteredEstate in filteredEstates)
                    {
                        var it = ests.FirstOrDefault(s => s.EstateID == filteredEstate.EstateID);
                        if (it == null)
                        {
                            ests.Add(filteredEstate);
                        }
                    }
                }
                totalItems = estates.Count();
                if (searchParameters.ItemsCountPerPage > 0)
                {
                    return ests.OrderByDescending(s => s.AddDate).Skip(searchParameters.Start).Take(searchParameters.ItemsCountPerPage);
                }
                return ests.OrderByDescending(s => s.AddDate);
            }
            totalItems = estates.Count();
            return estates.OrderByDescending(s => s.AddDate).Skip(searchParameters.Start).Take(searchParameters.ItemsCountPerPage);
        }

        public static List<Estate> GetLastAdded20RealEstates(User user, bool isOfflineMode)
        {
            if (user == null) return new List<Estate>();

            var estates = new DataClassesDataContext(GetConnectionString(isOfflineMode)).Estates
                                                                                        .Where(s => (s.IsSelledOrOrended == null || s.IsSelledOrOrended == false) &&
                                                                                                    (s.IsDeleted == null || s.IsDeleted == false))
                                                                                        .OrderByDescending(s => s.AddDate)
                                                                                        .AsEnumerable();
            if (user.IsBroker)
            {
                estates = GetUserEstates(estates.ToList(), user);
            }

            return estates.Take(100).ToList();
        }

        public static bool Delete(Estate estate)
        {
            DataClassesDataContext db = new DataClassesDataContext();

            try
            {
                var estateFromDB = db.Estates.FirstOrDefault(s => s.EstateID == estate.EstateID);
                if (estateFromDB.EstateImages.Count > 0)
                {
                    ImageManager.DeleteImageFiles(estateFromDB.EstateImages.ToList());
                    db.EstateImages.DeleteAllOnSubmit(estateFromDB.EstateImages);
                }

                var favoriteEstates = db.FavoriteEstates.Where(s => s.EstateID == estate.EstateID);
                if (favoriteEstates.Count() > 0)
                {
                    db.FavoriteEstates.DeleteAllOnSubmit(favoriteEstates);
                }

                if (estateFromDB.EstateConvenients.Count > 0)
                {
                    db.EstateConvenients.DeleteAllOnSubmit(estateFromDB.EstateConvenients);
                }
                if (estateFromDB.EstatesAndDemands.Count > 0)
                {
                    db.EstatesAndDemands.DeleteAllOnSubmit(estateFromDB.EstatesAndDemands);
                }
                if (estateFromDB.EstateVideos.Count > 0)
                {
                    ImageManager.DeleteVideos(estateFromDB.EstateVideos);
                }
                //db.Estates.DeleteOnSubmit(estateFromDB);
                estateFromDB.IsDeleted = true;
                estateFromDB.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool Update(Estate estate, ref StringBuilder errorMessage)
        {

            DataClassesDataContext db = new DataClassesDataContext();
            DbTransaction transaction = null;
            try
            {
                db.Connection.Open();
                transaction = db.Connection.BeginTransaction();
                db.Transaction = transaction;

                var estateFromDB = db.Estates.FirstOrDefault(s => s.EstateID == estate.EstateID);
                if (estateFromDB == null)
                {
                    errorMessage = new StringBuilder(CultureResources.Inst["UpdateError"]);
                    return false;
                }

                db.EstateConvenients.DeleteAllOnSubmit(estateFromDB.EstateConvenients);
                db.SubmitChanges();
                estateFromDB.BuildingType = db.BuildingTypes.SingleOrDefault(s => s.BuildingTypeID == estate.BuildingTypeID);
                estateFromDB.Currency = db.Currencies.SingleOrDefault(s => s.CurrencyID == estate.CurrencyID);
                if (estateFromDB.BrokerID != estate.BrokerID)
                {
                    estateFromDB.ChangeToBrokerDate = DateTime.Now;
                }
                estateFromDB.User = db.Users.SingleOrDefault(s => s.ID == estate.BrokerID);
                estateFromDB.Project = db.Projects.SingleOrDefault(s => s.ProjectID == estate.ProjectID);
                estateFromDB.Region = db.Regions.SingleOrDefault(s => s.RegionID == estate.RegionID);
                estateFromDB.Remont = db.Remonts.SingleOrDefault(s => s.RemontID == estate.RemontID);
                estateFromDB.SignificanceOfTheUse = db.SignificanceOfTheUses.SingleOrDefault(s => s.ID == estate.SignificanceOfTheUseID);
                estateFromDB.OperationalSignificance = db.OperationalSignificances.SingleOrDefault(s => s.ID == estate.OperationalSignificanceID);
                estateFromDB.Roofing = db.Roofings.SingleOrDefault(s => s.ID == estate.RoofingID);
                estateFromDB.Country = db.Countries.SingleOrDefault(s => s.ID == estate.CountryID);
                if (estate.EstateConvenients != null && estate.EstateConvenients.Count > 0)
                {
                    estateFromDB.EstateConvenients = estate.EstateConvenients;
                }
                CopyProperties(estateFromDB, estate, db);
                estateFromDB.LastModifiedDate = DateTime.Now;
                if (estate.Street != null && estate.Street.StreetID == 0)
                {
                    estateFromDB.Street = new Street { Name = estate.Street.Name, RegionID = estate.Street.RegionID };
                }
                db.SubmitChanges();
                transaction.Commit();
                return true;
            }
            catch (Exception ex)
            {
                if (transaction != null)
                {
                    transaction.Rollback();
                }
                errorMessage.AppendLine(ex.ToString());
                return false;
            }
        }

        public static void CopyProperties(Estate estateFromDb, Estate estate)
        {
            //estateFromDb.EstateID = estate.EstateID;
            estateFromDb.EstateTypeID = estate.EstateTypeID;
            estateFromDb.RoomCount = estate.RoomCount;
            estateFromDb.BrokerID = estate.BrokerID;
            estateFromDb.TotalSquare = estate.TotalSquare;
            estateFromDb.Floor = estate.Floor;
            estateFromDb.Price = estate.Price;
            estateFromDb.CurrencyID = estate.CurrencyID;
            estateFromDb.RegionID = estate.RegionID;
            estateFromDb.RemontID = estate.RemontID;
            estateFromDb.Height = estate.Height;
            estateFromDb.HasGarage = estate.HasGarage;
            estateFromDb.SellerName = estate.SellerName;
            estateFromDb.PhonePrimary = estate.PhonePrimary;
            estateFromDb.PhoneSecondary = estate.PhoneSecondary;
            estateFromDb.Email = estate.Email;
            estateFromDb.HasEuroWindows = estate.HasEuroWindows;
            estateFromDb.AddressID = estateFromDb.AddressID;
            estateFromDb.IsHasCanalisationPosibility = estate.IsHasCanalisationPosibility;
            estateFromDb.AdditionalInformation = estate.AdditionalInformation;
            estateFromDb.Canalisation = estate.Canalisation;
            estateFromDb.IsWoterAlways = estate.IsWoterAlways;
            estateFromDb.IsHasGas = estate.IsHasGas;
            estateFromDb.ProjectID = estate.ProjectID;
            estateFromDb.ExpandingPosibility = estate.ExpandingPosibility;
            estateFromDb.BuildingTypeID = estate.BuildingTypeID;
            estateFromDb.OrderTypeID = estate.OrderTypeID;
            estateFromDb.HasPadval = estate.HasPadval;
            estateFromDb.BuildingFloorsCount = estate.BuildingFloorsCount;
            estateFromDb.PadvalSquare = estate.PadvalSquare;
            estateFromDb.IsHasGarden = estate.IsHasGarden;
            estateFromDb.GardenSquare = estate.GardenSquare;
            estateFromDb.IsOutDoorFromSteel = estate.IsOutDoorFromSteel;
            estateFromDb.GasPosibility = estate.GasPosibility;
            estateFromDb.AddDate = estate.AddDate;
            estateFromDb.CityID = estate.CityID;
            estateFromDb.StreetID = estate.StreetID;
            estateFromDb.HomeNumber = estate.HomeNumber;
            estateFromDb.AptNumber = estate.AptNumber;
            estateFromDb.EarthPlaceTypeID = estate.EarthPlaceTypeID;
            estateFromDb.StateID = estate.StateID;
            estateFromDb.GarageTypeID = estate.GarageTypeID;
            estateFromDb.PriceTypeID = estate.PriceTypeID;
            estateFromDb.Rating = estate.Rating;
            estateFromDb.PlaceName = estate.PlaceName;
            estateFromDb.OfficePlaceTypeID = estate.OfficePlaceTypeID;
            estateFromDb.Electricity = estate.Electricity;
            estateFromDb.PricePerDay = estate.PricePerDay;
            estateFromDb.PriceInAMD = estate.PriceInAMD;
            estateFromDb.IsSelledOrOrended = estate.IsSelledOrOrended;
            estateFromDb.IsHasDrinkWater = estate.IsHasDrinkWater;
            estateFromDb.IsHasVoroqmanJur = estate.IsHasVoroqmanJur;
            estateFromDb.IsHasElectricityPosibility = estate.IsHasElectricityPosibility;
            estateFromDb.IsUploadedToWeb = estate.IsUploadedToWeb;
            estateFromDb.LastModifiedDate = estate.LastModifiedDate;
            estateFromDb.SignificanceOfTheUseID = estate.SignificanceOfTheUseID;
estateFromDb.OperationalSignificanceID = estate.OperationalSignificanceID;
estateFromDb.Code = estate.Code;
estateFromDb.RoofingID = estate.RoofingID;
estateFromDb.IsExchangePossible = estate.IsExchangePossible;
            estateFromDb.ExchangeWith = estate.ExchangeWith;
estateFromDb.IsInNewBuilding = estate.IsInNewBuilding;
estateFromDb.IsHasFurniture = estate.IsHasFurniture;
estateFromDb.IsHasConditioner = estate.IsHasConditioner;
estateFromDb.IsHasWasher = estate.IsHasWasher;
estateFromDb.InformationSource = estate.InformationSource;
estateFromDb.PricePerDayInAMD = estate.PricePerDayInAMD;
estateFromDb.IsHasWarmingSystem = estate.IsHasWarmingSystem;
estateFromDb.IsHasWarmingSystem = estate.IsHasWarmingSystem;
estateFromDb.IsHasInternet = estate.IsHasInternet;
estateFromDb.IsHasAntena = estate.IsHasAntena;
estateFromDb.IsHasTechnique = estate.IsHasTechnique;
estateFromDb.OpenBalcony = estate.OpenBalcony;
            estateFromDb.ClosedBalcony = estate.ClosedBalcony;
estateFromDb.Nisha = estate.Nisha;
            estateFromDb.FrontBalcony = estate.FrontBalcony;
estateFromDb.Arevkox = estate.Arevkox;
            estateFromDb.Xordanoc = estate.Xordanoc;
            estateFromDb.IsEmpty = estate.IsEmpty;
estateFromDb.IsHasTV = estate.IsHasTV;
            estateFromDb.IsHasDVD = estate.IsHasDVD;
estateFromDb.IsHasJakuzi = estate.IsHasJakuzi;
            estateFromDb.IsHasRefrigerator = estate.IsHasRefrigerator;
            estateFromDb.IsHasAriston = estate.IsHasAriston;
            estateFromDb.IsHasGeyser = estate.IsHasGeyser;
estateFromDb.IsHasWaterContainer = estate.IsHasWaterContainer;
            estateFromDb.IsHasPool = estate.IsHasPool;
estateFromDb.IsHasGasHeater = estate.IsHasGasHeater;
estateFromDb.IsHasOfficeRoom = estate.IsHasOfficeRoom;
            estateFromDb.IsHasShowerCab = estate.IsHasShowerCab;
estateFromDb.IsHasBed = estate.IsHasBed;
            estateFromDb.IsHasGate = estate.IsHasGate;
            estateFromDb.IsHasTrees = estate.IsHasTrees;
estateFromDb.IsHasPlayRoom = estate.IsHasPlayRoom;
            estateFromDb.IsHasService = estate.IsHasService;
            estateFromDb.IsHasHeatedFloors = estate.IsHasHeatedFloors;
            estateFromDb.IsHasLodgeBalcony = estate.IsHasLodgeBalcony;
estateFromDb.IsHasIntercome = estate.IsHasIntercome;
estateFromDb.IsInElitarBuilding = estate.IsInElitarBuilding;
estateFromDb.IsHasSecuritySystem = estate.IsHasSecuritySystem;
estateFromDb.IsHasParking = estate.IsHasParking;
estateFromDb.IsHasKitchen = estate.IsHasKitchen;
estateFromDb.InFirstLine = estate.InFirstLine;
estateFromDb.InNullableFloor = estate.InNullableFloor;
estateFromDb.IsHasWC = estate.IsHasWC;
estateFromDb.IsHasThreePhaseElectricity = estate.IsHasThreePhaseElectricity;
estateFromDb.IsHasFencing = estate.IsHasFencing;
estateFromDb.AdditionalConvenients = estate.AdditionalConvenients;
estateFromDb.Lat = estate.Lat;
            estateFromDb.Lng = estate.Lng;
estateFromDb.EuroDesign = estate.EuroDesign;
            estateFromDb.Dishwasher = estate.Dishwasher;
            estateFromDb.Tile = estate.Tile;
estateFromDb.Metlax = estate.Metlax;
            estateFromDb.LodgeBalcony = estate.LodgeBalcony;
            estateFromDb.Domophone = estate.Domophone;
            estateFromDb.Lift = estate.Lift;
estateFromDb.NotPopulated = estate.NotPopulated;
            estateFromDb.SeparateRooms = estate.SeparateRooms;
estateFromDb.Square = estate.Square;
estateFromDb.Status = estate.Status;
estateFromDb.MakedRooms = estate.MakedRooms;
estateFromDb.LandFront = estate.LandFront;
estateFromDb.FloorAdditional = estate.FloorAdditional;
            estateFromDb.LandNumber = estate.LandNumber;
estateFromDb.IsElectricityCablesChanged = estate.IsElectricityCablesChanged;
estateFromDb.IsPipesChanged = estate.IsPipesChanged;
estateFromDb.IsCeilingRepaired = estate.IsCeilingRepaired;
estateFromDb.OriginalID = estate.OriginalID;
estateFromDb.IsHasSomething = estate.IsHasSomething;
            estateFromDb.IsDeleted = estate.IsDeleted;
estateFromDb.IsHasSauna = estate.IsHasSauna;
estateFromDb.AdditionalDetailsSite = estate.AdditionalDetailsSite;
estateFromDb.PlaceNameSite = estate.PlaceNameSite;
estateFromDb.WaterHeater = estate.WaterHeater;
estateFromDb.CountryID = estate.CountryID;
            estateFromDb.Address = estate.Address;
            estateFromDb.IsOverseas = estate.IsOverseas;
            estateFromDb.ChangeToBrokerDate = estate.ChangeToBrokerDate;
        }
        private static void CopyProperties(Estate estateFromDb, Estate estate, DataClassesDataContext db)
        {
            estateFromDb.Address = estate.Address;
            estateFromDb.AdditionalInformation = estate.AdditionalInformation;
            estateFromDb.AdditionalDetailsSite = estate.AdditionalDetailsSite;
            estateFromDb.PlaceNameSite = estate.PlaceNameSite;
            estateFromDb.WaterHeater = estate.WaterHeater;
            estateFromDb.BuildingFloorsCount = estate.BuildingFloorsCount;
            estateFromDb.Email = estate.Email;
            estateFromDb.EstateType = db.EstateTypes.SingleOrDefault(s => s.EstateTypeID == estate.EstateTypeID);
            estateFromDb.ExpandingPosibility = estate.ExpandingPosibility;
            estateFromDb.Floor = estate.Floor;
            estateFromDb.GardenSquare = estate.GardenSquare;
            estateFromDb.GasPosibility = estate.GasPosibility;
            estateFromDb.HasEuroWindows = estate.HasEuroWindows;
            estateFromDb.HasGarage = estate.HasGarage;
            estateFromDb.HasPadval = estate.HasPadval;
            estateFromDb.IsHasGarden = estate.IsHasGarden;
            estateFromDb.IsHasGas = estate.IsHasGas;
            estateFromDb.IsHasDrinkWater = estate.IsHasDrinkWater;
            estateFromDb.IsHasCanalisationPosibility = estate.IsHasCanalisationPosibility;
            estateFromDb.IsHasVoroqmanJur = estate.IsHasVoroqmanJur;
            estateFromDb.IsOutDoorFromSteel = estate.IsOutDoorFromSteel;
            estateFromDb.IsWoterAlways = estate.IsWoterAlways;
            estateFromDb.OrderType = db.OrderTypes.SingleOrDefault(s => s.OrderTypeID == estate.OrderTypeID);
            estateFromDb.PadvalSquare = estate.PadvalSquare;
            estateFromDb.PhonePrimary = estate.PhonePrimary;
            estateFromDb.PhoneSecondary = estate.PhoneSecondary;

            if (estateFromDb.Price.HasValue && estateFromDb.PriceInAMD != estate.PriceInAMD && estateFromDb.EstateID > 0)
            {
                OldPrice oldPrice = new OldPrice();
                oldPrice.EstateID = estateFromDb.EstateID;
                oldPrice.OldPrice1 = estateFromDb.Price.Value;
                oldPrice.CurrencyID = estateFromDb.CurrencyID.GetValueOrDefault(1);
                oldPrice.ChangeDate = DateTime.Now;
                db.OldPrices.InsertOnSubmit(oldPrice);
                try
                {
                    db.SubmitChanges();
                }
                catch { }
            }
            estateFromDb.Price = estate.Price;
            estateFromDb.PriceInAMD = estate.PriceInAMD;
            estateFromDb.RoomCount = estate.RoomCount;
            estateFromDb.SellerName = estate.SellerName;
            estateFromDb.TotalSquare = estate.TotalSquare;
            estateFromDb.StreetID = estate.StreetID;
            estateFromDb.City = db.Cities.SingleOrDefault(s => s.CityID == estate.CityID);
            estateFromDb.HomeNumber = estate.HomeNumber;
            estateFromDb.AptNumber = estate.AptNumber;
            estateFromDb.Canalisation = estate.Canalisation;
            estateFromDb.Electricity = estate.Electricity;
            estateFromDb.Rating = estate.Rating;
            estateFromDb.PricePerDay = estate.PricePerDay;
            estateFromDb.PlaceName = estate.PlaceName;
            estateFromDb.Height = estate.Height;
            estateFromDb.Code = estate.Code;
            estateFromDb.IsExchangePossible = estate.IsExchangePossible;
            estateFromDb.ExchangeWith = estate.ExchangeWith;
            estateFromDb.IsInNewBuilding = estate.IsInNewBuilding;
            estateFromDb.IsHasConditioner = estate.IsHasConditioner;
            estateFromDb.IsHasFurniture = estate.IsHasFurniture;
            estateFromDb.IsHasWasher = estate.IsHasWasher;
            estateFromDb.InformationSource = estate.InformationSource;
            estateFromDb.OpenBalcony = estate.OpenBalcony;
            estateFromDb.ClosedBalcony = estate.ClosedBalcony;
            estateFromDb.Nisha = estate.Nisha;
            estateFromDb.FrontBalcony = estate.FrontBalcony;
            estateFromDb.Arevkox = estate.Arevkox;
            estateFromDb.Xordanoc = estate.Xordanoc;
            estateFromDb.IsEmpty = estate.IsEmpty;
            estateFromDb.IsHasTV = estate.IsHasTV;
            estateFromDb.IsHasDVD = estate.IsHasDVD;
            estateFromDb.IsHasJakuzi = estate.IsHasJakuzi;
            estateFromDb.IsHasRefrigerator = estate.IsHasRefrigerator;
            estateFromDb.IsHasAriston = estate.IsHasAriston;
            estateFromDb.IsHasGeyser = estate.IsHasGeyser;
            estateFromDb.IsInElitarBuilding = estate.IsInElitarBuilding;
            estateFromDb.IsHasParking = estate.IsHasParking;
            estateFromDb.InFirstLine = estate.InFirstLine;
            estateFromDb.IsHasWC = estate.IsHasWC;
            estateFromDb.IsHasWaterContainer = estate.IsHasWaterContainer;
            estateFromDb.IsHasPool = estate.IsHasPool;
            estateFromDb.IsHasGasHeater = estate.IsHasGasHeater;
            estateFromDb.IsHasOfficeRoom = estate.IsHasOfficeRoom;
            estateFromDb.IsHasShowerCab = estate.IsHasShowerCab;
            estateFromDb.IsHasBed = estate.IsHasBed;
            estateFromDb.IsHasGate = estate.IsHasGate;
            estateFromDb.IsHasTrees = estate.IsHasTrees;
            estateFromDb.IsHasPlayRoom = estate.IsHasPlayRoom;
            estateFromDb.IsHasService = estate.IsHasService;
            estateFromDb.IsHasHeatedFloors = estate.IsHasHeatedFloors;
            estateFromDb.IsHasLodgeBalcony = estate.IsHasLodgeBalcony;
            estateFromDb.IsHasIntercome = estate.IsHasIntercome;
            estateFromDb.IsHasSecuritySystem = estate.IsHasSecuritySystem;
            estateFromDb.IsHasKitchen = estate.IsHasKitchen;
            estateFromDb.InNullableFloor = estate.InNullableFloor;
            estateFromDb.IsHasThreePhaseElectricity = estate.IsHasThreePhaseElectricity;
            estateFromDb.Lat = estate.Lat;
            estateFromDb.Lng = estate.Lng;
            estateFromDb.EuroDesign = estate.EuroDesign;
            estateFromDb.Dishwasher = estate.Dishwasher;
            estateFromDb.Tile = estate.Tile;
            estateFromDb.Metlax = estate.Metlax;
            estateFromDb.LodgeBalcony = estate.LodgeBalcony;
            estateFromDb.Domophone = estate.Domophone;
            estateFromDb.Lift = estate.Lift;
            estateFromDb.NotPopulated = estate.NotPopulated;
            estateFromDb.SeparateRooms = estate.SeparateRooms;
            estateFromDb.Status = estate.Status;
            estateFromDb.Square = estate.Square;
            estateFromDb.MakedRooms = estate.MakedRooms;
            estateFromDb.IsCeilingRepaired = estate.IsCeilingRepaired;
            estateFromDb.IsElectricityCablesChanged = estate.IsElectricityCablesChanged;
            estateFromDb.IsPipesChanged = estate.IsPipesChanged;
            estateFromDb.FloorAdditional = estate.FloorAdditional;
            estateFromDb.LandFront = estate.LandFront;
            estateFromDb.LandNumber = estate.LandNumber;
            estateFromDb.IsHasWarmingSystem = estate.IsHasWarmingSystem;
            estateFromDb.AdditionalConvenients = estate.AdditionalConvenients;
        }
        public static int SaveRealEstate(Estate estate, ref StringBuilder errorMessage)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                if (estate.CountryID.HasValue)
                {
                    estate.Country = db.Countries.SingleOrDefault(s => s.ID == estate.CountryID);
                }
                if (estate.StreetID.GetValueOrDefault(0) > 0)
                {
                    estate.Street = db.Streets.SingleOrDefault(s => s.StreetID == estate.StreetID);
                }
                if (estate.OrderTypeID.HasValue)
                {
                    estate.OrderType = db.OrderTypes.SingleOrDefault(s => s.OrderTypeID == estate.OrderTypeID);
                }
                if (estate.BrokerID.HasValue)
                {
                    estate.User = db.Users.SingleOrDefault(s => s.ID == estate.BrokerID);
                }
                if (estate.BuildingTypeID.HasValue)
                {
                    estate.BuildingType = db.BuildingTypes.SingleOrDefault(s => s.BuildingTypeID == estate.BuildingTypeID);
                }
                if (estate.CityID.HasValue)
                {
                    estate.City = db.Cities.SingleOrDefault(s => s.CityID == estate.CityID);
                }
                if (estate.CurrencyID.HasValue)
                {
                    estate.Currency = db.Currencies.SingleOrDefault(s => s.CurrencyID == estate.CurrencyID);
                }
                estate.EstateType = db.EstateTypes.SingleOrDefault(s => s.EstateTypeID == estate.EstateTypeID);
                if (estate.ProjectID.HasValue)
                {
                    estate.Project = db.Projects.SingleOrDefault(s => s.ProjectID == estate.ProjectID);
                }
                if (estate.RegionID.HasValue)
                {
                    estate.Region = db.Regions.SingleOrDefault(s => s.RegionID == estate.RegionID);
                }
                if (estate.RemontID.HasValue)
                {
                    estate.Remont = db.Remonts.SingleOrDefault(s => s.RemontID == estate.RemontID);
                }
                if (estate.StateID.HasValue)
                {
                    estate.State = db.States.SingleOrDefault(s => s.ID == estate.StateID);
                }
                if (estate.SignificanceOfTheUseID.HasValue)
                {
                    estate.SignificanceOfTheUse = db.SignificanceOfTheUses.SingleOrDefault(s => s.ID == estate.SignificanceOfTheUseID);
                }
                if (estate.OperationalSignificanceID.HasValue)
                {
                    estate.OperationalSignificance = db.OperationalSignificances.SingleOrDefault(s => s.ID == estate.OperationalSignificanceID);
                }
                if (estate.RoofingID.HasValue)
                {
                    estate.Roofing = db.Roofings.SingleOrDefault(s => s.ID == estate.RoofingID);
                }
                estate.LastModifiedDate = DateTime.Now;
                db.Estates.InsertOnSubmit(estate);
                db.SubmitChanges();
                if (!estate.OriginalID.HasValue)
                {
                    estate.OriginalID = estate.EstateID;
                    db.SubmitChanges();
                }
                return estate.EstateID;
            }
            catch (Exception ex)
            {
                errorMessage.AppendLine(ex.Message);
                return -1;
            }
        }

        public static List<Estate> GetEstatesByIDs(List<int> ids, bool isOfflineMode, User user)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
                var estates = db.Estates.Where(s => ids.Contains(s.EstateID)).Where(s => (s.IsSelledOrOrended == null || s.IsSelledOrOrended == false) &&
                                                                                    (s.IsDeleted == null || s.IsDeleted == false)).ToList();
                if (user.IsBroker)
                {
                    estates = GetUserEstates(estates, user);
                }
                return estates;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static int GetEstatesCount(bool isOfflineMode)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
                var estates = db.Estates.Where(s => (s.IsSelledOrOrended == null || s.IsSelledOrOrended == false) &&
                                                    (s.IsDeleted == null || s.IsDeleted == false));
                return estates.Count();
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static void AddToFavoriteEstates(int userID, List<int> estateIDs)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            var existingFavoriteEstates = db.FavoriteEstates.Where(s => estateIDs.Contains(s.EstateID) && s.UserID == userID);
            if (existingFavoriteEstates.Count() > 0)
            {
                foreach (var existingFavoriteEstate in existingFavoriteEstates)
                {
                    estateIDs.Remove(existingFavoriteEstate.EstateID);
                }
            }
            var favoriteEstates = estateIDs.Select(estateID => new FavoriteEstate { EstateID = estateID, UserID = userID });
            db.FavoriteEstates.InsertAllOnSubmit(favoriteEstates);
            db.SubmitChanges();
        }

        public static List<FavoriteEstate> GetFavoriteEstates(int userID, bool isOfflineMode)
        {
            if (userID <= 0) return null;

            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            return db.FavoriteEstates.Where(s => s.UserID == userID).ToList();
        }

        public static void DeleteFavoriteEstate(List<int> favoriteEstatesIds)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                var favoriteEstates = db.FavoriteEstates.Where(s => favoriteEstatesIds.Contains(s.EstateID));
                if (favoriteEstates.Count() > 0)
                {
                    db.FavoriteEstates.DeleteAllOnSubmit(favoriteEstates);
                    db.SubmitChanges();
                }
            }
            catch { }
        }

        public static List<SelledEstate> GetSoldEstates(SoldRentedEstateCriteria searchCriteria, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            var soldEstates = db.SelledEstates.Where(s => s.IsDeleted == null || s.IsDeleted == false);
            if (searchCriteria == null) return soldEstates.ToList();

            if (!string.IsNullOrEmpty(searchCriteria.Code))
            {
                soldEstates = soldEstates.Where(s => s.Estate.Code.StartsWith(searchCriteria.Code));
            }
            if (searchCriteria.EstateTypeID > 0)
            {
                soldEstates = soldEstates.Where(s => s.Estate.EstateTypeID == searchCriteria.EstateTypeID);
            }
            if (searchCriteria.RegionID > 0)
            {
                soldEstates = soldEstates.Where(s => s.Estate.RegionID == searchCriteria.RegionID);
            }
            if (searchCriteria.DateFrom.HasValue)
            {
                soldEstates = soldEstates.Where(s => s.SellDate >= searchCriteria.DateFrom);
            }
            if (searchCriteria.DateTo.HasValue)
            {
                soldEstates = soldEstates.Where(s => s.SellDate <= searchCriteria.DateTo);
            }
            if (searchCriteria.PriceFromInAMD.HasValue)
            {
                soldEstates = soldEstates.Where(s => s.PriceInAMD >= searchCriteria.PriceFromInAMD);
            }
            if (searchCriteria.PriceToInAMD.HasValue)
            {
                soldEstates = soldEstates.Where(s => s.PriceInAMD <= searchCriteria.PriceToInAMD);
            }
            return soldEstates.OrderByDescending(s => s.ID).ToList();
        }

        public static List<RentedEstate> GetRentedEstates(SoldRentedEstateCriteria searchCriteria, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            var rentedEstates = db.RentedEstates.Where(s => s.IsDeleted == null || s.IsDeleted == false);
            if (searchCriteria == null) return rentedEstates.ToList();

            if (searchCriteria.EstateTypeID > 0)
            {
                rentedEstates = rentedEstates.Where(s => s.Estate.EstateTypeID == searchCriteria.EstateTypeID);
            }
            if (searchCriteria.RegionID > 0)
            {
                rentedEstates = rentedEstates.Where(s => s.Estate.RegionID == searchCriteria.RegionID);
            }
            if (searchCriteria.DateFrom.HasValue)
            {
                rentedEstates = rentedEstates.Where(s => s.StartDate >= searchCriteria.DateFrom);
            }
            if (searchCriteria.DateTo.HasValue)
            {
                rentedEstates = rentedEstates.Where(s => s.StartDate <= searchCriteria.DateTo);
            }
            if (searchCriteria.PriceFromInAMD.HasValue)
            {
                rentedEstates = rentedEstates.Where(s => s.PriceInAMD >= searchCriteria.PriceFromInAMD);
            }
            if (searchCriteria.PriceToInAMD.HasValue)
            {
                rentedEstates = rentedEstates.Where(s => s.PriceInAMD <= searchCriteria.PriceToInAMD);
            }
            if (searchCriteria.PricePerDayFromInAMD.HasValue)
            {
                rentedEstates = rentedEstates.Where(s => s.PricePerDayInAMD >= searchCriteria.PricePerDayFromInAMD);
            }
            if (searchCriteria.PricePerDayToInAMD.HasValue)
            {
                rentedEstates = rentedEstates.Where(s => s.PricePerDayInAMD <= searchCriteria.PricePerDayToInAMD);
            }
            if (searchCriteria.EndDateFrom.HasValue)
            {
                rentedEstates = rentedEstates.Where(s => s.EndDate >= searchCriteria.EndDateFrom);
            }
            if (searchCriteria.EndDateTo.HasValue)
            {
                rentedEstates = rentedEstates.Where(s => s.EndDate <= searchCriteria.EndDateTo);
            }
            return rentedEstates.OrderByDescending(s => s.ID).ToList();
        }

        public static bool MarkAsSelled(SelledEstate estate)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            DbTransaction transaction = null;
            try
            {
                db.Connection.Open();
                transaction = db.Connection.BeginTransaction();
                db.Transaction = transaction;
                var estateInDB = db.Estates.First(s => s.EstateID == estate.EstateID);
                estateInDB.IsSelledOrOrended = true;
                estateInDB.LastModifiedDate = DateTime.Now;
                if (estate.CurrencyID.HasValue)
                {
                    estate.Currency = db.Currencies.First(s => s.CurrencyID == estate.CurrencyID);
                }
                if (estate.BrokerID.HasValue)
                {
                    estate.User = db.Users.First(s => s.ID == estate.BrokerID);
                }
                estate.LastModifiedDate = DateTime.Now;
                db.SelledEstates.InsertOnSubmit(estate);
                db.SubmitChanges();
                estate.OriginalID = estate.ID;
                db.SubmitChanges();
                transaction.Commit();
                return true;
            }
            catch
            {
                if (transaction != null)
                {
                    transaction.Rollback();
                }
                return false;
            }
        }

        public static bool UpdateSelledEstate(SelledEstate selledEstate)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                var seFromDB = db.SelledEstates.First(s => s.ID == selledEstate.ID);
                CopySoldEstateProperties(selledEstate, seFromDB);
                seFromDB.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        private static void CopySoldEstateProperties(SelledEstate selledEstate, SelledEstate seFromDB)
        {
            seFromDB.CurrencyID = selledEstate.CurrencyID;
            seFromDB.Price = selledEstate.Price;
            seFromDB.SellDate = selledEstate.SellDate;
            seFromDB.BrokerID = selledEstate.BrokerID;
        }

        public static bool MarkAsRented(RentedEstate rentedEstate)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            DbTransaction transaction = null;
            try
            {
                db.Connection.Open();
                transaction = db.Connection.BeginTransaction();
                db.Transaction = transaction;
                var estateInDB = db.Estates.First(s => s.EstateID == rentedEstate.EstateID);
                estateInDB.IsSelledOrOrended = true;
                estateInDB.LastModifiedDate = DateTime.Now;
                rentedEstate.Estate = db.Estates.FirstOrDefault(s => s.EstateID == rentedEstate.EstateID);
                rentedEstate.Currency = db.Currencies.FirstOrDefault(s => s.CurrencyID == rentedEstate.CurrencyID);
                rentedEstate.User = db.Users.FirstOrDefault(s => s.ID == rentedEstate.BrokerID);
                rentedEstate.LastModifiedDate = DateTime.Now;
                db.RentedEstates.InsertOnSubmit(rentedEstate);
                db.SubmitChanges();

                rentedEstate.OriginalID = rentedEstate.ID;
                db.SubmitChanges();

                transaction.Commit();
                return true;
            }
            catch
            {
                if (transaction != null)
                {
                    transaction.Rollback();
                }
                return false;
            }
        }

        public static bool UpdateRentedEstate(RentedEstate rentEstate)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                var seFromDB = db.RentedEstates.First(s => s.ID == rentEstate.ID);
                CopyRentedEstateProperties(rentEstate, seFromDB);
                seFromDB.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        private static void CopyRentedEstateProperties(RentedEstate rentEstate, RentedEstate seFromDB)
        {
            seFromDB.CurrencyID = rentEstate.CurrencyID;
            seFromDB.Price = rentEstate.Price;
            seFromDB.StartDate = rentEstate.StartDate;
            seFromDB.EndDate = rentEstate.EndDate;
            seFromDB.BrokerID = rentEstate.BrokerID;
            seFromDB.PricePerDay = rentEstate.PricePerDay;
        }

        public static bool ReturnSelledEstateToEstatesList(SelledEstate estate)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                Estate estateInDB = db.Estates.Single(s => s.EstateID == estate.EstateID);
                estateInDB.IsSelledOrOrended = null;
                estateInDB.LastModifiedDate = DateTime.Now;
                var soldEstate = db.SelledEstates.First(s => s.ID == estate.ID);
                soldEstate.LastModifiedDate = DateTime.Now;
                soldEstate.IsDeleted = true;
                //db.SelledEstates.DeleteOnSubmit(soldEstate);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool ReturnRentedEstateToEstatesList(RentedEstate rentedEstate)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                Estate estateInDB = db.Estates.First(s => s.EstateID == rentedEstate.EstateID);
                estateInDB.IsSelledOrOrended = null;
                //var selledEstateFromDB = db.RentedEstates.First(s => s.ID == rentedEstate.ID);
                //db.RentedEstates.DeleteOnSubmit(selledEstateFromDB);
                estateInDB.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool CheckEstate(Estate estate)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            var estates = db.Estates.Where(s => //(s.IsSelledOrOrended == null || s.IsSelledOrOrended == false) &&
                                                (s.IsDeleted == null || s.IsDeleted == false) &&
                                                s.EstateTypeID == estate.EstateTypeID && s.OrderTypeID == estate.OrderTypeID);
            if (estate.StreetID.HasValue)
            {
                estates = estates.Where(s => s.StreetID == estate.StreetID);
                switch (estate.EstateTypeID)
                {
                    case 1: //apt
                        if (!string.IsNullOrEmpty(estate.HomeNumber) && !string.IsNullOrEmpty(estate.AptNumber))
                        {
                            estates = estates.Where(s => s.HomeNumber == estate.HomeNumber && s.AptNumber == estate.AptNumber);
                            return estates.Any();
                        }
                        break;
                    case 2: //house
                        if (!string.IsNullOrEmpty(estate.HomeNumber))
                        {
                            estates = estates.Where(s => s.HomeNumber == estate.HomeNumber);
                            return estates.Any();
                        }
                        break;
                    case 3: //earth place
                        if (!string.IsNullOrWhiteSpace(estate.LandNumber))
                        {
                            estates = estates.Where(s => s.LandNumber == estate.LandNumber);
                            return estates.Any();
                        }
                        break;
                    case 4: //commercial place
                        if (!string.IsNullOrWhiteSpace(estate.HomeNumber))
                        {
                            estates = estates.Where(s => s.HomeNumber == estate.HomeNumber);
                        }
                        if (!string.IsNullOrWhiteSpace(estate.AptNumber))
                        {
                            estates = estates.Where(s => s.AptNumber == estate.AptNumber);
                        }
                        return estates.Any();
                }
            }

            return false;
        }

        public static bool ValidateEstateCode(Estate estate)
        {
            var estateWithSameCode = new DataClassesDataContext().Estates.FirstOrDefault(s => s.Code == estate.Code && (s.IsDeleted == null || s.IsDeleted == false));
            return estateWithSameCode == null || estate.EstateID == estateWithSameCode.EstateID;
        }

        public static void ChangeEstateUploadMark(Estate estate, bool isUploaded)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                var estateInDB = db.Estates.First(s => s.EstateID == estate.EstateID);
                estateInDB.IsUploadedToWeb = isUploaded;
                estateInDB.LastModifiedDate = DateTime.Now;

                db.SubmitChanges();
            }
            catch { }
        }

        public static List<Estate> MoveExpiredEstatesFromRentedEstates()
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                //_new.ReleatedNews.Join(db.News, rln => rln.ReleatedNewID, n => n.NewID, (rln, n) => n).OrderByDescending(s => s.AddDate).ToList();

                var rentedEstates = db.RentedEstates.
                    Join(db.Estates, s => s.Estate, n => n, (s, n) => s).
                    Where(s => s.EndDate <= DateTime.Now.Date && s.Estate.IsSelledOrOrended == true).ToList();

                if (rentedEstates.Count > 0)
                {
                    var estateIDs = rentedEstates.Select(s => s.EstateID);
                    var estates = db.Estates.Where(s => estateIDs.Contains(s.EstateID));
                    foreach (Estate estate in estates)
                    {
                        estate.IsSelledOrOrended = null;
                        estate.LastModifiedDate = DateTime.Now;
                    }
                    db.SubmitChanges();
                    return estates.ToList();
                }

            }
            catch (Exception ex)
            {
                var v = ex;
                string str = v.ToString();
            }
            return null;
        }

        public static ObservableCollection<Convenient> GetConvenients(bool isOfflineMode)
        {
            return new ObservableCollection<Convenient>(new DataClassesDataContext(GetConnectionString(isOfflineMode)).Convenients.Where(s => s.IsDeleted == null || s.IsDeleted == false));
        }

        public static ObservableCollection<Estate> SearchEstatesForShowDemand(DemandSearchCriteria searchParameters, bool isOfflineMode)
        {
            var db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            var estates = db.Estates.AsQueryable();
            if (!string.IsNullOrEmpty(searchParameters.Code))
            {
                return new ObservableCollection<Estate>(estates.Where(s => s.Code == searchParameters.Code));
            }

            if (!string.IsNullOrEmpty(searchParameters.Phone))
            {
                estates = estates.Where(s => s.PhonePrimary.Contains(searchParameters.Phone) || s.PhoneSecondary.Contains(searchParameters.Phone));
            }
            if (searchParameters.RoomCount.HasValue)
            {
                estates = estates.Where(s => s.RoomCount == searchParameters.RoomCount);
            }
            if (searchParameters.Square.HasValue)
            {
                estates = estates.Where(s => s.TotalSquare == searchParameters.Square || s.Square == searchParameters.Square);
            }
            return new ObservableCollection<Estate>(estates);
        }

        public static bool DeleteRentedEstate(RentedEstate rentedEstate)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            DbTransaction transaction = null;
            try
            {
                db.Connection.Open();
                transaction = db.Connection.BeginTransaction();
                db.Transaction = transaction;

                var rentedEstateFromDb = db.RentedEstates.Single(s => s.ID == rentedEstate.ID);
                rentedEstateFromDb.IsDeleted = true;
                rentedEstateFromDb.LastModifiedDate = DateTime.Now;
                //db.RentedEstates.DeleteOnSubmit(rentedEstateFromDb);

                var estate = db.Estates.Single(s => s.EstateID == rentedEstate.EstateID);
                estate.IsSelledOrOrended = null;
                estate.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();
                transaction.Commit();
                return true;
            }
            catch (Exception)
            {
                if (transaction != null)
                {
                    transaction.Rollback();
                }
                return false;
            }

        }

        public static DateTime GetRentLastChangeDate()
        {
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                var item = db.RentedEstates.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
                if (item == null) return DateTime.MinValue;
                return item.LastModifiedDate ?? DateTime.MinValue;
            }
        }

        public static List<RentedEstate> GetNewRentedEstates(DateTime lastChangeDate)
        {
            if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
            {
                lastChangeDate = Constants.SQLAcceptedMinDateValue;
            }
            using (var db = new DataClassesDataContext())
            {
                return db.RentedEstates.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
            }
        }

        public static void SynchronizeRentedEstates(List<RentedEstate> rentedEstates)
        {
            if (rentedEstates == null || rentedEstates.Count == 0) return;

            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                foreach (var item in rentedEstates)
                {
                    var itemInDB = db.RentedEstates.FirstOrDefault(s => s.OriginalID == item.ID);
                    if (itemInDB == null)
                    {
                        item.OriginalID = item.ID;
                        db.RentedEstates.InsertOnSubmit(item);
                    }
                    else
                    {
                        CopyRentedEstateProperties(item, itemInDB);
                        itemInDB.LastModifiedDate = item.LastModifiedDate;
                    }
                    db.SubmitChanges();
                }
            }
        }

        public static DateTime GetSoldEstatesLastChangeDate()
        {
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                var item = db.SelledEstates.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
                if (item == null) return DateTime.MinValue;
                return item.LastModifiedDate ?? DateTime.MinValue;
            }
        }

        public static List<SelledEstate> GetNewSoldEstates(DateTime lastChangeDate)
        {
            if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
            {
                lastChangeDate = Constants.SQLAcceptedMinDateValue;
            }
            using (var db = new DataClassesDataContext())
            {
                return db.SelledEstates.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
            }
        }

        public static void SynchronizeSoldEstates(List<SelledEstate> soldEstates)
        {
            if (soldEstates == null || soldEstates.Count == 0) return;

            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                foreach (var item in soldEstates)
                {
                    var itemInDB = db.SelledEstates.FirstOrDefault(s => s.OriginalID == item.ID);
                    if (itemInDB == null)
                    {
                        item.OriginalID = item.ID;
                        db.SelledEstates.InsertOnSubmit(item);
                    }
                    else
                    {
                        CopySoldEstateProperties(item, itemInDB);
                        itemInDB.LastModifiedDate = item.LastModifiedDate;
                    }
                    db.SubmitChanges();
                }
            }
        }

        public static DateTime GetLastChangeDate()
        {
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                var item = db.Estates.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
                if (item == null) return DateTime.MinValue;
                return item.LastModifiedDate ?? DateTime.MinValue;
            }
        }

        public static List<Estate> GetNewEstates(DateTime lastChangeDate)
        {
            if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
            {
                lastChangeDate = Constants.SQLAcceptedMinDateValue;
            }
            using (var db = new DataClassesDataContext())
            {
                var estates = db.Estates.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
                foreach (Estate estate in estates)
                {
                    estate.ImagesList = estate.EstateImages.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
                    estate.VideosList = estate.EstateVideos.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
                    estate.ConvenientsList = estate.EstateConvenients.ToList();
                }
                return estates;
            }
        }

        public static void SynchronizeEstates(List<Estate> estates)
        {
            if (estates == null || estates.Count == 0) return;

            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                foreach (Estate estate in estates)
                {
                    bool isNew = false;
                    Estate estateFromDB = db.Estates.FirstOrDefault(s => s.OriginalID == estate.ID);
                    if (estateFromDB == null)
                    {
                        isNew = true;
                        estateFromDB = new Estate();
                        estateFromDB.OriginalID = estate.ID;
                    }
                    else
                    {

                    }
                    CopyProperties(estateFromDB, estate, db);
                    estateFromDB.AddDate = estate.AddDate;
                    estateFromDB.LastModifiedDate = estate.LastModifiedDate;
                    if (estate.BrokerID.HasValue)
                    {
                        estateFromDB.User = db.Users.FirstOrDefault(s => s.OriginalID == estate.BrokerID);
                    }
                    if (estate.BuildingTypeID.HasValue)
                    {
                        estateFromDB.BuildingType = db.BuildingTypes.FirstOrDefault(s => s.OriginalID == estate.BuildingTypeID);
                    }
                    if (estate.CityID.HasValue)
                    {
                        estateFromDB.City = db.Cities.FirstOrDefault(s => s.OriginalID == estate.CityID);
                    }
                    if (estate.CurrencyID.HasValue)
                    {
                        estateFromDB.Currency = db.Currencies.FirstOrDefault(s => s.OriginalID == estate.CurrencyID);
                    }
                    if (estate.OperationalSignificanceID.HasValue)
                    {
                        estateFromDB.OperationalSignificance = db.OperationalSignificances.FirstOrDefault(s => s.OriginalID == estate.OperationalSignificanceID);
                    }
                    if (estate.ProjectID.HasValue)
                    {
                        estateFromDB.Project = db.Projects.FirstOrDefault(s => s.OriginalID == estate.ProjectID);
                    }
                    if (estate.RegionID.HasValue)
                    {
                        estateFromDB.Region = db.Regions.FirstOrDefault(s => s.OriginalID == estate.RegionID);
                    }
                    if (estate.RemontID.HasValue)
                    {
                        estateFromDB.Remont = db.Remonts.FirstOrDefault(s => s.OriginalID == estate.RemontID);
                    }
                    if (estate.RoofingID.HasValue)
                    {
                        estateFromDB.Roofing = db.Roofings.FirstOrDefault(s => s.OriginalID == estate.RoofingID);
                    }
                    if (estate.SignificanceOfTheUseID.HasValue)
                    {
                        estateFromDB.SignificanceOfTheUse = db.SignificanceOfTheUses.FirstOrDefault(s => s.OriginalID == estate.SignificanceOfTheUseID);
                    }
                    if (estate.StateID.HasValue)
                    {
                        estateFromDB.State = db.States.FirstOrDefault(s => s.OriginalID == estate.StateID);
                    }
                    if (estate.StreetID.HasValue)
                    {
                        estateFromDB.Street = db.Streets.FirstOrDefault(s => s.OriginalID == estate.StreetID);
                    }
                    if (isNew)
                    {
                        db.Estates.InsertOnSubmit(estateFromDB);
                    }
                    db.SubmitChanges();
                    if (estate.ImagesList != null && estate.ImagesList.Count > 0)
                    {
                        ImageManager.SynchronizeEstateImages(estateFromDB, estate.ImagesList);
                    }
                    if (estate.ConvenientsList != null && estate.ConvenientsList.Count > 0)
                    {
                        SynchronizeConvenients(estateFromDB, estate.ConvenientsList);
                    }
                }
            }
        }

        private static void SynchronizeConvenients(Estate estateFromDb, List<EstateConvenient> convenientsList)
        {
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                IQueryable<EstateConvenient> estateConvenients = db.EstateConvenients.Where(s => s.EstateID == estateFromDb.OriginalID);
                db.EstateConvenients.DeleteAllOnSubmit(estateConvenients);
                db.SubmitChanges();

                IEnumerable<EstateConvenient> convenientsToInsert = convenientsList.Select(s => new EstateConvenient
                                                                        {
                                                                            ConvenientID = s.ConvenientID,
                                                                            EstateID = estateFromDb.ID
                                                                        });
                db.EstateConvenients.InsertAllOnSubmit(convenientsToInsert);
                db.SubmitChanges();
            }
        }

        public static ObservableCollection<Estate> GetDeletedEstates(SoldRentedEstateCriteria searchCriteria, bool offlineMode)
        {
            var estates = new DataClassesDataContext(GetConnectionString(offlineMode)).Estates.Where(s => s.IsDeleted == true);
            if (!string.IsNullOrEmpty(searchCriteria.Code)) estates = estates.Where(s => s.Code == searchCriteria.Code);
            if (searchCriteria.EstateTypeID != 0) estates = estates.Where(s => s.EstateTypeID == searchCriteria.EstateTypeID);
            if (searchCriteria.RegionID != 0) estates = estates.Where(s => s.RegionID == searchCriteria.RegionID);
            if (searchCriteria.CurrencyID != 0)
            {
                if (searchCriteria.PriceFrom.HasValue) estates = estates.Where(s => s.PriceInAMD >= searchCriteria.PriceFromInAMD || s.PricePerDay >= searchCriteria.PriceFromInAMD);
                if (searchCriteria.PriceTo.HasValue) estates = estates.Where(s => s.PriceInAMD <= searchCriteria.PriceToInAMD || s.PriceInAMD <= searchCriteria.PricePerDayToInAMD);
            }
            if (searchCriteria.DateFrom.HasValue) estates = estates.Where(s => s.ShowDate >= searchCriteria.DateFrom);
            if (searchCriteria.DateTo.HasValue) estates = estates.Where(s => s.ShowDate >= searchCriteria.DateTo);
            return new ObservableCollection<Estate>(estates);
        }

        public static bool ReturnDeletedEstateToEstatesList(Estate estate)
        {
            using (var db = new DataClassesDataContext())
            {
                var est = db.Estates.FirstOrDefault(s => s.EstateID == estate.ID);
                if (est != null)
                {
                    est.IsDeleted = null;
                }
                try
                {
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
    }
}
