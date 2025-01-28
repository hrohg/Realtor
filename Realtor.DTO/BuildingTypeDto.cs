using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Realtor.DTO
{
	[DataContract]
	[Serializable]
	public class BuildingTypeDto: DtoBase
	{
		#region BuildingTypeID - Описание свойства (summary)
		public const string BuildingTypeIDProperty = "BuildingTypeID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int BuildingTypeID
		{
			get { return fieldBuildingTypeID; }
			set
			{
				if (fieldBuildingTypeID == value) return;
				fieldBuildingTypeID = value;
			}
		}
		private int fieldBuildingTypeID;
		#endregion
	}
}
