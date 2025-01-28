using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Linq;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Windows;
using System.Xml.Serialization;
using Microsoft.Win32;
using RealEstate.Business.Helpers;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.DataAccess;
using Realtor.DTO;


namespace UserControls.Helpers
{
	public class RealtorFileManager
	{
		public static void SaveFile(IList estates)
		{
			if (estates == null || estates.Count == 0) return;
			List<EstateDto> estateDtos = new List<EstateDto>();
			foreach (var estate in estates)
			{
				estateDtos.Add(Translator.GetEstateDto((Estate)estate));
			}

			SaveFileDialog dialog = new SaveFileDialog { AddExtension = true, DefaultExt = "arx", RestoreDirectory = true };
			if (dialog.ShowDialog() ?? false)
			{
				if (!string.IsNullOrEmpty(dialog.FileName))
				{
					try
					{
						XmlSerializer serializer = new XmlSerializer(estateDtos.GetType());
						FileStream fs = new FileStream(dialog.FileName, FileMode.Create);
						TextWriter writer = new StreamWriter(fs, new UTF8Encoding());
						serializer.Serialize(writer, estateDtos);
						writer.Close();
					}
					catch (Exception)
					{
						MessageBox.Show(CultureResources.Inst["ErrorInSaveFile"], CultureResources.Inst["Error"]);
					}
					bool isImageUploadEnabled;
					bool.TryParse(ConfigurationManager.AppSettings["IsImageUploadEnabled"], out isImageUploadEnabled);
					if (isImageUploadEnabled)
					{
						string fptURL = ConfigurationManager.AppSettings["ImageUploadFtpURL"];
						string ftpUser = ConfigurationManager.AppSettings["ImageUploadFtpUser"];
						string ftpPass = ConfigurationManager.AppSettings["ImageUploadFtpPassword"];
						//FTP ftp = new FTP(fptURL, ftpUser, ftpPass);

						try
						{
							//ftp.Connect();
							var serverIP = ConfigurationManager.AppSettings["ServerIP"];
							bool fromLocal = (serverIP == "localhost" || serverIP == "127.0.0.1") && !Session.Inst.OfflineMode;
							string folderPath = Session.Inst.OfflineMode ? Constants.LocalImagesFolderPath : Constants.ImagesFolderPath;

							foreach (var estateObj in estates)
							{
								var estate = estateObj as Estate;
								var estateImages = estate.EstateImages.Where(s => s.ShowInSite && (s.IsDeleted == null || s.IsDeleted == false));
								if (!fromLocal)
								{
									CopyImagesToLocalFolder(estateImages);
									folderPath = Constants.ApplicationExecutablePath + @"_tempD\";
								}



								if (estateImages != null && estateImages.Count() != 0)
								{
									foreach (EstateImage estateImage in estateImages)
									{
										int triesCount = 0;
										do
										{
											if (triesCount == 5)
											{
												break;
											}
											triesCount++;
										} while (!UploadImageFile(estateImage, folderPath, fptURL, ftpUser, ftpPass));
									}
								}
							}

						}
						catch (Exception ex)
						{
						}
					}
				}
			}
		}

		private static bool UploadImageFile(EstateImage estateImage, string folderPath, string fptURL, string ftpUser, string ftpPass)
		{
			try
			{
				estateImage.ImageFilePath = string.Format("{0}{1}.{2}", folderPath, estateImage.ImageID,
														  (ImageTypes)estateImage.ImageTypeID.GetValueOrDefault(1));

				//StreamReader sourceStream = new StreamReader(estateImage.ImageFilePath);
				//byte[] fileContents = Encoding.UTF8.GetBytes(sourceStream.ReadToEnd());
				//sourceStream.Close();
				//using (var stream = new MemoryStream(fileContents))
				//{
					UploadFile(estateImage.ImageFilePath, Path.GetFileName(estateImage.ImageFilePath), fptURL, ftpUser, ftpPass);
				//}
				return true;
			}
			catch
			{
				return false;
			}
		}

		private static byte[] ReadFully(Stream input)
		{
			byte[] buffer = new byte[16 * 1024];
			using (MemoryStream ms = new MemoryStream())
			{
				int read;
				while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
				{
					ms.Write(buffer, 0, read);
				}
				return ms.ToArray();
			}
		}

		private static bool UploadFile(string filePath, string filename, string ftpURL, string user, string pass)
		{
			//stream.Seek(0, SeekOrigin.Begin);

			string uri = String.Format("{0}/{1}", ftpURL, filename);

			try
			{
				FtpWebRequest request = (FtpWebRequest)WebRequest.Create(uri);
				request.Method = WebRequestMethods.Ftp.UploadFile;

				// This example assumes the FTP site uses anonymous logon.
				request.Credentials = new NetworkCredential(user, pass);

				// Copy the contents of the file to the request stream.
				StreamReader sourceStream = new StreamReader(filePath);
				byte[] fileContents = ReadFully(sourceStream.BaseStream);
				sourceStream.Close();
				request.ContentLength = fileContents.Length;

				Stream requestStream = request.GetRequestStream();
				//requestStream.Seek(0, SeekOrigin.Begin);
				requestStream.Write(fileContents, 0, fileContents.Length);
				requestStream.Flush();
				requestStream.Close();

				//FtpWebResponse response = (FtpWebResponse)request.GetResponse();

				////Console.WriteLine("Upload File Complete, status {0}", response.StatusDescription);

				//response.Close();






				//FtpWebRequest reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri(uri));

				//reqFTP.Credentials = new NetworkCredential(user, pass);
				//reqFTP.Method = WebRequestMethods.Ftp.UploadFile;
				//reqFTP.KeepAlive = false;
				//reqFTP.UseBinary = true;
				//reqFTP.UsePassive = true;
				//reqFTP.ContentLength = stream.Length;
				////reqFTP.EnableSsl = true; // it's FTPES type of ftp

				//int buffLen = 2048;
				//byte[] buff = new byte[buffLen];
				//int contentLen;

				//try
				//{
				//	Stream ftpStream = reqFTP.GetRequestStream();
				//	contentLen = stream.Read(buff, 0, buffLen);
				//	while (contentLen != 0)
				//	{
				//		ftpStream.Write(buff, 0, contentLen);
				//		contentLen = stream.Read(buff, 0, buffLen);
				//	}
				//	ftpStream.Flush();
				//	ftpStream.Close();
				//}
				//catch (Exception exc)
				//{
				//	MessageBox.Show(exc.ToString());
				//	return false;
				//}
			}
			catch (Exception exc)
			{
				MessageBox.Show(exc.ToString());
				return false;
			}

			return true;
		}


		private static void CopyImagesToLocalFolder(IEnumerable<EstateImage> estateImages)
		{
			var tempFolderPath = Constants.ApplicationExecutablePath + @"_tempD\";
			if (Directory.Exists(tempFolderPath))
			{
				Directory.Delete(tempFolderPath, true);
			}

			Directory.CreateDirectory(tempFolderPath);

			foreach (EstateImage estateImage in estateImages)
			{
				estateImage.ImageFilePath = string.Format("{0}{1}.{2}",
												Constants.ImagesFolderPath, estateImage.ImageID,
												(ImageTypes)estateImage.ImageTypeID.GetValueOrDefault(1));
				try
				{
					File.Copy(estateImage.ImageFilePath, string.Format("{0}{1}", tempFolderPath, Path.GetFileName(estateImage.ImageFilePath)));
				}
				catch
				{
				}
			}

		}
	}
}
