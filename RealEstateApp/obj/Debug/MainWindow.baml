   M S B A M L   `   `   `  ����G  CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA0clr-namespace:UserControls;assembly=UserControlsUserControls  5      I ECustomControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullcBclr-namespace:RealEstateApp.CustomControls;assembly=CustomControlsRealEstateApp.CustomControls 5      A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 5       RealEstateApp   RealEstateApp.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R	 NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml 	    5      IUserControls0clr-namespace:UserControls;assembly=UserControls 	    5      ]CustomControlsBclr-namespace:RealEstateApp.CustomControls;assembly=CustomControls 	    5      F
Converters/clr-namespace:Shared.Converters;assembly=Shared 	    5      -   5        $��
mainWidnow��5   	     � WindowStartupLocation$  CenterScreen=�5       � WindowState$ 	Maximized=�6'    � WindowStyle$ SingleBorderWindow=�6?    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5       � 	Resources 5	      1  +Shared.Converters.BoolToVisibilityConverter   BoolToVisibilityConverterD  >Shared.Converters.BoolToClientModeCheckBoxToolTipTextConverter 0 ,BoolToClientModeCheckBoxToolTipTextConverter7  1Shared.Converters.BoolToVisibilityInvertConverter # BoolToVisibilityInvertConverterD  >Shared.Converters.IsAdminOrDirectorToObjectVisibilityConverter 0 ,IsAdminOrDirectorToObjectVisibilityConverter;  5Shared.Converters.DataUpdateButtonVisibilityConverter ' #DataUpdateButtonVisibilityConverter9  3Shared.Converters.ServerIPToItemVisibilityConverter % !ServerIPToItemVisibilityConverter?  9Shared.Converters.SiteDataUpdateButtonVisibilityConverter + 'SiteDataUpdateButtonVisibilityConverter��%�   &	        &	      &	 &     &	 9     &	 L     &	 _     &	 r       5
   
   6/     5   
   6B     5   
   65     5   
   6B     5      63     5   
   67     5      67   5      .��5      �   PanelLightBrush#���  6   .+�5   
   ]� $��Stretch=�6   $��Stretch=�62   ��. .+�5      � $	��Top=�6   $��30��6(    � ColumnDefinitions 5      �� 5      �� 5      $
��Auto �6'   .+�5      o� -   5        $��mnuMainMenu��5      $��Stretch=�6*   $
��Bold"�6H   .@�5      m� -   5         m�Name$ MiAdmin��5      $��Admin��60   .@�5      m� $��
Merge DB's��6#   .@�5      m� -   5        $��Merge Users Table��5   '   6B   m� 5      -   5        $��Merge BlackList Tables��5   '   6G   m� 5      -   5        $��Merge Settings Tables��5   '   6F   m� 5      -   5        $��Merge Estate Table��5   '   6C   m� 5       -   5        $��Merge EstateImages Table��5    '   6I   m� 5!      -	   5        $"��Merge Estate Settings Tables��5!   '   6M   m� 5"      -
   5        $��Correct DB's��5"   '   6=   m� 5#      -   5        $��Sort images��5#   '   6<   5$      5%      m� 5&      -   5        $��mnuFile��5&      ��6.   ��   CultureResources �� Source# [  �� Path$ 	[Realtor]�.@�5'      m� -   5        $��mnuFile_RefreshData��5'   #   ��6>   �� # [ $ [RefreshData]�6�   m� 5(      -   5        ��5(   #   �� # [ $ [YerevanMap]�6q   m� 5)      -   5        ��5)   #   �� # [ $ [ArmeniaMap]�6q   m� 5*      ��5+      �� 5,   "   	 �� Orientation$	 
Horizontal=�6-   $��Center=�6F   .+�5-   &   �� $��Center=�6z   ��60   �� # [ $ 
[Language]�6z   �� 5.   &   $I��Cpack://application:,,,/Shared;component/Images/DownTriangleIcon.png��6,   $��10��6y   $��10��6�   $��5,0,0,0q�6�   $��Center=�6�   5/   #   .@�51      m� -   5        $��Հայերեն��51   '   

 � Tag$
 hy-AM��68   6D   m� 52      -   5        $��Русский��52   '   $
 ru-RU��68   6D   m� 53      -   5        $��English��53   '   $
 en-US��68   6D   55      m� 56      -   5        $��mnuFile_Exit��56   #   ��67   �� # [ $ [Exit]�6   57      m� 59      -   5        $��mnuUsers��59      ��6/   �� # [ $ [Users]�y�5:      `� 5;       `� 	Converter# [ 6+   .1�5<   "   ��    UserControls.Session   Inst# Z 6*   $ User.IsAdminOrDirector�6X   �� 5=   "   # Z 6*   $ OfflineMode�6X   5>      .@�5@      m� -   5        $��mnuUsers_Add��5@   #   ��67   �� # [ $ [AddUserPPP]�6�   m� 5A      -   5        $��mnuAllUsers��5A   #   ��66   �� # [ $ [AllUsersPPP]�6�   5B      m� 5D      -   5        $��mnuTools��5D      ��6/   �� # [ $ [Dictionaries]�y�5E      `� 5F      # [ 6+   .1�5G   "   �� # Z 6*   $ User.IsAdminOrDirector�6X   �� 5H   "   # Z 6*   $ OfflineMode�6X   5I      .@�5K      m� -   5        $ ��mnuTools_CountryManagement��5K   #   ��6F   �� # [ $ [CountriesPPP]�6�   m� 5L      -   5        $��mnuTools_StatesManagement��5L   #   ��6E   �� # [ $ [StateRegionsPPP]�6�   m� 5M      -   5        $��mnuTools_CityManagement��5M   #   ��6C   �� # [ $ [CitiesPPP]�6�   m� 5N      -   5        $��mnuTools_RegionManagement��5N   #   ��6E   �� # [ $ [RegionsPPP]�6�   m� 5O      -   5        $��mnuTools_StreetManagement��5O   #   ��6E   �� # [ $ [StreetsPPP]�6�   m� 5P      -   5        $&�� mnuTools_BuildingTypesManagement��5P   #   ��6L   �� # [ $ [BuildingStructuresPPP]�6�   m� 5Q      -   5        $ ��mnuTools_ProjectManagement��5Q   #   ��6F   �� # [ $ [BuildingProjectsPPP]�6�   m� 5R      -   5        $��mnuTools_RemontManagement��5R   #   ��6E   �� # [ $ [RemontTypesPPP]�6�   m� 5S      -    5        $ ��mnuTools_RoofingManagement��5S   #   ��6F   �� # [ $ [RoofingsPPP]�6�   m� 5T      -!   5        $!��mnuTools_CurrencyManagement��5T   #   ��6G   �� # [ $ [CurrenciesPPP]�6�   m� 5U      -"   5        $#��mnuTools_ConvenientManagement��5U   #   ��6I   �� # [ $  [CommercialConvenientsPPP]�6�   m� 5X      -#   5        $��mnuTools_CreateDatabase��5X   #   ��6B   �� # [ $ [CreateArchive]�y�5Y   #   �� # Z $ ServerIP� �� 	Converter# [ m� 5Z      -$   5        $��mnuTools_DeletedEstates��5Z      ��60   �� # [ $ [DeletedEstates]�6�   m� 5[      -%   5        $��mnuTools_DeletedClients��5[   #   ��6B   �� # [ $ [DeletedClients]�6�   m� 5\      -&   5        $��mnuTools_ImageCleaner��5\   #   ��6@   �� # [ $ [CleanImages]�y�5]   #   �� # Z $ User.IsAdminOrDirector�# [  m� 5^      -'   5        $��mnuTools_Test��5^      ��6&   �� # [ $ 
[Settings]�6r   5_      m� 5`      -(   5        $ mnuStatistics��5`      ��66   �� # [ $ [DoneDealings]�y�5a   
   �� # Z $ User.IsAdminOrDirector�# [  .@�5h      m� -)   5        $&  mnu_StatisticAboutAgencyOrBroker��5h   q   ��6#   �� # [ $ [Statistics]�y�5i   	   �� # Z $ User.IsDirector�# [  m� 5j      -*   5        $! mnuStatistics_SelledEstates��5j   #   ��6H   �� # [ $ [SoldEstates]�6�   m� 5k      -+   5        $! mnuStatistics_RentedEstates��5k   #   ��6H   �� # [ $ [RentedEstates]�6�   5l      m� 5r      -,   5        $��mnuHelp��5r      ��6.   �� # [ $ [Help]�.@�5s      m� --   5        $��mnuHelp_Help��5s   #   ��67   �� # [ $ [Help]�6   m� 5t      -.   5        $��mnuHelp_EnterCode��5t   #   ��6<   �� # [ $ [InputCurCode]�y�6�   �� # Z $ IsWithoutVerification�# [ .@�5u      m� -/   5        $��mnuHelp_EnterCode_Input��5u   '   ��6l   �� # [ $ [EnterCode]�m� 5v      -0   5        $ ��mnuHelp_EnterCode_FromFile��5v   '   ��6r   �� # [ $ [SelectFile]�5w      m� 5x      -1   5        $��mnuHelp_About��5x   #   ��68   �� # [ $ [AboutProgramPPP]�6�   5y      5z      �� 5{      #��[ 6   $��1��6G   $��30��6W   ._�5|      �� $	 
Horizontal=�6   .+�5}      �� $
��Bold"�5      $��12(�6.   
���  ��$��Center=�6M   $
��10,0q�5�      ��5}      �� # [ $) #[ApplicationIsRunningInOfflineMode]�y�5~      �� # Z $ OfflineMode�# [  5�      �� 5�      -2   5         ��Name$ btnUpdateData��5�   	   $��5q�5�       � Cursor$
 Hand��6   ��6(   �� # [ $ [CheckForDataUpdates]�y�5�   	   `� 5�   
   # [ 6   .1�5�      �� # Z 6   $ OfflineMode�6A   �� 5�      # Z 6   $ ServerIP�6A   5�      ��5�   	   �� 5�   
    �� 
TargetType" ��6   .R�5�      �� $��	Underline{�6   �� 5�      5�      5�      ��5�   	   �� 5�   
    �� 
TargetType" ��6   .�5�      ��  �� Property � �� �� Value
 ��  �6(    �� Triggers 5�      P� 5�       P� Property �@J�IsMouseOver P� Value . . �5�      ��  � ��
 �  ��6*   5�      5�      5�   	   �� 5�      -3   5        $ btnUpdateSiteData��5�   	   $��5q�5�      $
 Hand��6   ��6(   �� # [ $ [CheckForSiteDataUpdates]�y�5�   	   `� 5�   
   # [ 6   .1�5�      �� # Z 6   $ IsWebEnabled�6A   �� 5�      # Z 6   $ ServerIP�6A   5�      ��5�   	   �� 5�   
   " ��6   .R�5�      �� $��	Underline{�6   �� 5�      5�      5�      ��5�   	   �� 5�   
   " ��6   .�5�      ��  � ��
 ��  �6(    5�      P� 5�       �@J�IsMouseOver . . �5�      ��  � ��
 �  ��6*   5�      5�      5�   	   5�      5�      5�      �� 5�      #���  6   $��Stretch=�6G   $��Bottom=�6e   .@�5�      �� .��5�      � $��Stretch=�6    5�      �� 5�      $
��Auto �6/   �� 5�      �� 5�      $
��Auto �6/   .+�5�      �  � Orientation$ 
Horizontal=�6$   
������ $��1,-3,1,1q�6V   $��Center=�6h   $
��Left=�6�   $��1��6�   .+�5�      �� -4   5         ��Name$ txbUser��5�   (   $
��Left=�69   $��11(�6T   $��10,0,0,0q�6b   ��6t   �� # [ $ [UserP]��� 5�      -5   5        $ txbUserName��5�   (   $
��Left=�6=   $	��250��6X   $��11(�6g   $��3,0,0,0q�6u   $
��Wrap=�6�    �� BaselineOffset$ 5Q�6�   $
��Bold"�6�   ��6�   �� # Z $ User.FullName�6�   �� 5�      $��Right=�6(   $��11(�6D   $��1,0,0,0q�6R   $��;��6c   �� 5�      -6   5        $ txbEstatesCount��5�   (   $
��Left=�6A   $��11(�6\   $��10,0,0,0q�6j   ��6|   �� # [ $ [EstatesCountP]��� 5�      -7   5        $ 	txbFPName��5�   (   $��Right=�6;   $��11(�6W   $	��300��6e   $��2,0,0,0q�6t   $
��Wrap=�6�   $ 5Q�6�   $
��Bold"�6�   ��6�   �� # Z $ EstatesCount�6�   �� 5�      $��Right=�6(   $��11(�6D   $��1,0,0,0q�6R   $��;��6c   �� 5�      -8   5        $ txbDemandsCount��5�   (   $
��Left=�6A   $��11(�6\   $��10,0,0,0q�6j   ��6|   �� # [ $ [ClientsCountP]��� 5�      -9   5        $ 
txbDemands��5�   (   $��Right=�6<   $��11(�6X   $	��300��6f   $��2,0,0,0q�6u   $
��Wrap=�6�   $ 5Q�6�   $
��Bold"�6�   ��6�   �� # Z $ DemandsCount�6�   �� 5�      $��Right=�6(   $��11(�6D   $��1,0,0,0q�6R   $��;��6c   �� 5�      -:   5        $ txbPersonalDemandsTitle��5�   (   $
��Left=�6I   $��11(�6d   $��10,0,0,0q�6r   ��6�   �� # [ $ [MyClientsCount]��� 5�      -;   5        $ txbPersonalDemandsValue��5�   (   $��Right=�6I   $��11(�6e   $	��300��6s   $��2,0,0,0q�6�   $
��Wrap=�5�   g   $ 5Q�6{   $
��Bold"�6�   ��6   �� # Z $ User.NeededEstates.Count�6�   5�      5�      5�      �� 5�      $��Right=�6    .��5�      �� $	 
Horizontal=�6!   $��2��6:   $	��5,0q�6J   .+�5�      �� -<   5        $ btnCheckForUpdates��5�   	   $��5q�5�   !   $
 Hand��6,   ��6:   �� # [ $ [CheckForUpdates]���5�      �� 5�   "   " ��62   .R�5�   &   �� $��	Underline{�60   �� 5�      5�   '   5�   #   ��5�      �� 5�   "   " ��6(   .�5�   &   ��  � ��
 ��  �6C    5�   &   P� 5�   *    �@J�IsMouseOver . . �5�   .   ��  � ��
 �  ��6K   5�   +   5�   #    � Triggers 5�      :� 5�   "    :� RoutedEvent$ Button.Click��6/   .[�5�   &   �� .��5�   *   �� -=   5         ��Name$ 
sbProgress��5�   5   .��5�   .   W� ->   5         W�Name$ updateProgressAnimation��5�   a    �� 
TargetName$ 
progUpdate��6>    �� TargetProperty$ Value�5�        W� From$  0X�6/   	! W� To$	! 100X�68   " g� Duration$" 0:0:3D�6A   # g� AutoReverse# . $ g� 	BeginTime$$ 0:0:0X�6e   W� 5�   .   $ 
progUpdate��6>   $ Width�5�      $  0X�6/   $	! 100X�68   $" 0:0:1D�6A   $$ 0:0:0X�6R   W� 5�   .   -?   5        $ updateWidthAnimation��5�   a   $ 
progUpdate��6>   $ Width�5�      $	  100X�6/   $! 0X�6:   $" 0:0:1D�6A   $$ 0:0:5X�6R   5�   +   5�   '   5�   #   5�      � 5�      -@   5        % �Name$% 
progUpdate��5�   <   $��15��6&   $��0��62   $	��5,0q�6P   $��Center=�6]   5�      5      5     4	  .RealEstateApp.CustomControls.DragDockPanelHost	  5     -A   5        $��dockPanelHost��5  /   $��Stretch=�6D   $��Stretch=�6b   & 	  MinimizedPosition$& Right=�6~   .+�5     0
  *RealEstateApp.CustomControls.DragDockPanel
  -B   5        $��ddpAddRealEstate��5  /   $��5q�6G   
���������6R   �� # [ $ [AddEditEstate]�.��5     � $��Stretch=�6   $��Stretch=�69   $��3q�6U   .+�5     $   UserControls.AddEditRealEstate  -C   5        $��addrealEstate��5  9   $��Stretch=�6N   $��Stretch=�6l   '   RealEstatesListControl' 5	  9   �� ( �� ElementName$( ddpRealEstatesList��)   FavoriteEstatesControl) 5
  9   �� $( favoritesControl��5     5     
  5     -D   5        $��ddpRealEstatesList��5  /   $��5q�6I   
���������6T   �� # [ $ 	[Estates]�.��5     � $��Stretch=�6   $��Stretch=�69   $��3q�6U   .+�5     "   UserControls.RealEstatesList  -E   5        $��EstatesList��5  7   $��Stretch=�5  7   $��Stretch=�6U   *   EditControl* 5  J   �� $( ddpAddRealEstate��+   FavoriteEstatesControl+ 5     �� $( ddpRealEstatesList��,   EstatesAndDemandsControl, 5     �� $( ddpestatesShowedClients��5     5     
  5     -F   5        $��ddpFavoriteEstates��5  /   $��5q�6I   
���������6T   �� # [ $! [FavoriteEstatesAndClients]�.��5     � $��Stretch=�6   $��Stretch=�69   $��3q�6U   .+�5     �� .@�5     �� ��6&   �� # [ $ [FavoriteEstates]�.��5  "   "   UserControls.FavoriteEstates  -G   5        -  Name$- favoritesControl��5  y   $��Stretch=�6?   $��Stretch=�6]   6y   5     �� 5     ��6&   �� # [ $ [FavoriteClients]�.��5  "   "   UserControls.FavoriteClients  -H   5        .  Name$. favoriteClientsControl��5  y   $��Stretch=�6?   $��Stretch=�6]   6y   5     5      5!     5"     
  5$     -I   5        $��	ddpSearch��5$  /   $��5q�6@   
���������6K   �� # [ $ [Search]�.��5%     �� $
��Auto=�6#   $
��Auto=�6H   $��Stretch=�6k   $��Stretch=�6�   $��3q�6�   .��5&     �� .+�5'     �� $	 
Horizontal=�6)   $��Center=�6B   $
��Left=�6]   .+�5)  "   �� -J   5        $��btnCheckAddress��5)  )   $��Right=�5*  
   $��10q�6&   ��5)  @   �� # [ $ [CheckAddress]�5*  &   �� 5,  "   -K   5        $��btnSearchChange��5,  )   $��Advanced��6�   $��10q�5-  
   ��5,  @   �� # [ $ [AdvancedSearch]�5-  
   5/         UserControls.SearchControl  51     -L   5        /  Name$/ searchControl��51  9   $��Stretch=�6P   $	��Top=�6n   $y�	Collapsed=�52  {   !0   RealEstatesListControlName0 65   �� $( ddpRealEstatesList��6{   &    UserControls.SimpleSearchControl  53     -M   5        1  Name$1 simpleSearch��53  ?   $��Stretch=�6U   $	��Top=�6s   !2   RealEstatesListControlName2 54     �� $( ddpRealEstatesList��55     57     58     
  5:     -N   5        $��ddpAddDemand��5:  /   $��5q�6C   
���������6N   �� # [ $ [AddEditDemand]�.��5<     � $��Stretch=�6   $��Stretch=�69   $��3q�6U   .+�5=         UserControls.AddEditDemand  -O   5        3  Name$3 addEditDemand��5=  o   $��Stretch=�65   $��Stretch=�6S   4   DemandsListPanel4 5>     �� $( ddpAllDemands��5?     5@     
  5B     -P   5        $��ddpAllDemands��5B  /   $��5q�6D   
���������6O   �� # [ $ 	[Demands]�.��5C     � $��Stretch=�6   $��Stretch=�69   $��3q�6U   .+�5D        UserControls.Demands  -Q   5        $��
allDemands��5D  /   $��Stretch=�6A   $��Stretch=�6_   5   
DemandType$	5 All=�6{   6   AddEditControlPanel6 5E     �� $( ddpAddDemand��7   EstatesAndDemandsControl7 5F     �� $( ddpestatesShowedClients��8   FavoriteClientsControl8 5G  /   �� $( favoriteClientsControl��5H     5I     
  5M     -R   5        $��ddpBlackList��5M  /   $��5q�6C   
���������6N   �� # [ $ [OtherBrokersList]�.��5N     � $��Stretch=�6   $��Stretch=�69   $��3q�6U   .+�5O        UserControls.BlackList  -S   5        9  Name$9 	blackList��5O  1   5P     5Q     
  5S     -T   5        : 
 Name$: ddpestatesShowedClients��5S  /   $��5q�6P   
���������6[   �� # [ $ [EstatesShowedClients]�.��5T     � $��Stretch=�6   $��Stretch=�69   $��3q�6U   .+�5U     '   !UserControls.EstatesShowedClients  -U   5        ;  Name$; estatesShowedClients��5U  <   5V     5W     5Y     5Z     5[     5\     