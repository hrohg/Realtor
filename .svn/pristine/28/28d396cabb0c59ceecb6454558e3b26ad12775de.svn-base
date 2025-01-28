using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace RealEstateApp
{
	public partial class PDFViewWinFormsControl : UserControl
	{
		public PDFViewWinFormsControl()
		{
			InitializeComponent();
		}

		public PDFViewWinFormsControl(string pdfFilePath):this()
		{
			this.axAcroPDF1.LoadFile(pdfFilePath);
		}
	}
}
