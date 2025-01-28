using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Realtor.DTO
{
	[DataContract]
	[Serializable]
	public class DtoBase
	{
		#region IsDeleted - Описание свойства (summary)
		public const string IsDeletedProperty = "IsDeleted";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public bool IsDeleted
		{
			get { return fieldIsDeleted; }
			set
			{
				if (fieldIsDeleted == value) return;
				fieldIsDeleted = value;
			}
		}
		private bool fieldIsDeleted;
		#endregion

		#region LastModifiedDate - Описание свойства (summary)
		public const string LastModifiedDateProperty = "LastModifiedDate";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public DateTime? LastModifiedDate
		{
			get { return fieldLastModifiedDate; }
			set
			{
				if (fieldLastModifiedDate == value) return;
				fieldLastModifiedDate = value;
			}
		}
		private DateTime? fieldLastModifiedDate;
		#endregion

		#region NameAm - Описание свойства (summary)
		public const string NameAmProperty = "NameAm";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string NameAm
		{
			get { return fieldNameAm; }
			set
			{
				if (fieldNameAm == value) return;
				fieldNameAm = value;
			}
		}
		private string fieldNameAm;
		#endregion

		#region NameRu - Описание свойства (summary)
		public const string NameRuProperty = "NameRu";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string NameRu
		{
			get { return fieldNameRu; }
			set
			{
				if (fieldNameRu == value) return;
				fieldNameRu = value;
			}
		}
		private string fieldNameRu;
		#endregion

		#region NameEn - Описание свойства (summary)
		public const string NameEnProperty = "NameEn";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string NameEn
		{
			get { return fieldNameEn; }
			set
			{
				if (fieldNameEn == value) return;
				fieldNameEn = value;
			}
		}
		private string fieldNameEn;
		#endregion

		#region NameIr - Описание свойства (summary)
		public const string NameIrProperty = "NameIr";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string NameIr
		{
			get { return fieldNameIr; }
			set
			{
				if (fieldNameIr == value) return;
				fieldNameIr = value;
			}
		}
		private string fieldNameIr;
		#endregion
	}
}
