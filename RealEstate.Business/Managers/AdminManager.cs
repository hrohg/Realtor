using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Text;
using RealEstate.Business.Helpers;
using RealEstate.Common;
using RealEstate.Common.Enumerations;
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;
using Realtor.DTL;
using Realtor.DTO;

namespace RealEstate.Business.Managers
{
    public class AdminManager : DataManagerBase
    {
        private static DataClassesDataContext dbMaster;
        private static DataClassesDataContext dbSlave;
        private static List<BlackListItem> _blackListItem;
        private static List<User> _users;
        private static List<Street> _streets;
        private static List<City> _cities;
        private static List<NeededEstate> _demands;
        private static List<Estate> _estates;
        private List<EstateImage> _estateImages;
        private static List<OperationalSignificance> _operationalSignificance;
        private static List<SignificanceOfTheUse> _significanceOfTheUse;
        public AdminManager()
        {
           dbMaster = new DataClassesDataContext(GetConnectionString(false));
        }

        public void LoadSlaveDbs()
        {
             
            dbSlave = new DataClassesDataContext(GetConnectionString(true));
            _blackListItem = dbSlave.BlackListItems.ToList();
            _users = dbSlave.Users.ToList();
            _streets = dbSlave.Streets.ToList();
            _cities = dbSlave.Cities.ToList();
            _demands = dbSlave.NeededEstates.ToList();
            _estates = dbSlave.Estates.ToList();
            _operationalSignificance = dbSlave.OperationalSignificances.ToList();
            _significanceOfTheUse = dbSlave.SignificanceOfTheUses.ToList();
        }
        public bool MergeUsers()
        {
            if (!SynchronizeUsers()) { return false; }
            return true;
        }
        public bool MergeBlackLists()
        {
            if (!SynchronizeBlackListName()) { return false; }
            if (!SynchronizeBlackListNumbers()) { return false; }
            return true;
        }
        public bool MergeSettings()
        {
            if (!SynchronizeSignificanceOfTheUses()) { return false; }
            //
            if (!SynchronizeStreets()) { return false; }
            if (!SynchronizeCities()) { return false; }
            //
            if (!SynchronizeBrokerStates()) { return false; }
            if (!SynchronizeBrokerRegions()) { return false; }
            if (!SynchronizeBrokerOrderTypes()) { return false; }
            if (!SynchronizeBrokerEstateTypes()) { return false; }
            
            //
            if (!SynchronizeNeededEstates()) { return false; }
            if (!SynchronizeNeededProjects()) { return false; }
            if (!SynchronizeNeededRemonts()) { return false; }
            if (!SynchronizeNeededBuildingTypes()) { return false; }
            if (!SynchronizeNeededRegion()) { return false; }
            if (!SynchronizeNeededEstateTypes()) { return false; }
            return true;
        }
        public bool MergeEstate()
        {
            if (!SynchronizeEstates()) { return false; }
            return true;
        } 
        public bool MergeEstateImages()
        {
            if (!SynchronizeEstateImages()) { return false; }
            return true;
        }
        public bool MergeEstateSettings()
        {
            if (!SynchronizeEstateConvenients()) { return false; }
            if (!SynchronizeOldPrice()) { return false; }
            if (!SynchronizeFavoriteEstate()) { return false; }
            if (!SynchronizeClientSuggestedEstates()) { return false; }
            if (!SynchronizeRentedEstates()) { return false; }
            if (!SynchronizeSelledEstates()) { return false; }
            if (!SynchronizeEstatesAndDemands()) { return false; }
            return true;
        }
        public static bool SynchronizeDbs()
        {
            return true;
        }
        /// <summary>
        /// BalckListItems
        /// </summary>
        /// <returns></returns>
        private static bool SynchronizeBlackListName()
        {
            var masterItems = dbMaster.BlackListItems.ToList();
            var slaveItems = dbSlave.BlackListItems.ToList();
            BlackListItem itemInDb;
            foreach (var item in slaveItems)
            {
                itemInDb = masterItems.FirstOrDefault(s => s.Name.ToLower() == item.Name.ToLower());
                if (itemInDb == null)
                {
                    itemInDb = new BlackListItem();
                    BlackListManager.CopyProperties(item, itemInDb);
                    dbMaster.BlackListItems.InsertOnSubmit(itemInDb);
                    dbMaster.SubmitChanges();
                }
                item.OriginalID = itemInDb.ID;
                dbSlave.SubmitChanges();
            }
            _blackListItem = dbSlave.BlackListItems.ToList();
            return true;
        }
        private static bool SynchronizeBlackListNumbers()
        {
            var masterItems = dbMaster.BlackListNumbers.ToList();
            var slaveItems = dbSlave.BlackListNumbers.ToList();
            foreach (var item in slaveItems)
            {
                if (masterItems.FirstOrDefault(s => s.BlackListItemID == _blackListItem.First(t => t.ID == item.BlackListItemID).OriginalID) == null)
                {
                    dbMaster.BlackListNumbers.InsertOnSubmit(new BlackListNumber
                    {
                        BlackListItemID = (int)_blackListItem.First(t => t.ID == item.BlackListItemID).OriginalID,
                        Phone = item.Phone,
                        LastModifiedDate = item.LastModifiedDate,
                        OriginalID = item.OriginalID,
                        IsDeleted = item.IsDeleted
                    });
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        /// <summary>
        /// Settings
        /// </summary>
        /// <returns></returns>
        private static bool SynchronizeStreets()
        {
            var masterItems = dbMaster.Streets.ToList();
            var slaveItems = dbSlave.Streets.ToList();
            Street itemInDb;
            foreach (var item in slaveItems)
            {
                itemInDb = masterItems.FirstOrDefault(s => s.NameAm.ToLower() == item.NameAm.ToLower());
                if (itemInDb == null)
                {
                    itemInDb = new Street();
                    StreetManager.CopyProperties(item, itemInDb);
                    dbMaster.Streets.InsertOnSubmit(itemInDb);
                    dbMaster.SubmitChanges();
                }
                item.OriginalID = itemInDb.StreetID;
                dbSlave.SubmitChanges();
            }
            _streets = dbSlave.Streets.ToList();
            return true;
        }
        private static bool SynchronizeCities()
        {
            var masterItems = dbMaster.Cities.ToList();
            var slaveItems = dbSlave.Cities.ToList();
            City itemInDb;
            foreach (var item in slaveItems)
            {
                itemInDb = masterItems.FirstOrDefault(s => s.NameAm.ToLower() == item.NameAm.ToLower());
                if (itemInDb == null)
                {
                    itemInDb = new City();
                    CityManager.CopyProperties(item, itemInDb);
                    dbMaster.Cities.InsertOnSubmit(itemInDb);
                    dbMaster.SubmitChanges();
                }
                item.OriginalID = itemInDb.CityID;
                dbSlave.SubmitChanges();
            }
            _cities = dbSlave.Cities.ToList();
            return true;
        }
        /// <summary>
        /// Users
        /// </summary>
        /// <returns></returns>
        private static bool SynchronizeUsers()
        {
            var masterItems = dbMaster.Users.ToList();
            var slaveItems = dbSlave.Users.ToList();
            var itemInDb = new User();
            foreach (var item in slaveItems)
            {
                if (item.ID != 54) { continue; }
                if (masterItems.FirstOrDefault(s => s.UserName == item.UserName) == null)
                {
                    UserManager.CopyProperties(itemInDb, item);
                    itemInDb.OriginalID = item.OriginalID;
                    dbMaster.Users.InsertOnSubmit(itemInDb);
                }
                var exItem = masterItems.FirstOrDefault(s => s.UserName == item.UserName);
                //if (exItem == null)
                //{
                //    return false;
                //}
                //item.OriginalID = exItem.ID;
                dbMaster.SubmitChanges();
            }
            _users = dbSlave.Users.ToList();
            return true;
        } 
        private static bool SynchronizeSignificanceOfTheUses()
        {
            var masterItems = dbMaster.SignificanceOfTheUses.ToList();
            var slaveItems = dbSlave.SignificanceOfTheUses.ToList();
            foreach (var item in slaveItems)
            {
                var itemInDb = masterItems.FirstOrDefault(s => s.NameAm.ToLower() == item.NameAm.ToLower());
                if (itemInDb == null)
                {
                    itemInDb = new SignificanceOfTheUse();
                    itemInDb.NameAm = item.NameAm;
                    itemInDb.EstateTypeID = item.EstateTypeID;
                    itemInDb.IsDeleted = item.IsDeleted;
                    dbMaster.SignificanceOfTheUses.InsertOnSubmit(itemInDb); 
                    dbMaster.SubmitChanges();
                }
                item.OriginalID = itemInDb.ID;
                dbSlave.SubmitChanges();
            }
            return true;
        }
        /// <summary>
        /// Brokers
        /// </summary>
        /// <returns></returns>
        private static bool SynchronizeBrokerStates()
        {
            var masterItems = dbMaster.BrokerStates.ToList();
            var slaveItems = dbSlave.BrokerStates.ToList();
            foreach (var item in slaveItems)
            {
                if (masterItems.FirstOrDefault(s => s.BrokerID == _users.First(t => t.ID == item.BrokerID).OriginalID && s.StateID == item.StateID) == null)
                {
                    dbMaster.BrokerStates.InsertOnSubmit(new BrokerState { BrokerID = (int)_users.First(t => t.ID == item.BrokerID).OriginalID, StateID = item.StateID });
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeBrokerRegions()
        {
            var masterItems = dbMaster.BrokersRegions.ToList();
            var slaveItems = dbSlave.BrokersRegions.ToList();
            foreach (var item in slaveItems)
            {
                if (masterItems.FirstOrDefault(s => s.BrokerID == _users.First(t => t.ID == item.BrokerID).OriginalID && s.RegionID == item.RegionID) == null)
                {
                    dbMaster.BrokersRegions.InsertOnSubmit(new BrokersRegion { BrokerID = (int)_users.First(t => t.ID == item.BrokerID).OriginalID, RegionID = item.RegionID }); dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeBrokerOrderTypes()
        {
            var masterItems = dbMaster.BrokerOrderTypes.ToList();
            var slaveItems = dbSlave.BrokerOrderTypes.ToList();
            foreach (var item in slaveItems)
            {
                if (masterItems.FirstOrDefault(s => s.BrokerID == _users.First(t => t.ID == item.BrokerID).OriginalID && s.OrderTypeID == item.OrderTypeID) == null)
                {
                    dbMaster.BrokerOrderTypes.InsertOnSubmit(new BrokerOrderType { BrokerID = (int)_users.First(t => t.ID == item.BrokerID).OriginalID, OrderTypeID = item.OrderTypeID }); dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeBrokerEstateTypes()
        {
            var masterItems = dbMaster.BrokerEstateTypes.ToList();
            var slaveItems = dbSlave.BrokerEstateTypes.ToList();
            foreach (var item in slaveItems)
            {
                if (masterItems.FirstOrDefault(s => s.BrokerID == _users.First(t => t.ID == item.BrokerID).OriginalID && s.EstateTypeID == item.EstateTypeID) == null)
                {
                    dbMaster.BrokerEstateTypes.InsertOnSubmit(new BrokerEstateType { BrokerID = (int)_users.First(t => t.ID == item.BrokerID).OriginalID, EstateTypeID = item.EstateTypeID }); dbMaster.SubmitChanges();
                }
            }
            return true;
        }
       
        /// <summary>
        /// Demands
        /// </summary>
        /// <param name="state"></param>
        /// <param name="isOfflineMode"></param>
        /// <returns></returns>
        private static bool SynchronizeNeededEstates()
        {
            var masterItems = dbMaster.NeededEstates.ToList();
            var slaveItems = dbSlave.NeededEstates.ToList();
            NeededEstate itemInDb;
            foreach (var item in slaveItems)
            {
                itemInDb = masterItems.FirstOrDefault(s => s.ID == item.ID);
                if (itemInDb == null)
                {
                    itemInDb = new NeededEstate();
                    DemandManager.CopyProperties(itemInDb, item);
                    if (item.BrokerID != null)
                    { itemInDb.BrokerID = _users.First(s => s.ID == itemInDb.BrokerID).OriginalID; }
                    dbMaster.NeededEstates.InsertOnSubmit(itemInDb);
                }
                else
                {
                    if (item.BrokerID != null)
                    { itemInDb.BrokerID = _users.First(s => s.ID == item.BrokerID).OriginalID; }
                }
                dbMaster.SubmitChanges();
                item.OriginalID = itemInDb.ID;
                dbSlave.SubmitChanges();
            }
            _demands = dbSlave.NeededEstates.ToList();
            return true;
        }
        private static bool SynchronizeNeededProjects()
        {
            var masterItems = dbMaster.NeededProjects.ToList();
            var slaveItems = dbSlave.NeededProjects.ToList();
            foreach (var item in slaveItems)
            {
                if (_demands.FirstOrDefault(t => t.ID == item.DemandID) == null) { continue; }
                if (masterItems.FirstOrDefault(s => s.DemandID == _demands.First(t => t.ID == item.DemandID).OriginalID && s.ProjectID == item.ProjectID) == null)
                {
                    dbMaster.NeededProjects.InsertOnSubmit(new NeededProject
                    {
                        DemandID = (int)_demands.First(t => t.ID == item.DemandID).OriginalID,
                        ProjectID = item.ProjectID
                    });
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeNeededRemonts()
        {
            var masterItems = dbMaster.NeededRemonts.ToList();
            var slaveItems = dbSlave.NeededRemonts.ToList();
            foreach (var item in slaveItems)
            {
                if (_demands.FirstOrDefault(t => t.ID == item.DemandID) == null) { continue; }
                if (masterItems.FirstOrDefault(s => s.DemandID == _demands.First(t => t.ID == item.DemandID).OriginalID && s.NeededRemontID == item.NeededRemontID) == null)
                {
                    dbMaster.NeededRemonts.InsertOnSubmit(new NeededRemont
                    {
                        DemandID = (int)_demands.First(t => t.ID == item.DemandID).OriginalID,
                        NeededRemontID = item.NeededRemontID
                    });
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeNeededBuildingTypes()
        {
            var masterItems = dbMaster.NeededBuildingTypes.ToList();
            var slaveItems = dbSlave.NeededBuildingTypes.ToList();
            foreach (var item in slaveItems)
            {
                if (_demands.FirstOrDefault(t => t.ID == item.DemandID) == null) { continue; }
                if (masterItems.FirstOrDefault(s => s.DemandID == _demands.First(t => t.ID == item.DemandID).OriginalID && s.BuildingTypeID == item.BuildingTypeID) == null)
                {
                    dbMaster.NeededBuildingTypes.InsertOnSubmit(new NeededBuildingType
                    {
                        DemandID = (int)_demands.First(t => t.ID == item.DemandID).OriginalID,
                        BuildingTypeID = item.BuildingTypeID
                    });
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeNeededRegion()
        {
            var masterItems = dbMaster.NeededRegions.ToList();
            var slaveItems = dbSlave.NeededRegions.ToList();
            foreach (var item in slaveItems)
            {
                if (_demands.FirstOrDefault(t => t.ID == item.NeededEstateID) == null) { continue; }
                if (masterItems.FirstOrDefault(s => s.NeededEstateID == _demands.First(t => t.ID == item.NeededEstateID).OriginalID && s.RegionID == item.RegionID) == null)
                {
                    dbMaster.NeededRegions.InsertOnSubmit(new NeededRegion
                    {
                        NeededEstateID = (int)_demands.First(t => t.ID == item.NeededEstateID).OriginalID,
                        RegionID = item.RegionID
                    });
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeNeededEstateTypes()
        {
            var masterItems = dbMaster.NeededEstateTypes.ToList();
            var slaveItems = dbSlave.NeededEstateTypes.ToList();
            foreach (var item in slaveItems)
            {
                if (_demands.FirstOrDefault(t => t.ID == item.NeededEstateID) == null) { continue; }
                if (masterItems.FirstOrDefault(s => s.NeededEstateID == _demands.First(t => t.ID == item.NeededEstateID).OriginalID && s.EstateTypeID == item.EstateTypeID) == null)
                {
                    dbMaster.NeededEstateTypes.InsertOnSubmit(new NeededEstateType
                    {
                        NeededEstateID = (int)_demands.First(t => t.ID == item.NeededEstateID).OriginalID,
                        EstateTypeID = item.EstateTypeID
                    });
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        /// <summary>
        /// Estates
        /// </summary>
        /// <param name="state"></param>
        /// <param name="isOfflineMode"></param>
        /// <returns></returns>
        private static bool SynchronizeEstates()
        {
            var masterItems = dbMaster.Estates.ToList();
            var slaveItems = dbSlave.Estates.ToList();
            Estate itemInDb;
            foreach (var item in slaveItems)
            {
                itemInDb = masterItems.FirstOrDefault(s => String.Equals(s.Code, item.Code, StringComparison.CurrentCultureIgnoreCase));
                if (itemInDb == null)
                {
                    itemInDb = new Estate();
                    EstateManager.CopyProperties(itemInDb, item);
                    if (item.BrokerID != null)
                    {
                        itemInDb.BrokerID = _users.First(s => s.ID == item.BrokerID).OriginalID;
                    }
                    if (item.CityID != null)
                    { itemInDb.CityID = _cities.First(s => s.CityID == item.CityID).OriginalID; }
                    if (item.StreetID != null)
                    { itemInDb.StreetID = _streets.First(s => s.StreetID == itemInDb.StreetID).OriginalID; }
                    itemInDb.OperationalSignificanceID = item.OperationalSignificanceID != null ? 
                        _operationalSignificance.First(s => s.ID == item.OperationalSignificanceID).OriginalID : null;
                    itemInDb.SignificanceOfTheUseID = item.SignificanceOfTheUseID != null ? 
                        _significanceOfTheUse.First(s => s.ID == item.SignificanceOfTheUseID).OriginalID : null;

                    
                    dbMaster.Estates.InsertOnSubmit(itemInDb);
                }
                else
                {
                    itemInDb.SignificanceOfTheUseID = item.SignificanceOfTheUseID != null ?
                        _significanceOfTheUse.First(s => s.ID == item.SignificanceOfTheUseID).OriginalID : null;
                }
                dbMaster.SubmitChanges();
                item.OriginalID = itemInDb.EstateID;
                try
                {
                    dbSlave.SubmitChanges();
                }
                catch (Exception)
                {
                    return false;
                }

            }
            _estates = dbSlave.Estates.ToList();
            return true;
        }
        /// <summary>
        /// Estate settings
        /// </summary>
        /// <returns></returns>
        private static bool SynchronizeEstateImages()
        {
            var masterItems = dbMaster.EstateImages.ToList();
            var slaveItems = dbSlave.EstateImages.ToList();
            int? estateId;
            EstateImage estateImage;
            foreach (var item in slaveItems)
            {

                estateId = _estates.First(t => t.ID == item.EstateID).OriginalID;
                if (masterItems.FirstOrDefault(s => s.EstateID == estateId && s.ImageID == item.ImageID) == null)
                {
                    estateImage = new EstateImage
                       {
                           EstateID = (int)estateId,
                           ImageID = item.ImageID,
                           ImageTypeID = item.ImageTypeID,
                           LastModifiedDate = item.LastModifiedDate,
                           IsDeleted = item.IsDeleted,
                           OriginalID = item.ImageID,
                           IsMain = item.IsMain,
                           ShowInSite = item.ShowInSite
                       };
                    dbMaster.EstateImages.InsertOnSubmit(estateImage);
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeEstateConvenients()
        {
            var masterItems = dbMaster.EstateConvenients.ToList();
            var slaveItems = dbSlave.EstateConvenients.ToList();
            int? estateId;
            foreach (var item in slaveItems)
            {
                estateId = _estates.First(t => t.ID == item.EstateID).OriginalID;
                if (masterItems.FirstOrDefault(s => s.EstateID == estateId && s.ConvenientID == item.ConvenientID) == null)
                {
                    dbMaster.EstateConvenients.InsertOnSubmit(new EstateConvenient { EstateID = (int)estateId, ConvenientID = item.ConvenientID }); dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeOldPrice()
        {
            var masterItems = dbMaster.OldPrices.ToList();
            var slaveItems = dbSlave.OldPrices.ToList();
            int? estateId;
            OldPrice newItem;
            foreach (var item in slaveItems)
            {

                estateId = _estates.First(t => t.ID == item.EstateID).OriginalID;
                if (masterItems.FirstOrDefault(s => s.EstateID == estateId) == null)
                {
                    newItem = new OldPrice
                    {
                        EstateID = (int)estateId,
                        ChangeDate = item.ChangeDate,
                        CurrencyID = item.CurrencyID,
                        OldPrice1 = item.OldPrice1,
                    };
                    dbMaster.OldPrices.InsertOnSubmit(newItem);
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeFavoriteEstate()
        {
            var masterItems = dbMaster.FavoriteEstates.ToList();
            var slaveItems = dbSlave.FavoriteEstates.ToList();
            int? estateId;
            int? userId;
            FavoriteEstate newItem;
            foreach (var item in slaveItems)
            {

                estateId = _estates.First(t => t.ID == item.EstateID).OriginalID;
                userId = _users.First(t => t.ID == item.UserID).OriginalID;
                if (masterItems.FirstOrDefault(s => s.EstateID == estateId && s.UserID == userId) == null)
                {
                    newItem = new FavoriteEstate
                    {
                        EstateID = (int)estateId,
                        UserID = (int)userId
                    };
                    dbMaster.FavoriteEstates.InsertOnSubmit(newItem);
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeClientSuggestedEstates()
        {
            var masterItems = dbMaster.ClientSuggestedEstates.ToList();
            var slaveItems = dbSlave.ClientSuggestedEstates.ToList();
            int? estateId;
            int? userId;
            ClientSuggestedEstate newItem;
            foreach (var item in slaveItems)
            {
                estateId = _estates.First(t => t.ID == item.EstateID).OriginalID;
                userId =item.BrokerID != null? _users.First(t => t.ID == item.BrokerID).OriginalID:null;
                if (masterItems.FirstOrDefault(s => s.EstateID == estateId && s.ClientID == item.ClientID) == null)
                {
                    newItem = new ClientSuggestedEstate
                    {
                        EstateID = (int)estateId,
                        ClientID = item.ClientID,
                        SuggestDate = item.SuggestDate,
                        BrokerID = userId,
                        Comment = item.Comment
                    };
                    dbMaster.ClientSuggestedEstates.InsertOnSubmit(newItem);
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeRentedEstates()
        {
            var masterItems = dbMaster.RentedEstates.ToList();
            var slaveItems = dbSlave.RentedEstates.ToList();
            int? estateId;
            int? userId;
            RentedEstate newItem;
            foreach (var item in slaveItems)
            {

                estateId = _estates.First(t => t.ID == item.EstateID).OriginalID;
                userId = item.BrokerID!=null? _users.First(t => t.ID == item.BrokerID).OriginalID:null;
                if (masterItems.FirstOrDefault(s => s.EstateID == estateId) == null)
                {
                    newItem = new RentedEstate
                    {
                        EstateID = (int)estateId,
                        StartDate = item.StartDate,
                        EndDate = item.EndDate,
                        Price = item.Price,
                        CurrencyID = item.CurrencyID,
                        BrokerID = userId,
                        PricePerDay = item.PricePerDay,
                        PriceInAMD = item.PriceInAMD,
                        PricePerDayInAMD = item.PricePerDayInAMD,
                        LastModifiedDate = item.LastModifiedDate,
                        IsDeleted = item.IsDeleted,
                        OriginalID = item.OriginalID
                    };
                    dbMaster.RentedEstates.InsertOnSubmit(newItem);
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeSelledEstates()
        {
            var masterItems = dbMaster.SelledEstates.ToList();
            var slaveItems = dbSlave.SelledEstates.ToList();
            int? estateId;
            int? userId;
            SelledEstate newItem;
            foreach (var item in slaveItems)
            {

                estateId = _estates.First(t => t.ID == item.EstateID).OriginalID;
                userId = item.BrokerID != null ? _users.First(t => t.ID == item.BrokerID).OriginalID : null;
                if (masterItems.FirstOrDefault(s => s.EstateID == estateId) == null)
                {
                    newItem = new SelledEstate
                    {
                        EstateID = (int)estateId,
                        Price = item.Price,
                        SellDate = item.SellDate,
                        CurrencyID = item.CurrencyID,
                        BrokerID = userId,
                        PriceInAMD = item.PriceInAMD,
                        LastModifiedDate = item.LastModifiedDate,
                        IsDeleted = item.IsDeleted,
                        OriginalID = item.OriginalID
                    };
                    dbMaster.SelledEstates.InsertOnSubmit(newItem);
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        private static bool SynchronizeEstatesAndDemands()
        {
            var masterItems = dbMaster.EstatesAndDemands.ToList();
            var slaveItems = dbSlave.EstatesAndDemands.ToList();
            int? estateId;
            int? userId;
            int? demandId;
            EstatesAndDemand newItem;
            foreach (var item in slaveItems)
            {

                estateId = _estates.First(t => t.ID == item.EstateID).OriginalID;
                demandId = _demands.First(t => t.ID == item.DemandID).OriginalID;
                userId = item.BrokerID != null ? _users.First(t => t.ID == item.BrokerID).OriginalID : null;
                if (masterItems.FirstOrDefault(s => s.EstateID == estateId && s.DemandID == demandId) == null)
                {
                    newItem = new EstatesAndDemand
                    {
                        EstateID = (int)estateId,
                        DemandID = (int)demandId,
                        ShowDate = item.ShowDate,
                        BrokerID = userId,
                        DemandOriginalID = item.DemandOriginalID,
                        EstateOriginalID = item.EstateOriginalID,
                        LastModifiedDate = item.LastModifiedDate,
                        IsDeleted = item.IsDeleted,
                        Comment = item.Comment
                    };
                    dbMaster.EstatesAndDemands.InsertOnSubmit(newItem);
                    dbMaster.SubmitChanges();
                }
            }
            return true;
        }
        public bool CorrectDb()
        {
            Estate exItem;
            foreach (var item in _estates)
            {
                exItem = dbMaster.Estates.FirstOrDefault(s => s.EstateID == item.OriginalID);
                if (exItem == null) { continue; }
                if(!exItem.CurrencyID.HasValue && item.CurrencyID.HasValue) {exItem.CurrencyID = item.CurrencyID;}
if (!exItem.RegionID.HasValue && item.RegionID.HasValue) {exItem.RegionID = item.RegionID;}
if (!exItem.RemontID.HasValue && item.RemontID.HasValue) { exItem.RemontID = item.RemontID; }
if (!exItem.AddressID.HasValue && item.AddressID.HasValue) { exItem.AddressID = item.AddressID; }
if (!exItem.ProjectID.HasValue && item.ProjectID.HasValue) { exItem.ProjectID = item.ProjectID; }
if (!exItem.BuildingTypeID.HasValue && item.BuildingTypeID.HasValue) { exItem.BuildingTypeID = item.BuildingTypeID; }
if (!exItem.OrderTypeID.HasValue && item.OrderTypeID.HasValue) { exItem.OrderTypeID = item.OrderTypeID; }
if (!exItem.AddDate.HasValue && item.AddDate.HasValue) { exItem.AddDate = item.AddDate; }
if (!exItem.EarthPlaceTypeID.HasValue && item.EarthPlaceTypeID.HasValue) { exItem.EarthPlaceTypeID = item.EarthPlaceTypeID; }
if (!exItem.StateID.HasValue && item.StateID.HasValue) { exItem.StateID = item.StateID; }
if (!exItem.GarageTypeID.HasValue && item.GarageTypeID.HasValue) { exItem.GarageTypeID = item.GarageTypeID; }
if (!exItem.PriceTypeID.HasValue && item.PriceTypeID.HasValue) { exItem.PriceTypeID = item.PriceTypeID; }
if (!exItem.OfficePlaceTypeID.HasValue && item.OfficePlaceTypeID.HasValue) { exItem.OfficePlaceTypeID = item.OfficePlaceTypeID; }
if (!exItem.IsSelledOrOrended.HasValue && item.IsSelledOrOrended.HasValue) { exItem.IsSelledOrOrended = item.IsSelledOrOrended; }
if (!exItem.IsHasElectricityPosibility.HasValue && item.IsHasElectricityPosibility.HasValue) { exItem.IsHasElectricityPosibility = item.IsHasElectricityPosibility; }
if (!exItem.IsUploadedToWeb.HasValue && item.IsUploadedToWeb.HasValue) { exItem.IsUploadedToWeb = item.IsUploadedToWeb; }
if (!exItem.LastModifiedDate.HasValue && item.LastModifiedDate.HasValue) { exItem.LastModifiedDate = item.LastModifiedDate; }
if (!exItem.IsSelledOrOrended.HasValue && item.IsSelledOrOrended.HasValue) { exItem.IsSelledOrOrended = item.IsSelledOrOrended; }
if (!exItem.SignificanceOfTheUseID.HasValue && item.SignificanceOfTheUseID.HasValue) { exItem.SignificanceOfTheUseID = item.SignificanceOfTheUseID; }
if (!exItem.OperationalSignificanceID.HasValue && item.OperationalSignificanceID.HasValue) { exItem.OperationalSignificanceID = item.OperationalSignificanceID; }
if (!exItem.RoofingID.HasValue && item.RoofingID.HasValue) { exItem.RoofingID = item.RoofingID; }
if (!exItem.PricePerDayInAMD.HasValue && item.PricePerDayInAMD.HasValue) { exItem.PricePerDayInAMD = item.PricePerDayInAMD; }
if (!exItem.IsHasInternet.HasValue && item.IsHasInternet.HasValue) { exItem.IsHasInternet = item.IsHasInternet; }
if (!exItem.IsHasAntena.HasValue && item.IsHasAntena.HasValue) { exItem.IsHasAntena = item.IsHasAntena; }
if (!exItem.IsHasTechnique.HasValue && item.IsHasTechnique.HasValue) { exItem.IsHasTechnique = item.IsHasTechnique; }
if (!exItem.IsHasFencing.HasValue && item.IsHasFencing.HasValue) { exItem.IsHasFencing = item.IsHasFencing; }
if (!exItem.IsHasSomething.HasValue && item.IsHasSomething.HasValue) { exItem.IsHasSomething = item.IsHasSomething; }
if (!exItem.IsDeleted.HasValue && item.IsDeleted.HasValue) { exItem.IsDeleted = item.IsDeleted; }
if (!exItem.IsHasSauna.HasValue && item.IsHasSauna.HasValue) { exItem.IsHasSauna = item.IsHasSauna; }
if (!exItem.CountryID.HasValue && item.CountryID.HasValue) { exItem.CountryID = item.CountryID; }
if (!exItem.IsOverseas.HasValue && item.IsOverseas.HasValue) { exItem.IsOverseas = item.IsOverseas; }
if (!exItem.ChangeToBrokerDate.HasValue && item.ChangeToBrokerDate.HasValue) { exItem.ChangeToBrokerDate = item.ChangeToBrokerDate; }


                try
                {
                    dbMaster.SubmitChanges();
                }
                catch (Exception)
                {
                    return false;
                }
            }

            
            return true;
        }

        public bool SortImages()
        {
            _estates = dbMaster.Estates.ToList();
            _estateImages = dbMaster.EstateImages.ToList();
            var  defaultImagesPath = Constants.ImagesFolderPath;
            string imagePath;
            List<EstateImage> estateImages;
            var fileNotExists = 0;
            foreach (var estate in _estates)
            {
                //if (estate.ID == estate.OriginalID) { continue;}
                imagePath = string.Format(@"{0}\{1}", defaultImagesPath, estate.ID);
                estateImages = _estateImages.Where(s => s.EstateID == estate.EstateID).ToList();
                //if (estateImages.Any())
                //{
                //    if (!Directory.Exists(imagePath))
                //    {
                //        Directory.CreateDirectory(imagePath);
                //    }
                //}
                foreach (var estateImage in estateImages)
                {
                    if (estateImage.ImageID == estateImage.OriginalID || estateImage.OriginalID == null)
                    {
                        continue;
                    }
                    if (!File.Exists(string.Format(@"{0}\{1}\{2}.jpg", defaultImagesPath,"EstateImages_Mega", estateImage.OriginalID)))
                    {
                        fileNotExists++; continue;
                    }
                    File.Move(string.Format(@"{0}\{1}\{2}.jpg", defaultImagesPath,"EstateImages_Mega", estateImage.OriginalID), 
                        string.Format(@"{0}\{1}.jpg", defaultImagesPath, estateImage.ImageID));
                }
            }
            return true;
        }
    }
}
