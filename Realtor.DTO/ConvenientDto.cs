using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Realtor.DTO
{
	public class ConvenientDto : DtoBase
	{
		#region ID - Описание свойства (summary)
		public const string IDProperty = "ID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int ID
		{
			get { return fieldID; }
			set
			{
				if (fieldID == value) return;
				fieldID = value;
			}
		}
		private int fieldID;
		#endregion
	}
}
