using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;


namespace RealEstate.DataAccess
{
	public static class DatabaseTools
	{
		public static bool BackupDatabase(String destinationPath, ref string errorMessage)
		{
			try
			{
				const string databaseName = "REDB";
				SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstate.DataAccess.Properties.Settings.REDBConnectionString"].ConnectionString);
				ServerConnection connection = new ServerConnection(con);
				Server sqlServer = new Server(connection);

				Backup bkpDatabase = new Backup();
				bkpDatabase.Action = BackupActionType.Database;
				bkpDatabase.Database = databaseName;
				BackupDeviceItem bkpDevice = new BackupDeviceItem(destinationPath, DeviceType.File);
				
				bkpDatabase.Devices.Add(bkpDevice);
				bkpDatabase.SqlBackup(sqlServer);
				connection.Disconnect();
				return true;
			}
			catch(Exception ex)
			{
				errorMessage = ex.Message;
				return false;
			}
		}


		public static bool RestoreDatabase(string bakupFilePath, string dataFolderPath, ref string errorMessage)
		{
			SqlConnection curSQLConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDBConnectionString"].ConnectionString);
			try
			{
				curSQLConnection.Open();
				ServerConnection sc = new ServerConnection(curSQLConnection);
				Server s = new Server(sc);
				Restore r = new Restore();
				r.Action = RestoreActionType.Database;
				r.Database = "REDB";
				r.ReplaceDatabase = true;
				r.Devices.AddDevice(bakupFilePath, DeviceType.File);
				r.RelocateFiles.Add(new RelocateFile("REDB", dataFolderPath + "\\REDB.mdf"));
				r.RelocateFiles.Add(new RelocateFile("REDB_log", dataFolderPath + "\\REDB.ldf"));
				r.SqlRestore(s);
				return true;
			}
			catch (Exception ex)
			{
				errorMessage = ex.Message;
				return false;
			}
			finally
			{
				curSQLConnection.Close();
			}

		}
	}
}
