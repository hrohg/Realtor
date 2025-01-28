using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class CurrencyManager : DataManagerBase
	{
		public static List<Currency> GetCurrencies(bool isOfflineMode)
		{
			DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
			return db.Currencies.Where(s => s.IsDeleted == null || s.IsDeleted == false).ToList();
		}

		public static bool DeleteCurrency(Currency currency)
		{
			if (currency == null) return false;
			currency.IsDeleted = true;
			bool OK = UpdateCurrency(currency);
			if (OK)
			{
				RemoveCurrenciesInEstates(currency);
			}
			return OK;
		}

		private static void RemoveCurrenciesInEstates(Currency currency)
		{
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				var estates = db.Estates.Where(s => s.CurrencyID == currency.CurrencyID);
				foreach (Estate estate in estates)
				{
					estate.Price = estate.PriceInAMD;
					estate.CurrencyID = null;
					estate.Currency = null;
					estate.LastModifiedDate = DateTime.Now;
				}
				db.SubmitChanges();
			}
			catch { }
		}

		public static bool AddCurrency(Currency currency)
		{
			if (currency == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				currency.LastModifiedDate = DateTime.Now;
				db.Currencies.InsertOnSubmit(currency);
				db.SubmitChanges();
				if (!currency.OriginalID.HasValue)
				{
					currency.OriginalID = currency.CurrencyID;
					db.SubmitChanges();
				}
				return true;
			}
			catch
			{
				return false;
			}
		}

		public static bool UpdateCurrency(Currency currency)
		{
			if (currency == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				var currencyInDB = db.Currencies.FirstOrDefault(s => s.CurrencyID == currency.CurrencyID);
				if (currencyInDB == null) return false;

				CopyProperties(currency, currencyInDB);
				currencyInDB.LastModifiedDate = DateTime.Now;
				bool isValueInAMDChanged = currencyInDB.ValueInAMD != currency.ValueInAMD;
				if (isValueInAMDChanged)
				{
					currencyInDB.ValueInAMD = currency.ValueInAMD;
				}
				db.SubmitChanges();
				if (isValueInAMDChanged)
				{
					UpdateCurrencyValueInEstates(currency, false);
				}
				return true;
			}
			catch
			{
				return false;
			}
		}

		private static void CopyProperties(Currency currency, Currency currencyInDB)
		{
			currencyInDB.IsDeleted = currency.IsDeleted;
			currencyInDB.NameAm = currency.NameAm;
			currencyInDB.NameRu = currency.NameRu;
			currencyInDB.NameEn = currency.NameEn;
			currencyInDB.NameCz = currency.NameCz;
			currencyInDB.NameKz = currency.NameKz;

		}

		private static void UpdateCurrencyValueInEstates(Currency currency, bool isOfflineMode)
		{
			DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
			try
			{
				var estates = db.Estates.Where(s => s.CurrencyID == currency.CurrencyID);
				foreach (Estate estate in estates)
				{
					//estate.LastModifiedDate = DateTime.Now;
					estate.PriceInAMD = estate.Price * currency.ValueInAMD;
				}
				db.SubmitChanges();
			}
			catch { }
		}

		public static Currency GetCurrency(int id, bool isOfflineMode)
		{
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).Currencies.FirstOrDefault(s => s.CurrencyID == id);
		}

		public static DateTime GetLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.Currencies.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<Currency> GetNewCurrencies(DateTime lastChangeDate)
		{
			if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
			{
				lastChangeDate = Constants.SQLAcceptedMinDateValue;
			}
			using (var db = new DataClassesDataContext())
			{
				return db.Currencies.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeCurrencies(List<Currency> currencies)
		{
			if (currencies == null || currencies.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var currency in currencies)
				{
					var itemInDB = db.Currencies.FirstOrDefault(s => s.OriginalID == currency.CurrencyID);
					if (itemInDB == null)
					{
						currency.OriginalID = currency.CurrencyID;
						db.Currencies.InsertOnSubmit(currency);
						db.SubmitChanges();
					}
					else
					{
						CopyProperties(currency, itemInDB);
						itemInDB.LastModifiedDate = currency.LastModifiedDate;
						bool isValueInAMDChanged = itemInDB.ValueInAMD != currency.ValueInAMD;
						if (isValueInAMDChanged)
						{
							itemInDB.ValueInAMD = currency.ValueInAMD;
						}
						db.SubmitChanges();
						if (isValueInAMDChanged)
						{
							UpdateCurrencyValueInEstates(currency, true);
						}
					}

				}
			}
		}
	}
}
