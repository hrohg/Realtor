using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Realtor.DTO
{
	[DataContract]
	[Serializable]
	public class ProjectDto: DtoBase
	{
		#region ProjectID - Описание свойства (summary)
		public const string ProjectIDProperty = "ProjectID";

		/// <summary>Описание свойства (summary)</summary>
		[System.Runtime.Serialization.DataMember]
		public int ProjectID
		{
			get { return fieldProjectID; }
			set
			{
				if (fieldProjectID == value) return;
				fieldProjectID = value;
			}
		}
		private int fieldProjectID;
		#endregion

	}
}
