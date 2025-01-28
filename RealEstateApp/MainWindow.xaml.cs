using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Ionic.Zip;
using LocalizationResources;
using Microsoft.Win32;
using RealEstate.Business.Helpers;
using RealEstate.Business.Managers;
using RealEstate.Common;
using RealEstate.DataAccess;
using Realtor.Synchronize.Service.Facade;
using Realtor.UploadService.Facade;
using Shared.Helpers;
using UpdateModule.FtpHelper;
using UserControls;
using RealEstate.Common.Cultures;

namespace RealEstateApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            var company = ConfigurationManager.AppSettings["Company"];
            Title = CultureResources.Inst["Realtor"] + (string.IsNullOrWhiteSpace(company) ? string.Empty : " - " + company);
            worker = new BackgroundWorker();
            worker.DoWork += worker_DoWork;
            worker.RunWorkerCompleted += worker_RunWorkerCompleted;

            workerForUpdateData = new BackgroundWorker();
            workerForUpdateData.DoWork += workerForUpdateData_DoWork;

            workerForSiteUpdateData = new BackgroundWorker();
            workerForSiteUpdateData.DoWork += workerForSiteUpdateData_DoWork;
        }

        private void workerForSiteUpdateData_DoWork(object sender, DoWorkEventArgs e)
        {
            UpdateSiteDatabase();
        }

        private void workerForUpdateData_DoWork(object sender, DoWorkEventArgs e)
        {
            UpdateDatabase();
        }

        private void worker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
        }

        private void worker_DoWork(object sender, DoWorkEventArgs e)
        {
            if (CheckInternet())
            {
                //CheckForUpdates();
            }
        }

        private BackgroundWorker worker;
        private BackgroundWorker workerForUpdateData;
        private BackgroundWorker workerForSiteUpdateData;

        private void btnSearchChange_Click(object sender, RoutedEventArgs e)
        {
            if (btnSearchChange.CommandParameter.ToString() == "Advanced")
            {
                btnSearchChange.CommandParameter = "Simple";
                btnSearchChange.Content = CultureResources.Inst["SimpleSearch"];
                simpleSearch.Visibility = Visibility.Collapsed;
                searchControl.Visibility = Visibility.Visible;
            }
            else
            {
                btnSearchChange.CommandParameter = "Advanced";
                btnSearchChange.Content = CultureResources.Inst["AdvancedSearch"];
                simpleSearch.Visibility = Visibility.Visible;
                searchControl.Visibility = Visibility.Collapsed;
            }
        }

        private void mnuUsers_Add_Click(object sender, RoutedEventArgs e)
        {
            EditUserForm form = new EditUserForm();
            form.ShowDialog();
        }

        private void mnuAllUsers_Click(object sender, RoutedEventArgs e)
        {
            Users form = new Users();
            form.ShowDialog();
        }

        private void mnuHelp_About_Click(object sender, RoutedEventArgs e)
        {
            new About().ShowDialog();
        }

        private void mainWidnow_Loaded(object sender, RoutedEventArgs e)
        {
            if ((Session.Inst.User.IsBroker && !Session.Inst.MainSettings.AllowBrokersToAddData) || Session.Inst.OfflineMode)
            {
                dockPanelHost.Children.Remove(ddpAddRealEstate);
                dockPanelHost.Children.Remove(ddpAddDemand);
            }
            if (Session.Inst.User.IsAdminOrDirector)
            {
                Dispatcher.Invoke(new Func<object>(CheckRentedEstates));
            }
            //Thread thread = new Thread(CheckRentedEstates);
            //thread.Start();
            InitializeDisplayFields();

            worker.RunWorkerAsync();
        }

        private object CheckRentedEstates()
        {
            var estates = Session.Inst.BEManager.CheckRentedEstates();
            if (estates != null && estates.Count > 0)
            {
                StringBuilder str = new StringBuilder();
                str.AppendLine(CultureResources.Inst["TheseEstatesAreFree"]);
                foreach (Estate estate in estates)
                {
                    str.AppendLine(string.Format("{0} {1}", estate.Code, estate.FullAddressStringWithoutRegion()));
                }
                MessageBox.Show(str.ToString(), "Վարձակալության ավարտ");
            }
            return null;
        }

        private void InitializeDisplayFields()
        {
            if (Session.Inst.ApplicationSettings.ShowingColumns == null || Session.Inst.ApplicationSettings.ShowingColumns.Count != 25)
            {
                var columns = RealtorSettingsManager.GetDisplayColumns(Session.Inst.User, Session.Inst.OfflineMode);
                foreach (UserDisplayColumn column in columns)
                {
                    column.IdName = column.ColumnName;
                    column.ColumnName = CultureResources.Inst[column.ColumnName];
                }
                Session.Inst.ApplicationSettings.ShowingColumns = new ObservableCollection<UserDisplayColumn>(columns);
            }
        }
        private void mnuFile_Exit_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void mnuTools_BuildingTypesManagement_Click(object sender, RoutedEventArgs e)
        {
            new BuildingTypesManagement().ShowDialog();
        }

        private void mnuTools_StatesManagement_Click(object sender, RoutedEventArgs e)
        {
            new StatesManagement().ShowDialog();
        }

        private void mnuTools_RemontManagement_Click(object sender, RoutedEventArgs e)
        {
            new RemontManagement().ShowDialog();
        }

        private void mnuTools_ProjectManagement_Click(object sender, RoutedEventArgs e)
        {
            new ProjectManagement().ShowDialog();
        }

        private void mnuTools_CurrencyManagement_Click(object sender, RoutedEventArgs e)
        {
            new CurrencyManagement().ShowDialog();
        }

        private void mnuTools_CityManagement_Click(object sender, RoutedEventArgs e)
        {
            new CityManagement().ShowDialog();
        }

        private void mnuTools_RegionManagement_Click(object sender, RoutedEventArgs e)
        {
            new RegionManagement().ShowDialog();
        }

        private void mnuTools_StreetManagement_Click(object sender, RoutedEventArgs e)
        {
            new StreetManagement().ShowDialog();
        }

        private void mnuTools_Settings_Click(object sender, RoutedEventArgs e)
        {
            new SettingsForm().ShowDialog();
        }

        private void mnuFile_RefreshData_Click(object sender, RoutedEventArgs e)
        {
            RefreshData();
        }

        private void RefreshData()
        {
            this.Cursor = Cursors.Wait;
            Session.Inst.Update();
            EstatesList.RefreshEstates();
            searchControl.RefreshData();
            simpleSearch.RefreshData();
            addEditDemand.RefreshData();
            allDemands.RefreshData();
            //personalDemands.RefreshData();
            addrealEstate.RefreshData();
            favoritesControl.RefreshFavoriteEstates();

            Cursor = null;
        }

        private void mnuStatistics_SelledEstates_Click(object sender, RoutedEventArgs e)
        {
            new SelledEstatesViewer().ShowDialog();
        }

        private void mnuStatistics_RentedEstates_Click(object sender, RoutedEventArgs e)
        {
            new RentedEstates().ShowDialog();
        }

        private void mnuFile_SendMail(object sender, RoutedEventArgs e)
        {
            //MailSender.SendErrorReport("exception text", "exeption details");
        }

        private void mnuMap_Click(object sender, RoutedEventArgs e)
        {
            new MapWindow(Constants.ApplicationExecutablePath + @"\Yerevan.pdf", CultureResources.Inst["YerevanMap"]).ShowDialog();
        }

        private void mnuHelp_Help_Click(object sender, RoutedEventArgs e)
        {
            new HelpWindow().ShowDialog();
        }

        private void mnuTools_RoofingManagement_Click(object sender, RoutedEventArgs e)
        {
            new RoofingManagement().ShowDialog();
        }

        private void mnuTools_SignificanceOfTheUsesManagement_Click(object sender, RoutedEventArgs e)
        {
            new SignificanceOfTheUsesManagement().ShowDialog();
        }

        private void mnuTools_OperationalSignificancesManagement_Click(object sender, RoutedEventArgs e)
        {
            new OperationalSignificancesManagement().ShowDialog();
        }

        private void mnuMapArmenia_Click(object sender, RoutedEventArgs e)
        {
            new MapWindow(Constants.ApplicationExecutablePath + @"\Armenia.pdf", CultureResources.Inst["ArmeniaMap"]).ShowDialog();
        }

        private void mnuTools_Test_Click(object sender, RoutedEventArgs e)
        {
            if (new SettingsForm().ShowDialog() == true)
            {
                RefreshData();
            }
        }

        private void mnuHelp_EnterCode_Input_Click(object sender, RoutedEventArgs e)
        {
            ExpirationCodeWindow window = new ExpirationCodeWindow();
            window.ShowDialog();
        }

        private void mnuHelp_EnterCode_FromFile_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                CheckFileExists = true,
                Filter = "Realtor Code Files|*.arc",
                Multiselect = false,
                RestoreDirectory = true,
                Title = CultureResources.Inst["SelectFile"]
            };
            if (openFileDialog.ShowDialog() ?? false)
            {
                string code = string.Empty;
                using (StreamReader reader = File.OpenText(openFileDialog.FileName))
                {
                    code = reader.ReadToEnd();
                    reader.Close();
                }
                if (string.IsNullOrEmpty(code))
                {
                    MessageBox.Show(CultureResources.Inst["WrongFileOrFileIsCorrupted"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                RealtorSecurity security = new RealtorSecurity();
                DateTime? expirationDate;
                if (!security.ValidateExpirationDateCode(code, out expirationDate))
                {
                    MessageBox.Show(CultureResources.Inst["IncorrectExpirationDateCode"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                MessageBox.Show(string.Format(CultureResources.Inst["CodeEnteredExpirationDateX"], expirationDate.Value.ToString(StringEncription.DateFormat)), CultureResources.Inst["CodeInputed"], MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void mnu_File_Language_Click(object sender, RoutedEventArgs e)
        {
            var selectedLanguage = ((MenuItem)sender).Tag.ToString();
            CultureResources.ChangeCulture(new CustomCultureInfo(selectedLanguage));
            CultureResources.SaveSelectedLanguage(selectedLanguage);
            InitializeDisplayFields();
            RefreshData();
        }

        private void mnuTools_CreateDatabase_Click(object sender, RoutedEventArgs e)
        {
            System.Windows.Forms.SaveFileDialog dialog = new System.Windows.Forms.SaveFileDialog
            {
                Title = "Backup File",
                RestoreDirectory = true,
                Filter = "Realtor Bakup Files (*.arr)|*.arr",
                AddExtension = true
            };

            string backupFilePath = string.Empty;
            if (dialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                backupFilePath = dialog.FileName;
            }
            else
            {
                return;
            }

            string password = string.Empty;

            InputPassword passWindow = new InputPassword();
            if (passWindow.ShowDialog() ?? false)
            {
                password = passWindow.Password;
            }
            else
            {
                return;
            }
            if (string.IsNullOrEmpty(password.Trim()))
            {
                MessageBox.Show(CultureResources.Inst["PasswordCanNotBeEmpty"], CultureResources.Inst["PasswordError"], MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            Cursor = Cursors.Wait;

            string errorMessage = string.Empty;
            if (backupFilePath.EndsWith(".arr"))
            {
                backupFilePath = backupFilePath.Replace(".arr", string.Empty);
            }

            if (!Session.Inst.BEManager.CreateDatabaseBackup(backupFilePath, ref errorMessage))
            {
                Cursor = null;
                MessageBox.Show(CultureResources.Inst["ArchiveIsNotCompletedTryLater"], CultureResources.Inst["ArchiveError"], MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!string.IsNullOrEmpty(backupFilePath))
            {
                using (ZipFile zip = new ZipFile())
                {
                    //zip.AddDirectory(Directory.GetParent(Directory.GetParent(Constants.ImagesFolderPath).FullName).FullName);
                    zip.AddFile(backupFilePath);
                    zip.Save(backupFilePath + "temp");
                }

                Cryptography cryptography = new Cryptography(password);

                if (cryptography.Encrypt(backupFilePath + "temp", string.Format("{0}.arr", backupFilePath)))
                {
                    DeleteBakupTempFiles(backupFilePath);
                    MessageBox.Show(CultureResources.Inst["ArchiveCreatedSuccessfully"], "", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    DeleteBakupTempFiles(backupFilePath);
                }
                Cursor = null;
            }
            else
            {
                DeleteBakupTempFiles(backupFilePath);
                Cursor = null;
                MessageBox.Show(CultureResources.Inst["ArchiveIsNotCompletedTryLater"], CultureResources.Inst["ArchiveError"], MessageBoxButton.OK, MessageBoxImage.Error);
            }


        }

        private static void DeleteBakupTempFiles(string backupFilePath)
        {
            try
            {
                File.Delete(backupFilePath);
                File.Delete(backupFilePath + "temp");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnCheckForUpdates_Click(object sender, RoutedEventArgs e)
        {
            if (btnCheckForUpdates.Tag == null) btnCheckForUpdates.Tag = false;
            if ((bool)btnCheckForUpdates.Tag)
            {
                if (MessageBox.Show(CultureResources.Inst["RealtorWillBeCloseForInstallingUpdates"], CultureResources.Inst["ConfirmUpdate"], MessageBoxButton.YesNo, MessageBoxImage.Question) != MessageBoxResult.Yes)
                {
                    return;
                }
                Process p = new Process();
                p.StartInfo.FileName = "UpdateModule.exe";
                p.StartInfo.UseShellExecute = false;
                p.StartInfo.RedirectStandardOutput = true;
                p.StartInfo.RedirectStandardError = true;
                if (System.Environment.OSVersion.Version.Major >= 6)
                {
                    p.StartInfo.Verb = "runas";
                }
                p.Start();
                App.ShutdownApplication();
                return;
            }
            if (!worker.IsBusy)
            {
                worker.RunWorkerAsync();
            }
            //if (!CheckInternet())
            //{
            //    MessageBox.Show(CultureResources.Inst["YouAreNotConnectedToTheInternetConnectForUpdate"], CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
            //}
            //else
            //{
            //    //progUpdate.Visibility = Visibility.Visible;
            //    CheckForUpdates();
            //    //progUpdate.Visibility = Visibility.Collapsed;
            //}
        }

        private bool CheckInternet()
        {
            try
            {
                System.Net.IPHostEntry ipHostEntry = System.Net.Dns.GetHostByName("www.google.com");
                return true;
            }
            catch
            {
                Dispatcher.BeginInvoke((Action)(() =>
                {
                    btnCheckForUpdates.Content = CultureResources.Inst["UnableToCheckingUpdates"];
                    new Thread(ChangeButtonText).Start();
                }));
                return false;
            }
        }

        private void CheckForUpdates()
        {
            //btnCheckForUpdates.IsEnabled = false;
            string server = ConfigurationManager.AppSettings["UpdatePath"];
            string user = "realtor";
            string pass = "Litnw3mB6F9Cz";

            FTP ftp = new FTP(server, user, pass);
            try
            {
                ftp.Connect();
                var versionFilePath = Constants.ApplicationExecutablePath + "version.txt";
                ftp.OpenDownload("Version.txt", versionFilePath, true);
                while (ftp.DoDownload() > 0)
                {
                    //perc = (int)((ftp.BytesTotal * 100) / ftp.FileSize);
                }
                string version = string.Empty;
                using (var file = File.OpenText(versionFilePath))
                {
                    version = file.ReadToEnd();
                    file.Close();
                }
                try
                {
                    File.Delete(versionFilePath);
                }
                catch { }

                var mainAssembly = System.Reflection.Assembly.GetExecutingAssembly();
                var localVersion = mainAssembly.GetName().Version.ToString();
                if (localVersion != version)
                {
                    Dispatcher.BeginInvoke((Action)(() =>
                                                        {
                                                            btnCheckForUpdates.Content = CultureResources.Inst["NewUpdatesAreAvailable"]; // "New updates are available";
                                                            btnCheckForUpdates.Tag = true;
                                                        }));
                }
                else
                {
                    Dispatcher.BeginInvoke((Action)(() =>
                    {
                        btnCheckForUpdates.Content = CultureResources.Inst["RealtorIsUpToDate"];
                        btnCheckForUpdates.Tag = false;
                    }));

                    Thread thread = new Thread(ChangeButtonText);
                    thread.Start();
                }
            }
            catch (Exception ex)
            {
                new SimpleExceptionBox(ex.ToString()).ShowDialog();
                //MessageBox.Show(ex.ToString(), CultureResources.Inst["Error"], MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void ChangeButtonText()
        {
            Thread.Sleep(10000); //10 seconds
            Dispatcher.BeginInvoke((Action)(() => { btnCheckForUpdates.Content = CultureResources.Inst["CheckForUpdates"]; }));
        }

        private void mnu_StatisticAboutAgencyOrBroker_Click(object sender, RoutedEventArgs e)
        {
            new Statistics().ShowDialog();

        }

        private void btnCheckAddress_Click(object sender, RoutedEventArgs e)
        {
            new CheckAddressView(ddpRealEstatesList).ShowDialog();
        }

        private void ChangeDataUpdateButtonText(object text)
        {
            Dispatcher.BeginInvoke((Action)(() => { btnUpdateData.Content = text; }));
        }

        private void btnUpdateData_Click(object sender, RoutedEventArgs e)
        {
            workerForUpdateData.RunWorkerAsync();
        }

        private void UpdateDatabase()
        {
            StringBuilder message = new StringBuilder();
            message.AppendLine("Synchronization completed");
            message.AppendLine();
            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["OtherBrokersList"]);//;
            }));
            var lastChangeDate = BlackListManager.GetLastChangeDate();
            List<BlackListItem> blackListItems = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewBlackListItems(lastChangeDate));
            BlackListManager.SynchronizeBlackListItems(blackListItems);
            if (blackListItems != null && blackListItems.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["OtherBrokersList"], blackListItems.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["BuildingTypes"]);
            }));
            lastChangeDate = BuildingTypeManager.GetLastChangeDate();
            List<BuildingType> buildingTypes = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewBuildingTypes(lastChangeDate));
            BuildingTypeManager.SynchronizeBuildingTypes(buildingTypes);
            if (buildingTypes != null && buildingTypes.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["BuildingTypes"], buildingTypes.Count));
            }



            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}", CultureResources.Inst["Updating"], CultureResources.Inst["CurrenciesPPP"]);
            }));
            lastChangeDate = CurrencyManager.GetLastChangeDate();
            List<Currency> currencies = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewCurrencies(lastChangeDate));
            CurrencyManager.SynchronizeCurrencies(currencies);
            if (currencies != null && currencies.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Currency"], currencies.Count));
            }
            //lastChangeDate = OperationalSignificanceManager.GetLastChangeDate();
            //List<OperationalSignificance> operationalSignificances = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewOperationalSignificances(lastChangeDate));
            //OperationalSignificanceManager.SynchronizeOperationalSignificances(operationalSignificances);

            //lastChangeDate = OperationalSignificanceManager.GetSignificanceOfTheUsesLastChangeDate();
            //List<SignificanceOfTheUse> significanceOfTheUses = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewSignificanceOfTheUses(lastChangeDate));
            //OperationalSignificanceManager.SynchronizeSignificanceOfTheUses(significanceOfTheUses);

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["BuildingProjects"]);
            }));
            lastChangeDate = ProjectManager.GetLastChangeDate();
            List<Project> projects = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewProjects(lastChangeDate));
            ProjectManager.SynchronizeProjects(projects);
            if (projects != null && projects.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["BuildingProjects"], projects.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["RemontTypes"]);
            }));
            lastChangeDate = RemontManager.GetLastChangeDate();
            List<Remont> remonts = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewRemonts(lastChangeDate));
            RemontManager.SynchronizeRemonts(remonts);
            if (remonts != null && remonts.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["RemontTypes"], remonts.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}", CultureResources.Inst["Updating"], CultureResources.Inst["RoofingsPPP"]);
            }));
            lastChangeDate = RoofingManager.GetLastChangeDate();
            List<Roofing> roofings = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewRoofings(lastChangeDate));
            RoofingManager.SynchronizeRoofings(roofings);
            if (roofings != null && roofings.Count > 0)
            {
                message.AppendLine(string.Format("{0} {1}", CultureResources.Inst["RoofingsP"], roofings.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["States"]);
            }));
            lastChangeDate = StateManager.GetLastChangeDate();
            List<State> states = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewStates(lastChangeDate));
            StateManager.SynchronizeStates(states);
            if (states != null && states.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["States"], states.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["Cities"]);
            }));
            lastChangeDate = CityManager.GetLastChangeDate();
            List<City> cities = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewCities(lastChangeDate));
            CityManager.SynchronizeCities(cities);
            if (cities != null && cities.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Cities"], cities.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["Regions"]);
            }));
            lastChangeDate = RegionManager.GetLastChangeDate();
            List<Region> regions = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewRegions(lastChangeDate));
            RegionManager.SynchronizeRegions(regions);
            if (regions != null && regions.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Regions"], regions.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["Streets"]);
            }));
            lastChangeDate = StreetManager.GetLastChangeDate();
            List<Street> streets = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewStreets(lastChangeDate));
            StreetManager.SynchronizeStreets(streets);
            if (streets != null && streets.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Streets"], streets.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["Users"]);
            }));
            lastChangeDate = UserManager.GetLastChangeDate();
            List<User> users = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewUsers(lastChangeDate));
            UserManager.SynchronizeUsers(users);
            if (users != null && users.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Users"], users.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
                        {
                            btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["Demands"]);
                        }));
            lastChangeDate = DemandManager.GetLastChangeDate();
            List<NeededEstate> demands = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewDemands(lastChangeDate));
            DemandManager.SynchronizeDemands(demands);
            if (demands != null && demands.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Demands"], demands.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["Estates"]);
            }));
            lastChangeDate = EstateManager.GetLastChangeDate();
            List<Estate> estates = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewEstates(lastChangeDate));
            EstateManager.SynchronizeEstates(estates);
            if (estates != null && estates.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Estates"], estates.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}", CultureResources.Inst["Updating"], CultureResources.Inst["CommercialConvenientsPPP"]);
            }));
            lastChangeDate = ConvenientManager.GetLastChangeDate();
            List<Convenient> convs = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewConvenients(lastChangeDate));
            ConvenientManager.SynchronizeConvenients(convs);
            if (convs != null && convs.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["CommercialConvenientsPPP"], convs.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["RentedEstates"]);
            }));
            lastChangeDate = EstateManager.GetRentLastChangeDate();
            List<RentedEstate> rentedEstates = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewRentedEstates(lastChangeDate));
            EstateManager.SynchronizeRentedEstates(rentedEstates);
            if (rentedEstates != null && rentedEstates.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["RentedEstates"], rentedEstates.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["SoldEstates"]);
            }));
            lastChangeDate = EstateManager.GetSoldEstatesLastChangeDate();
            List<SelledEstate> soldEstates = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewSoldEstates(lastChangeDate));
            EstateManager.SynchronizeSoldEstates(soldEstates);
            if (soldEstates != null && soldEstates.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["SoldEstates"], soldEstates.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["EstatesShowedClients"]);
            }));
            lastChangeDate = EstatesAndDemandManager.GetLastChangeDate();
            List<EstatesAndDemand> estateAndDemands = ServiceExecutionContext<IDataUpdateServiceHost>.Execute(s => s.GetNewEstateDemands(lastChangeDate));
            EstatesAndDemandManager.SynchronizeEstateAndDemands(estateAndDemands);
            if (estateAndDemands != null && estateAndDemands.Count > 0)
            {
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["EstatesShowedClients"], estateAndDemands.Count));
            }
            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = CultureResources.Inst["CheckForDataUpdates"];
            }));
            MessageBox.Show(message.ToString(), "Synchronize result", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void btnUpdateSiteData_Click(object sender, RoutedEventArgs e)
        {
            workerForSiteUpdateData.RunWorkerAsync();
        }

        private void UpdateSiteDatabase()
        {
            StringBuilder message = new StringBuilder();
            message.AppendLine("Synchronization completed");
            message.AppendLine();


            DateTime lastChangeDate = ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.GetLastChangeDate());
            if (lastChangeDate == DateTime.MinValue)
            {
                MessageBox.Show("Something is wront");
            }
            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["BuildingTypes"]);
            }));

            List<BuildingType> buildingTypes = BuildingTypeManager.GetNewBuildingTypes(lastChangeDate);
            if (buildingTypes != null && buildingTypes.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateBuildingTypes(buildingTypes.Select(Translator.GetBuildingTypeDto).ToList()));
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["BuildingTypes"], buildingTypes.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["Cities"]);
            }));

            List<City> cities = CityManager.GetNewCities(lastChangeDate);
            if (cities != null && cities.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateCities(cities.Select(Translator.GetCityDto).ToList()));
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Cities"], cities.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}", CultureResources.Inst["Updating"], CultureResources.Inst["CurrenciesPPP"]);
            }));

            List<Currency> currencies = CurrencyManager.GetNewCurrencies(lastChangeDate);
            if (currencies != null && currencies.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateCurrencies(currencies.Select(Translator.GetCurrencyDto).ToList()));
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Currency"], currencies.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["BuildingProjects"]);
            }));

            List<Project> projects = ProjectManager.GetNewProjects(lastChangeDate);
            if (projects != null && projects.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateProjects(projects.Select(Translator.GetProjectDto).ToList()));
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["BuildingProjects"], projects.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["RemontTypes"]);
            }));

            List<Remont> remonts = RemontManager.GetNewRemonts(lastChangeDate);
            if (remonts != null && remonts.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateRemonts(remonts.Select(Translator.GetRemontDto).ToList()));
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["RemontTypes"], remonts.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}", CultureResources.Inst["Updating"], CultureResources.Inst["RoofingsPPP"]);
            }));

            List<Roofing> roofings = RoofingManager.GetNewRoofings(lastChangeDate);
            if (roofings != null && roofings.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateRoofings(roofings.Select(Translator.GetRoofingtDto).ToList()));
                message.AppendLine(string.Format("{0} {1}", CultureResources.Inst["RoofingsP"], roofings.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["States"]);
            }));

            List<State> states = StateManager.GetNewStates(lastChangeDate);
            if (states != null && states.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateStates(states.Select(Translator.GetStateDto).ToList()));
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["States"], states.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["Regions"]);
            }));

            List<Region> regions = RegionManager.GetNewRegions(lastChangeDate);
            if (regions != null && regions.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateRegions(regions.Select(Translator.GetRegionDto).ToList()));
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Regions"], regions.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}...", CultureResources.Inst["Updating"], CultureResources.Inst["Streets"]);
            }));

            List<Street> streets = StreetManager.GetNewStreets(lastChangeDate);
            if (streets != null && streets.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateStreets(streets.Select(Translator.GetStreetDto).ToList()));
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["Streets"], streets.Count));
            }

            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = string.Format("{0} -> {1}", CultureResources.Inst["Updating"], CultureResources.Inst["CommercialConvenientsPPP"]);
            }));

            List<Convenient> convs = ConvenientManager.GetNewConvenients(lastChangeDate);
            if (convs != null && convs.Count > 0)
            {
                ServiceExecutionContext<IRealtorUploadService>.Execute(s => s.UpdateConvenients(convs.Select(Translator.GetConvenientDto).ToList()));
                message.AppendLine(string.Format("{0}: {1}", CultureResources.Inst["CommercialConvenients"], convs.Count));
            }


            Dispatcher.BeginInvoke((Action)(() =>
            {
                btnUpdateData.Content = CultureResources.Inst["CheckForDataUpdates"];
            }));
            MessageBox.Show(message.ToString(), "Synchronize result", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void mnuTools_Convenients_Click(object sender, RoutedEventArgs e)
        {
            new ConvenientManagement().ShowDialog();
        }

        private void mnuTools_DeletedEstates_Click(object sender, RoutedEventArgs e)
        {
            new DeletedEstatesWindow().ShowDialog();
        }

        private void mnuTools_CountryManagement_Click(object sender, RoutedEventArgs e)
        {
            new CountriesManagement().ShowDialog();
        }

        private void mnuTools_CleanImages_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show(CultureResources.Inst["RealtorWillBeClose"], CultureResources.Inst["Confirm"], MessageBoxButton.YesNo, MessageBoxImage.Question) != MessageBoxResult.Yes)
            {
                return;
            }
            Process p = new Process();
            p.StartInfo.FileName = "ImageCleaner.exe";
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            if (System.Environment.OSVersion.Version.Major >= 6)
            {
                p.StartInfo.Verb = "runas";
            }
            p.Start();
            App.ShutdownApplication();
            return;
        }

        private void mnuTools_DeletedClients_Click(object sender, RoutedEventArgs e)
        {
            new DeletedClients().ShowDialog();
            allDemands.LoadDemands();
        }
        private void MiMergeUsers_Click(object sender, EventArgs e)
        {
            var manager = new AdminManager(); manager.LoadSlaveDbs();
            if (manager.MergeUsers())
            {
                MessageBox.Show("Հատուկ գործողությունն ավարտվել է հաջողությամբ։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
            else
            {
                MessageBox.Show("Հատուկ գործողությունն ընդհատվել է։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        private void MiMergeBlackLists_Click(object sender, EventArgs e)
        {
            var manager = new AdminManager(); manager.LoadSlaveDbs();
            if (manager.MergeBlackLists())
            {
                MessageBox.Show("Հատուկ գործողությունն ավարտվել է հաջողությամբ։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
            else
            {
                MessageBox.Show("Հատուկ գործողությունն ընդհատվել է։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        private void MiMergeSettings_Click(object sender, EventArgs e)
        {
            var manager = new AdminManager(); manager.LoadSlaveDbs();
            if (manager.MergeSettings())
            {
                MessageBox.Show("Հատուկ գործողությունն ավարտվել է հաջողությամբ։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
            else
            {
                MessageBox.Show("Հատուկ գործողությունն ընդհատվել է։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        private void MiMergeEstate_Click(object sender, EventArgs e)
        {
            var manager = new AdminManager(); manager.LoadSlaveDbs();
            if (manager.MergeEstate())
            {
                MessageBox.Show("Հատուկ գործողությունն ավարտվել է հաջողությամբ։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
            else
            {
                MessageBox.Show("Հատուկ գործողությունն ընդհատվել է։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        private void MiMergeEstateImages_Click(object sender, EventArgs e)
        {
            var manager = new AdminManager();
            manager.LoadSlaveDbs();
            if (manager.MergeEstateImages())
            {
                MessageBox.Show("Հատուկ գործողությունն ավարտվել է հաջողությամբ։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
            else
            {
                MessageBox.Show("Հատուկ գործողությունն ընդհատվել է։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        private void MiCorrectDb_Click(object sender, EventArgs e)
        {
            var manager = new AdminManager();
            if (manager.CorrectDb())
            {
                MessageBox.Show("Հատուկ գործողությունն ավարտվել է հաջողությամբ։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
            else
            {
                MessageBox.Show("Հատուկ գործողությունն ընդհատվել է։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void MiMergeEstateSettings_Click(object sender, EventArgs e)
        {
            var manager = new AdminManager(); manager.LoadSlaveDbs();
            if (manager.MergeEstateSettings())
            {
                MessageBox.Show("Հատուկ գործողությունն ավարտվել է հաջողությամբ։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
            else
            {
                MessageBox.Show("Հատուկ գործողությունն ընդհատվել է։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        private void MiSortImages_Click(object sender, EventArgs e)
        {
            var manager = new AdminManager();
            if (manager.SortImages())
            {
                MessageBox.Show("Հատուկ գործողությունն ավարտվել է հաջողությամբ։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
            else
            {
                MessageBox.Show("Հատուկ գործողությունն ընդհատվել է։", "Հատուկ գործողություն", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }       
    }
}
