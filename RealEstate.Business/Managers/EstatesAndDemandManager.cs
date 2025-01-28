using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using RealEstate.Common;
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;

namespace RealEstate.Business.Managers
{
    public class EstatesAndDemandManager : DataManagerBase
    {
        public static bool AddShowInfo(EstatesAndDemand showInfo)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                //showInfo.Estate = db.Estates.Single(s => s.ID == showInfo.EstateID);
                //showInfo.NeededEstate = db.NeededEstates.Single(s => s.ID == showInfo.DemandID);
                showInfo.LastModifiedDate = DateTime.Now;
                db.EstatesAndDemands.InsertOnSubmit(showInfo);
                db.SubmitChanges();
                if (!showInfo.DemandOriginalID.HasValue)
                {
                    showInfo.DemandOriginalID = showInfo.DemandID;
                    showInfo.EstateOriginalID = showInfo.EstateID;
                    db.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static ObservableCollection<EstatesAndDemand> GetAllDemandsWithShowedEstates(User user, DemandSearchCriteria demandSearchCriteria, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            var demands = db.EstatesAndDemands.Where(s => s.IsDeleted == null || s.IsDeleted == false).AsQueryable();
            if (demandSearchCriteria == null) return new ObservableCollection<EstatesAndDemand>(demands);
            if (!string.IsNullOrEmpty(demandSearchCriteria.Name))
            {
                demands = demands.Where(s => s.NeededEstate.SellerName.Contains(demandSearchCriteria.Name));
            }
            if (!string.IsNullOrEmpty(demandSearchCriteria.Phone))
            {
                demands = demands.Where(s => s.NeededEstate.Telephone1.Contains(demandSearchCriteria.Phone) || s.NeededEstate.Telephone2.Contains(demandSearchCriteria.Phone));
            }
            demands = demands.Select(s => s.NeededEstate).Distinct().Select(s => s.EstatesAndDemands.First());
            return new ObservableCollection<EstatesAndDemand>(demands);
        }

        public static ObservableCollection<EstatesAndDemand> GetShowedToClientsEstates(RealEstateSearchParameters criteria, User user, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            var estates = db.EstatesAndDemands.Where(s => s.IsDeleted == null || s.IsDeleted == false).AsQueryable();
            if (criteria != null)
            {
                if (!string.IsNullOrEmpty(criteria.Code))
                {
                    estates = estates.Where(s => s.Estate.Code == criteria.Code);
                    return !user.IsAdminOrDirector ? new ObservableCollection<EstatesAndDemand>(estates.Where(s => s.Estate.BrokerID == user.ID)) : new ObservableCollection<EstatesAndDemand>(estates);
                }
                if (!string.IsNullOrEmpty(criteria.TelephoneOrName))
                {
                    estates = estates.Where(s => s.Estate.PhonePrimary.Contains(criteria.TelephoneOrName) ||
                                            s.Estate.PhoneSecondary.Contains(criteria.TelephoneOrName) ||
                                            s.Estate.SellerName.Contains(criteria.TelephoneOrName));
                }
                if (criteria.FloorFrom.HasValue)
                {
                    estates = estates.Where(s => s.Estate.Floor >= criteria.FloorFrom);
                }
                if (criteria.FloorTo.HasValue)
                {
                    estates = estates.Where(s => s.Estate.Floor <= criteria.FloorTo);
                }
                if (criteria.SquareFrom.HasValue)
                {
                    estates = estates.Where(s => s.Estate.TotalSquare >= criteria.SquareFrom);
                }
                if (criteria.SquareTo.HasValue)
                {
                    estates = estates.Where(s => s.Estate.TotalSquare <= criteria.SquareTo);
                }
                if (criteria.Currency == null)
                {
                    criteria.Currency = CurrencyManager.GetCurrency(1, isOfflineMode);
                }
                if (criteria.PriceFrom.HasValue)
                {
                    criteria.PriceFromInAMD = criteria.Currency.ValueInAMD * criteria.PriceFrom.Value;
                    estates = estates.Where(s => s.Estate.PriceInAMD >= criteria.PriceFromInAMD);
                }
                if (criteria.PriceTo.HasValue)
                {
                    criteria.PriceToInAMD = criteria.Currency.ValueInAMD * criteria.PriceTo;
                    estates = estates.Where(s => s.Estate.PriceInAMD <= criteria.PriceToInAMD);
                }
                if (criteria.RoomCountFrom.HasValue)
                {
                    estates = estates.Where(s => s.Estate.RoomCount >= criteria.RoomCountFrom || s.Estate.MakedRooms >= criteria.RoomCountFrom);
                }
                if (criteria.RoomCountTo.HasValue)
                {
                    estates = estates.Where(s => s.Estate.RoomCount <= criteria.RoomCountTo || s.Estate.MakedRooms <= criteria.RoomCountFrom);
                }
                estates = estates.Select(s => s.Estate).Distinct().Select(s => s.EstatesAndDemands.First());
            }
            return !user.IsAdminOrDirector ? new ObservableCollection<EstatesAndDemand>(estates.Where(s => s.Estate.BrokerID == user.ID)) : new ObservableCollection<EstatesAndDemand>(estates);
        }

        public static ObservableCollection<EstatesAndDemand> GetShowedEstatesForDemand(int demandId, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            return new ObservableCollection<EstatesAndDemand>(db.EstatesAndDemands.Where(s => s.DemandID == demandId && (s.IsDeleted == null || s.IsDeleted == false)));
        }

        public static ObservableCollection<EstatesAndDemand> GetShowedClientsForEstate(int estateId, bool isOfflineMode)
        {
            return new ObservableCollection<EstatesAndDemand>(new DataClassesDataContext(GetConnectionString(isOfflineMode)).EstatesAndDemands.Where(s => s.EstateID == estateId && (s.IsDeleted == null || s.IsDeleted == false)));
        }

        public static bool DeleteShoingInfo(EstatesAndDemand itemToDelete)
        {
            try
            {
                DataClassesDataContext db = new DataClassesDataContext();
                var item = db.EstatesAndDemands.Single(s => s.EstateID == itemToDelete.EstateID && s.DemandID == itemToDelete.DemandID);
                item.IsDeleted = true;
                item.LastModifiedDate = DateTime.Now;
                //db.EstatesAndDemands.DeleteOnSubmit(item);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DateTime GetLastChangeDate()
        {
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                var item = db.EstatesAndDemands.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
                if (item == null) return DateTime.MinValue;
                return item.LastModifiedDate ?? DateTime.MinValue;
            }
        }

        public static List<EstatesAndDemand> GetNewEstateDemands(DateTime lastChangeDate)
        {
            if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
            {
                lastChangeDate = Constants.SQLAcceptedMinDateValue;
            }
            using (var db = new DataClassesDataContext())
            {
                return db.EstatesAndDemands.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
            }
        }

        public static void SynchronizeEstateAndDemands(List<EstatesAndDemand> estatesAndDemands)
        {
            if (estatesAndDemands == null || estatesAndDemands.Count == 0) return;

            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                foreach (EstatesAndDemand estateAndDemand in estatesAndDemands)
                {
                    var estate = db.Estates.FirstOrDefault(s => s.OriginalID == estateAndDemand.EstateID);
                    if (estate == null) continue;
                    var demand = db.NeededEstates.FirstOrDefault(s => s.OriginalID == estateAndDemand.DemandID);
                    if (demand == null) continue;

                    var existingRecord = db.EstatesAndDemands.FirstOrDefault(s => s.DemandID == demand.ID && s.EstateID == estate.ID);
                    if (existingRecord != null)
                    {
                        db.EstatesAndDemands.DeleteOnSubmit(existingRecord);
                        db.SubmitChanges();
                    }
                    EstatesAndDemand newRecord = new EstatesAndDemand
                                                    {
                                                        EstateID = estate.ID,
                                                        DemandID = demand.ID
                                                    };
                    if (estateAndDemand.BrokerID.HasValue)
                    {
                        var broker = db.Users.FirstOrDefault(s => s.OriginalID == estateAndDemand.BrokerID.Value);
                        if (broker != null)
                        {
                            newRecord.BrokerID = broker.ID;
                        }
                    }
                    newRecord.IsDeleted = estateAndDemand.IsDeleted;
                    newRecord.LastModifiedDate = estateAndDemand.LastModifiedDate;
                    newRecord.ShowDate = estateAndDemand.ShowDate;
                    db.EstatesAndDemands.InsertOnSubmit(newRecord);
                    db.SubmitChanges();
                }
            }
        }

        public static bool AddSuggestInfo(ClientSuggestedEstate suggestedEstates)
        {
            using (var db = new DataClassesDataContext())
            {
                foreach (var estatesId in suggestedEstates.EstatesIds)
                {
                    var suggest = db.ClientSuggestedEstates.FirstOrDefault(s => s.EstateID == estatesId && s.ClientID == suggestedEstates.ClientID);
                    if (suggest != null) continue;
                    db.ClientSuggestedEstates.InsertOnSubmit(new ClientSuggestedEstate
                    {
                        BrokerID = suggestedEstates.BrokerID,
                        ClientID = suggestedEstates.ClientID,
                        Comment = suggestedEstates.Comment,
                        EstateID = estatesId,
                        SuggestDate = suggestedEstates.SuggestDate,

                    });
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

        public static bool DeleteSuggestInfo(IEnumerable<ClientSuggestedEstate> infos)
        {
            using (var db = new DataClassesDataContext())
            {
                var ids = infos.Select(s => s.EstateID);
                var clientID = infos.ElementAt(0).ClientID;
                var infoToDelete = db.ClientSuggestedEstates.Where(s => s.ClientID == clientID && ids.Contains(s.EstateID));
                db.ClientSuggestedEstates.DeleteAllOnSubmit(infoToDelete);
                try
                {
                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public static void SaveSuggestInfo(ClientSuggestedEstate suggestInfo)
        {
            using (var db = new DataClassesDataContext())
            {
                var info = db.ClientSuggestedEstates.Single(s => s.ClientID == suggestInfo.ClientID && s.EstateID == suggestInfo.EstateID);
                info.Comment = suggestInfo.Comment;
                db.SubmitChanges();
            }
        }

        public static void SaveShowInfo(EstatesAndDemand showInfo)
        {
            using (var db = new DataClassesDataContext())
            {
                var info = db.EstatesAndDemands.Single(s => s.DemandID == showInfo.DemandID && s.EstateID == showInfo.EstateID);
                info.Comment = showInfo.Comment;
                db.SubmitChanges();
            }
        }
    }
}
