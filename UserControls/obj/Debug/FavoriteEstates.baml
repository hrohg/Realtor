   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5      U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls 5      G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:UserControlsUserControls 5      "   UserControls.FavoriteEstates   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5      ZMicrosoftControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     5      3UserControlsclr-namespace:UserControls     5      -   5          >�Name$  favoriteList��5      
���   � J� 	AllowDrop .  � 	Resources 5         
PanelBrush �� 
StartPoint �� EndPoint � Offset � Color1   +Shared.Converters.BoolToVisibilityConverter  BoolToVisibilityConverter:   4Shared.Converters.EstateToRegionStateStringConverter & "EstateToRegionStateStringConverter5   /Shared.Converters.StringToOneRowStringConverter ! StringToOneRowStringConverter9   3Shared.Converters.EstateToFloorViewForListConverter % !EstateToFloorViewForListConverter2   ,Shared.Converters.StringEmptyToNullConverter  NullToStringEmptyConverter  StringEmptyToNullConverter;   5Shared.Converters.ShowingColumnsToVisibilityConverter ' #ShowingColumnsToVisibilityConverter6   0Shared.Converters.FullAddressVisibilityConverter " FullAddressVisibilityConverterM   GShared.Converters.EstateToEstateFullAddressStringWithoutRegionConverter 9	 5EstateToEstateFullAddressStringWithoutRegionConverter0	   *Shared.Converters.IntToVisibilityConverter 
 IntToVisibilityConverter9
   3Shared.Converters.EstateToRoomsCountStringConverter % !EstateToRoomsCountStringConverterD   >Shared.Converters.IsAdminOrDirectorToObjectVisibilityConverter 0 ,IsAdminOrDirectorToObjectVisibilityConverter��%0  &	        &	 �     &	 �     &	 �     &	     &	     &	 )    &	 <    &	 O    &		 b    &	
 u    &	 �    &	 �    �� 5   
   $	 0,0&�61   $	 0,1&�6B   .��5      � $ 0Q�6   $ 	#fffdfdfd��6&   � 5      $	 0.8Q�6   $ 	#fff0f0f0��6(   � 5      $ 1Q�6   $ 	#ffe0e0e0��6&   5        5   
   6/     5   
   68     5   
   63     5   
   67     5   
   60     5   
   60     5   
   69     5   
   64     5      6E   	  5      6(   
  5      61     5   
   6B   5      .��5      � -   5         �Name$ grdRoot��5      $��3q�6    � RowDefinitions 5   
   �� 5       $
��Auto �6   �� 5!      �� 5"      $��25 �6   .+�5%   
   � 	 � ColumnDefinitions	 5&   
   �� 5'      �� 5(       5+   
   �� 5,      $
��Auto �6   �� 5-      .+�50   
   �� 
 �� Orientation$
 
Horizontal=�6   $��Center=�6.   $
��Left=�6I   $��0��6d   .+�55      �� -   5         ��Name$ btnPrint��55      $��10,0,0,0q�6�    � ToolTip 65   ��   CultureResources �� Source# [  �� Path$ [Print]�.��56      �� $>��8pack://application:,,,/Shared;component/Images/Print.png��6   $��24��6Z   $��23��6e   57      58      5:      )  #Microsoft.Windows.Controls.DataGrid  5;      -   5          Name$ 	dgEstates��5=   L      AutoGenerateColumns .     CanUserResizeColumns .    CanUserReorderColumns .    CanUserSortColumns . $��1��5<         
IsReadOnly . $��0,5,0,0q�6u   $��Stretch=�5=      $	��Top=�64      CanUserResizeRows .   J� SnapsToDevicePixels .  ��5<   #   �� $ Estates� �� ElementName$ favoriteList�� � ContextMenu 5@      �� 5A      -   5         ��Name$
 menu��5A      .@�5B      m� -   5         m�Name$ mnuDeleteFromThisList��5B   f   ��6   �� # [ $ [RemoveFromThisList]�6�   m� 5C      -   5        $ mnuOpen��5C      ��6!   �� # [ $ [Open]�6i   m� 5D      -   5        $��	mnuDelete��5D   �   ��6   �� # [ $ [Delete]�y�5E      `� 5F       `� 	Converter# [ 6+   .1�5G   "   ��   UserControls.Session   Inst# Z 6*   $ User.IsAdminOrDirector�6X   �� 5H   "   # Z 6*   $ OfflineMode�6X   5I      5K      m� 5L      -	   5        $ mnuSaveAsXML��5L   �   ��6#   �� # [ $ [SaveAsFile]�y�5M      �� # Z $ User.IsAdminOrDirector� �� 	Converter# [ m� 5N      -
   5        ��5N      �� # [ $ [SelectClients]�6a   5O         Columns 5Q      3  -Microsoft.Windows.Controls.DataGridTextColumn  5R      /  )Microsoft.Windows.Controls.DataGridColumn   Width8  2Microsoft.Windows.Controls.DataGridLengthConverter$
 Auto 6�       SortMemberPath$
  Code��6�   4  .Microsoft.Windows.Controls.DataGridBoundColumn!   Binding! 67   �� $
 Code�" �� Mode$" OneWay=�#   Header# 6b   �� # [ $ [Code]�$   
Visibility$ 5S      �� # Z $0 *ApplicationSettings.ShowingColumns[0].Show�# [ % �� UpdateSourceTrigger$% PropertyChanged=�$" OneWay=�  5T      $
 Auto 6�   $  OrderType.Name��6�   ! 67   �� $ OrderType.Name�$" OneWay=�# 6l   �� # [ $ [SellOrRent]�$ 5U      �� # Z $0 *ApplicationSettings.ShowingColumns[1].Show�# [ $% PropertyChanged=�$" OneWay=�7  1Microsoft.Windows.Controls.DataGridTemplateColumn  5V      $
 Auto 6�   # 6;   �� # [ $ [Room]�$ 5W      �� # Z $0 *ApplicationSettings.ShowingColumns[2].Show�# [ $% PropertyChanged=�$" OneWay=�&   CellTemplate& 5X      �� 5Y      .R�5Z      �� ��6(   �� $" OneWay=�# [ 5[      5]        5^      $
 Auto 6�   $  EstateTypeID��6�   ! 67   �� $ EstateType.TypeName�$" OneWay=�# 6q   �� # [ $ [TheEstateType]�$ 5_      �� # Z $0 *ApplicationSettings.ShowingColumns[3].Show�# [ $% PropertyChanged=�$" OneWay=�  5`      $
 Auto 6�   $  Region.RegionID��6�   ! 67   �� $" OneWay=�# [ # 6�   �� # [ $ [StateOrRegion]�$ 5a   %   �� # Z $0 *ApplicationSettings.ShowingColumns[4].Show�# [ $% PropertyChanged=�$" OneWay=�  5b      $
 Auto 6�   '   CanUserSort' .  ! 67   �� $ ShortAddressString�$" OneWay=�# 6p   �� # [ $ 	[Address]�$ 5c      �� # Z $0 *ApplicationSettings.ShowingColumns[5].Show�# [ $% PropertyChanged=�$" OneWay=�  5d      $
 Auto 6�   ' .  ! 67   �� $" OneWay=�# [	 # 6�   �� # [ $ [AddressFull]�$ 5e      `� 5f      # [ 6'   .1�5g      �� # Z 6&   $0 *ApplicationSettings.ShowingColumns[6].Show�6T   �� 5h      # Z 6&   $ IsClientShowingMode�6T   5i      5k        5n      $
 Auto 6�   $  TotalSquare��6�   ! 67   �� $ SquareString�$" OneWay=�# 6j   �� # [ $ [Square]�$ 5o   %   �� # Z $0 *ApplicationSettings.ShowingColumns[7].Show�# [ $% PropertyChanged=�$" OneWay=�  5p      (   MaxWidth$( 50Q�6�   $
 Auto 6�   ! 67   �� $" OneWay=�# [ # 6�   �� # [ $ [Floor]�$ 5q   %   �� # Z $0 *ApplicationSettings.ShowingColumns[8].Show�# [ $% PropertyChanged=�$" OneWay=�  5r      $
 Auto 6�   ! 67   �� $ Remont.Name�$" OneWay=�# 6i   �� # [ $ [RemontType]�$ 5s      �� # Z $1 +ApplicationSettings.ShowingColumns[20].Show�# [ $% PropertyChanged=�$" OneWay=�  5t      $
 Auto 6�   ! 67   �� $ BuildingType.Name�$" OneWay=�# 6o   �� # [ $ [BuildingType]�$ 5u      �� # Z $1 +ApplicationSettings.ShowingColumns[22].Show�# [ $% PropertyChanged=�$" OneWay=�  5v      $
 Auto 6;   ' .  $ 5w      �� # Z $0 *ApplicationSettings.ShowingColumns[9].Show�# [ $% PropertyChanged=�$" OneWay=�)   HeaderTemplate) 5x      �� 5y      .R�5z      �� $
 
Horizontal=�6)   .+�5{   "   �� ��6,   �� # [ $ [Price]��� 5|   "   $��20��6t   $��3,0,0,0q�6�   $��11(�6�   * �� DisplayMemberPath$
* Name��5~      + �� 
IsEditable+ .  ��5|   +   �� $ GridCurrencies�$ realEstatesList��, �� SelectedItem, 5}      �� $ SelectedGridCurrency�$" TwoWay=�$ realEstatesList��5~   $   5      5�      & 5�      �� 5�      .R�5�      �� ��6(   �� $ Price�$" OneWay=�5�      5�        5�      $
 Auto 6�   $  PricePerDay��6�   ! 67   �� $ PricePerDay�$" OneWay=�# 6i   �� # [ $ [PricePerDay]�$ 5�      �� # Z $1 +ApplicationSettings.ShowingColumns[10].Show�# [ $% PropertyChanged=�$" OneWay=�  5�      $
 Auto 6�   $  Currency.CurrencyID��6�   ! 67   �� $ Currency.Name�$" OneWay=�# 6k   �� # [ $ 
[Currency]�$ 5�      �� # Z $1 +ApplicationSettings.ShowingColumns[11].Show�# [ $% PropertyChanged=�$" OneWay=�  5�      $
 Auto 6�   ! 67   �� $ AddDate�$" OneWay=�- �� StringFormat$- {0:dd.MM.yyyy}��# 6�   �� # [ $ [Added]�$ 5�   
   �� # Z $1 +ApplicationSettings.ShowingColumns[12].Show�# [ $% PropertyChanged=�$" OneWay=�  5�      $
 Auto 6  ! 67   �� $ LastModifiedDate�$" OneWay=�# [ $- {0:dd.MM.yyyy}��# 6�   �� # [ $ 	[Updated]�$ 5�   %   �� # Z $1 +ApplicationSettings.ShowingColumns[13].Show�# [ $% PropertyChanged=�$" OneWay=�  5�      $
 Auto 6�   ! 67   �� $ Height�$" OneWay=�# 6d   �� # [ $ [Height]�$ 5�      �� # Z $1 +ApplicationSettings.ShowingColumns[14].Show�# [ $% PropertyChanged=�$" OneWay=�  5�      $
 Auto 6�   ! 67   �� $ 
SellerInfo�$" OneWay=�# 6h   �� # [ $ [Seller]�$ 5�      `� 5�      # [ 6'   .1�5�      �� # Z 6&   $1 +ApplicationSettings.ShowingColumns[15].Show�6T   �� 5�      # Z 6&   $ IsClientShowingMode�6T   5�      5�        5�      $
 Auto 6�   # 6;   �� # [ $ [AdditionalDetails]�$ 5�      �� # Z $1 +ApplicationSettings.ShowingColumns[16].Show�# [ $% PropertyChanged=�$" OneWay=�& 5�      �� 5�      .R�5�      �� ��6(   �� $ AdditionalInformation�$" OneWay=�# [ . ^� ToolTip. 6�   �� $ AdditionalInformation�5�      5�        5�      $
 Auto 6�   ! 67   �� $ InformationSource�$" OneWay=�# 6o   �� # [ $ [InfSource]�$ 5�      �� # Z $1 +ApplicationSettings.ShowingColumns[18].Show�# [ $% PropertyChanged=�$" OneWay=�  5�      $
 Auto 6�   ! 67   �� $ Status�$" OneWay=�# 6d   �� # [ $ [Status]�$ 5�      �� # Z $1 +ApplicationSettings.ShowingColumns[19].Show�# [ $% PropertyChanged=�$" OneWay=�  5�      $
 Auto 6�   ! 67   �� $ User.FullName�$" OneWay=�# 6k   �� # [ $ [Broker]�$ 5�      �� # Z $1 +ApplicationSettings.ShowingColumns[17].Show�# [ $% PropertyChanged=�$" OneWay=�  5�      $
 Auto 6�   ! 67   �� $ Project.Name�$" OneWay=�# 6j   �� # [ $ [TheProject]�$ 5�      �� # Z $1 +ApplicationSettings.ShowingColumns[21].Show�# [ $% PropertyChanged=�$" OneWay=�5�      5�      5�      