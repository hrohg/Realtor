using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using RealEstate.Common;
using RealEstate.Common.Enumerations;

namespace RealEstate.Business.Managers
{
	public static class FileManager
	{
		public static void SavePrintableColumns(ObservableCollection<ShowableColumn> rightList, ObservableCollection<ShowableColumn> leftList)
		{
			string settingsFilePath = string.Format(@"{0}\{1}", Constants.ApplicationExecutablePath, Constants.PrintColumnsFilePath);
			FileStream fs = new FileStream(settingsFilePath, FileMode.Create);

			BinaryFormatter formatter = new BinaryFormatter();
			try
			{
				foreach (ShowableColumn column in rightList)
				{
					column.Show = true;
				}
				foreach (ShowableColumn column in leftList)
				{
					column.Show = false;
				}
				var columns = rightList.ToList();
				columns.AddRange(leftList);
				formatter.Serialize(fs, columns);
			}
			catch (Exception ex)
			{
				var v = ex.ToString();
			}
			finally
			{
				fs.Close();
			}
		}

		public static IEnumerable<ShowableColumn> GetPrintableColumns()
		{
			string showableColumnsFilePath = string.Format(@"{0}\{1}", Constants.ApplicationExecutablePath, Constants.PrintColumnsFilePath);
			if (File.Exists(showableColumnsFilePath))
			{
				FileStream fileStream = new FileStream(showableColumnsFilePath, FileMode.Open);
				try
				{
					BinaryFormatter serializer = new BinaryFormatter();
					return (List<ShowableColumn>)serializer.Deserialize(fileStream);
				}
				catch (Exception ex)
				{
					var v = ex.ToString();
					return ApplicationSettings.GetEstateColumns();
				}
				finally
				{
					fileStream.Close();
				}

			}
			return ApplicationSettings.GetEstateColumns();
		}
	}


}
