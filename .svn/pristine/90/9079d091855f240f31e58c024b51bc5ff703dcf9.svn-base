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
	/// Interaction logic for EstateAdvancedAttributeTemplate.xaml
	/// </summary>
	public partial class EstateAdvancedAttributeTemplate : UserControl
	{


		public String Title
		{
			get { return (String)GetValue(TitleProperty); }
			set { SetValue(TitleProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Title.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty TitleProperty =
			DependencyProperty.Register("Title", typeof(String), typeof(EstateAdvancedAttributeTemplate), new UIPropertyMetadata(string.Empty, OnTitleChanged));

		private static void OnTitleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EstateAdvancedAttributeTemplate tmp = d as EstateAdvancedAttributeTemplate;
			tmp.Title = e.NewValue.ToString();
		}

		public String Value
		{
			get { return (String)GetValue(ValueProperty); }
			set { SetValue(ValueProperty, value); }
		}

		// Using a DependencyProperty as the backing store for Value.  This enables animation, styling, binding, etc...
		public static readonly DependencyProperty ValueProperty =
			DependencyProperty.Register("Value", typeof(String), typeof(EstateAdvancedAttributeTemplate), new UIPropertyMetadata(string.Empty, OnValueChanged));

		private static void OnValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
		{
			EstateAdvancedAttributeTemplate tmp = d as EstateAdvancedAttributeTemplate;
			tmp.Value = e.NewValue.ToString();
		}


		public EstateAdvancedAttributeTemplate()
		{
			InitializeComponent();
		}

		public EstateAdvancedAttributeTemplate(string title, string value):this()
		{
			Title = title;
			Value = value;
		}
	}
}
