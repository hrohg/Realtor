using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class StateManager : DataManagerBase
	{
		private static List<State> GetStates(bool isOfflineMode)
		{
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).States.Where(s => s.IsDeleted == null || s.IsDeleted == false).ToList();
		}

		public static List<State> GetStates(User user, bool isOfflineMode)
		{
			var states = GetStates(isOfflineMode);
			if (user == null) return new List<State>();
			if (user.IsAdminOrDirector) return states;
			var stateIDs = user.BrokerStates.Select(s => s.StateID).ToList();
			if (user.BrokersRegions.Count > 0)
			{
				stateIDs.Add(1);
			}
			return states.Where(s => stateIDs.Contains(s.ID)).ToList();
		}

		public static bool DeleteState(State state)
		{
			if (state == null) return false;
			state.IsDeleted = true;
			return UpdateState(state);
		}

		public static bool UpdateState(State state)
		{
			if (state == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				var stateInDb = db.States.FirstOrDefault(s => s.ID == state.ID);
				if (stateInDb == null) return false;
				CopyProperties(state, stateInDb);
				stateInDb.LastModifiedDate = DateTime.Now;
				db.SubmitChanges();
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		private static void CopyProperties(State state, State stateInDb)
		{
			stateInDb.IsDeleted = state.IsDeleted;
			stateInDb.NameAm = state.NameAm;
			stateInDb.NameRu = state.NameRu;
			stateInDb.NameEn = state.NameEn;
			stateInDb.NameKz = state.NameKz;
			stateInDb.NameCz = state.NameCz;
		}

		public static bool AddState(State state)
		{
			if (state == null) return false;
			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				state.LastModifiedDate = DateTime.Now;
				db.States.InsertOnSubmit(state);
				db.SubmitChanges();
				if(!state.OriginalID.HasValue)
				{
					state.OriginalID = state.ID;
					db.SubmitChanges();
				}
				return true;
			}
			catch
			{
				return false;
			}
		}

		public static DateTime GetLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.States.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<State> GetNewStates(DateTime lastChangeDate)
		{
			if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
			{
				lastChangeDate = Constants.SQLAcceptedMinDateValue;
			}
			using (var db = new DataClassesDataContext())
			{
				return db.States.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeStates(List<State> states)
		{
			if (states == null || states.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var item in states)
				{
					var itemInDB = db.States.FirstOrDefault(s => s.OriginalID == item.ID);
					if (itemInDB == null)
					{
						item.OriginalID = item.ID;
						db.States.InsertOnSubmit(item);
					}
					else
					{
						CopyProperties(item, itemInDB);
						itemInDB.LastModifiedDate = item.LastModifiedDate;
					}
					db.SubmitChanges();
				}
			}
		}
	}
}
