﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Common;
using System.Linq;
using RealEstate.Business.Helpers;
using RealEstate.Common;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;

namespace RealEstate.Business.Managers
{
    public class DemandManager : DataManagerBase
    {
        public static bool SaveDemand(NeededEstate demand)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            try
            {
                var newDemand = new NeededEstate
                                    {
                                        Code = demand.Code,
                                        AddDate = demand.AddDate,
                                        AdditionalDetails = demand.AdditionalDetails,
                                        User = demand.BrokerID.HasValue ? db.Users.FirstOrDefault(s => s.ID == demand.BrokerID) : null,
                                        Currency = db.Currencies.First(s => s.CurrencyID == demand.CurrencyID),
                                        FloorFrom = demand.FloorFrom,
                                        FloorTo = demand.FloorTo,
                                        IsHasGas = demand.IsHasGas,
                                        IsNeedForRent = demand.IsNeedForRent,
                                        IsWoterAlways = demand.IsWoterAlways,
                                        LastModifiedDate = DateTime.Now,
                                        NeededEstateTypes = demand.NeededEstateTypes,
                                        NeededRegions = demand.NeededRegions,
                                        NeededBuildingTypes = demand.NeededBuildingTypes,
                                        NeededProjects = demand.NeededProjects,
                                        NeededRemonts = demand.NeededRemonts,
                                        PriceFrom = demand.PriceFrom,
                                        PriceFromInAMD = demand.PriceFromInAMD,
                                        PriceTo = demand.PriceTo,
                                        PriceToInAMD = demand.PriceToInAMD,
                                        RoomCountFrom = demand.RoomCountFrom,
                                        RoomCountTo = demand.RoomCountTo,
                                        SellerName = demand.SellerName,
                                        SquareFrom = demand.SquareFrom,
                                        SquareTo = demand.SquareTo,
                                        Telephone1 = demand.Telephone1,
                                        Telephone2 = demand.Telephone2,
                                        IsEmpty = demand.IsEmpty,
                                        IsExchangePossible = demand.IsExchangePossible,
                                        IsHasGarage = demand.IsHasGarage,
                                        IsHasPodval = demand.IsHasPodval,
                                        IsHasThreePhaseElectricity = demand.IsHasThreePhaseElectricity,
                                        IsInFirstLine = demand.IsInFirstLine,
                                        IsInNewBuilding = demand.IsInNewBuilding,
                                        IsInNullableFloor = demand.IsInNullableFloor,
                                        IsHasFurniture = demand.IsHasFurniture,
                                        Email = demand.Email
                                    };
                db.NeededEstates.InsertOnSubmit(newDemand);
                db.SubmitChanges();
                if (!demand.OriginalID.HasValue)
                {
                    demand.OriginalID = demand.ID;
                    db.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool UpdateDemand(NeededEstate demand)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            DbTransaction transaction = null;
            try
            {
                db.Connection.Open();
                transaction = db.Connection.BeginTransaction();
                db.Transaction = transaction;

                var demandInDB = db.NeededEstates.FirstOrDefault(s => s.ID == demand.ID);
                if (demandInDB == null) return false;

                if (demandInDB.NeededEstateTypes != null)
                {
                    db.NeededEstateTypes.DeleteAllOnSubmit(demandInDB.NeededEstateTypes);
                }
                if (demandInDB.NeededRegions != null)
                {
                    db.NeededRegions.DeleteAllOnSubmit(demandInDB.NeededRegions);
                }
                if (demandInDB.NeededBuildingTypes != null)
                {
                    db.NeededBuildingTypes.DeleteAllOnSubmit(demandInDB.NeededBuildingTypes);
                }
                if (demandInDB.NeededProjects != null)
                {
                    db.NeededProjects.DeleteAllOnSubmit(demandInDB.NeededProjects);
                }
                if (demandInDB.NeededRemonts != null)
                {
                    db.NeededRemonts.DeleteAllOnSubmit(demandInDB.NeededRemonts);
                }

                db.SubmitChanges();

                if (demand.NeededEstateTypes != null)
                {
                    db.NeededEstateTypes.InsertAllOnSubmit(demand.NeededEstateTypes.Select(s => new NeededEstateType { EstateTypeID = s.EstateTypeID, NeededEstateID = demandInDB.ID }));
                }
                if (demand.NeededRegions != null)
                {
                    db.NeededRegions.InsertAllOnSubmit(demand.NeededRegions.Select(s => new NeededRegion { NeededEstateID = demandInDB.ID, RegionID = s.RegionID }));
                }
                if (demand.NeededBuildingTypes != null)
                {
                    db.NeededBuildingTypes.InsertAllOnSubmit(demand.NeededBuildingTypes.Select(s => new NeededBuildingType { BuildingTypeID = s.BuildingTypeID, DemandID = demandInDB.ID }));
                }
                if (demand.NeededProjects != null)
                {
                    db.NeededProjects.InsertAllOnSubmit(demand.NeededProjects.Select(s => new NeededProject { ProjectID = s.ProjectID, DemandID = demandInDB.ID }));
                }
                if (demand.NeededRemonts != null)
                {
                    db.NeededRemonts.InsertAllOnSubmit(demand.NeededRemonts.Select(s => new NeededRemont { NeededRemontID = s.NeededRemontID, DemandID = demandInDB.ID }));
                }

                CopyProperties(demandInDB, demand);
                demandInDB.LastModifiedDate = DateTime.Now;
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

        public static void CopyProperties(NeededEstate demandInDb, NeededEstate demand)
        {
            demandInDb.Code = demand.Code;
            demandInDb.AdditionalDetails = demand.AdditionalDetails;
            demandInDb.FloorFrom = demand.FloorFrom;
            demandInDb.FloorTo = demand.FloorTo;
            demandInDb.IsHasGas = demandInDb.IsHasGas;
            demandInDb.IsWoterAlways = demandInDb.IsWoterAlways;
            demandInDb.PriceFrom = demand.PriceFrom;
            demandInDb.PriceTo = demand.PriceTo;
            demandInDb.RoomCountFrom = demand.RoomCountFrom;
            demandInDb.RoomCountTo = demand.RoomCountTo;
            demandInDb.SellerName = demand.SellerName;
            demandInDb.SquareFrom = demand.SquareFrom;
            demandInDb.SquareTo = demand.SquareTo;
            demandInDb.Telephone1 = demand.Telephone1;
            demandInDb.Telephone2 = demand.Telephone2;
            demandInDb.CurrencyID = demand.CurrencyID;
            demandInDb.PriceFromInAMD = demand.PriceFromInAMD;
            demandInDb.PriceToInAMD = demand.PriceToInAMD;
            demandInDb.BrokerID = demand.BrokerID;
            demandInDb.IsNeedForRent = demand.IsNeedForRent;
            demandInDb.IsEmpty = demand.IsEmpty;
            demandInDb.IsExchangePossible = demand.IsExchangePossible;
            demandInDb.IsHasGarage = demand.IsHasGarage;
            demandInDb.IsHasGas = demand.IsHasGas;
            demandInDb.IsHasPodval = demand.IsHasPodval;
            demandInDb.IsHasThreePhaseElectricity = demand.IsHasThreePhaseElectricity;
            demandInDb.IsInFirstLine = demand.IsInFirstLine;
            demandInDb.IsInNewBuilding = demand.IsInNewBuilding;
            demandInDb.IsInNullableFloor = demand.IsInNullableFloor;
            demandInDb.IsHasFurniture = demand.IsHasFurniture;
            demandInDb.Email = demand.Email;
        }

        public static List<NeededEstate> GetAllDemands(User user, DemandSearchCriteria criteria, bool isOfflineMode)
        {
            var demands = GetAllDemands(criteria, isOfflineMode);
            demands = GetFilteredByUserAccessDemands(demands, user);

            if (demands != null)
            {
                return demands.ToList();
            }
            return new List<NeededEstate>();
        }

        private static IEnumerable<NeededEstate> GetFilteredByUserAccessDemands(IEnumerable<NeededEstate> demands, User user)
        {
            if (user == null) return null;

            if (user.IsAdminOrDirector)
            {
                return demands;
            }
            return demands.Where(s => s.BrokerID == user.ID);

            //var regionIDs = user.BrokersRegions.Select(s => s.RegionID).ToList();
            //if (regionIDs.Count > 0)
            //{
            //    demands = demands.SelectMany(s => s.NeededRegions, (s, v) => new { s, v }).Where(@t => regionIDs.Contains(@t.v.RegionID)).Select(@t => @t.s).Distinct();
            //}

            //var estateTypeIDs = user.BrokerEstateTypes.Select(s => s.EstateTypeID).ToList();
            //if (estateTypeIDs.Count > 0)
            //{
            //    demands = demands.SelectMany(s => s.NeededEstateTypes, (s, v) => new { s, v }).Where(@t => estateTypeIDs.Contains(@t.v.EstateTypeID)).Select(@t => @t.s).Distinct();
            //}
            //var orderTypeIDs = user.BrokerOrderTypes.Select(s => s.OrderTypeID).ToList();
            //if (orderTypeIDs.Count == 1)
            //{
            //    demands = demands.Where(s => s.IsNeedForRent == (orderTypeIDs[0] == 2));
            //}

            //return demands;
        }

        private static IEnumerable<NeededEstate> GetAllDemands(DemandSearchCriteria criteria, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            IQueryable<NeededEstate> demands = null;
            if (criteria != null && criteria.IsDeleted)
            {
                demands = db.NeededEstates.Where(s => s.IsDeleted == true).AsQueryable();
            }
            else
            {
                demands = db.NeededEstates.Where(s => s.IsDeleted == null || s.IsDeleted == false).AsQueryable();
            }
            if (criteria == null)
            {
                return demands.OrderByDescending(s => s.ID);
            }
            if (!string.IsNullOrEmpty(criteria.Code))
            {
                demands = demands.Where(s => s.Code == criteria.Code);
            }
            if (!string.IsNullOrEmpty(criteria.Name))
            {
                demands = demands.Where(s => s.SellerName.Contains(criteria.Name));
            }
            if (!string.IsNullOrEmpty(criteria.Phone))
            {
                demands = demands.Where(s => s.Telephone1.Contains(criteria.Phone) || s.Telephone2.Contains(criteria.Phone));
            }

            return demands.OrderByDescending(s => s.ID);
        }

        public static List<NeededEstate> GetDemandsByBroker(int brokerId, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            return db.NeededEstates.Where(s => s.BrokerID == brokerId && (s.IsDeleted == null || s.IsDeleted == false)).OrderByDescending(s => s.ID).ToList();
        }

        public static bool DeleteDemand(NeededEstate demand)
        {
            if (demand == null) return false;
            DataClassesDataContext db = new DataClassesDataContext();
            DbTransaction transaction = null;
            try
            {
                db.Connection.Open();
                transaction = db.Connection.BeginTransaction();
                db.Transaction = transaction;

                var demandInDb = db.NeededEstates.FirstOrDefault(s => s.ID == demand.ID);
                if (demandInDb == null) return false;

                //if (demandInDb.NeededEstateTypes.Count > 0)
                //{
                //    db.NeededEstateTypes.DeleteAllOnSubmit(demandInDb.NeededEstateTypes);
                //}
                //if (demandInDb.NeededRegions.Count > 0)
                //{
                //    db.NeededRegions.DeleteAllOnSubmit(demandInDb.NeededRegions);
                //}
                //if (demandInDb.EstatesAndDemands.Count > 0)
                //{
                //    db.EstatesAndDemands.DeleteAllOnSubmit(demandInDb.EstatesAndDemands);
                //}
                //db.NeededEstates.DeleteOnSubmit(demandInDb);
                demandInDb.LastModifiedDate = DateTime.Now;
                demandInDb.IsDeleted = true;
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

        public static int DeleteDemands(IEnumerable<NeededEstate> demands)
        {
            var faultsCount = demands.Count(demand => !DeleteDemand(demand));
            return faultsCount;
        }

        public static int GetAllDemandsCount(bool isOfflineMode)
        {
            try
            {
                return new DataClassesDataContext(GetConnectionString(isOfflineMode)).NeededEstates.Count(s => s.IsDeleted == null || s.IsDeleted == false);
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static List<NeededEstate> GetDemandsForEstate(Estate estate, User user, bool isOfflineMode)
        {
            if (estate == null || user == null) return null;

            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            var demands = from s in db.NeededEstates
                          where s.NeededEstateTypes.Select(r => r.EstateTypeID).Contains(estate.EstateTypeID) &&
                                (s.IsDeleted == null || s.IsDeleted == false)
                          select s;
            if (!user.IsAdminOrDirector)
            {
                demands = demands.Where(s => s.BrokerID == user.ID);
            }
            if (estate.Floor.HasValue)
            {
                demands = from s in demands
                          where (!s.FloorFrom.HasValue && !s.FloorTo.HasValue) ||
                                (s.FloorFrom.HasValue && s.FloorFrom <= estate.Floor && s.FloorTo.HasValue && s.FloorTo >= estate.Floor) ||
                                (s.FloorFrom.HasValue && !s.FloorTo.HasValue && s.FloorFrom <= estate.Floor) ||
                                (!s.FloorFrom.HasValue && s.FloorTo.HasValue && s.FloorTo >= estate.Floor)
                          select s;
            }
            if (estate.OrderTypeID.HasValue)
            {
                demands = demands.Where(s => s.IsNeedForRent == (estate.OrderTypeID == 2));
            }
            if (estate.Price.HasValue)
            {
                demands = from s in demands
                          where (!s.PriceFromInAMD.HasValue && !s.PriceToInAMD.HasValue) ||
                                (s.PriceFromInAMD.HasValue && s.PriceFromInAMD <= estate.PriceInAMD && s.PriceToInAMD.HasValue && s.PriceToInAMD >= estate.PriceInAMD) ||
                                (s.PriceFromInAMD.HasValue && !s.PriceToInAMD.HasValue && s.PriceFromInAMD <= estate.PriceInAMD) ||
                                (!s.PriceFromInAMD.HasValue && s.PriceToInAMD.HasValue && s.PriceToInAMD >= estate.PriceInAMD)
                          select s;
            }
            if (estate.RoomCount.HasValue)
            {
                demands = from s in demands
                          where (!s.RoomCountFrom.HasValue && !s.RoomCountTo.HasValue) ||
                                (s.RoomCountFrom.HasValue && s.RoomCountFrom <= estate.RoomCount && s.RoomCountTo.HasValue && s.RoomCountTo >= estate.RoomCount) ||
                                (s.RoomCountFrom.HasValue && !s.RoomCountTo.HasValue && s.RoomCountFrom <= estate.RoomCount) ||
                                (!s.RoomCountFrom.HasValue && s.RoomCountTo.HasValue && s.RoomCountTo >= estate.RoomCount)
                          select s;
            }
            if (estate.TotalSquare.HasValue)
            {
                demands = from s in demands
                          where (!s.SquareFrom.HasValue && !s.SquareTo.HasValue) ||
                                (s.SquareFrom.HasValue && s.SquareFrom <= estate.TotalSquare && s.SquareTo.HasValue && s.SquareTo >= estate.TotalSquare) ||
                                (s.SquareFrom.HasValue && !s.SquareTo.HasValue && s.SquareFrom <= estate.TotalSquare) ||
                                (!s.SquareFrom.HasValue && s.SquareTo.HasValue && s.SquareTo >= estate.TotalSquare)
                          select s;
            }
            if (estate.RegionID.HasValue)
            {
                demands = from s in demands
                          from r in db.NeededRegions.Where(nr => nr.NeededEstateID == s.ID).DefaultIfEmpty()
                          where (r == null || r.RegionID == estate.RegionID.Value)
                          select s;
            }

            if (estate.RemontID.HasValue)
            {
                demands = from s in demands
                          from r in db.NeededRemonts.Where(w => w.DemandID == s.ID).DefaultIfEmpty()
                          where (r == null || r.NeededRemontID == estate.RemontID.Value)
                          select s;
            }

            if (estate.ProjectID.HasValue)
            {
                demands = from s in demands
                          from p in db.NeededProjects.Where(np => np.DemandID == s.ID).DefaultIfEmpty()
                          where (p == null || p.ProjectID == estate.ProjectID.Value)
                          select s;
            }

            if (estate.BuildingTypeID.HasValue)
            {
                demands = from s in demands
                          from b in db.NeededBuildingTypes.Where(nb => nb.DemandID == s.ID).DefaultIfEmpty()
                          where (b == null || b.BuildingTypeID == estate.BuildingTypeID.Value)
                          select s;
            }


            //if (regionIDs != null && regionIDs.Count() > 0)
            //{
            //    demands = demands.SelectMany(s => s.NeededRegions, (s, v) => new { s, v }).Where(@t => regionIDs.Contains(@t.v.RegionID)).Select(@t => @t.s).Distinct();
            //}
            return demands.OrderByDescending(s => s.ID).ToList();
        }

        public static DateTime GetLastChangeDate()
        {
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                var item = db.NeededEstates.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
                if (item == null) return DateTime.MinValue;
                return item.LastModifiedDate ?? DateTime.MinValue;
            }
        }

        public static List<NeededEstate> GetNewDemands(DateTime lastChangeDate)
        {
            if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
            {
                lastChangeDate = Constants.SQLAcceptedMinDateValue;
            }
            using (var db = new DataClassesDataContext())
            {
                var demands = db.NeededEstates.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
                foreach (NeededEstate demand in demands)
                {
                    demand.BuildingTypesList = demand.BuildingTypesList.ToList();
                    demand.EstateTypesList = demand.NeededEstateTypes.ToList();
                    demand.ProjectsList = demand.ProjectsList.ToList();
                    demand.RegionsList = demand.NeededRegions.ToList();
                    demand.RemontsList = demand.RemontsList.ToList();
                }
                return demands;
            }
        }

        public static void SynchronizeDemands(List<NeededEstate> demands)
        {
            if (demands == null || demands.Count == 0) return;

            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                foreach (NeededEstate demand in demands)
                {
                    bool isNew = false;
                    var itemInDB = db.NeededEstates.FirstOrDefault(s => s.OriginalID == demand.ID);
                    if (itemInDB == null)
                    {
                        isNew = true;
                        itemInDB = new NeededEstate();
                        itemInDB.OriginalID = demand.ID;
                    }
                    else
                    {
                        db.NeededEstateTypes.DeleteAllOnSubmit(itemInDB.NeededEstateTypes);
                        db.NeededRegions.DeleteAllOnSubmit(itemInDB.NeededRegions);
                        db.NeededBuildingTypes.DeleteAllOnSubmit(itemInDB.BuildingTypesList);
                        db.NeededProjects.DeleteAllOnSubmit(itemInDB.ProjectsList);
                        db.NeededRemonts.DeleteAllOnSubmit(itemInDB.RemontsList);

                        db.SubmitChanges();
                    }
                    CopyProperties(itemInDB, demand);
                    itemInDB.LastModifiedDate = demand.LastModifiedDate;

                    if (demand.IsDeleted == null || demand.IsDeleted == false)
                    {

                        if (demand.BuildingTypesList != null && demand.BuildingTypesList.Count > 0)
                        {
                            itemInDB.BuildingTypesList.AddRange(demand.BuildingTypesList.Select(e => new NeededBuildingType
                            {
                                BuildingTypeID = db.BuildingTypes.First(s => s.OriginalID == e.BuildingTypeID).BuildingTypeID
                            }));
                        }
                        if (demand.EstateTypesList != null && demand.EstateTypesList.Count > 0)
                        {
                            itemInDB.NeededEstateTypes.AddRange(demand.NeededEstateTypes.Select(e => new NeededEstateType
                            {
                                EstateTypeID = e.EstateTypeID
                            }));
                        }
                        if (demand.ProjectsList != null && demand.ProjectsList.Count > 0)
                        {
                            itemInDB.ProjectsList.AddRange(demand.ProjectsList.Select(e => new NeededProject
                            {
                                ProjectID = db.Projects.First(s => s.OriginalID == e.ProjectID).ProjectID
                            }));
                        }
                        if (demand.RegionsList != null && demand.RegionsList.Count > 0)
                        {
                            itemInDB.NeededRegions.AddRange(demand.NeededRegions.Select(e => new NeededRegion
                            {
                                RegionID = db.Regions.First(s => s.OriginalID == e.RegionID).RegionID
                            }));
                        }
                        if (demand.RemontsList != null && demand.RemontsList.Count > 0)
                        {
                            itemInDB.RemontsList.AddRange(demand.RemontsList.Select(e => new NeededRemont
                            {
                                NeededRemontID = db.Remonts.First(s => s.OriginalID == e.NeededRemontID).RemontID
                            }));
                        }
                    }
                    if (isNew)
                    {
                        db.NeededEstates.InsertOnSubmit(itemInDB);
                    }
                    db.SubmitChanges();
                }
            }
        }

        public static bool ReturnToClientsList(NeededEstate neededEstate)
        {
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                try
                {
                    var client = db.NeededEstates.Single(s => s.ID == neededEstate.ID);
                    client.IsDeleted = null;
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public static ShowedAndOfferedEstates GetShowedAndOfferedEstates(int clientID)
        {
            var db = new DataClassesDataContext();
            return new ShowedAndOfferedEstates
            {
                ShowedEstates = db.EstatesAndDemands.Where(s => s.DemandID == clientID).ToList(),
                OfferedEstates = db.ClientSuggestedEstates.Where(s => s.ClientID == clientID).ToList()
            };

        }

        public static ObservableCollection<NeededEstate> GetFavoriteDemands(User user, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            return new ObservableCollection<NeededEstate>(db.FavoriteClients.Where(s => s.UserID == user.ID).Select(s => s.NeededEstate));
        }

        public static void AddFavoriteClient(int userID, IEnumerable<int> clientsIDs)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(false));
            var existingFavoriteClients = db.FavoriteClients.Where(s => s.UserID == userID && clientsIDs.Contains(s.ClientID));
            if (existingFavoriteClients.Any())
            {
                var ids = existingFavoriteClients.Select(s => s.ClientID);
                clientsIDs = clientsIDs.Where(s => !ids.Contains(s));

            }
            foreach (int clientID in clientsIDs)
            {
                db.FavoriteClients.InsertOnSubmit(new FavoriteClient
                {
                    ClientID = clientID,
                    UserID = userID
                });
            }
            db.SubmitChanges();
        }
    }
}
