﻿#pragma checksum "..\..\OperationalSignificancesManagement.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "B701C1208ADD5B48DFB82A0783D8107B"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34209
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Microsoft.Windows.Controls;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms.Integration;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace RealEstateApp {
    
    
    /// <summary>
    /// OperationalSignificancesManagement
    /// </summary>
    public partial class OperationalSignificancesManagement : System.Windows.Window, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 4 "..\..\OperationalSignificancesManagement.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal RealEstateApp.OperationalSignificancesManagement form;
        
        #line default
        #line hidden
        
        
        #line 26 "..\..\OperationalSignificancesManagement.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbEstateTypes;
        
        #line default
        #line hidden
        
        
        #line 30 "..\..\OperationalSignificancesManagement.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbSignificanceOfTheUses;
        
        #line default
        #line hidden
        
        
        #line 35 "..\..\OperationalSignificancesManagement.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dgOperationalSignificances;
        
        #line default
        #line hidden
        
        
        #line 54 "..\..\OperationalSignificancesManagement.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnOk;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/RealEstateApp;component/operationalsignificancesmanagement.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\OperationalSignificancesManagement.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.form = ((RealEstateApp.OperationalSignificancesManagement)(target));
            
            #line 5 "..\..\OperationalSignificancesManagement.xaml"
            this.form.KeyUp += new System.Windows.Input.KeyEventHandler(this.form_KeyUp);
            
            #line default
            #line hidden
            
            #line 6 "..\..\OperationalSignificancesManagement.xaml"
            this.form.Loaded += new System.Windows.RoutedEventHandler(this.form_Loaded);
            
            #line default
            #line hidden
            return;
            case 2:
            this.cbEstateTypes = ((System.Windows.Controls.ComboBox)(target));
            
            #line 27 "..\..\OperationalSignificancesManagement.xaml"
            this.cbEstateTypes.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cbEstateTypes_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.cbSignificanceOfTheUses = ((System.Windows.Controls.ComboBox)(target));
            
            #line 31 "..\..\OperationalSignificancesManagement.xaml"
            this.cbSignificanceOfTheUses.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cbSignificanceOfTheUses_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.dgOperationalSignificances = ((System.Windows.Controls.DataGrid)(target));
            
            #line 37 "..\..\OperationalSignificancesManagement.xaml"
            this.dgOperationalSignificances.RowEditEnding += new System.EventHandler<System.Windows.Controls.DataGridRowEditEndingEventArgs>(this.dgOperationalSignificances_RowEditEnding);
            
            #line default
            #line hidden
            return;
            case 6:
            this.btnOk = ((System.Windows.Controls.Button)(target));
            
            #line 54 "..\..\OperationalSignificancesManagement.xaml"
            this.btnOk.Click += new System.Windows.RoutedEventHandler(this.btnOk_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 5:
            
            #line 47 "..\..\OperationalSignificancesManagement.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.ButtonDelete_Click);
            
            #line default
            #line hidden
            break;
            }
        }
    }
}

