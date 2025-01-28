using RealEstate.DataAccess;

namespace Shared.Helpers
{
	public static class CalculationHelper
	{
		public static long? GetPriceInAMD(long? price, Currency currency)
		{
			if (!price.HasValue || currency == null)
			{
				return price;
			}
			return price * currency.ValueInAMD;
		}
	}
}