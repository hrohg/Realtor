using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using Realtor.DTO;

namespace Realtor.UploadService.Facade
{
	[ServiceContract]
	public interface IRealtorUploadService
	{
		[OperationContract]
        int UploadEstate(EstateDto estate);
        [OperationContract]
        int UpdateEstate(EstateDto estate);
		[OperationContract]
		bool UpdateBuildingTypes(List<BuildingTypeDto> buildingTypes);
        
        [OperationContract]
		bool UpdateCities(List<CityDto> cities);

		[OperationContract]
		bool UpdateCurrencies(List<CurrencyDto> currencies);

		[OperationContract]
		bool UpdateProjects(List<ProjectDto> projects);

		[OperationContract]
		bool UpdateRemonts(List<RemontDto> remonts);

		[OperationContract]
		bool UpdateRoofings(List<RoofingtDto> roofings);

		[OperationContract]
		bool UpdateStates(List<StateDto> states);

		[OperationContract]
		bool UpdateRegions(List<RegionDto> regions);

		[OperationContract]
		bool UpdateStreets(List<StreetDto> streets);

		[OperationContract]
		DateTime GetLastChangeDate();

		[OperationContract]
		bool MarkSoldOrRented(int estateID);

		[OperationContract]
		bool UpdateConvenients(List<ConvenientDto> convenients);

		[OperationContract]
		bool DeleteImages(int estateID);
	}
}
