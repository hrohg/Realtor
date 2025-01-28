using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
    public class CountryManager: DataManagerBase
    {
        public static ObservableCollection<Country> GetCountries(bool offlineMode)
        {
            using(DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(offlineMode)))
            {
                return new ObservableCollection<Country>(db.Countries.Where(s => s.IsDeleted == null || s.IsDeleted == false));
            }
        }

        public static bool UpdateCountry(Country country)
        {
            if (country == null) return false;
            DataClassesDataContext db = new DataClassesDataContext();
            try
            {
                var countryInDB = db.Countries.FirstOrDefault(s => s.ID == country.ID);
                if (countryInDB == null) return false;

                CopyProperties(country, countryInDB);
                countryInDB.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        private static void CopyProperties(Country country, Country countryInDb)
        {
            countryInDb.IsDeleted = country.IsDeleted;
            countryInDb.NameAm = country.NameAm;
            countryInDb.NameRu = country.NameRu;
            countryInDb.NameEn = country.NameEn;
        }

        public static bool AddCountry(Country country)
        {
            if (country == null) return false;
            DataClassesDataContext db = new DataClassesDataContext();
            try
            {
                country.LastModifiedDate = DateTime.Now;
                db.Countries.InsertOnSubmit(country);
                db.SubmitChanges();
                if (!country.OriginalID.HasValue)
                {
                    country.OriginalID = country.ID;
                    db.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool DeleteCountry(Country country)
        {
            if (country == null) return true;
            using(DataClassesDataContext db = new DataClassesDataContext())
            {
                var countryInDb = db.Countries.Single(s => s.ID == country.ID);
                db.Countries.DeleteOnSubmit(countryInDb);
                try
                {
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
    }
}
