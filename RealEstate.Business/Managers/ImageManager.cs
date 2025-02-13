﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Linq;
using System.IO;
using System.Linq;
using System.Text;
using AK.Converters;
using RealEstate.Common;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;

namespace RealEstate.Business.Managers
{
	public class ImageManager : DataManagerBase
	{
		public static bool UpdateImages(int estateID, ObservableCollection<EstateImage> estateImages, ref StringBuilder errorMessage)
		{
			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				var estateImgaesFromDB = db.EstateImages.Where(s => s.EstateID == estateID);
				var tempImages = new List<EstateImage>();
				foreach (var image in estateImages)
				{
					var fileName = Path.GetFileNameWithoutExtension(image.ImageFilePath);
					var imgID = AKConvert.ToInt32(fileName);
					if (imgID > 0)
					{
						var img = estateImgaesFromDB.FirstOrDefault(s => s.ImageID == imgID);
						if (img == null)
						{
							tempImages.Add(image);
						}
						else
						{
							img.ShowInSite = image.ShowInSite;
							img.IsMain = image.IsMain;
						}
					}
					else
					{
						tempImages.Add(image);
					}
				}
				db.SubmitChanges();
				if (tempImages.Count > 0)
				{
					return SaveImages(estateID, tempImages, ref errorMessage) != -1;
				}
				return true;
			}
			catch (Exception)
			{
				return false;
			}
		}

		public static int SaveImages(int estateID, List<EstateImage> estateImages, ref StringBuilder errorMessage)
		{
			List<EstateImage> images = new List<EstateImage>();
			//List<ImageFullInfo> imagesForSave = new List<ImageFullInfo>();
			foreach (var imageFileName in estateImages)
			{
				var imageTypeID = GetImageType(imageFileName.ImageFilePath);
				if (imageTypeID > 0)
				{
					images.Add(new EstateImage
					{
						EstateID = estateID,
						ImageTypeID = imageTypeID,
						LastModifiedDate = DateTime.Now,
						ShowInSite = imageFileName.ShowInSite,
						IsMain = imageFileName.IsMain,
						ImageFilePath = imageFileName.ImageFilePath
					});
				}
			}
			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				foreach (EstateImage image in images)
				{
					db.EstateImages.InsertOnSubmit(image);
				}
				db.SubmitChanges();
				List<int> conflictedImagesIds = SaveFileImages(images);
				if (conflictedImagesIds.Count > 0)
				{
					DeleteImagesFromDBOnly(conflictedImagesIds);
				}
				return conflictedImagesIds.Count;
			}
			catch (Exception)
			{
				return -1;
			}
		}

		private static List<int> SaveFileImages(List<EstateImage> images)
		{
			List<int> conflictedImages = new List<int>();
			foreach (EstateImage image in images)
			{
				try
				{
					File.Copy(image.ImageFilePath, Constants.ImagesFolderPath + image.ImageID + Path.GetExtension(image.ImageFilePath), true);
				}
				catch
				{
					conflictedImages.Add(image.ImageID);
				}
			}
			return conflictedImages;
		}

		private static int GetImageType(string fileName)
		{
			try
			{
				return (int)(ImageTypes)Enum.Parse(typeof(ImageTypes), Path.GetExtension(fileName).TrimStart('.'));
			}
			catch (Exception)
			{
				return 0;
			}
		}

		public static void RemoveImage(int imageId)
		{
			try
			{
				DataClassesDataContext db = new DataClassesDataContext();
				var image = db.EstateImages.FirstOrDefault(s => s.ImageID == imageId);
				if (image != null)
				{
					string imageFilePath = string.Format("{0}{1}.{2}", Constants.ImagesFolderPath, image.ImageID, (ImageTypes)image.ImageTypeID);
					image.IsDeleted = true;
					image.LastModifiedDate = DateTime.Now;
					db.EstateImages.DeleteOnSubmit(image);
					db.SubmitChanges();
					File.Delete(imageFilePath);
				}
			}
			catch (Exception)
			{
			}
		}

		private static void DeleteImagesFromDBOnly(List<int> imageIDs)
		{
			if (imageIDs == null || imageIDs.Count <= 0) return;

			DataClassesDataContext db = new DataClassesDataContext();
			foreach (int imageID in imageIDs)
			{
				try
				{
					EstateImage image = db.EstateImages.FirstOrDefault(s => s.ImageID == imageID);
					if (image == null) continue;
					image.IsDeleted = true;
					image.LastModifiedDate = DateTime.Now;
					//db.EstateImages.DeleteOnSubmit(image);
					db.SubmitChanges();
				}
				catch { }
			}
		}

		public static void DeleteImages(List<EstateImage> estateImages)
		{
			DataClassesDataContext db = new DataClassesDataContext();
			var imageIDs = estateImages.Select(s => s.ImageID);
			if (imageIDs.Count() == 0) return;
			try
			{
				var imagesFromDb = db.EstateImages.Where(s => imageIDs.Contains(s.ImageID));
				foreach (EstateImage estateImage in imagesFromDb)
				{
					estateImage.IsDeleted = true;
					estateImage.LastModifiedDate = DateTime.Now;
				}
				db.EstateImages.DeleteAllOnSubmit(imagesFromDb);
				db.SubmitChanges();
				foreach (EstateImage image in estateImages)
				{
					File.Delete(string.Format("{0}{1}.{2}", Constants.ImagesFolderPath, image.ImageID, (ImageTypes)image.ImageTypeID)); //3=jpg
				}
			}
			catch { }
		}

		public static void DeleteImageFiles(List<EstateImage> estateImages)
		{
			foreach (EstateImage image in estateImages)
			{
				try
				{
					File.Delete(string.Format("{0}{1}.{2}", Constants.ImagesFolderPath, image.ImageID, (ImageTypes)image.ImageTypeID.GetValueOrDefault(3))); //3=jpg
				}
				catch { }
				//todo: Delete image file ======> The process cannot access the file 'D:\WORK\Other\RealEstateApp\RealEstateApp\bin\Debug\EstateImages\43.jpg' because it is being used by another process.
			}
		}

		public static List<string> GetFilePaths(EntitySet<EstateImage> estateImages)
		{
			if (estateImages == null) return new List<string>();
			return estateImages.Select(estateImage => string.Format("{0}{1}.{2}", Constants.ImagesFolderPath, estateImage.ImageID, (ImageTypes)estateImage.ImageTypeID)).ToList();
		}

		public static int SaveVideos(int estateId, ObservableCollection<string> estateVideos, ref StringBuilder errorMessage)
		{
			if (estateId <= 0 || estateVideos == null || estateVideos.Count == 0) return 0;

			DataClassesDataContext db = new DataClassesDataContext();
			List<EstateVideo> videosObjects = new List<EstateVideo>();
			foreach (var video in estateVideos)
			{
				if (!string.IsNullOrEmpty(video) && !video.Contains(Constants.VideosFolderPath))
				{
					var videoObj = new EstateVideo
								{
									FileExtension = Path.GetExtension(video),
									EstateID = estateId,
									VideoFilePath = video,
									LastModifiedDate = DateTime.Now
								};
					db.EstateVideos.InsertOnSubmit(videoObj);
					videosObjects.Add(videoObj);
				}
			}
			db.SubmitChanges();
			var conflictedVideoFilesIDs = new List<int>();
			foreach (var video in videosObjects)
			{
				if (video.ID > 0)
				{
					try
					{
						File.Copy(video.VideoFilePath, Constants.VideosFolderPath + video.ID + video.FileExtension, true);
					}
					catch (Exception ex)
					{
						if (errorMessage == null)
						{
							errorMessage = new StringBuilder();
						}
						errorMessage.AppendLine(ex.ToString());
						conflictedVideoFilesIDs.Add(video.ID);
					}
				}
			}
			if (conflictedVideoFilesIDs.Count > 0)
			{
				var conflictedVideos = db.EstateVideos.Where(s => conflictedVideoFilesIDs.Contains(s.ID));
				db.EstateVideos.DeleteAllOnSubmit(conflictedVideos);
				db.SubmitChanges();
			}
			return conflictedVideoFilesIDs.Count;
		}

		public static void DeleteVideo(string videoPath)
		{
			try
			{
				var videoID = Convert.ToInt32(Path.GetFileNameWithoutExtension(videoPath));
				DataClassesDataContext db = new DataClassesDataContext();
				var videoInDB = db.EstateVideos.Single(s => s.ID == videoID);
				videoInDB.LastModifiedDate = DateTime.Now;
				videoInDB.IsDeleted = true;
				db.EstateVideos.DeleteOnSubmit(videoInDB);
				db.SubmitChanges();
				File.Delete(videoPath);
			}
			catch (Exception ex)
			{
				var e = ex.ToString();
			}
		}

		public static void DeleteVideos(IEnumerable<EstateVideo> estateVideos)
		{
			foreach (var video in estateVideos)
			{
				var filePath = Constants.VideosFolderPath + video.ID + video.FileExtension;
				if (File.Exists(filePath))
				{
					try
					{
						File.Delete(filePath);
					}
					catch { }
				}
			}
		}

		public static void SynchronizeEstateImages(Estate estateFromDb, List<EstateImage> imagesList)
		{
			using (var db = new DataClassesDataContext(LocalConnectionString))
			{

				var imageIDs = imagesList.Select(s => s.ImageID);
				if (imageIDs.Any())
				{
					var imagesFromDb = db.EstateImages.Where(s => imageIDs.Contains(s.OriginalID.GetValueOrDefault(-1)));

					foreach (EstateImage image in imagesFromDb)
					{
						try
						{
							var filePath = string.Format("{0}{1}.{2}", Constants.LocalImagesFolderPath, image.ImageID, (ImageTypes)image.ImageTypeID);
							File.Delete(filePath); //3=jpg
						}
						catch (Exception ex)
						{
							var v = ex.ToString();
						}
					}
					db.EstateImages.DeleteAllOnSubmit(imagesFromDb);
					db.SubmitChanges();

				}
				List<EstateImage> imagesToInsert = new List<EstateImage>();
				foreach (EstateImage estateImage in imagesList.Where(s => s.IsDeleted == null || s.IsDeleted == false))
				{
					imagesToInsert.Add(new EstateImage
										{
											EstateID = estateFromDb.EstateID,
											ImageTypeID = estateImage.ImageTypeID,
											OriginalID = estateImage.ImageID,
											LastModifiedDate = estateImage.LastModifiedDate
										});

				}
				db.EstateImages.InsertAllOnSubmit(imagesToInsert);
				db.SubmitChanges();
				foreach (EstateImage image in imagesToInsert)
				{
					try
					{
						var localFilePath = string.Format("{0}{1}.{2}", Constants.LocalImagesFolderPath, image.ImageID, (ImageTypes)image.ImageTypeID);
						var remoteFilePath = string.Format("{0}{1}.{2}", Constants.ImagesFolderPath, image.OriginalID, (ImageTypes)image.ImageTypeID);
						File.Copy(remoteFilePath, localFilePath, true);
					}
					catch (Exception ex)
					{
						var v = ex.ToString();
					}
				}
			}
		}

	    public static bool IsImageDeleted(string idStr)
	    {
	        int imageID ;
            if (!int.TryParse(idStr, out imageID)) return true;

            using (var db = new DataClassesDataContext())
            {
                return db.EstateImages.Any(s => s.IsDeleted == true && s.ImageID == imageID);
            }
	    }
	}
}
