using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class OrderTypeManager : DataManagerBase
	{
		public static List<OrderType> GetOrderTypes(bool isOfflineMode)
		{
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).OrderTypes.Where(s => s.IsDeleted == null || s.IsDeleted == false).ToList();
		}

		public static List<OrderType> GetOrderTypesForEstate(User user, bool isOfflineMode)
		{
			var orderTypes = GetOrderTypesForEstate(isOfflineMode);
			return user.IsAdminOrDirector ? orderTypes : FilterOrderTypesByUser(orderTypes, user);
		}

		private static List<OrderType> FilterOrderTypesByUser(List<OrderType> orderTypes, User user)
		{
			if (user == null || user.BrokerOrderTypes == null) return new List<OrderType>();

			var userOrderTypeIDs = user.BrokerOrderTypes.Select(s => s.OrderTypeID);
			return orderTypes.Where(s => userOrderTypeIDs.Contains(s.OrderTypeID)).ToList();
		}

		private static List<OrderType> GetOrderTypesForEstate(bool isOfflineMode)
		{
			var orderTypes = GetOrderTypes(isOfflineMode);
			//return orderTypes;
			if (orderTypes != null)
			{
				return orderTypes.Where(s => s.OrderTypeID == 1 || s.OrderTypeID == 2 && (s.IsDeleted == null || s.IsDeleted == false)).ToList();
			}
			return null;
		}
	}
}
