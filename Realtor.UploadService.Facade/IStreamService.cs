using System.ServiceModel;

namespace Realtor.UploadService.Facade
{
	/// <summary>
	/// Представляет собой контракт сервиса для доступа к потоку на сервере.</summary>
	[ServiceContract]
	public interface IStreamService
	{
		/// <summary>
		/// Создает принимающий поток на сервере.</summary>
		/// <returns>Возвращает идентификатор, используемый для доступа к созданному потоку.</returns>
		[OperationContract]
		string CreateStream();

		/// <summary>
		/// Возвращает текущий размер потока.</summary>
		/// <param name="key">Идентификатор потока.</param>
		/// <returns>Текущий размер потока в байтах.</returns>
		[OperationContract]
		long GetStreamLength(string key);

		/// <summary>
		/// Производит чтение данных из потока на сервере.</summary>
		/// <param name="key">Идентификатор потока.</param>
		/// <param name="count">Максимальное количество байт, которое будет прочитано из потока (длина возвращаемого массива).</param>
		/// <param name="readedLength">Фактически прочитанная длина.</param>
		/// <returns>Массив байт длиной <paramref name="count"/> и содержащий прочитанные данные.</returns>
		[OperationContract]
		byte[] ReadFromStream(string key, int count, out int readedLength);

		/// <summary>
		/// Записывает переданный буфер в поток.</summary>
		/// <param name="key">Идентификатор потока.</param>
		/// <param name="buffer">Буфер для записи.</param>
		/// <returns>Текущий размер данных в потоке.</returns>
		[OperationContract]
		long WriteToStream(string key, byte[] buffer);

		/// <summary>
		/// Закрывает поток на сервере.</summary>
		/// <param name="key">Идентификатор потока.</param>
		[OperationContract]
		void CloseStream(string key);

		/// <summary>
		/// Уничтожает поток с сервера и освобождает все ресурсы связанные с ним.</summary>
		/// <param name="key">Идентификатор потока.</param>
		[OperationContract]
		void DisposeStream(string key);
	}
}
