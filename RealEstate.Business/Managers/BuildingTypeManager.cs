using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class BuildingTypeManager : DataManagerBase
	{
		public static List<BuildingType> GetBuildingTypes(bool isOfflineMode)
		{
			DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
			return db.BuildingTypes.Where(s => s.IsDeleted == null || s.IsDeleted == false).ToList();
		}

		public static bool UpdateBuildingType(BuildingType buildingType)
		{
			if (buildingType == null) return false;
			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				BuildingType buildingTypeInDB = db.BuildingTypes.FirstOrDefault(s => s.BuildingTypeID == buildingType.BuildingTypeID);
				if (buildingTypeInDB == null) return false;
				CopyProperites(buildingType, buildingTypeInDB);
				buildingTypeInDB.LastModifiedDate = DateTime.Now;
				db.SubmitChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}

		private static void CopyProperites(BuildingType buildingType, BuildingType buildingTypeInDB)
		{
			buildingTypeInDB.NameAm = buildingType.NameAm;
			buildingTypeInDB.NameRu = buildingType.NameRu;
			buildingTypeInDB.NameEn = buildingType.NameEn;
			buildingTypeInDB.NameKz = buildingType.NameKz;
			buildingTypeInDB.NameCz = buildingType.NameCz;
			buildingTypeInDB.SortIndex = buildingType.SortIndex;
			buildingTypeInDB.IsDeleted = buildingType.IsDeleted;
		}

		public static bool AddBuildingType(BuildingType buildingType)
		{
			if (buildingType == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				buildingType.LastModifiedDate = DateTime.Now;
				db.BuildingTypes.InsertOnSubmit(buildingType);
				db.SubmitChanges();
				if (!buildingType.OriginalID.HasValue)
				{
					buildingType.OriginalID = buildingType.BuildingTypeID;
					db.SubmitChanges();
				}

				return true;
			}
			catch
			{
				return false;
			}
		}

		public static bool DeleteBuildingType(BuildingType buildingType)
		{
			if (buildingType == null) return false;
			buildingType.IsDeleted = true;
			buildingType.LastModifiedDate = DateTime.Now;
			return UpdateBuildingType(buildingType);
		}

		public static DateTime GetLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.BuildingTypes.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<BuildingType> GetNewBuildingTypes(DateTime lastModifiedDate)
		{
			using (var db = new DataClassesDataContext())
			{

				if (lastModifiedDate < Constants.SQLAcceptedMinDateValue)
				{
					lastModifiedDate = Constants.SQLAcceptedMinDateValue;
				}
				var result = db.BuildingTypes.Where(s => s.LastModifiedDate > lastModifiedDate).ToList();
				return result;
			}
		}

		public static void SynchronizeBuildingTypes(List<BuildingType> newBuildingTypes)
		{
			if (newBuildingTypes == null || newBuildingTypes.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (BuildingType newBuildingType in newBuildingTypes)
				{
					var itemInDB = db.BuildingTypes.FirstOrDefault(s => s.OriginalID == newBuildingType.BuildingTypeID);
					if (itemInDB == null)
					{
						newBuildingType.OriginalID = newBuildingType.BuildingTypeID;
						db.BuildingTypes.InsertOnSubmit(newBuildingType);
					}
					else
					{
						CopyProperites(newBuildingType, itemInDB);
						itemInDB.LastModifiedDate = newBuildingType.LastModifiedDate;
						itemInDB.OriginalID = newBuildingType.BuildingTypeID;
					}
					db.SubmitChanges();
				}
			}
		}
	}
}
