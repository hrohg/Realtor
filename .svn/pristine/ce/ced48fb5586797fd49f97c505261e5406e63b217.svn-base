using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for SimpleExceptionBox.xaml
	/// </summary>
	public partial class SimpleExceptionBox : Window
	{
		public static object CanProceedHandleExceptionMonitor = new object();
		public System.Exception ExceptionHandled { get; set; }
		public event System.EventHandler<CustomExceptionHandlingEventArgs> ExceptionHandlingApproved;

		public SimpleExceptionBox()
		{
			InitializeComponent();
		}

		public SimpleExceptionBox(string exceptionMessage):this()
		{
			ExceptionText = exceptionMessage;
		}

		public string ExceptionText
		{
			get { return (string)GetValue(ExceptionTextProperty); }
			set { SetValue(ExceptionTextProperty, value); }
		}

		// Using a DependencyProperty as the backing store for ExceptionText.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ExceptionTextProperty = DependencyProperty.Register("ExceptionText", typeof(string), typeof(SimpleExceptionBox));

		private void btOK_Click(object sender, RoutedEventArgs e)
		{
			try
			{
				Close();
			}
			catch (System.InvalidOperationException) { }
			if (ExceptionHandlingApproved != null)
				ExceptionHandlingApproved(this, new CustomExceptionHandlingEventArgs(ExceptionHandled));
			lock (CanProceedHandleExceptionMonitor)
				System.Threading.Monitor.Pulse(CanProceedHandleExceptionMonitor);
		}

	}
}
