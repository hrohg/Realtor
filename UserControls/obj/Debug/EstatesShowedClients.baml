   M S B A M L   `   `   `  ����U  QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls  5      G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:UserControlsUserControls 5      A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 65   I ECustomControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]?clr-namespace:CustomControls.ValidPanel;assembly=CustomControlsCustomControls.ValidPanel 5      '   !UserControls.EstatesShowedClients   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation       5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     5      3UserControlsclr-namespace:UserControls     5      F
Converters/clr-namespace:Shared.Converters;assembly=Shared     65   YCusomControls?clr-namespace:CustomControls.ValidPanel;assembly=CustomControls     5      -   5          >�Name$  clientShowForm��5	       � 	Resources 5
      /  )Shared.Converters.IsRentToStringConverter   IsRentToStringConverter:  4Shared.Converters.NeededEstateTypesToStringConverter & "NeededEstateTypesToStringConverter5  /Shared.Converters.StringToOneRowStringConverter ! StringToOneRowStringConverter9  3Shared.Converters.EstateToRoomsCountStringConverter % !EstateToRoomsCountStringConverter1  +Shared.Converters.BoolToVisibilityConverter  BoolToVisibilityConverterM  GShared.Converters.EstateToEstateFullAddressStringWithoutRegionConverter 9 5EstateToEstateFullAddressStringWithoutRegionConverter2  ,Shared.Converters.StringEmptyToNullConverter  StringEmptyToNullConverter��%�   &	        &	      &	 &     &	 9     &	 L     &	 _     &	 r       5      6'     5      62     5      6-     5      61     5      6)     5      6E     5      6*   5      .��5      � $��5q�6    � RowDefinitions 5      �� 5      $��30 �6   �� 5      �� 5      $��10 �6   �� 5      .+�5   
   �  � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      .+�5!      �� ��6   ��   CultureResources �� Source# [  �� Path$ [OffersAndShows]�5"      �� 5$      
���   �$��1��6k   ��6   �� # [ $ 	[Demands]�.��5%      �  5&      �� 5'      $��30 �6   �� 5(      .+�5+      )   #Microsoft.Windows.Controls.DataGrid  -   5          Name$ dgNeededEstates��5-   L      AutoGenerateColumns .     CanUserResizeColumns . 	   CanUserReorderColumns	 . 
   CanUserSortColumns
 .    
IsReadOnly .    SelectionMode$ Extended=�5,   j   $��1��6�   $��Stretch=�5-      $	��Top=�64   ��5,      �� $ Demands� �� ElementName$ clientShowForm�� � ContextMenu 5.      �� 5/      .@�50      m� -   5        ��50   '   �� # [ $ [Open]�6o   51         Columns 53      7	   1Microsoft.Windows.Controls.DataGridTemplateColumn	  54      /
   )Microsoft.Windows.Controls.DataGridColumn 
  Width8   2Microsoft.Windows.Controls.DataGridLengthConverter$
 Auto 6(    	  CellTemplate 55   	   �� 56   
   .R�57      �� -   5        $��20��57   4   $��20��6?   
 � Tag 6   �� $ NeededEstate�.��58      �� $=��7pack://application:,,,/Shared;component/Images/down.png��6   $��-1q�6S   59      5:      5<   	   3   -Microsoft.Windows.Controls.DataGridTextColumn  5=      $
 Auto 6�   4   .Microsoft.Windows.Controls.DataGridBoundColumn   Binding 6$   �� $  NeededEstate.IsNeedForRent� �� Mode$ OneWay=� �� 	Converter# [   
  Header 6�   �� # [ $ 	[OrdType]�6�     5>      $
 Auto 6�    6$   �� $$ NeededEstate.NeededEstateTypes�$ OneWay=�# [  6�   �� # [ $ [EstateType]�6�     5?      $
 Auto 6�    6$   �� $% NeededEstate.RoomsCountInterval�$ OneWay=� 6j   �� # [ $ [Room]�6�     5@      $
 Auto 6�    6$   �� $! NeededEstate.SquareInterval�$ OneWay=� 6f   �� # [ $ [Square]�6�     5A      $
 Auto 6�    6$   �� $  NeededEstate.PriceInterval�$ OneWay=� 6e   �� # [ $ [Price]�6�     5B      $
 Auto 6�    6$   �� $  NeededEstate.Currency.Name�$ OneWay=� 6e   �� # [ $ 
[Currency]�6�     5C      $
 Auto 6�    6$   �� $ NeededEstate.BuyerInfo�$ OneWay=� 6a   �� # [ $ [Client]�6�     5D      $
 Auto 6�    6$   �� $ ShowDate�$ OneWay=� �� StringFormat$ {0:dd.MM.yyyy}�� 6r   �� # [ $ [Date]�6�   	  5E      $
 Auto 6u    6(   �� # [ $ [AdditData]� 5F   	   �� 5G   
   .R�5H      �� ��6   �� $$ NeededEstate.AdditionalDetails�$ OneWay=�# [  ^� ToolTip 6�   �� $ AdditionalDetails�5I      5K   	     5L      $
 Auto 6�    6$   �� $ User.FullName�$ OneWay=� 6X   �� # [ $ [Broker]�6�   	  5M      $
 Auto 6(    5N   	   �� 5O   
   .R�5P      ��  ��Name$ btnDeleteDemand��6   -   5         5P   +   �� y�5Q      ��  �� RelativeSource �� *FindAncestor+ �� AncestorType'  !UserControls.EstatesShowedClients"  $ DemandDeleteVisibility�.��5R      �� $D��>pack://application:,,,/Shared;component/Images/CancelRound.png��6   $��20��6Z   $��20��6e   5S      5T      5V   	   5X      � 5Z      $��0��6   $��2��6   $	��Top=�6*    5[      �� 5\      �� 5]      $
��Auto �6   .+�5_      9� -   5         9�Name$ expDemandSearch��5`   
    K� ZIndex$ 99��5_   Z   $	��700��6l   $
��Left=�6{   ��6   �� # [ $ [Search]�.��5a      �� 
�������
����ح� �� CornerRadius$ 5��6>   $��3q�6O    J� Effect 5b   	   3  -System.Windows.Media.Effects.DropShadowEffect  5c   
   ._�5e   	   �   � DataContext  6   �� $ DemandSearchCriteria�$ clientShowForm�� 5f   
   �� 5g      $��40 �6   .+�5i   
   �� ! �� Orientation$! 
Horizontal=�6   .+�5j      �� $��0,0,5,0q�6\   $��Center=�6m   ��6   �� # [ $ [NameP]�6m   �� 5k      -   5        " ��Name$" txtName��5k      $	��250��6   ��60   �� $
 Name�$ TwoWay=�# �� UpdateSourceTrigger$# PropertyChanged=�6}   �� 5m      $��7,0,5,0q�6a   $��Center=�6r   ��6   �� # [ $ [TelephoneP]�6r   �� 5n      -   5        $" txtPhone��5n      $	��200��6   ��61   �� $ Phone�$ TwoWay=�$# PropertyChanged=�6   �� 5p      -	   5        $ btnSearchDemands��5p      $��30��6K   $��30��6W   $
��10,3q�6b   $��Right=�5q      ��6(   Z� $ � ToolTip$ 69   �� # [ $ [Search]�.��5r      �� $?��9pack://application:,,,/Shared;component/Images/Search.png��6   5s      �� 5u      -
   5        $ btnClear��5u      $��30��6H   $��30��6T   $
��10,3q�6_   $��Right=�5v      ��6'   Z� $ 68   �� # [ $ [Clear]�.��5w      �� $D��>pack://application:,,,/Shared;component/Images/ClearSearch.png��6   5x      5y      5z   
   5{   	   5|      �� 5~      -   5        $ btnShowDemands��5~      $��1��6�   $	��3,0q�6�   ��6&   �� # [ $ 	[Demands]�6�   5      5�      5�      �� 5�   
   $	��3px��6   $��Stretch=�6$   $��2��6B   �� 5�      $��3��6X   
���   ���6   �� # [ $ 	[Estates]�.��5�      �  5�      �� 5�      $��30 �6   �� 5�      .+�5�        -   5        $ 	dgEstates��5�   E    .   . 	 . 
 . $%   HorizontalScrollBarVisibility$% Visible=�5�      !&   EnableColumnVirtualization& . '   EnableRowVirtualization' . $��1��5�       . $��0,5,0,0q�6p   $��Stretch=�5�      $	��Top=�6-   (   CanUserResizeRows( .  ) J� SnapsToDevicePixels) .  ��5�      �� $ Estates�$ clientShowForm�� 5�      �� 5�      -   5        * ��Name$
* menu��5�      .@�5�   	   m� -   5        ��5�      �� # [ $ [Open]�6Z   5�   	    5�      	  5�      $
 Auto 6(    5�   	   �� 5�   
   .R�5�      �� -   5        $��20��5�   .   $��20��69    6   �� $ Estate�.��5�      �� $;��5pack://application:,,,/Shared;component/Images/up.png��6   $��-1q�6Q   5�      5�      5�   	     5�      $
 Auto 6�   + 
  SortMemberPath$
+ Code��6�    6$   �� $ Estate.Code�$ OneWay=� 6V   �� # [ $ [Code]�6�     5�      $
 Auto 6�   $+ OrderType.Name��6�    6$   �� $ Estate.OrderType.Name�$ OneWay=� 6`   �� # [ $ [SellOrRent]�6�   	  5�      $
 Auto 6p    6(   �� # [ $ [Room]� 5�   	   �� 5�   
   .R�5�      �� ��6   �� $ Estate�$ OneWay=�# [ 5�      5�   	     5�      $
 Auto 6�   $+ EstateTypeID��6�    6$   �� $  Estate.EstateType.TypeName�$ OneWay=� 6e   �� # [ $ [TheEstateType]�6�     5�      $
 Auto 6�   $+ Street.StreetID��6�    6$   �� $ Estate.Street.Name�$ OneWay=� 6]   �� # [ $ [Street]�6�     5�      $
 Auto 6�   , 
  CanUserSort, .   6$   �� $ Estate�$ OneWay=�# [  6�   �� # [ $ [AddressFull]�6�     5�      $
 Auto 6�    6$   �� $ Estate.TotalSquare�$ OneWay=� 6]   �� # [ $ [Square]�6�     5�      - 
  MaxWidth$- 50Q�6�   $
 Auto 6�    6$   �� $ Estate.Floor�$ OneWay=� 6W   �� # [ $ [Floor]�6�   	  5�      $
 Auto 6(   , .   6I   �� # [ $ [Price]� 5�   	   �� 5�   
   .R�5�      �� ��6   �� $ Estate.Price�$ OneWay=�5�      5�   	     5�      $
 Auto 6�   $+ Currency.CurrencyID��6�    6$   �� $ Estate.Currency.Name�$ OneWay=� 6_   �� # [ $ 
[Currency]�6�     5�      $
 Auto 6�    6$   �� $ Estate.SellerInfo�$ OneWay=� 6\   �� # [ $ [Seller]�. 
  
Visibility. 5�      ��   UserControls.Session/   Inst# Z/ $ IsClientShowingMode�# [ 5�   	     5�      $
 Auto 6�    6$   �� $ ShowDate�$ OneWay=�$ {0:dd.MM.yyyy}�� 6r   �� # [ $ [Date]�6�   	  5�      $
 Auto 6}    6(   �� # [ $ [AdditionalDetails]� 5�   	   �� 5�   
   .R�5�      �� ��6   �� $" Estate.AdditionalInformation�$ OneWay=�# [  6�   �� $ AdditionalInformation�5�      5�   	     5�      $
 Auto 6�    6$   �� $ Estate.Status�$ OneWay=� 6X   �� # [ $ [Status]�6�     5�      $
 Auto 6�    6$   �� $ User.FullName�$ OneWay=� 6X   �� # [ $ [Broker]�6�     5�      $
 Auto 6�    6$   �� $ Comment�$ OneWay=�# [  6�   �� # [ $ 	[Comment]�6�   	  5�      $
 Auto 6(    5�   	   �� 5�   
   .R�5�      �� $ btnDeleteDemand��6   -   5         5�   +   �� y�5�      ��  �� *FindAncestor+"  $ EstateDeleteVisibility�.��5�      �� $D��>pack://application:,,,/Shared;component/Images/CancelRound.png��6   $��20��6Z   $��20��6e   5�      5�      5�   	   5�      � 5�      $��2��6   $	��Top=�6    5�      �� 5�      �� 5�      $
��Auto �6   .+�5�      9� -   5        $ expEstatesSearch��5�   	   $	 100��5�   b   $	��600��5�   #   $
��Left=�62   $��3q�6M   $
��Auto��6X   ��5�      �� # [ $ [SearchCriteria]�.��5�      �� 
�������
�������$��1q�6>   $ 5��6R   $	��210��6c    5�   	     5�   
   ._�5�   	   *  $CustomControls.ValidPanel.ValidPanel  -   5        0  Name$0 vPanel��5�   "   $
��Auto��62   .+�5�   
   � $��5q�6]   $
��Auto��6h     6   �� $ EstateSearchCriteria�$ clientShowForm�� 5�      �� 5�      $��2* �6   �� 5�      $��10 �6   �� 5�      $��8* �6    5�      �� 5�      $��25 �6   �� 5�      $��25 �6   �� 5�      $��25 �6   �� 5�      $��25 �6   �� 5�      $��25 �6   �� 5�      $��25 �6   �� 5�      $��25 �6   �� 5�      $��25 �6   .+�5�      �� $��Right=�6\   ��6   �� # [ $ [CodeP]�6\   �� 5�      -   5        $��2��5�      ��5�      �� $
 Code�$# PropertyChanged=�$ TwoWay=�1 �� ValidatesOnDataErrors1 . # [ 5�      �� 5�      $��Right=�6a   $��1��6}   ��6   �� # [ $ [TelephoneP]�6}   �� 5�      -   5        $��2��5�      $��1��6   ��5�      �� $ 	Telephone�$# PropertyChanged=�$ TwoWay=�1 . # [ 5�   *   �� 5�      $��3��6a   $��Right=�6n   ��6   �� # [ $ [RoomCountP]�6n   �� 5�      $! 
Horizontal=�6   $
��Left=�6/   $��2��6J   $��3��6Z   .+�5�      �� -   5        $��txtRoomCountFrom��5�      $	��150��6,   $��Stretch=�6;   $��Center=�6Y   ��5�      �� $ RoomCountFrom�1 . $# PropertyChanged=�$ TwoWay=�# [ �� 5�      $��3,0,3,0q�6Z   ��6   �� # [ $
 [to]�6Z   �� 5�      -   5        $��txtRoomCountTo��5�      $	��150��6*   $��Stretch=�69   $��Center=�6W   ��5�      �� $ RoomCountTo�1 . $# PropertyChanged=�$ TwoWay=�# [ 5�      �� 5�      $��Right=�6]   $��4��6y   ��6   �� # [ $ [FloorP]�6y   �� 5      $! 
Horizontal=�6   $
��Left=�6/   $��4��6J   $��2��6W   .+�5     �� -   5        $��txtFloorFrom��5     $	��150��6!   $��Stretch=�60   $��Center=�6N   ��5     �� $ 	FloorFrom�$# PropertyChanged=�1 . $ TwoWay=�# [ 5  i   �� 5     $��3,0,3,0q�6Z   ��6   �� # [ $
 [to]�6Z   �� 5     -   5        $��
txtFloorTo��5     $	��150��6   $��Stretch=�6.   $��Center=�6L   ��5     �� $ FloorTo�1 . $# PropertyChanged=�$ TwoWay=�# [ 5  g   5     �� 5     $��Right=�6]   $��5��6y   ��6   �� # [ $ [PriceP]�6y   �� 5	     $! 
Horizontal=�6   $
��Left=�6/   $��5��6J   $��2��6W   .+�5     �� -   5        $��txtPriceFrom��5     $	��150��6!   $��Stretch=�60   $��Center=�6N   ��5     �� $ 	PriceFrom�1 . $# PropertyChanged=�$ TwoWay=�# [ 5  i   �� 5     $��3,0,3,0q�6Z   ��6   �� # [ $
 [to]�6Z   �� 5     -   5        $��
txtPriceTo��5     $	��150��6   $��Stretch=�6.   $��Center=�6L   ��5     �� $ PriceTo�1 . $# PropertyChanged=�$ TwoWay=�# [ 5  g   �� 5     -   5        $��cbCurrencies��5     $��30��6)   2 �� 
IsEditable2 .  3 �� DisplayMemberPath$
3 Name��5     $
��Left=�5     $��5,0,0,0q�6*   4 �� SelectedItem4 5  4   �� $ Currency�$ TwoWay=���5  (   �� $ 
Currencies�$ clientShowForm��5  ;   5     �� 5     $��Right=�6^   $��6��6z   $��Center=�6�   ��6   �� # [ $ 	[SquareP]�6�   �� 5     $! 
Horizontal=�6   $
��Left=�6/   $��6��6J   $��2��6W   $��Center=�6g   .+�5     �� -   5        $��txtSquareFrom��5     $	��150��6+   $��Stretch=�6:   $��Center=�6X   ��5     �� $ 
SquareFrom�1 . $# PropertyChanged=�$ TwoWay=�# [ 5  X   �� 5     $��3,0,3,0q�6Z   ��6   �� # [ $
 [to]�6Z   �� 5     -   5        $��txtSquareTo��5     $	��150��6*   $��Stretch=�69   $��Center=�6W   ��5     �� $ SquareTo�1 . $# PropertyChanged=�$ TwoWay=�# [ 5  W   5     �� 5     $! 
Horizontal=�6   $��Right=�6/   $��0,0,10,0q�6K   $��7��6]   $��2��6j   .+�5      �� -   5        $��	btnSearch��5      $	��5,0q�6�   ��6$   �� # [ $ [Search]�{�5!     �� $ vPanel��$ IsValid��� 5"     -   5        $��btnClearEstateSearch��5"     ��6/   �� # [ $ [Clear]�6y   5#     5%     5&  
   5'  	   5(     �� 5*     -    5        $ btnShowEstates��5*     $��1��6�   $	��3,0q�6�   ��6&   �� # [ $ 	[Estates]�6�   5+     5,     5-     5.     5/     