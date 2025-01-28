using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class OperationalSignificanceManager : DataManagerBase
	{
		public static List<SignificanceOfTheUse> GetSignificanceOfTheUses(EstateType estateType, bool isOfflineMode)
		{
			if (estateType == null) return null;
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).SignificanceOfTheUses.Where(s => s.EstateTypeID == estateType.EstateTypeID && (s.IsDeleted == null || s.IsDeleted == false)).ToList();
		}

		public static List<OperationalSignificance> GetOperationalSignificances(SignificanceOfTheUse significanceOfTheUse, bool isOfflineMode)
		{
			if (significanceOfTheUse == null) return null;
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).OperationalSignificances.Where(s => s.SignificanceOfTheUseID == significanceOfTheUse.ID && (s.IsDeleted == null || s.IsDeleted == false)).ToList();
		}

		public static bool DeleteSignificanceOfTheUse(SignificanceOfTheUse significanceOfTheUse)
		{
			if (significanceOfTheUse == null) return false;
			significanceOfTheUse.IsDeleted = true;
			significanceOfTheUse.LastModifiedDate = DateTime.Now;
			return UpdateSignificanceOfTheUse(significanceOfTheUse);
		}

		public static bool UpdateSignificanceOfTheUse(SignificanceOfTheUse significanceOfTheUse)
		{
			if (significanceOfTheUse == null) return false;
			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				var itemFromDB = db.SignificanceOfTheUses.First(s => s.ID == significanceOfTheUse.ID);

				CopySignificanceOfTheUseProperties(significanceOfTheUse, db, itemFromDB);
				itemFromDB.LastModifiedDate = DateTime.Now;

				//itemFromDB.Name = significanceOfTheUse.Name;
				db.SubmitChanges();
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public static bool AddSignificanceOfTheUse(SignificanceOfTheUse significanceOfTheUse)
		{
			if (significanceOfTheUse == null) return false;
			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				significanceOfTheUse.LastModifiedDate = DateTime.Now;
				db.SignificanceOfTheUses.InsertOnSubmit(significanceOfTheUse);
				db.SubmitChanges();
				if (!significanceOfTheUse.OriginalID.HasValue)
				{
					significanceOfTheUse.OriginalID = significanceOfTheUse.ID;
					db.SubmitChanges();
				}
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public static bool DeleteOperationalSignificance(OperationalSignificance operationalSignificance)
		{
			if (operationalSignificance == null) return true;
			operationalSignificance.IsDeleted = true;
			operationalSignificance.LastModifiedDate = DateTime.Now;
			return UpdateOperationalSignificance(operationalSignificance);
		}

		public static bool AddOperationalSignificance(OperationalSignificance operationalSignificance)
		{
			if (operationalSignificance == null) return false;
			try
			{
				operationalSignificance.LastModifiedDate = DateTime.Now;
				DataClassesDataContext db = new DataClassesDataContext();
				db.OperationalSignificances.InsertOnSubmit(operationalSignificance);
				db.SubmitChanges();
				if (!operationalSignificance.OriginalID.HasValue)
				{
					operationalSignificance.OriginalID = operationalSignificance.ID;
					db.SubmitChanges();
				}
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public static bool UpdateOperationalSignificance(OperationalSignificance operationalSignificance)
		{
			if (operationalSignificance == null) return false;
			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				var opInDB = db.OperationalSignificances.First(s => s.ID == operationalSignificance.ID);
				CopyProperties(operationalSignificance, db, opInDB);
				opInDB.LastModifiedDate = DateTime.Now;
				db.SubmitChanges();
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		private static void CopyProperties(OperationalSignificance operationalSignificance, DataClassesDataContext db, OperationalSignificance opInDB)
		{
			opInDB.IsDeleted = operationalSignificance.IsDeleted;
			opInDB.NameAm = operationalSignificance.NameAm;
			opInDB.NameRu = operationalSignificance.NameRu;
			opInDB.NameEn = operationalSignificance.NameEn;
			opInDB.NameCz = operationalSignificance.NameCz;
			opInDB.NameKz = operationalSignificance.NameKz;
			opInDB.SignificanceOfTheUse = db.SignificanceOfTheUses.Single(s => s.ID == operationalSignificance.SignificanceOfTheUseID);
		}

		public static DateTime GetLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.OperationalSignificances.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<OperationalSignificance> GetNewOperationalSignificances(DateTime lastChangeDate)
		{
			if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
			{
				lastChangeDate = Constants.SQLAcceptedMinDateValue;
			}
			using (var db = new DataClassesDataContext())
			{
				return db.OperationalSignificances.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeOperationalSignificances(List<OperationalSignificance> operationalSignificances)
		{
			if (operationalSignificances == null || operationalSignificances.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var item in operationalSignificances)
				{
					var itemInDB = db.OperationalSignificances.FirstOrDefault(s => s.OriginalID == item.ID);
					if (itemInDB == null)
					{
						item.OriginalID = item.ID;
						db.OperationalSignificances.InsertOnSubmit(item);
					}
					else
					{
						CopyProperties(item, db, itemInDB);
						itemInDB.LastModifiedDate = item.LastModifiedDate;
					}
					db.SubmitChanges();
				}
			}
		}

		public static DateTime GetSignificanceOfTheUsesLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.SignificanceOfTheUses.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<SignificanceOfTheUse> GetNewSignificanceOfTheUses(DateTime lastChangeDate)
		{
			if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
			{
				lastChangeDate = Constants.SQLAcceptedMinDateValue;
			}
			using (var db = new DataClassesDataContext())
			{
				return db.SignificanceOfTheUses.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeSignificanceOfTheUses(List<SignificanceOfTheUse> significanceOfTheUses)
		{
			if (significanceOfTheUses == null || significanceOfTheUses.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var item in significanceOfTheUses)
				{
					var itemInDB = db.SignificanceOfTheUses.FirstOrDefault(s => s.OriginalID == item.ID);
					if (itemInDB == null)
					{
						item.OriginalID = item.ID;
						db.SignificanceOfTheUses.InsertOnSubmit(item);
					}
					else
					{
						CopySignificanceOfTheUseProperties(item, db, itemInDB);
						itemInDB.LastModifiedDate = item.LastModifiedDate;
					}
					db.SubmitChanges();
				}
			}
		}

		private static void CopySignificanceOfTheUseProperties(SignificanceOfTheUse item, DataClassesDataContext db, SignificanceOfTheUse itemInDb)
		{
			itemInDb.EstateType = db.EstateTypes.Single(s => s.EstateTypeID == item.EstateTypeID);
			itemInDb.IsDeleted = item.IsDeleted;
			itemInDb.NameAm = item.NameAm;
			itemInDb.NameCz = item.NameCz;
			itemInDb.NameEn = item.NameEn;
			itemInDb.NameKz = item.NameKz;
			itemInDb.NameRu = item.NameRu;
		}
	}
}
