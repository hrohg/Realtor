﻿using System;
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
using RealEstate.Common;

namespace RealEstateApp
{
	/// <summary>
	/// Interaction logic for HelpWindow.xaml
	/// </summary>
	public partial class HelpWindow : Window
	{
		public HelpWindow()
		{
			InitializeComponent();
			webBrowser.Source = new Uri(Constants.ApplicationExecutablePath + "Help.htm");
			//todo: localize help
		}
	}
}
