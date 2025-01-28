using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstate.Common.Helpers;

namespace RealEstate.DataAccess.SearchCriteria
{
	public class StatisticSearchCriteria : SearchCriteriaBase
	{
		#region StartDate - Описание свойства (summary)
		public const string StartDateProperty = "StartDate";

		/// <summary>Описание свойства (summary)</summary>
		public DateTime StartDate
		{
			get { return fieldStartDate; }
			set
			{
				if (fieldStartDate == value) return;
				fieldStartDate = value;
				OnPropertyChanged(StartDateProperty);
			}
		}
		private DateTime fieldStartDate;
		#endregion

		#region EndDate - Описание свойства (summary)
		public const string EndDateProperty = "EndDate";

		/// <summary>Описание свойства (summary)</summary>
		public DateTime EndDate
		{
			get { return fieldEndDate; }
			set
			{
				if (fieldEndDate == value) return;
				fieldEndDate = value;
				OnPropertyChanged(EndDateProperty);
			}
		}
		private DateTime fieldEndDate;
		#endregion

		#region BrokerID - Описание свойства (summary)
		public const string BrokerIDProperty = "BrokerID";

		/// <summary>Описание свойства (summary)</summary>
		public int? BrokerID
		{
			get { return fieldBrokerID; }
			set
			{
				if (fieldBrokerID == value) return;
				fieldBrokerID = value;
				OnPropertyChanged(BrokerIDProperty);
			}
		}
		private int? fieldBrokerID;
		#endregion

		
	}
}
