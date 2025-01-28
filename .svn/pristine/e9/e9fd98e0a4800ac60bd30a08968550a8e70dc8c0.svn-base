using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Common.Enumerations
{
	

	public class Role
	{
		public int ID { get; set; }
		public string Name { get; set; }

		public static List<Role> GetRoles()
		{
			var roles = Enum.GetValues(typeof(Roles));
			List<Role> list = new List<Role>();
			foreach (var role in roles)
			{
				list.Add(new Role { ID = (int)(Roles)role, Name = role.ToString() });
			}
			return list;
		}
	}
}
