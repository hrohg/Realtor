using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class EstateTypeManager : DataManagerBase
	{
		public static List<EstateType> GetEstateTypes(User user, bool isOfflineMode)
		{
			var estateTypes = GetEstateTypes(isOfflineMode);
			if (user.IsAdminOrDirector) return estateTypes.ToList();
			return FilterEstateTypesByUser(user, estateTypes);
		}

		private static List<EstateType> FilterEstateTypesByUser(User user, IEnumerable<EstateType> estateTypes)
		{
			if (user == null || user.BrokerEstateTypes == null) return new List<EstateType>();
			var estateTypeIDs = user.BrokerEstateTypes.Select(s => s.EstateTypeID);
			return estateTypes.Where(s => estateTypeIDs.Contains(s.EstateTypeID)).ToList();
		}

		private static IEnumerable<EstateType> GetEstateTypes(bool isOfflineMode)
		{
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).EstateTypes.Where(s => s.IsDeleted == null || s.IsDeleted == false).AsEnumerable();
		}
	}
}