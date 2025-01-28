using System;
using System.Text;
using System.Collections;
using System.IO.Packaging;
using System.IO;
using System.IO.Compression;

namespace UpdateModule
{
    public class ZipHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sourceDir"></param>
        /// <param name="destinyFile"></param>
        public static void ZipDirectory(string sourceDir, string destinyFile)
        {
            ArrayList fileList = GenerateFileList(sourceDir);

            ZipPackage zip = (ZipPackage)ZipPackage.Open(destinyFile, FileMode.OpenOrCreate);

            foreach (string Fil in fileList) // for each file, generate a zipentry
            {
                string Fl = Fil.Remove(0, sourceDir.Length);
                Fl = Fl.Replace("\\", "/");
                PackagePart pp = zip.CreatePart(new Uri(Fl, UriKind.Relative), "", CompressionOption.Normal);

                using (FileStream fileStream = new FileStream(
                    Fil, FileMode.Open, FileAccess.Read))
                {
                    CopyStream(fileStream, pp.GetStream());
                }
            }

            zip.Flush();
            zip.Close();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sourceDir"></param>
        /// <param name="destinyFile"></param>
        public static void ZipDirectoryForSvodTemplate(string sourceDir, string destinyFile, string replaceName)
        {
            string file = (string)(GenerateFileList(sourceDir)[0]);

            ZipPackage zip = (ZipPackage)ZipPackage.Open(destinyFile, FileMode.OpenOrCreate);

            string Fl = file.Remove(0, sourceDir.Length);
            Fl = Fl.Replace("\\", "/");
            Fl = Fl.Replace("svodtemplate", replaceName);
            PackagePart pp = zip.CreatePart(new Uri(Fl, UriKind.Relative), "", CompressionOption.Normal);

            using (FileStream fileStream = new FileStream(
                file, FileMode.Open, FileAccess.Read))
            {
                CopyStream(fileStream, pp.GetStream());
            }

            zip.Flush();
            zip.Close();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sourceZipFile"></param>
        /// <param name="destinyFolder"></param>
        public static void UnZipFile(string sourceZipFile, string destinyFolder)
        {
            Package zip = ZipPackage.Open(sourceZipFile, FileMode.Open, FileAccess.ReadWrite);

            if (!Directory.Exists(destinyFolder))
                Directory.CreateDirectory(destinyFolder);

            foreach (ZipPackagePart contentFile in zip.GetParts())
                CreateFile(destinyFolder, contentFile);

            zip.Flush();
            zip.Close();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <param name="output"></param>
        public static void CopyStream(Stream input, Stream output)
        {
            byte[] buffer = new byte[input.Length];
            while (true)
            {
                int read = input.Read(buffer, 0, buffer.Length);
                if (read <= 0)
                {
                    return;
                }
                output.Write(buffer, 0, read);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Dir"></param>
        /// <returns></returns>
        private static ArrayList GenerateFileList(string Dir)
        {
            ArrayList fils = new ArrayList();
            bool Empty = true;
            foreach (string file in Directory.GetFiles(Dir)) // add each file in directory
            {
                fils.Add(file);
                Empty = false;
            }

            if (Empty)
            {
                if (Directory.GetDirectories(Dir).Length == 0)
                // if directory is completely empty, add it
                {
                    fils.Add(Dir + @"/");
                }
            }

            foreach (string dirs in Directory.GetDirectories(Dir)) // recursive
            {
                foreach (object obj in GenerateFileList(dirs))
                {
                    fils.Add(obj);
                }
            }
            return fils; // return file list
        }
        /// <summary>
        /// Method to create file at the temp folder
        /// </summary>
        /// <param name="rootFolder"></param>
        /// <param name="contentFileURI"></param>
        /// <returns></returns>
        private static void CreateFile(string rootFolder, ZipPackagePart contentFile)
        {
            // Initially create file under the folder specified
            string contentFilePath = string.Empty;
            contentFilePath = contentFile.Uri.OriginalString.Replace('/', Path.DirectorySeparatorChar);

            if (contentFilePath.StartsWith(Path.DirectorySeparatorChar.ToString()))
            {
                contentFilePath = contentFilePath.TrimStart(Path.DirectorySeparatorChar);
            }

            contentFilePath = Path.Combine(rootFolder, contentFilePath);

            //Check for the folder already exists. If not then create that folder

            if (Directory.Exists(Path.GetDirectoryName(contentFilePath)) != true)
            {
                Directory.CreateDirectory(Path.GetDirectoryName(contentFilePath));
            }

            FileStream newFileStream = File.Create(contentFilePath);
            newFileStream.Close();
            byte[] content = new byte[contentFile.GetStream().Length];
            contentFile.GetStream().Read(content, 0, content.Length);
            File.WriteAllBytes(contentFilePath, content);
        }

        public static string Compress(string text)
        {
            byte[] buffer = Encoding.UTF8.GetBytes(text);
            MemoryStream ms = new MemoryStream();
            using (GZipStream zip = new GZipStream(ms, CompressionMode.Compress, true))
            {
                zip.Write(buffer, 0, buffer.Length);
            }

            ms.Position = 0;
            MemoryStream outStream = new MemoryStream();

            byte[] compressed = new byte[ms.Length];
            ms.Read(compressed, 0, compressed.Length);

            byte[] gzBuffer = new byte[compressed.Length + 4];
            System.Buffer.BlockCopy(compressed, 0, gzBuffer, 4, compressed.Length);
            System.Buffer.BlockCopy(BitConverter.GetBytes(buffer.Length), 0, gzBuffer, 0, 4);
            return Convert.ToBase64String(gzBuffer);
        }

        public static string Decompress(string compressedText, bool returnCompressedTextOnError)
        {
            try
            {
                if (compressedText != null)
                {
                    byte[] gzBuffer = Convert.FromBase64String(compressedText);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        int msgLength = BitConverter.ToInt32(gzBuffer, 0);
                        ms.Write(gzBuffer, 4, gzBuffer.Length - 4);

                        byte[] buffer = new byte[msgLength];

                        ms.Position = 0;
                        using (GZipStream zip = new GZipStream(ms, CompressionMode.Decompress))
                        {
                            zip.Read(buffer, 0, buffer.Length);
                        }

                        return Encoding.UTF8.GetString(buffer);
                    }
                }
                return null;

            }
            catch (Exception ex)
            {
                if (returnCompressedTextOnError)
                {
                    return compressedText;
                }
                else
                {
                    throw;
                }
            }
        }
    }
}
