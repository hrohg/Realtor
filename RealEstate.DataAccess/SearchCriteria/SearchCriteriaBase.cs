using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace RealEstate.Common.Helpers
{
	public abstract class SearchCriteriaBase : IDataErrorInfo, INotifyPropertyChanged
	{
		#region IDataErrorInfo Members

		public string Error { get; set; }

		public string this[string columnName]
		{
			get { return ValidateProperty(columnName); }
		}

		private string ValidateProperty(string columnName)
		{
			return null;
		}

		#endregion

		#region INotifyPropertyChanged Members

		public event PropertyChangedEventHandler PropertyChanged;

		public virtual void OnPropertyChanged(string propertyName)
		{
			if (PropertyChanged != null)
				PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}

		#endregion
	}
}
