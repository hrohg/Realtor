using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Realtor.DTO
{
	[DataContract]
	[Serializable]
	public class CurrencyDto : DtoBase
	{
		#region CurrencyID - Описание свойства (summary)
		public const string CurrencyIDProperty = "CurrencyID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int CurrencyID
		{
			get { return fieldCurrencyID; }
			set
			{
				if (fieldCurrencyID == value) return;
				fieldCurrencyID = value;
			}
		}
		private int fieldCurrencyID;
		#endregion

		#region ValueInAMD - Описание свойства (summary)
		public const string ValueInAMDProperty = "ValueInAMD";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int ValueInAMD
		{
			get { return fieldValueInAMD; }
			set
			{
				if (fieldValueInAMD == value) return;
				fieldValueInAMD = value;
			}
		}
		private int fieldValueInAMD;
		#endregion
	}
}
