using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Common;
using System.Linq;
using System.Text;
using RealEstate.DataAccess;
using RealEstate.DataAccess.SearchCriteria;

namespace RealEstate.Business.Managers
{
    public class BlackListManager : DataManagerBase
    {
        public static ObservableCollection<BlackListItem> GetBlackListItems(BlackListSearchCriteria searchCriteria, bool isOfflineMode)
        {
            var connectionString = GetConnectionString(isOfflineMode);
            DataClassesDataContext db = new DataClassesDataContext(connectionString);
            var list = db.BlackListItems.Where(s => s.IsDeleted == null || s.IsDeleted == false).AsQueryable();
            if (searchCriteria == null)
            {
                return new ObservableCollection<BlackListItem>(list);
            }
            if (!string.IsNullOrEmpty(searchCriteria.Name))
            {
                list = list.Where(s => s.Name.Contains(searchCriteria.Name));
            }
            //if (searchCriteria.Telephones != null && searchCriteria.Telephones.Count > 0)
            //{
            //    list = (from blackListItem in list
            //            join phoneNumber in db.BlackListNumbers on blackListItem.ID equals phoneNumber.BlackListItemID
            //            where searchCriteria.Telephones.Contains(phoneNumber.Phone)
            //            select blackListItem).Distinct();
            //}
            if (!string.IsNullOrEmpty(searchCriteria.TelephonesString))
            {
                list = (from blackListItem in list
                        join phoneNumber in db.BlackListNumbers on blackListItem.ID equals phoneNumber.BlackListItemID
                        where phoneNumber.Phone.Contains(searchCriteria.TelephonesString)
                        select blackListItem).Distinct();
            }
            return new ObservableCollection<BlackListItem>(list);
        }

        public static void CopyProperties(BlackListItem item, BlackListItem itemInDb)
        {
            itemInDb.Name = item.Name;
            itemInDb.Comment = item.Comment;
            itemInDb.LastModifiedDate = item.LastModifiedDate;
            itemInDb.OriginalID = item.OriginalID;
            itemInDb.IsDeleted = item.IsDeleted;
        }
        public static bool AddBlackListItem(BlackListItem number)
        {
            if (number == null) return false;
            DataClassesDataContext db = new DataClassesDataContext();
            try
            {
                number.LastModifiedDate = DateTime.Now;
                db.BlackListItems.InsertOnSubmit(number);
                db.SubmitChanges();
                if (!number.OriginalID.HasValue)
                {
                    number.OriginalID = number.ID;
                    db.SubmitChanges();
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool UpdateBlackListNumber(BlackListNumber number)
        {
            if (number == null) return false;
            DataClassesDataContext db = new DataClassesDataContext();
            try
            {
                var numberInDB = db.BlackListNumbers.Single(s => s.ID == number.ID);
                numberInDB.Phone = number.Phone;
                numberInDB.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool DeleteBlackListNumber(BlackListNumber number)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            try
            {
                var num = db.BlackListNumbers.Single(s => s.ID == number.ID);
                //db.BlackListNumbers.DeleteOnSubmit(num);
                num.IsDeleted = true;
                num.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool UpdateBlackListItem(BlackListItem item)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            DbTransaction transaction = null;
            try
            {
                db.Connection.Open();
                transaction = db.Connection.BeginTransaction();
                db.Transaction = transaction;

                var dbItem = db.BlackListItems.Single(s => s.ID == item.ID);
                db.BlackListNumbers.DeleteAllOnSubmit(dbItem.BlackListNumbers);
                db.SubmitChanges();

                dbItem.Comment = item.Comment;
                dbItem.Name = item.Name;
                dbItem.LastModifiedDate = DateTime.Now;
                foreach (BlackListNumber number in item.BlackListNumbers)
                {
                    dbItem.BlackListNumbers.Add(new BlackListNumber { Phone = number.Phone, LastModifiedDate = DateTime.Now });
                }
                db.BlackListNumbers.InsertAllOnSubmit(dbItem.BlackListNumbers);
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


        public static bool DeleteBlackListItem(BlackListItem item)
        {
            try
            {
                var db = new DataClassesDataContext();
                var itemInDB = db.BlackListItems.Single(s => s.ID == item.ID);
                db.BlackListNumbers.DeleteAllOnSubmit(itemInDB.BlackListNumbers);
                //db.BlackListItems.DeleteOnSubmit(itemInDB);
                itemInDB.IsDeleted = true;
                itemInDB.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static List<BlackListItem> GetNewBlackListItems(DateTime lastModifiedDate)
        {
            using (var db = new DataClassesDataContext())
            {
                var result = db.BlackListItems.Where(s => s.LastModifiedDate > lastModifiedDate).ToList();
                foreach (BlackListItem item in result)
                {
                    item.Numbers = item.BlackListNumbers.ToList();
                }
                return result;
            }
        }

        public static void SynchronizeBlackListItems(List<BlackListItem> newItems)
        {
            if (newItems == null || newItems.Count == 0) return;
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                foreach (BlackListItem item in newItems)
                {
                    var itemInDB = db.BlackListItems.FirstOrDefault(s => s.OriginalID == item.ID);
                    if (itemInDB == null)
                    {
                        item.OriginalID = item.ID;
                        if (item.Numbers != null && item.Numbers.Count > 0)
                        {
                            foreach (BlackListNumber number in item.Numbers)
                            {
                                if (!number.OriginalID.HasValue)
                                {
                                    number.OriginalID = number.ID;
                                }
                                item.BlackListNumbers.Add(number);
                            }
                        }
                        db.BlackListItems.InsertOnSubmit(item);
                    }
                    else
                    {
                        db.BlackListNumbers.DeleteAllOnSubmit(itemInDB.BlackListNumbers);
                        db.SubmitChanges();

                        itemInDB.Comment = item.Comment;
                        itemInDB.Name = item.Name;
                        itemInDB.LastModifiedDate = item.LastModifiedDate;
                        if (item.Numbers != null)
                        {
                            itemInDB.BlackListNumbers.AddRange(item.Numbers.Where(s => s.IsDeleted == null || s.IsDeleted == false).Select(number => new BlackListNumber
                                                                                                {
                                                                                                    Phone = number.Phone,
                                                                                                    LastModifiedDate = number.LastModifiedDate,
                                                                                                    OriginalID = number.ID
                                                                                                }));
                        }
                        db.BlackListNumbers.InsertAllOnSubmit(itemInDB.BlackListNumbers);
                    }
                    db.SubmitChanges();
                }
            }
        }

        public static DateTime GetLastChangeDate()
        {
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                var item = db.BlackListItems.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
                if (item == null) return DateTime.MinValue;
                return item.LastModifiedDate ?? DateTime.MinValue;
            }
        }

    }
}
