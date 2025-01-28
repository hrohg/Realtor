using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstate.Common.Helpers;

namespace RealEstate.DataAccess.SearchCriteria
{
	public class DemandSearchCriteria : SearchCriteriaBase
	{
		#region Name - Описание свойства (summary)
		public const string NameProperty = "Name";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string Name
		{
			get { return fieldName; }
			set
			{
				if (fieldName == value) return;
				fieldName = value;
				OnPropertyChanged(NameProperty);
			}
		}
		private string fieldName;
		#endregion

		#region Phone - Описание свойства (summary)
		public const string PhoneProperty = "Phone";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string Phone
		{
			get { return fieldPhone; }
			set
			{
				if (fieldPhone == value) return;
				fieldPhone = value;
				OnPropertyChanged(PhoneProperty);
			}
		}
		private string fieldPhone;
		#endregion

		#region Code - Описание свойства (summary)
		public const string CodeProperty = "Code";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string Code
		{
			get { return fieldCode; }
			set
			{
				if (fieldCode == value) return;
				fieldCode = value;
				OnPropertyChanged(CodeProperty);
			}
		}
		private string fieldCode;
		#endregion

		#region RoomCount - Описание свойства (summary)
		public const string RoomCountProperty = "RoomCount";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int? RoomCount
		{
			get { return fieldRoomCount; }
			set
			{
				if (fieldRoomCount == value) return;
				fieldRoomCount = value;
				OnPropertyChanged(RoomCountProperty);
			}
		}
		private int? fieldRoomCount;
		#endregion

		#region Square - Описание свойства (summary)
		public const string SquareProperty = "Square";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public float? Square
		{
			get { return fieldSquare; }
			set
			{
				if (fieldSquare == value) return;
				fieldSquare = value;
				OnPropertyChanged(SquareProperty);
			}
		}
		private float? fieldSquare;
	    private bool _isDeleted;

	    #endregion

	    public bool IsDeleted
	    {
	        get { return _isDeleted; }
	        set
	        {
	            _isDeleted = value;
                OnPropertyChanged("IsDeleted");
	        }
	    }
	}
}
