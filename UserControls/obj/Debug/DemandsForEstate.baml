   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5   	   U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls 5   	    UserControls#   UserControls.DemandsForEstate   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5   	   QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     5   	   -   5          �Name$  demandsForEstate��5   W    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��6q    � ShowActivated .  � ShowInTaskbar .  � WindowState$ 	Maximized=�5   �    � WindowStartupLocation$ CenterScreen=�6�    � Title 6	   ��    CultureResources �� Source# [   �� Path$ [ClientsForEstates]�	 � 	Resources	 5      6   0Shared.Converters.NeededRegionsToStringConverter " NeededRegionsToStringConverter5   /Shared.Converters.UserToTranslatedUserConverter ! UserToTranslatedUserConverter:   4Shared.Converters.EstateToRegionStateStringConverter & "EstateToRegionStateStringConverter:   4Shared.Converters.NeededEstateTypesToStringConverter & "NeededEstateTypesToStringConverter<   6Shared.Converters.DateTimeToFormattedDateTimeConverter ( $DateTimeToFormattedDateTimeConverter5   /Shared.Converters.StringToOneRowStringConverter ! StringToOneRowStringConverter/   )Shared.Converters.IsRentToStringConverter  IsRentToStringConverter2   ,Shared.Converters.StringEmptyToNullConverter  NullToStringEmptyConverter��%�   &	       &	      &	 &     &	 9     &	 L     &	 _     &	 r     &	 �       5   
   64     5	   
   63     5
   
   68     5   
   68     5   
   6:     5   
   63     5   
   6-     5   
   60   5      .��5      � $��3q�6   
 � RowDefinitions
 5   
   �� 5      �� 5      �� 5      $��30 �6   .+�5      �� ��6   �� # [  $ [Estate]�.��5      )	  #Microsoft.Windows.Controls.DataGrid	  -   5         	 Name$ 	dgEstates��5   A    	  AutoGenerateColumns .   	  CanUserResizeColumns .  	  CanUserReorderColumns .  	  CanUserSortColumns .  	  SelectionMode$ Single=�5   �   $��2��5       	  
IsReadOnly . $��Stretch=�5      $	��Top=�6)   ��5       �� $ Estates� �� ElementName$ demandsForEstate�� 	  Columns 5      3
  -Microsoft.Windows.Controls.DataGridTextColumn
  5      4  .Microsoft.Windows.Controls.DataGridBoundColumn   Binding 62   �� $
 Code� �� Mode$ OneWay=�/  )Microsoft.Windows.Controls.DataGridColumn   Header 6]   �� # [  $ [Code]�
  5         Width8  2Microsoft.Windows.Controls.DataGridLengthConverter$
 Auto 6�      SortMemberPath$ OrderTypeID��6�    6#   �� $ OrderType.Name�$ OneWay=� 6X   �� # [  $ 	[OrdType]�6�   
  5      $
 Auto 6�   $ EstateTypeID��6�    6#   �� $ EstateType.TypeName�$ OneWay=� 6]   �� # [  $ [TheEstateType]�6�   
  5       $
 Auto 6�   $ RegionID��6�    6#   �� $ OneWay=� �� 	Converter# [  6�   �� # [  $ [StateOrRegion]�6�   
  5!      $
 Auto 6�    6#   �� $ 	RoomCount�$ OneWay=� 6S   �� # [  $ [Room]�6�   
  5#      $
 Auto 6�   $ StreetID��6�    6#   �� $ Street.Name�$ OneWay=� 6U   �� # [  $ [Street]�6�   
  5$      $
 Auto 6�      CanUserSort .   6#   �� $ ShortAddressString�$ OneWay=� 6\   �� # [  $ 	[Address]�6�   
  5%      $
 Auto 6�    6#   �� $ TotalSquare�$ OneWay=� 6U   �� # [  $ [Square]�6�   
  5&      $
 Auto 6�    6#   �� $ BuildingFloorsCount�$ OneWay=� 6]   �� # [  $ [BuildingFloor]�6�   
  5'         MaxWidth$ 50Q�6�   $
 Auto 6�    6#   �� $ Floor�$ OneWay=� 6O   �� # [  $ [Floor]�6�   
  5(      $
 Auto 6�    6#   �� $ Price�$ OneWay=� 6O   �� # [  $ [Price]�6�   
  5)      $
 Auto 6�   $ 
CurrencyID��6�    6#   �� $ Currency.Name�$ OneWay=� 6W   �� # [  $ 
[Currency]�6�   
  5*      $
 Auto 6�    6#   �� $ AddDate�$ OneWay=� �� StringFormat$ {0:dd.MM.yyyy}�� 6p   �� # [  $ [Added]�6�   
  5+      $
 Auto 6�    6#   �� $ LastModifiedDate�$ OneWay=�# [ $ {0:dd.MM.yyyy}�� 6�   �� # [  $ 	[Updated]�6�   
  5,      $
 Auto 6�    6#   �� $ 
SellerInfo�$ OneWay=� 6T   �� # [  $ [Seller]�6�   7  1Microsoft.Windows.Controls.DataGridTemplateColumn  5-      $
 Auto 6|    6'   �� # [  $ [AdditionalDetails]�   CellTemplate 5.      �� 5/      .R�50   "   �� ��6,   �� $ AdditionalInformation�$ OneWay=�# [  ^� ToolTip 6�   �� $ AdditionalInformation�51      53      
  54      $
 Auto 6�    6#   �� $ Rating�$ OneWay=� 6P   �� # [  $ [Rating]�6�   56      57      �� 58      $��1��6Z   ��6   �� # [  $ [Pahanjark]�.��59      	  -   5        $ dgNeededEstates��5<   A    .   .  .  .  . $ Single=�5;       $��Stretch=�5<      $	��Top=�6)   ��5:      �� $ Demands�$ demandsForEstate�� 5=      
  5>      $
 Auto 6�    6#   �� $
 User�$ OneWay=�# [  6�   �� # [  $ [Broker]�6�   
  5?      $
 Auto 6�    6#   �� $ IsNeedForRent�$ OneWay=�# [  6�   �� # [  $ 	[OrdType]�6�   
  5@      $
 Auto 6�    6#   �� $ NeededEstateTypes�$ OneWay=�# [  6�   �� # [  $ [EstateType]�6�   
  5A      $
 Auto 6�    6#   �� $ RoomsCountInterval�$ OneWay=� 6\   �� # [  $ [Room]�6�   
  5B      $
 Auto 6�    6#   �� $ SquareInterval�$ OneWay=� 6X   �� # [  $ [Square]�6�   
  5C      $
 Auto 6�    6#   �� $ PriceInterval�$ OneWay=� 6W   �� # [  $ [Price]�6�   
  5D      $
 Auto 6�    6#   �� $ Currency.Name�$ OneWay=� 6W   �� # [  $ 
[Currency]�6�   
  5E      $
 Auto 6�    6#   �� $ NeededRegions�$ OneWay=�# [  6�   �� # [  $ [StateOrRegion]�6�   
  5F      $
 Auto 6�    6#   �� $ 	BuyerInfo�$ OneWay=� 6S   �� # [  $ [Client]�6�   
  5G      $
 Auto 6�    6#   �� $ AddDate�$ OneWay=�$ {0:dd.MM.yyyy}�� 6p   �� # [  $ [Added]�6�   
  5H      $
 Auto 6�    6#   �� $ LastModifiedDate�$ OneWay=�# [ $ {0:dd.MM.yyyy}�� 6�   �� # [  $ 	[Updated]�6�     5I      $
 Auto 6t    6'   �� # [  $ [AdditData]� 5J      �� 5K      .R�5L   "   �� ��6,   �� $ AdditionalDetails�$ OneWay=�# [  6�   �� $ AdditionalDetails�5M      5O      5Q      5R      �� 5S      -   5         ��Name$ btnOK��5S      $��2��6d   $��Right=�6q   $��0,0,10,0q�6�   $��Center=�6�   ��6   �� # [  $ [Close]�6�   5T      5U      