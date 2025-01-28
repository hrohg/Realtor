using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.ServiceModel;
using System.Text;

namespace Realtor.DTO
{
	[MessageContract]
	public class EstateImageData
	{
		[MessageBodyMember]
		public Stream ImageStream { get; set; }

		[MessageHeader]
		public int EstateID { get; set; }
	}

	[MessageContract]
	public class EstateData
	{
		[MessageHeader]
		public string Header { get; set; }

		[MessageBodyMember]
		public EstateDto Estate { get; set; }
	}

	[MessageContract]
	public class ReturnData
	{
		public int Result { get; set; }
	}
}
