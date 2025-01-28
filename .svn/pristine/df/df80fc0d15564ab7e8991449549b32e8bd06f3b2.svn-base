using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Realtor.DTO
{
	[DataContract]
	[Serializable]
	public class ImageDto
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

		
		private string _imageType;
		private MemoryStream _imageContent;

		[DataMember]
		public string ImageType
		{
			get { return _imageType; }
			set { _imageType = value; }
		}

		[DataMember]
		public MemoryStream ImageContent
		{
			get { return _imageContent; }
			set { _imageContent = value; }
		}

		#region streamKey - Идентификатор потока данных
		string _streamKey;
		/// <summary>Идентификатор потока данных</summary>
		[System.Runtime.Serialization.DataMember]
		public string streamKey
		{
			get { return _streamKey; }
			set { _streamKey = value; }
		}
		#endregion

		#region EstateID - Описание свойства (summary)
		public const string EstateIDProperty = "EstateID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int EstateID
		{
			get { return fieldEstateID; }
			set
			{
				fieldEstateID = value;
			}
		}
		private int fieldEstateID;
		private bool _isMain;

		#endregion

		[DataMember]
		public bool IsMain
		{
			get { return _isMain; }
			set { _isMain = value; }
		}
	}
}
