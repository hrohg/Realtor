   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5   	   U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls 5   	   G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:UserControlsUserControls 5   	      UserControls.DemandView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5   	   QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     5   	   3UserControlsclr-namespace:UserControls     5   	   -   5          �Name$  demandVw��5   .    � WindowState$ 	Maximized=�5   W    � WindowStyle$ SingleBorderWindow=�6o    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   	    � WindowStartupLocation$ CenterScreen=�5   	    � 	Resources 5	      /   )Shared.Converters.IsRentToStringConverter   IsRentToStringConverter:   4Shared.Converters.NeededEstateTypesToStringConverter & "NeededEstateTypesToStringConverter6   0Shared.Converters.NeededRegionsToStringConverter " NeededRegionsToStringConverter5   /Shared.Converters.StringToOneRowStringConverter ! StringToOneRowStringConverter6   0Shared.Converters.NeededRemontsToStringConverter " NeededRemontsToStringConverter7   1Shared.Converters.NeededProjectsToStringConverter # NeededProjectsToStringConverter<   6Shared.Converters.NeededBuildingTypesToStringConverter ( $NeededBuildingTypesToStringConverter+   %Shared.Converters.BoolInvertConverter  BoolInvertConverter9	   3Shared.Converters.EstateToRoomsCountStringConverter % !EstateToRoomsCountStringConverter1
   +Shared.Converters.BoolToVisibilityConverter 	 BoolToVisibilityConverterM   GShared.Converters.EstateToEstateFullAddressStringWithoutRegionConverter 9
 5EstateToEstateFullAddressStringWithoutRegionConverter��%?  &	        &	      &	 &     &	 9     &	 L     &	 _     &	 r     &	 �     &	 �     &		 �     &	
 �       5
   
   6-     5   
   68     5   
   64     5   
   63     5   
   64     5   
   65     5   
   6:     5   
   6)   	  5   
   67   
  5   
   6/     5   
   6K   5      .��5      � $��3q�6    � DataContext 6   ��  �� Path$ Demand� �� ElementName$ demandVw��	 � RowDefinitions	 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5       $
��Auto �6   �� 5!      $
��Auto �6   �� 5"      $
��Auto �6   �� 5#      $
��Auto �6   �� 5$      $
��Auto �6   �� 5%      �� 5&      $
��Auto �6   
 � ColumnDefinitions
 5(   
   �� 5)      $
��Auto �6   �� 5*      $��5 �6   �� 5+      .+�5.   
   �� $��Center=�6]   $��Right=�6x   ��6   ��   CultureResources �� Source# [ $ [Client]�6x   �� 5/   
   $
��Bold"�65   $��Center=�6G   $
��Left=�6b   $��2��6}   $
��Wrap=�6�   ��6   �� $ 
SellerName�6�   �� 51   
   $��1��6   $��Center=�6j   $��Right=�6�   ��6!   �� # [ $ 	[OrdType]�6�   �� 52   
   $��1��6   $
��Bold"�6y   $��Center=�6�   $
��Left=�6�   $��2��6�   $
��Wrap=�6�   ��6!   �� $ IsNeedForRent� �� 	Converter# [  6�   �� 54   
   $��2��6   $��Center=�6m   $��Right=�6�   ��6!   �� # [ $ [EstateType]�6�   �� 55   
   $��2��6   $
��Bold"�6�   $��Center=�6�   $
��Left=�6�   $��2��6�   $
��Wrap=�6�   ��6!   �� $ NeededEstateTypes�# [ 6�   �� 57   
   $��3��6   $��Center=�6g   $��Right=�6�   ��6!   �� # [ $ [Room]�6�   �� 58   
   $��3��6   $
��Bold"�6J   $��Center=�6\   $
��Left=�6w   $��2��6�   $
��Wrap=�6�   ��6!   �� $ RoomsCountInterval�6�   �� 5:   
   $��4��6   $��Center=�6i   $��Right=�6�   ��6!   �� # [ $ [Square]�6�   �� 5;   
   $��4��6   $
��Bold"�6F   $��Center=�6X   $
��Left=�6s   $��2��6�   $
��Wrap=�6�   ��6!   �� $ SquareInterval�6�   �� 5=   
   $��5��6   $��Center=�6h   $��Right=�6�   ��6!   �� # [ $ [Floor]�6�   �� 5>   
   $��5��6   $
��Bold"�6E   $��Center=�6W   $
��Left=�6r   $��2��6�   $
��Wrap=�6�   ��6!   �� $ FloorInterval�6�   �� 5@   
   $��6��6   $��Center=�6h   $��Right=�6�   ��6!   �� # [ $ [Price]�6�   �� 5A   
   $��6��6   $
��Bold"�6!   $��Center=�63   $
��Left=�6N   $��2��6i   $
��Wrap=�6y   ��5B      `� 5C       �� StringFormat$ {0} {1}��6   .1�5D      �� $ PriceInterval�6   �� 5E      $ Currency.Name�6   5F      5H      �� 5K   
   $��7��6   $��Center=�6p   $��Right=�6�   ��6!   �� # [ $ [StateOrRegion]�6�   �� 5L   
   $��7��6   $
��Bold"�6�   $��Center=�6�   $
��Left=�6�   $��2��6�   $
��Wrap=�6�   ��6!   �� $ NeededRegions�# [ 6�   �� 5N   
   $��8��6   $��Center=�6l   $��Right=�6�   ��6!   �� # [ $ [AdditData]�6�   �� 5O   
   $��8��6   $
��Bold"�6�   $��Center=�6�   $
��Left=�6�   $��2��6�   $
��Wrap=�6�   ��6!   �� $ AdditionalDetails� ^� ToolTip 6I   �� $ AdditionalDetails�6�   �� 5Q   
   $��9��6   $��Center=�6o   $��Right=�6�   ��6!   �� # [ $ [TheRoomState]�6�   �� 5R   
   $��9��6   $
��Bold"�6�   $��Center=�6�   $
��Left=�6�   $��2��6�   $
��Wrap=�6�   ��6!   �� $ NeededRemonts�# [ 6�   �� 5T   
   $��10��6   $��Center=�6s   $��Right=�6�   ��6"   �� # [ $ [BuildingProject]�6�   �� 5U   
   $��10��6   $
��Bold"�6�   $��Center=�6�   $
��Left=�6�   $��2��6�   $
��Wrap=�6�   ��6"   �� $ NeededProjects�# [ 6�   �� 5W   
   $��11��6   $��Center=�6p   $��Right=�6�   ��6"   �� # [ $ [BuildingType]�6�   �� 5X   
   $��11��6   $
��Bold"�6�   $��Center=�6�   $
��Left=�6�   $��2��6�   $
��Wrap=�6�   ��6"   �� $ NeededBuildingTypes�# [ 6�   9� 5Z   
   
�������$��3��6u   $��Stretch=�5\      $��12��65   ��5Z      �� # [ $ [Client]� 9� 
IsExpanded 5[      ��   UserControls.Session   Inst# Z $ IsClientShowingMode�# [  �� Mode$ OneWay=�.��5]      �� $
��Bold"�68   $	��Top=�6J   $	��5,2q�6b   ��6   �� $ 	BuyerInfo�6b   5^      � 5`   
   $��13��6   $��0��6   $��3��6-   	 5a      �� 5b      �� 5c      $��5 �6    �� 5d      .+�5g      �� $��Stretch=�6i   $��Stretch=�6�   ��6   �� # [ $ [OfferedEstates]�.��5h      )  #Microsoft.Windows.Controls.DataGrid  -   5          Name$ dgSuggestedEstates��5k   E      AutoGenerateColumns .     CanUserResizeColumns .    CanUserReorderColumns .    CanUserSortColumns . $   HorizontalScrollBarVisibility$ Visible=�5i      !   EnableColumnVirtualization .    EnableRowVirtualization .    
IsReadOnly . $��0,5,0,0q�5j   d   $��Stretch=�5k      $	��Top=�6-      CanUserResizeRows .   J� SnapsToDevicePixels .  ��5j      �� $ OfferedEstates�$ demandVw�� � ContextMenu 5m      �� 5n      .@�5o      m� -   5         m�Name$ mnuSuggest_Open��5o   '   ��6@   �� # [ $ [Open]�6�   m� 5p      -   5        $ mnuSuggest_Delete��5p   '   ��6B   �� # [ $ [Delete]�6�   m� 5q      -   5        $ mnuSuggest_AddComment��5q   '   ��6F   �� # [ $ [AddComment]�6�   m� 5r      -   5        $ mnuPrintSelected��5r   '   ��6A   �� # [ $ [PrintSelected]�6�   5t         Columns 5v      3  -Microsoft.Windows.Controls.DataGridTextColumn  5w      /  )Microsoft.Windows.Controls.DataGridColumn    Width8  2Microsoft.Windows.Controls.DataGridLengthConverter$
  Auto 6�   !   SortMemberPath$
! Code��6�   4  .Microsoft.Windows.Controls.DataGridBoundColumn"   Binding" 66   �� $ Estate.Code�$ OneWay=�#   Header# 6h   �� # [ $ [Code]�6�     5x      $
  Auto 6�   $! OrderType.Name��6�   " 66   �� $ Estate.OrderType.Name�$ OneWay=�# 6r   �� # [ $ [SellOrRent]�6�   7  1Microsoft.Windows.Controls.DataGridTemplateColumn  5y      $
  Auto 6�   # 6:   �� # [ $ [Room]�$   CellTemplate$ 5z      �� 5{   "   .R�5|   &   �� ��60   �� $ Estate�$ OneWay=�# [ 5}   #   5        5�      $
  Auto 6�   $! EstateTypeID��6�   " 66   �� $  Estate.EstateType.TypeName�$ OneWay=�# 6w   �� # [ $ [TheEstateType]�6�     5�      $
  Auto 6�   $! Street.StreetID��6�   " 66   �� $ Estate.Street.Name�$ OneWay=�# 6o   �� # [ $ [Street]�6�     5�      $
  Auto 6  %   CanUserSort% .  " 66   �� $ Estate�$ OneWay=�# [
 # 6�   �� # [ $ [AddressFull]�6    5�      $
  Auto 6�   " 66   �� $ Estate.TotalSquare�$ OneWay=�# 6o   �� # [ $ [Square]�6�     5�      &   MaxWidth$& 50Q�6�   $
  Auto 6�   " 66   �� $ Estate.Floor�$ OneWay=�# 6i   �� # [ $ [Floor]�6�     5�      $
  Auto 6:   % .  # 6[   �� # [ $ [Price]�$ 5�      �� 5�   "   .R�5�   &   �� ��60   �� $ Estate.Price�$ OneWay=�5�   #   5�        5�      $
  Auto 6�   $! Currency.CurrencyID��6�   " 66   �� $ Estate.Currency.Name�$ OneWay=�# 6q   �� # [ $ 
[Currency]�6�     5�      $
  Auto 6�   " 66   �� $ Estate.SellerInfo�$ OneWay=�# 6n   �� # [ $ [Seller]�'   
Visibility' 5�      �� # Z $ IsClientShowingMode�# [	 5�        5�      $
  Auto 6�   " 66   �� $ ShowDate�$ OneWay=�$ {0:dd.MM.yyyy}��# 6�   �� # [ $ [Date]�6�     5�      $
  Auto 6�   # 6:   �� # [ $ [AdditionalDetails]�$ 5�      �� 5�   "   .R�5�   &   �� ��60   �� $" Estate.AdditionalInformation�$ OneWay=�# [  6�   �� $ AdditionalInformation�5�   #   5�        5�      $
  Auto 6�   " 66   �� $ Estate.Status�$ OneWay=�# 6j   �� # [ $ [Status]�6�     5�      $
  Auto 6�   " 66   �� $ User.FullName�$ OneWay=�# 6j   �� # [ $ [Broker]�6�     5�       66   �� $ Comment�$ OneWay=�" 6s   �� $ Comment�$ OneWay=�# [ # 6�   �� # [ $ 	[Comment]�5�      5�      �� 5�      $	��3px��6   $��Stretch=�6(   $��1��6F   �� 5�      $��2��6h   $��Stretch=�6u   $��Stretch=�6�   ��6   �� # [ $ [ShowedEstates]�.��5�        -   5        $ 	dgEstates��5�   E    .   .  .  . $ Visible=�5�       .  .  . $��0,5,0,0q�5�   c   $��Stretch=�5�      $	��Top=�6-    .   .  ��5�      �� $ ShowedEstates�$ demandVw�� 5�      �� 5�      .@�5�      m� -   5        $ mnuShowed_Open��5�   '   ��6?   �� # [ $ [Open]�6�   m� 5�      -	   5        $ mnuShowed_Delete��5�   '   ��6A   �� # [ $ [Delete]�6�   m� 5�      -
   5        $ mnuShowed_AddComment��5�   '   ��6E   �� # [ $ [AddComment]�6�   m� 5�      -   5        ��5�   '   �� # [ $ [PrintSelected]�6x   5�       5�        5�      $
  Auto 6�   $
! Code��6�   " 66   �� $ Estate.Code�$ OneWay=�# 6h   �� # [ $ [Code]�6�     5�      $
  Auto 6�   $! OrderType.Name��6�   " 66   �� $ Estate.OrderType.Name�$ OneWay=�# 6r   �� # [ $ [SellOrRent]�6�     5�      $
  Auto 6�   # 6:   �� # [ $ [Room]�$ 5�      �� 5�   "   .R�5�   &   �� ��60   �� $ Estate�$ OneWay=�# [ 5�   #   5�        5�      $
  Auto 6�   $! EstateTypeID��6�   " 66   �� $  Estate.EstateType.TypeName�$ OneWay=�# 6w   �� # [ $ [TheEstateType]�6�     5�      $
  Auto 6�   $! Street.StreetID��6�   " 66   �� $ Estate.Street.Name�$ OneWay=�# 6o   �� # [ $ [Street]�6�     5�      $
  Auto 6  % .  " 66   �� $ Estate�$ OneWay=�# [
 # 6�   �� # [ $ [AddressFull]�6    5�      $
  Auto 6�   " 66   �� $ Estate.TotalSquare�$ OneWay=�# 6o   �� # [ $ [Square]�6�     5�      $& 50Q�6�   $
  Auto 6�   " 66   �� $ Estate.Floor�$ OneWay=�# 6i   �� # [ $ [Floor]�6�     5�      $
  Auto 6:   % .  # 6[   �� # [ $ [Price]�$ 5�      �� 5�   "   .R�5�   &   �� ��60   �� $ Estate.Price�$ OneWay=�5�   #   5�        5�      $
  Auto 6�   $! Currency.CurrencyID��6�   " 66   �� $ Estate.Currency.Name�$ OneWay=�# 6q   �� # [ $ 
[Currency]�6�     5�      $
  Auto 6�   " 66   �� $ Estate.SellerInfo�$ OneWay=�# 6n   �� # [ $ [Seller]�' 5�      �� # Z $ IsClientShowingMode�# [	 5�        5�      $
  Auto 6�   " 66   �� $ ShowDate�$ OneWay=�$ {0:dd.MM.yyyy}��# 6�   �� # [ $ [Date]�6�     5�      $
  Auto 6�   # 6:   �� # [ $ [AdditionalDetails]�$ 5�      �� 5�   "   .R�5�   &   �� ��60   �� $" Estate.AdditionalInformation�$ OneWay=�# [  6�   �� $ AdditionalInformation�5�   #   5�        5�      $
  Auto 6�   " 66   �� $ Estate.Status�$ OneWay=�# 6j   �� # [ $ [Status]�6�     5�      $
  Auto 6�   " 66   �� $ User.FullName�$ OneWay=�# 6j   �� # [ $ [Broker]�6�     5�       66   �� $ Comment�$ OneWay=�" 6s   �� $ Comment�$ OneWay=�# [ # 6�   �� # [ $ 	[Comment]�5�      5�      5�      �� 5�   
   ( �� Orientation$( 
Horizontal=�6   $��14��6.   $��Bottom=�6<   $��Right=�6W   $��3��6s   .+�5�      �� -   5        ) ��Name$) btnOk��5�      $	��100��6�   $��25��6�   $��Right=�6�   $��0,5,10,5q�6�   ��6$   �� # [ $ [Close]�6�   5�      5�      5�      