﻿#pragma checksum "..\..\DemandView.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "AEAA43D103B57C39C651D1F8AD19A480"
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
using Shared.Converters;
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
using UserControls;


namespace UserControls {
    
    
    /// <summary>
    /// DemandView
    /// </summary>
    public partial class DemandView : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 8 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal UserControls.DemandView demandVw;
        
        #line default
        #line hidden
        
        
        #line 107 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal Microsoft.Windows.Controls.DataGrid dgSuggestedEstates;
        
        #line default
        #line hidden
        
        
        #line 111 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem mnuSuggest_Open;
        
        #line default
        #line hidden
        
        
        #line 112 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem mnuSuggest_Delete;
        
        #line default
        #line hidden
        
        
        #line 113 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem mnuSuggest_AddComment;
        
        #line default
        #line hidden
        
        
        #line 114 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem mnuPrintSelected;
        
        #line default
        #line hidden
        
        
        #line 165 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal Microsoft.Windows.Controls.DataGrid dgEstates;
        
        #line default
        #line hidden
        
        
        #line 169 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem mnuShowed_Open;
        
        #line default
        #line hidden
        
        
        #line 170 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem mnuShowed_Delete;
        
        #line default
        #line hidden
        
        
        #line 171 "..\..\DemandView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem mnuShowed_AddComment;
        
        #line default
        #line hidden
        
        
        #line 220 "..\..\DemandView.xaml"
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
            System.Uri resourceLocater = new System.Uri("/UserControls;component/demandview.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\DemandView.xaml"
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
            this.demandVw = ((UserControls.DemandView)(target));
            
            #line 3 "..\..\DemandView.xaml"
            this.demandVw.KeyUp += new System.Windows.Input.KeyEventHandler(this.demandVw_KeyUp);
            
            #line default
            #line hidden
            return;
            case 2:
            this.dgSuggestedEstates = ((Microsoft.Windows.Controls.DataGrid)(target));
            
            #line 107 "..\..\DemandView.xaml"
            this.dgSuggestedEstates.MouseDoubleClick += new System.Windows.Input.MouseButtonEventHandler(this.dgSuggestedEstates_MouseDoubleClick);
            
            #line default
            #line hidden
            
            #line 108 "..\..\DemandView.xaml"
            this.dgSuggestedEstates.ContextMenuOpening += new System.Windows.Controls.ContextMenuEventHandler(this.dgSuggestedEstates_ContextMenuOpening);
            
            #line default
            #line hidden
            return;
            case 3:
            this.mnuSuggest_Open = ((System.Windows.Controls.MenuItem)(target));
            
            #line 111 "..\..\DemandView.xaml"
            this.mnuSuggest_Open.Click += new System.Windows.RoutedEventHandler(this.mnuOpenSuggestedEstate_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.mnuSuggest_Delete = ((System.Windows.Controls.MenuItem)(target));
            
            #line 112 "..\..\DemandView.xaml"
            this.mnuSuggest_Delete.Click += new System.Windows.RoutedEventHandler(this.btnDeleteDemand_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.mnuSuggest_AddComment = ((System.Windows.Controls.MenuItem)(target));
            
            #line 113 "..\..\DemandView.xaml"
            this.mnuSuggest_AddComment.Click += new System.Windows.RoutedEventHandler(this.btnAddComment_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.mnuPrintSelected = ((System.Windows.Controls.MenuItem)(target));
            
            #line 114 "..\..\DemandView.xaml"
            this.mnuPrintSelected.Click += new System.Windows.RoutedEventHandler(this.mnuPrintSelected_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.dgEstates = ((Microsoft.Windows.Controls.DataGrid)(target));
            
            #line 165 "..\..\DemandView.xaml"
            this.dgEstates.MouseDoubleClick += new System.Windows.Input.MouseButtonEventHandler(this.dgEstates_MouseDoubleClick);
            
            #line default
            #line hidden
            
            #line 166 "..\..\DemandView.xaml"
            this.dgEstates.ContextMenuOpening += new System.Windows.Controls.ContextMenuEventHandler(this.dgEstates_ContextMenuOpening);
            
            #line default
            #line hidden
            return;
            case 8:
            this.mnuShowed_Open = ((System.Windows.Controls.MenuItem)(target));
            
            #line 169 "..\..\DemandView.xaml"
            this.mnuShowed_Open.Click += new System.Windows.RoutedEventHandler(this.mnuOpenEstate_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.mnuShowed_Delete = ((System.Windows.Controls.MenuItem)(target));
            
            #line 170 "..\..\DemandView.xaml"
            this.mnuShowed_Delete.Click += new System.Windows.RoutedEventHandler(this.btnShowedDeleteDemand_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.mnuShowed_AddComment = ((System.Windows.Controls.MenuItem)(target));
            
            #line 171 "..\..\DemandView.xaml"
            this.mnuShowed_AddComment.Click += new System.Windows.RoutedEventHandler(this.btnShowedAddComment_Click);
            
            #line default
            #line hidden
            return;
            case 11:
            
            #line 172 "..\..\DemandView.xaml"
            ((System.Windows.Controls.MenuItem)(target)).Click += new System.Windows.RoutedEventHandler(this.mnuShowedPrintSelected_Click);
            
            #line default
            #line hidden
            return;
            case 12:
            this.btnOk = ((System.Windows.Controls.Button)(target));
            
            #line 220 "..\..\DemandView.xaml"
            this.btnOk.Click += new System.Windows.RoutedEventHandler(this.btnOk_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

