using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using RealEstate.Business.Managers;
using RealEstate.Common.Cultures;
using RealEstate.DataAccess;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for EstateListColumnsSelection.xaml
	/// </summary>
	public partial class EstateListColumnsSelection : Window
	{
		public EstateListColumnsSelection()
		{
			InitializeComponent();
		}

		private void btnOK_Click(object sender, RoutedEventArgs e)
		{
			for (int i = 0; i < lstColumns.Items.Count; i++)
			{
				var column = lstColumns.Items[i] as UserDisplayColumn;
				column.OrderIndex = i + 1;
			}
			RealtorSettingsManager.SaveDisplayColumns(Session.Inst.ApplicationSettings.ShowingColumns);
			this.DialogResult = true;
			Close();
		}

		private void listColumns_Loaded(object sender, RoutedEventArgs e)
		{

		}

		private void btnCancel_Click(object sender, RoutedEventArgs e)
		{
			this.DialogResult = false;
			Close();
		}
	}
}
