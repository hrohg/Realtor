﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
    public class CityManager : DataManagerBase
    {
        public static List<City> GetCities(bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            return db.Cities.Where(s => s.IsDeleted == null || s.IsDeleted == false).ToList();
        }

        public static List<City> GetCities(int stateID, bool isOfflineMode)
        {
            DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode));
            return db.Cities.Where(s => s.StateID == stateID && (s.IsDeleted == null || s.IsDeleted == false)).ToList();
        }

        public static bool DeleteCity(City city)
        {
            if (city == null) return false;
            city.IsDeleted = true;
            return UpdateCity(city);
        }

        public static bool UpdateCity(City city)
        {
            if (city == null) return false;
            DataClassesDataContext db = new DataClassesDataContext();
            try
            {
                var cityInDB = db.Cities.FirstOrDefault(s => s.CityID == city.CityID);
                if (cityInDB == null) return false;

                CopyProperties(city, cityInDB);
                cityInDB.LastModifiedDate = DateTime.Now;
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static void CopyProperties(City city, City cityInDB)
        {
            cityInDB.IsDeleted = city.IsDeleted;
            cityInDB.NameAm = city.NameAm;
            cityInDB.NameRu = city.NameRu;
            cityInDB.NameEn = city.NameEn;
            cityInDB.NameCz = city.NameCz;
            cityInDB.NameKz = city.NameKz;
            cityInDB.StateID = city.StateID;
	        cityInDB.CountryID = city.CountryID;
        }

        public static bool AddCity(City city)
        {
            if (city == null) return false;
            DataClassesDataContext db = new DataClassesDataContext();
            try
            {
                city.LastModifiedDate = DateTime.Now;
                db.Cities.InsertOnSubmit(city);
                db.SubmitChanges();
                if (!city.OriginalID.HasValue)
                {
                    city.OriginalID = city.CityID;
                    db.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static DateTime GetLastChangeDate()
        {
            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                var item = db.Cities.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
                if (item == null) return DateTime.MinValue;
                return item.LastModifiedDate ?? DateTime.MinValue;
            }
        }

        public static List<City> GetNewCities(DateTime lastModifiedDate)
        {
            if (lastModifiedDate < Constants.SQLAcceptedMinDateValue)
            {
                lastModifiedDate = Constants.SQLAcceptedMinDateValue;
            }
            using (var db = new DataClassesDataContext())
            {
                return db.Cities.Where(s => s.LastModifiedDate > lastModifiedDate).ToList();
            }
        }

        public static void SynchronizeCities(List<City> cities)
        {
            if (cities == null || cities.Count == 0) return;

            using (var db = new DataClassesDataContext(LocalConnectionString))
            {
                foreach (var city in cities)
                {
                    var itemInDB = db.Cities.FirstOrDefault(s => s.OriginalID == city.CityID);
                    if (itemInDB == null)
                    {
                        city.OriginalID = city.CityID;
                        db.Cities.InsertOnSubmit(city);
                    }
                    else
                    {
                        CopyProperties(city, itemInDB);
                        itemInDB.LastModifiedDate = city.LastModifiedDate;
                        itemInDB.OriginalID = city.CityID;
                    }
                    db.SubmitChanges();
                }
            }
        }

        public static ObservableCollection<City> GetCitiesByCountry(int countryID, bool isOfflineMode)
        {

            using (DataClassesDataContext db = new DataClassesDataContext(GetConnectionString(isOfflineMode)))
            {
                return new ObservableCollection<City>(db.Cities.Where(s => s.CountryID == countryID && (s.IsDeleted == null || s.IsDeleted == false)));
            }
        }
    }
}
