using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.IO;
using System.Threading;

using System.Collections.Generic;
using System.Windows.Threading;
using RealEstate.Common.Cultures;
using Realtor.UploadService.Facade;


namespace RPN.ViewModel.Common
{
	public class StreamServiceClient
	{
		#region EventArgs classes
		public class ProgressEventArgs : EventArgs
		{
			public ProgressEventArgs(long maximum, long value)
			{
				Maximum = maximum;
				Value = value;
			}

			public long Maximum { get; private set; }
			public long Value { get; private set; }
		}
		public class CompletedEventArgs : EventArgs
		{
			public CompletedEventArgs(string remoteStreamKey) { RemoteStreamKey = remoteStreamKey; }
			public string RemoteStreamKey { get; private set; }
		}
		public class ErrorEventArgs : EventArgs
		{
			public ErrorEventArgs(Exception error) { Error = error; }
			public Exception Error { get; private set; }
		}
		#endregion

		#region Events
		public event EventHandler<ProgressEventArgs> ProgressChanged;
		protected virtual void OnProgressChanged(long maximum, long value)
		{
			if (ProgressChanged == null) return;
			if (Dispatcher == null || Dispatcher.CheckAccess())
			{
				ProgressChanged(this, new ProgressEventArgs(maximum, value));
			}
			else
			{
				Dispatcher.BeginInvoke(new Action<long, long>
					(OnProgressChanged), maximum, value);
			}
		}

		public event EventHandler<CompletedEventArgs> Completed;
		protected virtual void OnCompleted(string remoteStreamKey)
		{
			if (Completed == null) return;
			if (Dispatcher == null || Dispatcher.CheckAccess())
			{
				Completed(this, new CompletedEventArgs(remoteStreamKey));
			}
			else
			{
				Dispatcher.BeginInvoke(new Action<string>
					(OnCompleted), remoteStreamKey);
			}
		}

		public event EventHandler<ErrorEventArgs> Error;
		protected virtual void OnError(Exception exception)
		{
			if (Error == null) return;
			if (Dispatcher == null || Dispatcher.CheckAccess())
			{
				Error(this, new ErrorEventArgs(exception));
			}
			else
			{
				Dispatcher.BeginInvoke(new Action<Exception>(OnError), exception);
			}
		}
		#endregion

		public StreamServiceClient() : this(TimeSpan.FromMinutes(5)) { }

		public StreamServiceClient(TimeSpan timeout)
		{
			this.Timeout = timeout;
		}

		public static readonly int DefaultBufferSize = 0x4000;

		public IStreamService StreamService { get; set; }

		public Dispatcher Dispatcher { get; set; }

		public TimeSpan Timeout { get; set; }

		IDictionary<string, object> fieldTags;
		public IDictionary<string, object> Tags
		{
			get { return fieldTags ?? (fieldTags = new Dictionary<string, object>()); }
		}

		/// <summary>
		/// Записывает поток данных на сервер из указанного источника в асинхронной манере. 
		/// Для передачи будет использоваться буфер размером <see cref="DefaultBufferSize"/>.</summary>
		/// <param name="source">Источник данных, из которого будет происходить чтение.</param>
		public void WriteFromAsync(Stream source)
		{
			WriteFromAsync(source, DefaultBufferSize);
		}

		/// <summary>
		/// Записывает поток данных на сервер из указанного источника в асинхронной манере. 
		/// Для передачи будет использоваться буфер указанного размера.</summary>
		/// <param name="source">Источник данных, из которого будет происходить чтение.</param>
		/// <param name="bufferSize">Размер буфера, используемого для передачи данных.</param>
		public void WriteFromAsync(Stream source, int bufferSize)
		{
			ThreadPool.QueueUserWorkItem(
				delegate
				{
					WriteFrom(source, bufferSize);
				});
		}

		/// <summary>
		/// Записывает поток данных на сервер из указанного источника. 
		/// Для передачи будет использоваться буфер размером <see cref="DefaultBufferSize"/>.</summary>
		/// <param name="source">Источник данных, из которого будет происходить чтение.</param>
		/// <returns>Ключ, по которому удаленная сторона может получить доступ к переданному потоку.</returns>
		public string WriteFrom(Stream source)
		{
			return WriteFrom(source, DefaultBufferSize);
		}

		/// <summary>
		/// Записывает поток данных на сервер из указанного источника. 
		/// Для передачи будет использоваться буфер указанного размера.</summary>
		/// <param name="source">Источник данных, из которого будет происходить чтение.</param>
		/// <param name="bufferSize">Размер буфера, используемого для передачи данных.</param>
		/// <returns>Ключ потока данных на сервере.</returns>
		public string WriteFrom(Stream source, int bufferSize)
		{
			string streamKey = string.Empty;
			try
			{
				streamKey = RetriveStreamKey();

				byte[] buffer = new byte[bufferSize];
				byte[] bufferToWrite;
				int readedLen = 0;

				while ((readedLen = source.Read(buffer, 0, buffer.Length)) > 0)
				{
					if (buffer.Length > readedLen)
					{
						bufferToWrite = new byte[readedLen];
						Buffer.BlockCopy(buffer, 0, bufferToWrite, 0, readedLen);
					}
					else
					{
						bufferToWrite = buffer;
					}

					long result = StreamService.WriteToStream(streamKey, bufferToWrite);
					////WaitAsyncHandle(asyncResult);
					//long totalWrited = StreamService.WriteToStream(asyncResult);
					//OnProgressChanged(source.Length, totalWrited);
				}

				OnCompleted(streamKey);
				return streamKey;
			}
			catch (Exception ex)
			{
				OnError(ex);
			    return null;
			}
		}


		/// <summary>
		/// Читает поток данных с сервера в указанный приемник в асинхронной манере.
		/// Для передачи будет использоваться буфер размером <see cref="DefaultBufferSize"/>.</summary>
		/// <param name="destination">Приемник данных, в который будет происходить запись.</param>
		/// <param name="streamKey">Ключ потока данных на сервере.</param>
		public void ReadToAsync(Stream destination, string streamKey)
		{
			ReadToAsync(destination, streamKey, DefaultBufferSize);
		}

		/// <summary>
		/// Читает поток данных с сервера в указанный приемник в асинхронной манере.
		/// Для передачи будет использоваться буфер указанного размера.</summary>
		/// <param name="destination">Приемник данных, в который будет происходить запись.</param>
		/// <param name="streamKey">Ключ потока данных на сервере.</param>
		/// <param name="bufferSize">Размер буфера, используемого для передачи данных.</param>
		public void ReadToAsync(Stream destination, string streamKey, int bufferSize)
		{
			ThreadPool.QueueUserWorkItem(
				delegate
				{
					ReadTo(destination, streamKey, bufferSize);
				});
		}

		/// <summary>
		/// Читает поток данных с сервера в указанный приемник.
		/// Для передачи будет использоваться буфер размером <see cref="DefaultBufferSize"/>.</summary>
		/// <param name="destination">Приемник данных, в который будет происходить запись.</param>
		/// <param name="streamKey">Ключ потока данных на сервере.</param>
		/// <param name="bufferSize">Размер буфера, используемого для передачи данных.</param>
		public void ReadTo(Stream destination, string streamKey)
		{
			ReadTo(destination, streamKey, DefaultBufferSize);
		}

		/// <summary>
		/// Читает поток данных с сервера в указанный приемник.
		/// Для передачи будет использоваться буфер указанного размера.</summary>
		/// <param name="destination">Приемник данных, в который будет происходить запись.</param>
		/// <param name="streamKey">Ключ потока данных на сервере.</param>
		/// <param name="bufferSize">Размер буфера, используемого для передачи данных.</param>
		public void ReadTo(Stream destination, string streamKey, int bufferSize)
		{
			try
			{
				long totalLength = RetriveStreamLength(streamKey);
				int readedLen = 0;

				do
				{
					var buffer = StreamService.ReadFromStream(streamKey, bufferSize, out readedLen);
					//WaitAsyncHandle(asyncResult);
					//byte[] buffer = StreamService.EndReadFromStream(out readedLen, asyncResult);
					destination.Write(buffer, 0, readedLen);

					OnProgressChanged(totalLength, destination.Length);
				} while (readedLen > 0);

				OnCompleted(streamKey);
			}
			catch (Exception ex)
			{
				OnError(ex);
				throw;
			}
		}


		public void BeginDisposeStream(string streamKey)
		{
			StreamService.DisposeStream(streamKey);
			//WaitAsyncHandle(asyncResult);
			//return StreamService.EndCreateStream(asyncResult);
		}

		private long RetriveStreamLength(string streamKey)
		{
			return StreamService.GetStreamLength(streamKey);
			//WaitAsyncHandle(asyncResult);
			//return StreamService.EndGetStreamLength(asyncResult);
		}

		private string RetriveStreamKey()
		{
			return StreamService.CreateStream();
			//WaitAsyncHandle(asyncResult);
			//return StreamService.EndCreateStream(asyncResult);
		}

		private void WaitAsyncHandle(IAsyncResult asyncResult)
		{
		    if (!asyncResult.AsyncWaitHandle.WaitOne(this.Timeout))
            {return;
				throw new TimeoutException("End waiting time");}
				//throw new TimeoutException(CultureResources.Inst["EndWaitingTime"]);
		}
	}
}
