using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstate.Common.Helpers;

namespace RealEstate.DataAccess.SearchCriteria
{
	public class BlackListSearchCriteria : SearchCriteriaBase
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

		#region Telephones - Описание свойства (summary)
		public const string TelephonesProperty = "Telephones";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public List<string> Telephones
		{
			get { return fieldTelephones; }
			set
			{
				if (fieldTelephones == value) return;
				fieldTelephones = value;
				OnPropertyChanged(TelephonesProperty);
			}
		}
		private List<string> fieldTelephones;
		#endregion

		#region TelephonesString - Описание свойства (summary)
		public const string TelephonesStringProperty = "TelephonesString";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public string TelephonesString
		{
			get { return fieldTelephonesString; }
			set
			{
				if (fieldTelephonesString == value) return;
				fieldTelephonesString = value;
				OnPropertyChanged(TelephonesStringProperty);
			}
		}
		private string fieldTelephonesString;
		#endregion

		
	}
}
