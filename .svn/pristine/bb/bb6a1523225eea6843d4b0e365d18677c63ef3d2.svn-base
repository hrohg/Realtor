using System;
using System.Collections.Generic;
using System.Linq;
using RealEstate.Common;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class ProjectManager : DataManagerBase
	{
		public static List<Project> GetProjects(bool isOfflineMode)
		{
			return new DataClassesDataContext(GetConnectionString(isOfflineMode)).Projects.Where(s => s.IsDeleted == null || s.IsDeleted == false).ToList();
		}

		public static bool DeleteProject(Project project)
		{
			if (project == null) return false;
			project.IsDeleted = true;
			return UpdateProject(project);
		}

		public static bool UpdateProject(Project project)
		{
			if (project == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				Project projectInDB = db.Projects.FirstOrDefault(s => s.ProjectID == project.ProjectID);
				if (projectInDB == null) return false;
				CopyProperties(project, projectInDB);
				projectInDB.LastModifiedDate = DateTime.Now;
				db.SubmitChanges();
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		private static void CopyProperties(Project project, Project projectInDB)
		{
			projectInDB.IsDeleted = project.IsDeleted;
			projectInDB.NameAm = project.NameAm;
			projectInDB.NameRu = project.NameRu;
			projectInDB.NameEn = project.NameEn;
			projectInDB.NameCz = project.NameCz;
			projectInDB.NameKz = project.NameKz;
			projectInDB.SortIndex = project.SortIndex;
		}

		public static bool AddProject(Project project)
		{
			if (project == null) return false;
			DataClassesDataContext db = new DataClassesDataContext();
			try
			{
				project.LastModifiedDate = DateTime.Now;
				db.Projects.InsertOnSubmit(project);
				db.SubmitChanges();
				if (!project.OriginalID.HasValue)
				{
					project.OriginalID = project.ProjectID;
					db.SubmitChanges();
				}
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public static DateTime GetLastChangeDate()
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				var item = db.Projects.OrderByDescending(s => s.LastModifiedDate).FirstOrDefault();
				if (item == null) return DateTime.MinValue;
				return item.LastModifiedDate ?? DateTime.MinValue;
			}
		}

		public static List<Project> GetNewProjects(DateTime lastChangeDate)
		{
			if (lastChangeDate < Constants.SQLAcceptedMinDateValue)
			{
				lastChangeDate = Constants.SQLAcceptedMinDateValue;
			}
			using (var db = new DataClassesDataContext())
			{
				return db.Projects.Where(s => s.LastModifiedDate > lastChangeDate).ToList();
			}
		}

		public static void SynchronizeProjects(List<Project> projects)
		{
			if (projects == null || projects.Count == 0) return;

			using (var db = new DataClassesDataContext(LocalConnectionString))
			{
				foreach (var item in projects)
				{
					var itemInDB = db.Projects.FirstOrDefault(s => s.OriginalID == item.ProjectID);
					if (itemInDB == null)
					{
						item.OriginalID = item.ProjectID;
						db.Projects.InsertOnSubmit(item);
					}
					else
					{
						CopyProperties(item, itemInDB);
						itemInDB.LastModifiedDate = item.LastModifiedDate;
					}
					db.SubmitChanges();
				}
			}
		}
	}
}
