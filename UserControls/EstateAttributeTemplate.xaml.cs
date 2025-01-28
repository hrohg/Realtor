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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace UserControls
{
	/// <summary>
	/// Interaction logic for EstateAttributeTemplate.xaml
	/// </summary>
	public partial class EstateAttributeTemplate : UserControl
	{


		public string Title
		{
			get { return (string)GetValue(TitleProperty); }
			set { SetValue(TitleProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Title.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty TitleProperty =
			DependencyProperty.Register("Title", typeof(string), typeof(EstateAttributeTemplate), new UIPropertyMetadata(string.Empty, OnTitleChanged));

		private static void OnTitleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EstateAttributeTemplate tmp = d as EstateAttributeTemplate;
			if (tmp != null)
			{
				tmp.Title = e.NewValue != null ? e.NewValue.ToString() : string.Empty;
			}
		}


		public EstateAttributeTemplate()
		{
			InitializeComponent();
		}

		public EstateAttributeTemplate(string title)
			: this()
		{
			this.Title = title;
		}
	}
}
