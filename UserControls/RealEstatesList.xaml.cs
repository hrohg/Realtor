﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Configuration;
using System.Data.Linq;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Media;
using RPN.ViewModel.Common;
using RealEstate.Business.Helpers;
using RealEstate.Business.Managers;
using RealEstate.Common;
using RealEstate.Common.Cultures;
using RealEstate.Common.Enumerations;
using RealEstate.Common.Helpers;
using RealEstate.DataAccess;
using RealEstateApp.CustomControls;
using Realtor.DTO;
using Realtor.UploadService.Facade;
using Shared.Helpers;
using Stimulsoft.Report;
using UserControls.Helpers;
using BlobService = Shared.Helpers.ServiceExecutionContext<Realtor.UploadService.Facade.IImageUpload>;
using Color = System.Windows.Media.Color;
using Point = System.Windows.Point;

namespace UserControls
{
    /// <summary>
    /// Interaction logic for RealEstatesList.xaml
    /// </summary>
    public partial class RealEstatesList : INotifyPropertyChanged
    {


        public int TotalItems
        {
            get { return (int)GetValue(TotalItemsProperty); }
            set { SetValue(TotalItemsProperty, value); }
        }

        // Using a DependencyProperty as the backing store for TotalItems.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty TotalItemsProperty =
            DependencyProperty.Register("TotalItems", typeof(int), typeof(RealEstatesList), new UIPropertyMetadata(0));

        public string ShowOnlyMyDataButtonTooltip
        {
            get { return (string)GetValue(ShowOnlyMyDataButtonTooltipProperty); }
            set { SetValue(ShowOnlyMyDataButtonTooltipProperty, value); }
        }

        // Using a DependencyProperty as the backing store for ShowOnlyMyDataButtonTooltip.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ShowOnlyMyDataButtonTooltipProperty =
            DependencyProperty.Register("ShowOnlyMyDataButtonTooltip", typeof(string), typeof(RealEstatesList), new UIPropertyMetadata(string.Empty));

        public bool ShowOnlyUsersData
        {
            get { return (bool)GetValue(ShowOnlyUsersDataProperty); }
            set { SetValue(ShowOnlyUsersDataProperty, value); }
        }

        // Using a DependencyProperty as the backing store for ShowOnlyUsersData.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ShowOnlyUsersDataProperty =
            DependencyProperty.Register("ShowOnlyUsersData", typeof(bool), typeof(RealEstatesList), new UIPropertyMetadata(false, OnShowOnlyUsersDataChanged));

        private static void OnShowOnlyUsersDataChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var estatesList = d as RealEstatesList;
            estatesList.ShowOnlyUsersData = (bool)e.NewValue;
            estatesList.UpdateShowingOnlyUsersData();
            if (estatesList.ShowOnlyUsersData)
            {
                estatesList.ShowOnlyMyDataButtonTooltip = CultureResources.Inst["ShowAllData"];
            }
            else
            {
                estatesList.ShowOnlyMyDataButtonTooltip = CultureResources.Inst["ShowOnlyMyData"];
            }
        }

        private void UpdateShowingOnlyUsersData()
        {
            if (ShowOnlyUsersData)
            {
                RealEstates = new ObservableCollection<Estate>(RealEstates.Where(s => s.BrokerID == Session.Inst.User.ID));
            }
            else
            {
                RefreshEstates();
            }
        }

        public string SearchCriteriaInfo
        {
            get { return (string)GetValue(SearchCriteriaInfoProperty); }
            set { SetValue(SearchCriteriaInfoProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SearchCriteriaInfo.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SearchCriteriaInfoProperty =
            DependencyProperty.Register("SearchCriteriaInfo", typeof(string), typeof(RealEstatesList), new UIPropertyMetadata(string.Empty, OnSearchCriteriaInfoChanged));

        private static void OnSearchCriteriaInfoChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            RealEstatesList ctrl = d as RealEstatesList;
            if (ctrl != null)
            {
                ctrl.SearchCriteriaInfo = e.NewValue.ToString();
            }
        }

        public DragDockPanel EstatesAndDemandsControl
        {
            get { return (DragDockPanel)GetValue(EstatesAndDemandsControlProperty); }
            set { SetValue(EstatesAndDemandsControlProperty, value); }
        }

        // Using a DependencyProperty as the backing store for EstatesAndDemandsControl.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty EstatesAndDemandsControlProperty =
            DependencyProperty.Register("EstatesAndDemandsControl", typeof(DragDockPanel), typeof(RealEstatesList), new UIPropertyMetadata(null, OnEstatesAndDemandsControlChanged));

        private static void OnEstatesAndDemandsControlChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var estatesList = d as RealEstatesList;
            if (estatesList != null)
            {
                estatesList.EstatesAndDemandsControl = (DragDockPanel)e.NewValue;
            }
        }


        public DragDockPanel FavoriteEstatesControl
        {
            get { return (DragDockPanel)GetValue(FavoriteEstatesControlProperty); }
            set { SetValue(FavoriteEstatesControlProperty, value); }
        }

        // Using a DependencyProperty as the backing store for FavoriteEstatesControl.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty FavoriteEstatesControlProperty =
            DependencyProperty.Register("FavoriteEstatesControl", typeof(DragDockPanel), typeof(RealEstatesList), new UIPropertyMetadata(null, OnFavoriteEstatesListChanged));

        private static void OnFavoriteEstatesListChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            RealEstatesList ctrl = d as RealEstatesList;
            if (ctrl != null)
            {
                ctrl.FavoriteEstatesControl = (DragDockPanel)e.NewValue;
            }
        }

        public List<Currency> Currencies
        {
            get { return (List<Currency>)GetValue(CurrenciesProperty); }
            set { SetValue(CurrenciesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Currencies.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CurrenciesProperty =
            DependencyProperty.Register("Currencies", typeof(List<Currency>), typeof(RealEstatesList), new UIPropertyMetadata(null, OnCurrenciesChanged));

        private static void OnCurrenciesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            RealEstatesList ctrl = d as RealEstatesList;
            if (ctrl != null)
            {
                ctrl.Currencies = (List<Currency>)e.NewValue;
            }
        }

        public DragDockPanel EditControl
        {
            get { return (DragDockPanel)GetValue(EditControlProperty); }
            set { SetValue(EditControlProperty, value); }
        }

        // Using a DependencyProperty as the backing store for EditControl.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty EditControlProperty =
            DependencyProperty.Register("EditControl", typeof(DragDockPanel), typeof(RealEstatesList), new UIPropertyMetadata(null, OnEditControlChanged));

        private static void OnEditControlChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            RealEstatesList rel = (RealEstatesList)sender;
            if (rel != null)
            {
                rel.EditControl = (DragDockPanel)e.NewValue;
            }
        }

        public ObservableCollection<Estate> RealEstates
        {
            get { return (ObservableCollection<Estate>)GetValue(RealEstatesProperty); }
            set { SetValue(RealEstatesProperty, value); }
        }

        public RealEstateSearchParameters SearchParameters
        {
            get { return (RealEstateSearchParameters)GetValue(SearchParametersProperty); }
            set { SetValue(SearchParametersProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SearchParameters.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SearchParametersProperty =
            DependencyProperty.Register("SearchParameters", typeof(RealEstateSearchParameters), typeof(RealEstatesList), new UIPropertyMetadata(null, OnSearchParametersChanged));

        private static void OnSearchParametersChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            RealEstatesList rel = (RealEstatesList)sender;
            if (rel != null)
            {
                rel.SearchParameters = (RealEstateSearchParameters)e.NewValue;
                rel.RefreshEstates();
            }
        }

        private void InitializeSearchCriteriaInfo()
        {
            if (SearchParameters == null)
            {
                SearchCriteriaInfo = string.Empty;
                return;
            }

            StringBuilder sb = new StringBuilder(string.Format("{0} - ", CultureResources.Inst["Search"]));
            foreach (EstateType type in SearchParameters.RealEstateTypes)
            {
                sb.AppendFormat("{0}, ", type.TypeName);
            }
            Currency cur = Session.Inst.BEManager.GetCurrency(1, Session.Inst.OfflineMode);

            string currencyName = cur != null ? cur.Name : string.Empty;

            if (SearchParameters.Currency != null && !string.IsNullOrEmpty(SearchParameters.Currency.Name))
            {
                currencyName = SearchParameters.Currency.Name;
            }

            if (SearchParameters.PriceFrom.HasValue && SearchParameters.PriceTo.HasValue)
            {
                if (SearchParameters.PriceFrom == SearchParameters.PriceTo)
                {
                    sb.AppendFormat(" {2} {0} {1}, ", SearchParameters.PriceFrom, currencyName, CultureResources.Inst["Price"]);
                }
                else
                {
                    sb.AppendFormat(" {3} {0} - {1} {2}, ", SearchParameters.PriceFrom, SearchParameters.PriceTo, currencyName, CultureResources.Inst["Price"]);
                }
            }
            else if (SearchParameters.PriceFrom.HasValue)
            {
                sb.AppendFormat(" {2} > {0} {1}, ", SearchParameters.PriceFrom, currencyName, CultureResources.Inst["Price"]);
            }
            else if (SearchParameters.PriceTo.HasValue)
            {
                sb.AppendFormat(" {2} < {0} {1}, ", SearchParameters.PriceTo, currencyName, CultureResources.Inst["Price"]);
            }

            if (SearchParameters.RoomCountFrom.HasValue && SearchParameters.RoomCountTo.HasValue)
            {
                if (SearchParameters.RoomCountFrom == SearchParameters.RoomCountTo)
                {
                    sb.AppendFormat(" {1} {0}, ", SearchParameters.RoomCountFrom, CultureResources.Inst["Rooms"]);
                }
                else
                {
                    sb.AppendFormat(" {2} {0} - {1}, ", SearchParameters.RoomCountFrom, SearchParameters.RoomCountTo, CultureResources.Inst["Rooms"]);
                }
            }
            else if (SearchParameters.RoomCountFrom.HasValue)
            {
                sb.AppendFormat(" {1} > {0}, ", SearchParameters.RoomCountFrom, CultureResources.Inst["Rooms"]);
            }
            else if (SearchParameters.RoomCountTo.HasValue)
            {
                sb.AppendFormat(" {1} < {0}, ", SearchParameters.RoomCountTo, CultureResources.Inst["Rooms"]);
            }

            if (SearchParameters.SquareFrom.HasValue && SearchParameters.SquareTo.HasValue)
            {
                if (SearchParameters.SquareFrom == SearchParameters.SquareTo)
                {
                    sb.AppendFormat(" {1} {0}, ", SearchParameters.SquareFrom, CultureResources.Inst["TheSquare"]);
                }
                else
                {
                    sb.AppendFormat(" {2} {0} - {1}, ", SearchParameters.SquareFrom, SearchParameters.SquareTo, CultureResources.Inst["TheSquare"]);
                }
            }
            else if (SearchParameters.SquareFrom.HasValue)
            {
                sb.AppendFormat(" {1} > {0}, ", SearchParameters.SquareFrom, CultureResources.Inst["TheSquare"]);
            }
            else if (SearchParameters.SquareTo.HasValue)
            {
                sb.AppendFormat(" {1} < {0}, ", SearchParameters.SquareTo, CultureResources.Inst["TheSquare"]);
            }

            if (SearchParameters.FloorFrom.HasValue && SearchParameters.FloorTo.HasValue)
            {
                if (SearchParameters.FloorFrom != SearchParameters.FloorTo)
                {
                    sb.AppendFormat(" {2} {0} - {1}, ", SearchParameters.FloorFrom, SearchParameters.FloorTo, CultureResources.Inst["TheSquare"]);
                }
                else
                {
                    sb.AppendFormat(" {1} {0}, ", SearchParameters.FloorFrom, CultureResources.Inst["TheSquare"]);
                }
            }
            else if (SearchParameters.FloorFrom.HasValue)
            {
                sb.AppendFormat(" {1} > {0}, ", SearchParameters.FloorFrom, CultureResources.Inst["TheSquare"]);
            }
            else if (SearchParameters.FloorTo.HasValue)
            {
                sb.AppendFormat(" {1} < {0}, ", SearchParameters.FloorTo, CultureResources.Inst["TheSquare"]);
            }

            var paramInfo = sb.ToString().TrimEnd(',', ' ');
            SearchCriteriaInfo = paramInfo == string.Format("{0} - ", CultureResources.Inst["Search"]) ? string.Empty : paramInfo;
        }

        public void RefreshEstates()
        {
            //SearchParameters = new RealEstateSearchParameters();
            int totalItems;
            RealEstates = Session.Inst.BEManager.GetSearchedRealEstates(SearchParameters, Session.Inst.User, out totalItems, Session.Inst.OfflineMode);
            TotalItems = totalItems;
            if (ShowOnlyUsersData)
            {
                RealEstates = new ObservableCollection<Estate>(RealEstates.Where(s => s.BrokerID == Session.Inst.User.ID));
            }
            InvokePropertyChanged("Start");
            InvokePropertyChanged("End");
            InitializeSearchCriteriaInfo();
        }

        // Using a DependencyProperty as the backing store for RealEstates.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty RealEstatesProperty =
            DependencyProperty.Register("RealEstates", typeof(ObservableCollection<Estate>), typeof(RealEstatesList), new UIPropertyMetadata(null, OnRealEstatesChanged));

        private static void OnRealEstatesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            RealEstatesList wnd = sender as RealEstatesList;
            if (wnd != null)
            {
                wnd.RealEstates = (ObservableCollection<Estate>)e.NewValue;
            }
        }

        public Currency SelectedGridCurrency
        {
            get { return (Currency)GetValue(SelectedGridCurrencyProperty); }
            set { SetValue(SelectedGridCurrencyProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SelectedGridCurrency.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedGridCurrencyProperty =
            DependencyProperty.Register("SelectedGridCurrency", typeof(Currency), typeof(RealEstatesList), new UIPropertyMetadata(null, OnSelectedGridCurrencyChanged));

        private static void OnSelectedGridCurrencyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var form = d as RealEstatesList;
            if (form != null)
            {
                form.SelectedGridCurrency = (Currency)e.NewValue;
                if (form.SelectedGridCurrency.CurrencyID != -1)
                {
                    foreach (Estate estate in form.RealEstates)
                    {
                        if (estate.Currency == null) continue;
                        var priceInAMD = estate.Currency.ValueInAMD * estate.Price;
                        estate.Currency = form.SelectedGridCurrency;
                        estate.Price = priceInAMD / estate.Currency.ValueInAMD;
                        if (estate.PricePerDayInAMD.HasValue)
                        {
                            estate.PricePerDay = (int)(estate.PricePerDayInAMD / estate.Currency.ValueInAMD);
                        }
                    }
                }
                else
                {
                    form.RefreshEstates();
                }
            }
        }

        public List<Currency> GridCurrencies
        {
            get { return (List<Currency>)GetValue(GridCurrenciesProperty); }
            set { SetValue(GridCurrenciesProperty, value); }
        }

        // Using a DependencyProperty as the backing store for GridCurrencies.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty GridCurrenciesProperty =
            DependencyProperty.Register("GridCurrencies", typeof(List<Currency>), typeof(RealEstatesList), new UIPropertyMetadata(null, OnGridCurrenciesChanged));

        private static void OnGridCurrenciesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var form = d as RealEstatesList;
            if (form != null)
            {
                form.GridCurrencies = (List<Currency>)e.NewValue;
            }
        }



        public List<UserDisplayColumn> DisplayColumns
        {
            get { return (List<UserDisplayColumn>)GetValue(DisplayColumnsProperty); }
            set { SetValue(DisplayColumnsProperty, value); }
        }

        // Using a DependencyProperty as the backing store for DisplayColumns.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty DisplayColumnsProperty =
            DependencyProperty.Register("DisplayColumns", typeof(List<UserDisplayColumn>), typeof(RealEstatesList), new UIPropertyMetadata(null));

        public RealEstatesList()
        {
            SearchParameters = new RealEstateSearchParameters { DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose, ItemsCountPerPage = 100 };
            //InitializeDisplayFields();
            InitializeComponent();
        }

        private void InitializeDisplayFields()
        {
            if (Session.Inst.ApplicationSettings.ShowingColumns == null || Session.Inst.ApplicationSettings.ShowingColumns.Count != 25)
            {
                var columns = RealtorSettingsManager.GetDisplayColumns(Session.Inst.User, Session.Inst.OfflineMode);
                foreach (UserDisplayColumn column in columns)
                {
                    column.ColumnName = CultureResources.Inst[column.ColumnName];
                }
                Session.Inst.ApplicationSettings.ShowingColumns = new ObservableCollection<UserDisplayColumn>(columns);
            }
        }

        private ObservableCollection<Estate> FillRealEstates(ObservableCollection<Estate> realEstates)
        {
            var Projects = Session.Inst.BEManager.GetProjects(Session.Inst.OfflineMode);
            var Remonts = Session.Inst.BEManager.GetRemonts(Session.Inst.OfflineMode);
            var RealEstateTypes = Session.Inst.BEManager.GetEstateTypes(Session.Inst.User, Session.Inst.OfflineMode);
            var BuildingTypes = Session.Inst.BEManager.GetBuildingTypes(Session.Inst.OfflineMode);
            var OrderTypes = Session.Inst.BEManager.GetOrderTypesForEstate(Session.Inst.User, Session.Inst.OfflineMode);
            var Regions = Session.Inst.BEManager.GetRegions(1, Session.Inst.User, Session.Inst.OfflineMode);
            var Streets = Session.Inst.BEManager.GetStreets(Session.Inst.OfflineMode);

            foreach (Estate estate in realEstates)
            {
                var tempEstate = estate;
                if (tempEstate.BuildingType != null)
                {
                    estate.BuildingType = BuildingTypes.FirstOrDefault(s => s.BuildingTypeID == tempEstate.BuildingType.BuildingTypeID);
                }
                if (tempEstate.Currency != null)
                {
                    estate.Currency = Currencies.FirstOrDefault(s => s.CurrencyID == tempEstate.Currency.CurrencyID);
                }
                if (tempEstate.OrderType != null)
                {
                    estate.OrderType = OrderTypes.FirstOrDefault(s => s.OrderTypeID == tempEstate.OrderType.OrderTypeID);
                }
                if (estate.Project != null)
                {
                    estate.Project = Projects.FirstOrDefault(s => s.ProjectID == tempEstate.Project.ProjectID);
                }
                if (estate.EstateType != null)
                {
                    estate.EstateType = RealEstateTypes.FirstOrDefault(s => s.EstateTypeID == tempEstate.EstateType.EstateTypeID);
                }
                if (estate.Remont != null)
                {
                    estate.Remont = Remonts.FirstOrDefault(s => s.RemontID == tempEstate.Remont.RemontID);
                }
                if (estate.Region != null)
                {
                    estate.Region = Regions.FirstOrDefault(s => s.RegionID == tempEstate.Region.RegionID);
                }
                if (estate.Street != null)
                {
                    estate.Street = Streets.FirstOrDefault(s => s.StreetID == tempEstate.Street.StreetID);
                }
            }
            return realEstates;
        }

        private void mnuEdit_Click(object sender, RoutedEventArgs e)
        {
            AddEditRealEstate edit = (AddEditRealEstate)EditControl.FindName("addrealEstate");
            edit.RealEstate = (Estate)dgEstates.SelectedItem;
            EditControl.MaximizeToggle_Checked(sender, e);
        }

        private void mnuDelete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show(CultureResources.Inst["AreYouSureYouWantToDeleteThisEstate"], CultureResources.Inst["ConfirmDelete"], MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No) == MessageBoxResult.Yes)
            {
                var estate = dgEstates.SelectedItem as Estate;
                if (Session.Inst.BEManager.DeleteEstate(estate))
                {
                    //MessageBox.Show(CultureResources.Inst["EstateDeletedSuccessfully"], CultureResources.Inst["Deleted"], MessageBoxButton.OK);
                    if (Session.Inst.IsWebEnabled ?? false)
                    {
                        ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.MarkSoldOrRented(estate.EstateID));
                    }
                    RealEstates.Remove(estate);
                    RefreshFavoriteEstates();
                    RefreshEstatesAndDemands();
                    Session.Inst.EstatesCount--;
                }
            }
        }

        private void btnRefresh_Click(object sender, RoutedEventArgs e)
        {
            RefreshEstates();

        }

        private void btnAllEstates_Click(object sender, RoutedEventArgs e)
        {
            SearchParameters = new RealEstateSearchParameters { DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose };
        }

        private void mnuAddToFavorites_Click(object sender, RoutedEventArgs e)
        {
            Session.Inst.BEManager.AddToFavoriteEstates(Session.Inst.User.ID, (dgEstates.SelectedItems.Cast<Estate>().Select(s => s.EstateID).ToList()));
            RefreshFavoriteEstates();
        }

        private void RefreshFavoriteEstates()
        {
            var favoriteEstateControl = FavoriteEstatesControl.FindName("favoritesControl") as FavoriteEstates;
            favoriteEstateControl.RefreshFavoriteEstates();
        }

        private void RefreshEstatesAndDemands()
        {
            var showForm = EstatesAndDemandsControl.FindName("estatesShowedClients") as EstatesShowedClients;
            showForm.Refresh();
        }

        private void dgEstates_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            EstateView estateView = new EstateView(dgEstates.SelectedItem as Estate);
            estateView.Show();
        }

        private void mnuOpen_Click(object sender, RoutedEventArgs e)
        {
            EstateView view = new EstateView((Estate)dgEstates.SelectedItem);
            view.Show();
        }

        private void mnuSellEstate_Click(object sender, RoutedEventArgs e)
        {
            var estate = dgEstates.SelectedItem as Estate;
            if (estate == null) return;

            if (estate.OrderTypeID == 2)//rent
            {
                RentEstateDetails rentDetails = new RentEstateDetails(estate);
                if (rentDetails.ShowDialog() ?? false)
                {
                    RealEstates.Remove(dgEstates.SelectedItem as Estate);
                    RefreshFavoriteEstates();
                    Session.Inst.EstatesCount--;
                }
            }
            else
            {
                SelledEstateDetails form = new SelledEstateDetails(estate);
                if (form.ShowDialog() ?? false)
                {
                    RealEstates.Remove(dgEstates.SelectedItem as Estate);
                    RefreshFavoriteEstates();
                    Session.Inst.EstatesCount--;
                }
            }
        }

        private void MenuItem_ContextMenuOpening(object sender, ContextMenuEventArgs e)
        {
            if (dgEstates.SelectedItems != null && dgEstates.SelectedItems.Count != 1)
            {
                mnuEdit.Visibility = mnuDelete.Visibility = mnuSellRent.Visibility = Visibility.Collapsed;
            }
            else
            {
                mnuEdit.Visibility = mnuDelete.Visibility = mnuSaveAsXML.Visibility = mnuSellRent.Visibility = Visibility.Visible;
                if (Session.Inst.User.IsBroker)
                {
                    mnuSellRent.Visibility = Visibility.Collapsed;
                    if (((Estate)dgEstates.SelectedItem).BrokerID == Session.Inst.User.ID)
                    {
                        mnuEdit.Visibility = mnuDelete.Visibility = mnuSaveAsXML.Visibility = mnuShowToClient.Visibility =
                                                                    (Session.Inst.MainSettings.AllowBrokersToAddData) ? Visibility.Visible : Visibility.Collapsed;
                    }
                    else
                    {
                        mnuEdit.Visibility = mnuDelete.Visibility = mnuSaveAsXML.Visibility = mnuShowToClient.Visibility = Visibility.Collapsed;
                    }
                }
                if (Session.Inst.OfflineMode)
                {
                    mnuEdit.Visibility = mnuDelete.Visibility = mnuSaveAsXML.Visibility = mnuSellRent.Visibility = Visibility.Collapsed;
                }
                var estate = dgEstates.SelectedItem as Estate;
                if (estate == null || estate.OrderType == null) return;
                if (estate.OrderType.OrderTypeID == 1)
                {
                    mnuSellRent.Header = CultureResources.Inst["MarkSold"];
                }
                else
                {
                    mnuSellRent.Header = CultureResources.Inst["MarkRented"];
                }
            }
        }

        private void CopyImagesToLocalFolder(EntitySet<EstateImage> estateImages)
        {
            var tempFolderPath = Constants.ApplicationExecutablePath + @"_tempD\";
            try
            {
                if (Directory.Exists(tempFolderPath))
                {
                    Directory.Delete(tempFolderPath, true);
                }

                Directory.CreateDirectory(tempFolderPath);

                foreach (EstateImage estateImage in estateImages)
                {
                    estateImage.ImageFilePath = string.Format("{0}{1}.{2}",
                                                    Constants.ImagesFolderPath, estateImage.ImageID,
                                                    (ImageTypes)estateImage.ImageTypeID.GetValueOrDefault(1));

                    File.Copy(estateImage.ImageFilePath, string.Format("{0}{1}", tempFolderPath, Path.GetFileName(estateImage.ImageFilePath)));
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Զգուշացում");
            }


        }

        private void UploadImages(List<ImageDto> images, int estateID)
        {
            try
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.DeleteImages(estateID));
                var uploadedImages = 0;
                foreach (ImageDto image in images)
                {
                    if (image.ImageContent == null) continue;

                    //IsUploading = true;

                    //// создаем ProgressBar и запоминаем его в локальной переменной
                    //UploadProgressBar = this.ProgressBar;
                    //UploadProgressBar.Header = string.Format(CultureResources.Inst["UploadFileWithStringFormat"], FileInfoText);

                    StreamServiceClient streamService = new StreamServiceClient();
                    streamService.StreamService = BlobService.Instance.CreateChannel();

                    streamService.Error += streamService_Error;
                    streamService.Completed += delegate(object sender, StreamServiceClient.CompletedEventArgs e)
                    {
                        if (e == null) return;

                        ImageDto blobInfo = new ImageDto
                        {
                            streamKey = e.RemoteStreamKey,
                            EstateID = estateID,
                            IsMain = image.IsMain
                        };
                        //blobInfo.contentType = MimeType;
                        BlobService.Execute(s => s.WriteBlob(blobInfo));
                    };
                    //streamService.ProgressChanged += streamService_ProgressChanged;

                    streamService.WriteFromAsync(image.ImageContent);
                    uploadedImages++;
                }
                MessageBox.Show("Վերբեռնվել է " + uploadedImages + " նկար "+ images.Count +" -ից։", "Նկարների վերբեռնում");
            }
            catch (Exception ex)
            {

            }
            
        }

        private void streamService_Error(object sender, StreamServiceClient.ErrorEventArgs e)
        {
            MessageBox.Show("Նկարները կայքում տեղադրելու ժամանակ տեղի է ունեցել սխալ: " + e.Error, "Սխալ");
        }

        private MemoryStream GetFileBytes(string image)
        {
            if (File.Exists(image))
            {
                //var resizedImage = ResizeImage(fileBytes, 480);
                //return resizedImage;
                return new MemoryStream(File.ReadAllBytes(image));
            }
            return null;
        }

        private static MemoryStream ResizeImage(byte[] file, int resizeHeight)
        {
            int height = resizeHeight;
            MemoryStream stream = new MemoryStream(file);
            System.Drawing.Image pic = System.Drawing.Image.FromStream(stream);
            int width = (int)((double)pic.Width / pic.Height * (double)height);

            Bitmap imgOutput = new Bitmap(width, height);
            imgOutput.MakeTransparent();
            imgOutput.MakeTransparent(System.Drawing.Color.Black);

            Graphics newGraphics = Graphics.FromImage(imgOutput);
            newGraphics.Clear(System.Drawing.Color.FromArgb(0, 255, 255, 255)); //blank the image

            newGraphics.CompositingQuality = CompositingQuality.HighQuality;
            newGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            newGraphics.DrawImage(pic, 0, 0, width, height);
            newGraphics.Flush();

            stream = new MemoryStream();
            imgOutput.Save(stream, pic.RawFormat);
            return stream;
        }

        private string GetImageType(string image)
        {
            return Path.GetExtension(image);
            //if (string.IsNullOrEmpty(extension)) throw new Exception("Image is not in correct format");
            //switch (extension.ToLower())
            //{
            //	case ".jpg":
            //		return ImageFormat.Jpeg;
            //	case ".png":
            //		return ImageFormat.Png;
            //	case ".bmp":
            //		return ImageFormat.Bmp;
            //	case ".gif":
            //		return ImageFormat.Gif;
            //	default:
            //		throw new Exception("Image is not in correct format");
            //}
        }

        private void realEstatesList_Loaded(object sender, RoutedEventArgs e)
        {
            GridCurrencies = Currencies = Session.Inst.BEManager.GetCurrencies(Session.Inst.OfflineMode);
            GridCurrencies.Insert(0, new Currency { Name = CultureResources.Inst["NotSpecified"], CurrencyID = -1 });
            ShowOnlyMyDataButtonTooltip = CultureResources.Inst["ShowOnlyMyData"];
            InitializeDisplayFields();
            InitializeGridColumns();
            RealEstates = Session.Inst.BEManager.GetLastAdded20RealEstates(Session.Inst.User, Session.Inst.OfflineMode);
            btnPrint.Visibility = (Session.Inst.User.IsAdminOrDirector || Session.Inst.MainSettings.AllowBrokersToPrintEstates) ? Visibility.Visible : Visibility.Collapsed;
        }

        private void InitializeGridColumns()
        {
            dgEstates.Columns.Clear();
            foreach (UserDisplayColumn displayColumn in Session.Inst.ApplicationSettings.ShowingColumns.Where(s => s.Show))
            {
                switch (displayColumn.IdName)
                {
                    case UserDisplayColumn.Room:
                        Microsoft.Windows.Controls.DataGridTemplateColumn roomColumn = new Microsoft.Windows.Controls.DataGridTemplateColumn();
                        roomColumn.Header = displayColumn.ColumnName;
                        roomColumn.CellTemplate = this.Resources["RoomTemplate"] as DataTemplate;
                        roomColumn.SortMemberPath = "RoomCount";
                        dgEstates.Columns.Add(roomColumn);
                        break;
                    case UserDisplayColumn.Price:
                        Microsoft.Windows.Controls.DataGridTemplateColumn priceColumn = new Microsoft.Windows.Controls.DataGridTemplateColumn();
                        priceColumn.HeaderTemplate = this.Resources["PriceHeaderTemplate"] as DataTemplate;
                        priceColumn.CellTemplate = this.Resources["PriceTemplate"] as DataTemplate;
                        priceColumn.SortMemberPath = "PriceInAMD";
                        dgEstates.Columns.Add(priceColumn);
                        break;
                    case UserDisplayColumn.AdditionalDetails:
                        Microsoft.Windows.Controls.DataGridTemplateColumn additColumn = new Microsoft.Windows.Controls.DataGridTemplateColumn();
                        additColumn.Header = displayColumn.ColumnName;
                        additColumn.CellTemplate = this.Resources["AdditionalInformationTemplate"] as DataTemplate;
                        dgEstates.Columns.Add(additColumn);
                        break;
                    case UserDisplayColumn.OtherDetails:
                        Microsoft.Windows.Controls.DataGridTemplateColumn otherColumn = new Microsoft.Windows.Controls.DataGridTemplateColumn();
                        otherColumn.Header = displayColumn.ColumnName;
                        otherColumn.CellTemplate = this.Resources["OtherColumnTemplate"] as DataTemplate;
                        dgEstates.Columns.Add(otherColumn);
                        break;
                    case UserDisplayColumn.Added:
                    case UserDisplayColumn.Updated:
                        Microsoft.Windows.Controls.DataGridTextColumn dateColumn = new Microsoft.Windows.Controls.DataGridTextColumn();
                        dateColumn.Header = displayColumn.ColumnName;
                        var binding = new Binding(displayColumn.GetBindingPath());
                        binding.StringFormat = "dd.MM.yyyy";
                        dateColumn.Binding = binding;
                        dgEstates.Columns.Add(dateColumn);
                        break;
                    case UserDisplayColumn.StateOrRegion:
                        Microsoft.Windows.Controls.DataGridTextColumn stateColumn = new Microsoft.Windows.Controls.DataGridTextColumn();
                        stateColumn.Header = displayColumn.ColumnName;
                        var stateBinding = new Binding();
                        stateBinding.Converter = new Shared.Converters.EstateToRegionStateStringConverter();
                        stateColumn.Binding = stateBinding;
                        stateColumn.SortMemberPath = "Street.Name";
                        dgEstates.Columns.Add(stateColumn);
                        break;
                    case UserDisplayColumn.AddressFull:
                        Microsoft.Windows.Controls.DataGridTextColumn addressFullColumn = new Microsoft.Windows.Controls.DataGridTextColumn();
                        addressFullColumn.Header = displayColumn.ColumnName;
                        var fullAddressBinding = new Binding();
                        fullAddressBinding.Converter = new Shared.Converters.EstateToEstateFullAddressStringWithoutRegionConverter();
                        addressFullColumn.Binding = fullAddressBinding;
                        dgEstates.Columns.Add(addressFullColumn);
                        break;
                    case UserDisplayColumn.Floor:
                        Microsoft.Windows.Controls.DataGridTextColumn floorColumn = new Microsoft.Windows.Controls.DataGridTextColumn();
                        floorColumn.Header = displayColumn.ColumnName;
                        var floorBinding = new Binding();
                        floorBinding.Converter = new Shared.Converters.EstateToFloorViewForListConverter();
                        floorColumn.Binding = floorBinding;
                        floorColumn.SortMemberPath = "Floor";
                        dgEstates.Columns.Add(floorColumn);
                        break;
                    case UserDisplayColumn.Square:
                        Microsoft.Windows.Controls.DataGridTextColumn squareColumn = new Microsoft.Windows.Controls.DataGridTextColumn();
                        squareColumn.Header = displayColumn.ColumnName;
                        squareColumn.SortMemberPath = "TotalSquare";
                        squareColumn.Binding = new Binding(displayColumn.GetBindingPath());
                        dgEstates.Columns.Add(squareColumn);
                        break;
                    default:
                        Microsoft.Windows.Controls.DataGridTextColumn textColumn = new Microsoft.Windows.Controls.DataGridTextColumn();
                        textColumn.Header = displayColumn.ColumnName;
                        textColumn.Binding = new Binding(displayColumn.GetBindingPath());
                        dgEstates.Columns.Add(textColumn);
                        break;
                }
            }
        }

        private void mnuSelectDemands_Click(object sender, RoutedEventArgs e)
        {
            DemandsForEstate form = new DemandsForEstate(dgEstates.SelectedItems);
            form.ShowDialog();
        }

        private void btnExportToExcel_Click(object sender, RoutedEventArgs e)
        {
            dgEstates.ExportToExcel();
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            RefreshEstates();
        }



        private void btnPrint_Click(object sender, RoutedEventArgs e)
        {
            //PrintDialog printDialog = new PrintDialog();
            //if (printDialog.ShowDialog() ?? false)
            //{
            //    dgEstates.Arrange(new Rect(5, 5, printDialog.PrintableAreaWidth, printDialog.PrintableAreaHeight));
            //    printDialog.PrintVisual(dgEstates, string.Empty);
            //}
            //if (dgEstates.SelectedItems == null || dgEstates.SelectedItems.Count == 0) return;
            PrintColumnsSelectionForm form = new PrintColumnsSelectionForm(RealEstates.ToList());
            form.ShowDialog();
        }

        //private void dgEstates_DragEnter(object sender, System.Windows.DragEventArgs e)
        //{
        //    if (!e.Data.GetDataPresent("Estates") || sender == e.Source)
        //    {
        //        e.Effects = DragDropEffects.None;
        //    }
        //}

        //private void dgEstates_Drop(object sender, System.Windows.DragEventArgs e)
        //{
        //    if (e.Data.GetDataPresent("Estates"))
        //    {

        //        Estate user = e.Data.GetData("Estates") as Estate;
        //        var item = sender as DataGridRow;
        //        if (item != null)
        //        {
        //            MessageBox.Show((item.DataContext as Estate).ToString());
        //        }

        //    }
        //}

        Point startPoint = new Point();

        private void dgEstates_PreviewMouseLeftButtonDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            startPoint = e.GetPosition(null);
        }

        private void dgEstates_PreviewMouseMove(object sender, System.Windows.Input.MouseEventArgs e)
        {
            Point mousePos = e.GetPosition(null);
            Vector diff = startPoint - mousePos;

            if (e.LeftButton == MouseButtonState.Pressed && (Math.Abs(diff.X) > SystemParameters.MinimumHorizontalDragDistance || Math.Abs(diff.Y) > SystemParameters.MinimumVerticalDragDistance))
            {
                // Get the dragged ListViewItem

                Microsoft.Windows.Controls.DataGridCell cell = FindAnchestor<Microsoft.Windows.Controls.DataGridCell>((DependencyObject)e.OriginalSource);

                // Find the data behind the ListViewItem
                var cells = dgEstates.SelectedItems;
                if (cell != null && cells != null)
                {
                    //Estate estate = (Estate)cells.DataContext;
                    // Initialize the drag & drop operation
                    DataObject dragData = new DataObject("Estates", cells);
                    DragDrop.DoDragDrop(cell, dragData, DragDropEffects.Copy);
                }
            }
        }

        private static T FindAnchestor<T>(DependencyObject current) where T : DependencyObject
        {
            do
            {
                if (current is T)
                {
                    return (T)current;
                }
                current = VisualTreeHelper.GetParent(current);
            }
            while (current != null);
            return null;
        }

        private void mnuShowToClient_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;

            var clientSelectionForm = new ClientSelectionFormForEstate();
            if (clientSelectionForm.ShowDialog() ?? false)
            {
                EstatesAndDemand showInfo = clientSelectionForm.EstateAndDemand;
                showInfo.EstateID = (dgEstates.SelectedItem as Estate).ID;
                if (Session.Inst.BEManager.AddEstateShowInfo(showInfo))
                {
                    MessageBox.Show(CultureResources.Inst["SuccessfullyAddedShowInfo"], string.Empty, MessageBoxButton.OK, MessageBoxImage.Information);
                    RefreshEstatesAndDemands();
                }
                else
                {
                    MessageBox.Show(CultureResources.Inst["CanNotAddShowInfo"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void btnSettings_Click(object sender, RoutedEventArgs e)
        {
            var result = new EstateListColumnsSelection().ShowDialog();
            if (result ?? false)
            {
                var columns = RealtorSettingsManager.GetDisplayColumns(Session.Inst.User, Session.Inst.OfflineMode);
                foreach (UserDisplayColumn column in columns)
                {
                    column.ColumnName = CultureResources.Inst[column.ColumnName];
                }
                Session.Inst.ApplicationSettings.ShowingColumns = new ObservableCollection<UserDisplayColumn>(columns);
                InitializeGridColumns();
                RefreshEstates();
            }
        }

        private void cbItemsPerPage_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SearchParameters.ItemsCountPerPage = Convert.ToInt32((cbItemsPerPage.SelectedValue as ComboBoxItem).Content);
            RefreshEstates();
        }

        private ICommand firstCommand;

        private ICommand previousCommand;

        private ICommand nextCommand;

        private ICommand lastCommand;

        /// <summary>
        /// Gets the index of the first item in the products list.
        /// </summary>
        public int Start
        {
            get
            {
                if (SearchParameters == null) SearchParameters = new RealEstateSearchParameters { DaysBeforeToRentClose = Session.Inst.MainSettings.DaysBeforeToRentClose };
                return SearchParameters.Start + 1;
            }
        }

        /// <summary>
        /// Gets the index of the last item in the products list.
        /// </summary>
        public int End { get { return SearchParameters.Start + SearchParameters.ItemsCountPerPage < TotalItems ? SearchParameters.Start + SearchParameters.ItemsCountPerPage : TotalItems; } }

        /// <summary>
        /// Gets the command for moving to the first page of products.
        /// </summary>
        public ICommand FirstCommand
        {
            get
            {
                if (firstCommand == null)
                {
                    firstCommand = new RelayCommand
                    (
                        param =>
                        {
                            SearchParameters.Start = 0;
                            RefreshEstates();
                        },
                        param =>
                        {
                            return SearchParameters.Start - SearchParameters.ItemsCountPerPage >= 0;
                        }
                    );
                }

                return firstCommand;
            }
        }

        /// <summary>
        /// Gets the command for moving to the previous page of products.
        /// </summary>
        public ICommand PreviousCommand
        {
            get
            {
                if (previousCommand == null)
                {
                    previousCommand = new RelayCommand
                    (
                        param =>
                        {
                            SearchParameters.Start -= SearchParameters.ItemsCountPerPage;
                            RefreshEstates();
                        },
                        param =>
                        {
                            return SearchParameters.Start - SearchParameters.ItemsCountPerPage >= 0;
                        }
                    );
                }

                return previousCommand;
            }
        }

        /// <summary>
        /// Gets the command for moving to the next page of products.
        /// </summary>
        public ICommand NextCommand
        {
            get
            {
                if (nextCommand == null)
                {
                    nextCommand = new RelayCommand
                    (
                        param =>
                        {
                            SearchParameters.Start += SearchParameters.ItemsCountPerPage;
                            RefreshEstates();
                        },
                        param =>
                        {
                            return SearchParameters.Start + SearchParameters.ItemsCountPerPage < TotalItems;
                        }
                    );
                }

                return nextCommand;
            }
        }

        /// <summary>
        /// Gets the command for moving to the last page of products.
        /// </summary>
        public ICommand LastCommand
        {
            get
            {
                if (lastCommand == null)
                {
                    lastCommand = new RelayCommand
                    (
                        param =>
                        {
                            SearchParameters.Start = (TotalItems / SearchParameters.ItemsCountPerPage - 1) * SearchParameters.ItemsCountPerPage;
                            SearchParameters.Start += TotalItems % SearchParameters.ItemsCountPerPage == 0 ? 0 : SearchParameters.ItemsCountPerPage;
                            RefreshEstates();
                        },
                        param =>
                        {
                            return SearchParameters.Start + SearchParameters.ItemsCountPerPage < TotalItems;
                        }
                    );
                }

                return lastCommand;
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        public void InvokePropertyChanged(string propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }

        private void mnuPrintSelected_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItems != null && dgEstates.SelectedItems.Count > 0)
            {
                PrintColumnsSelectionForm form = new PrintColumnsSelectionForm(dgEstates.SelectedItems.OfType<Estate>().ToList());
                form.ShowDialog();
            }
        }

        private void Grid_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                btnSearch_Click(sender, new RoutedEventArgs());
            }
        }
        #region Menu items methods
        private void mnuOfferClient_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItems == null || dgEstates.SelectedItems.Count == 0) return;

            var clientSelectionForm = new ClientSelectionFormForEstate();
            if (clientSelectionForm.ShowDialog() ?? false)
            {
                ClientSuggestedEstate suggestedEstate = new ClientSuggestedEstate();
                suggestedEstate.EstatesIds = dgEstates.SelectedItems.OfType<Estate>().Select(s => s.EstateID).ToList();
                suggestedEstate.ClientID = clientSelectionForm.EstateAndDemand.DemandID;
                suggestedEstate.BrokerID = clientSelectionForm.EstateAndDemand.BrokerID;
                suggestedEstate.Comment = clientSelectionForm.EstateAndDemand.Comment;
                suggestedEstate.SuggestDate = clientSelectionForm.EstateAndDemand.ShowDate.GetValueOrDefault(DateTime.Now);
                if (EstatesAndDemandManager.AddSuggestInfo(suggestedEstate))
                {
                    MessageBox.Show(CultureResources.Inst["DataSavedSuccessfully"], string.Empty, MessageBoxButton.OK, MessageBoxImage.Information);
                    RefreshEstatesAndDemands();
                }
                else
                {
                    MessageBox.Show(CultureResources.Inst["DataSaveError"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        private void mnuSaveAsXML_Click(object sender, RoutedEventArgs e)
        {
            RealtorFileManager.SaveFile(dgEstates.SelectedItems);
        }
        private void mnuUploadToSiteWithoutImages_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            var estate = dgEstates.SelectedItem as Estate;
            EstateDto estateDto = Translator.GetEstateDto(estate);
            estateDto.EstateImages = null;
            try
            {
                var successfullyUploaded = ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UploadEstate(estateDto));
                if (successfullyUploaded > 0)
                {
                    EstateManager.ChangeEstateUploadMark(estate, true);
                    MessageBox.Show("Հայտը կայքում գրանցվել է հաջողությամբ։", "Գրանցում");
                }
                else
                {
                    MessageBox.Show("Կայքում տեղադրելու ժամանակ տեղի է ունեցել սխալ", "Սխալ");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Կայքում տեղադրելու ժամանակ տեղի է ունեցել սխալ " + ex.Message, "Սխալ");
            }
        }
        private void mnuUpdateToSiteWithoutImages_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            var estate = dgEstates.SelectedItem as Estate;
            EstateDto estateDto = Translator.GetEstateDto(estate);
            estateDto.EstateImages = null;
            try
            {
                var successfullyUploaded = ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateEstate(estateDto));
                if (successfullyUploaded > 0)
                {
                    EstateManager.ChangeEstateUploadMark(estate, true);
                    MessageBox.Show("Հայտը կայքում թարմացվել է հաջողությամբ։", "Գրանցում");
                }
                else
                {
                    MessageBox.Show("Կայքում տեղադրելու ժամանակ տեղի է ունեցել սխալ", "Սխալ");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Կայքում տեղադրելու ժամանակ տեղի է ունեցել սխալ " + ex.Message, "Սխալ");
            }
        }
        private void mnuUploadToSite_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            var estate = dgEstates.SelectedItem as Estate;
            EstateDto estateDto = Translator.GetEstateDto(estate);

            if (estate != null)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.DeleteImages(estate.ID));
                var images = new List<ImageDto>();
                if (estate.EstateImages != null && estate.EstateImages.Count > 0)
                {
                    //var uploadForm = new UploadImagesSelectionForm(estate);
                    //if (uploadForm.ShowDialog() ?? false)
                    //{
                    var serverIP = ConfigurationManager.AppSettings["ServerIP"];
                    bool fromLocal = (serverIP == "localhost" || serverIP == "127.0.0.1") && !Session.Inst.OfflineMode;
                    string folderPath = Session.Inst.OfflineMode ? Constants.LocalImagesFolderPath : Constants.ImagesFolderPath;
                    if (!fromLocal)
                    {
                        CopyImagesToLocalFolder(estate.EstateImages);
                        folderPath = Constants.ApplicationExecutablePath + @"_tempD\";
                    }

                    foreach (EstateImage estateImage in estate.EstateImages)
                    {
                        estateImage.ImageFilePath = string.Format("{0}{1}.{2}", folderPath, estateImage.ImageID,
                                                        (ImageTypes)estateImage.ImageTypeID.GetValueOrDefault(1));
                    }
                    images = estate.EstateImages.Where(s => s.ShowInSite)
                        .Select(s => new ImageDto
                        {
                            ImageType = GetImageType(s.ImageFilePath),
                            ImageContent = GetFileBytes(s.ImageFilePath),
                            IsMain = s.IsMain ?? false
                        }).ToList();

                    if (images.Count > 0 && !images.Any(s => s.IsMain))
                    {
                        images[0].IsMain = true;
                    }

                    try
                    {
                        var successfullyUploaded = ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UploadEstate(estateDto));
                        if (successfullyUploaded > 0)
                        {
                            EstateManager.ChangeEstateUploadMark(estate, true);
                            MessageBox.Show("Հայտը կայքում գրանցվել է հաջողությամբ։ " + successfullyUploaded, "Գրանցում");
                            if (images.Count > 0)
                            {
                                UploadImages(images, successfullyUploaded);
                                if (!fromLocal)
                                {
                                    try
                                    {
                                        Directory.Delete(Constants.ApplicationExecutablePath + @"_tempD\", true);
                                    }
                                    catch (Exception ex)
                                    {
                                        MessageBox.Show(ex.Message, "Սխալ");
                                    }
                                }
                            }
                        }
                        else
                        {
                            MessageBox.Show("Կայքում տեղադրելու ժամանակ տեղի է ունեցել սխալ", "Սխալ");
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Կայքում տեղադրելու ժամանակ տեղի է ունեցել սխալ " + ex.Message, "Սխալ");
                        MailSender.SendErrorReport("Կայքում տեղադրելու ժամանակ տեղի է ունեցել սխալ:", DateTime.Now + " Կայքում տեղադրելու ժամանակ տեղի է ունեցել սխալ: " + ex.Message);
                    }
                }
            }
        }
        private void mnuRemoveFromSite_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            var estates = dgEstates.SelectedItems as IList;
            if (estates != null && estates.Count > 0)
            {
                foreach (Estate estate in estates)
                {
                    EstateManager.ChangeEstateUploadMark(estate, false);
                    MessageBox.Show("Հայտը կայքից հեռացվել է հաջողությամբ։", "Գրանցում");
                }
            }
            else
            {
                MessageBox.Show("Տեղի է ունեցել սխալ", "Սխալ");
            }
        }
        private void mnuRemoveFromSiteImagesOnly_Click(object sender, RoutedEventArgs e)
        {
            if (dgEstates.SelectedItem == null) return;
            var estates = dgEstates.SelectedItems as IList;
            if (estates != null && estates.Count > 0)
            {
                try
                {
                    foreach (Estate estate in estates)
                    {
                        if (estate == null) continue;
                        if (ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.DeleteImages(estate.ID)))
                        {
                            MessageBox.Show("Նկարները կայքից հեռացվել են հաջողությամբ։", "Գրանցում");
                        }
                    }
                    return;
                }
                catch (Exception ex)
                {

                }
            }
            MessageBox.Show("Տեղի է ունեցել սխալ", "Սխալ");
        }
        #endregion

    }
}
