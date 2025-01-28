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
using RealEstate.Business.Helpers;
using RealEstate.Business.Managers;
using RealEstate.DataAccess;

namespace UserControls
{
    /// <summary>
    /// Interaction logic for DemandView.xaml
    /// </summary>
    public partial class DemandView : Window
    {

        #region Dependency Properties

        public List<EstatesAndDemand> ShowedEstates
        {
            get { return (List<EstatesAndDemand>)GetValue(ShowedEstatesProperty); }
            set { SetValue(ShowedEstatesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for ShowedEstates.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ShowedEstatesProperty =
            DependencyProperty.Register("ShowedEstates", typeof(List<EstatesAndDemand>), typeof(DemandView), new PropertyMetadata(null, OnShowedEstatesChanged));

        private static void OnShowedEstatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((DemandView)d).ShowedEstates = (List<EstatesAndDemand>)e.NewValue;
        }

        public List<ClientSuggestedEstate> OfferedEstates
        {
            get { return (List<ClientSuggestedEstate>)GetValue(OfferedEstatesProperty); }
            set { SetValue(OfferedEstatesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for OfferedEstates.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty OfferedEstatesProperty =
            DependencyProperty.Register("OfferedEstates", typeof(List<ClientSuggestedEstate>), typeof(DemandView), new PropertyMetadata(null, OnOfferedEstatesChanged));

        private static void OnOfferedEstatesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((DemandView)d).OfferedEstates = (List<ClientSuggestedEstate>)e.NewValue;
        }


        public NeededEstate Demand
        {
            get { return (NeededEstate)GetValue(DemandProperty); }
            set { SetValue(DemandProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Demand.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty DemandProperty =
            DependencyProperty.Register("Demand", typeof(NeededEstate), typeof(DemandView), new UIPropertyMetadata(null, OnDemandChanged));

        private static void OnDemandChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((DemandView)d).Demand = (NeededEstate)e.NewValue;
        }

        #endregion

        public DemandView(NeededEstate demand)
        {
            InitializeComponent();
            this.Demand = demand;
            this.Title = demand.SellerName ?? string.Empty;
            LoadShowedAndOfferedEstates();
        }

        private void LoadShowedAndOfferedEstates()
        {
            ShowedAndOfferedEstates data = DemandManager.GetShowedAndOfferedEstates(Demand.ID);
            ShowedEstates = data.ShowedEstates;
            OfferedEstates = data.OfferedEstates;
        }

        private void btnOk_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void demandVw_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                Close();
            }
        }

        private void dgEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            OpenEstate((dgEstates.SelectedItem as EstatesAndDemand).Estate);
        }

        private void OpenEstate(Estate estate)
        {
            new EstateView(estate).Show();
        }

        private void mnuShowedPrintSelected_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            if (dgEstates.SelectedItems != null && dgEstates.SelectedItems.Count > 0)
            {
                PrintColumnsSelectionForm form = new PrintColumnsSelectionForm(dgEstates.SelectedItems.OfType<EstatesAndDemand>().Select(s => s.Estate).ToList());
                form.ShowDialog();
            }
        }

        private void btnShowedAddComment_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            var showInfo = dgEstates.SelectedItem as EstatesAndDemand;
            var commentWindow = new CommentWindow(showInfo.Comment);
            if (commentWindow.ShowDialog() ?? false)
            {
                showInfo.Comment = commentWindow.Comment;
                EstatesAndDemandManager.SaveShowInfo(showInfo);
            }
        }

        private void btnShowedDeleteDemand_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;

            if (Session.Inst.BEManager.DeleteShoingInfo(dgEstates.SelectedItem as EstatesAndDemand))
            {
                LoadShowedAndOfferedEstates();
            }
        }

        private void mnuOpenEstate_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            OpenEstate((dgEstates.SelectedItem as EstatesAndDemand).Estate);
        }

        private void mnuOpenSuggestedEstate_Click(object sender, RoutedEventArgs e)
        {
            if (dgSuggestedEstates.SelectedItem == null) return;
            OpenEstate((dgSuggestedEstates.SelectedItem as ClientSuggestedEstate).Estate);
        }

        private void dgSuggestedEstates_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dgSuggestedEstates.SelectedItem == null) return;
            OpenEstate((dgSuggestedEstates.SelectedItem as ClientSuggestedEstate).Estate);
        }

        private void btnDeleteDemand_Click(object sender, RoutedEventArgs e)
        {
            if (dgSuggestedEstates.SelectedItems.Count == 0) return;
            if (EstatesAndDemandManager.DeleteSuggestInfo(dgSuggestedEstates.SelectedItems.OfType<ClientSuggestedEstate>()))
            {
                LoadShowedAndOfferedEstates();
            }
        }

        private void btnAddComment_Click(object sender, RoutedEventArgs e)
        {
            if (dgSuggestedEstates.SelectedItem == null) return;
            var suggestInfo = dgSuggestedEstates.SelectedItem as ClientSuggestedEstate;
            var commentWindow = new CommentWindow(suggestInfo.Comment);
            if (commentWindow.ShowDialog() ?? false)
            {
                suggestInfo.Comment = commentWindow.Comment;
                EstatesAndDemandManager.SaveSuggestInfo(suggestInfo);
            }
        }

        private void mnuPrintSelected_Click(object sender, RoutedEventArgs e)
        {
            if (dgSuggestedEstates.SelectedItems != null && dgSuggestedEstates.SelectedItems.Count > 0)
            {
                PrintColumnsSelectionForm form = new PrintColumnsSelectionForm(dgSuggestedEstates.SelectedItems.OfType<ClientSuggestedEstate>().Select(s => s.Estate).ToList());
                form.ShowDialog();
            }
        }

        private void dgEstates_ContextMenuOpening(object sender, ContextMenuEventArgs e)
        {
            mnuShowed_AddComment.Visibility = mnuShowed_Delete.Visibility = mnuShowed_Open.Visibility = dgEstates.SelectedItems.Count > 1 ? Visibility.Collapsed : Visibility.Visible;
        }

        private void dgSuggestedEstates_ContextMenuOpening(object sender, ContextMenuEventArgs e)
        {
            mnuSuggest_AddComment.Visibility = mnuSuggest_Delete.Visibility = mnuSuggest_Open.Visibility = dgSuggestedEstates.SelectedItems.Count > 1 ? Visibility.Collapsed : Visibility.Visible;
        }
    }
}
