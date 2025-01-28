using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Business.Helpers
{
    public class ShowedAndOfferedEstates
    {
        public List<EstatesAndDemand> ShowedEstates { get; set; }
        public List<ClientSuggestedEstate> OfferedEstates { get; set; }
    }
}
