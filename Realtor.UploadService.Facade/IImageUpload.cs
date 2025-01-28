using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using Realtor.DTO;

namespace Realtor.UploadService.Facade
{
	[ServiceContract]
	public interface IImageUpload : IStreamService
	{
		[OperationContract]
		ImageDto ReadBlob(long image);

		[OperationContract]
		int WriteBlob(ImageDto image);

	}
}
