   M S B A M L   `   `   `  ����U  QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls  5      A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 5      I ECustomControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]?clr-namespace:CustomControls.ValidPanel;assembly=CustomControlsCustomControls.ValidPanel 5      G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:UserControlsUserControls 6X      UserControls.Demands   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation       5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     5      F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5      YCusomControls?clr-namespace:CustomControls.ValidPanel;assembly=CustomControls     5      3UserControlsclr-namespace:UserControls     6X   -   5          >�Name$  demands��5   �   
���   � � 	Resources 5      :  4Shared.Converters.NeededEstateTypesToStringConverter &  "NeededEstateTypesToStringConverter6  0Shared.Converters.NeededRegionsToStringConverter " NeededRegionsToStringConverter5  /Shared.Converters.UserToTranslatedUserConverter ! UserToTranslatedUserConverter/  )Shared.Converters.IsRentToStringConverter  IsRentToStringConverter2  ,Shared.Converters.StringEmptyToNullConverter  NullToStringEmptyConverter5  /Shared.Converters.StringToOneRowStringConverter ! StringToOneRowStringConverter1  +Shared.Converters.BoolToVisibilityConverter  BoolToVisibilityConverter6  0Shared.Converters.NeededRemontsToStringConverter " NeededRemontsToStringConverter7	  1Shared.Converters.NeededProjectsToStringConverter # NeededProjectsToStringConverter<
  6Shared.Converters.NeededBuildingTypesToStringConverter (	 $NeededBuildingTypesToStringConverterD  >Shared.Converters.IsAdminOrDirectorToObjectVisibilityConverter 0
 ,IsAdminOrDirectorToObjectVisibilityConverter��%?  &	        &	      &	 &     &	 9     &	 L     &	 _     &	 r     &	 �     &	 �     &		 �     &	
 �       5      62     5	      6.     5
      6-     5      6'     5      6*     5      6-     5      6)     5      6.   	  5      6/   
  5      64     5   
   6B   5      .��5      � $��3q�6    � RowDefinitions 5      �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      .+�5      �� $
��Auto=�6   $
��Auto=�66   .��5      �� $��2q�6`   ��6   ��   CultureResources �� Source# [  �� Path$ [SearchCriteria]�.��5      �  � DataContext 6   �� $ SearchParameters� �� ElementName$ demands�� 5      �� 5      $��30 �6   .+�5       ��  �� Orientation$ 
Horizontal=�6   .+�5"      �� $��Center=�6k   ��6$   �� # [ $ [CodeP]�6k   �� 5#      -   5        $��txtCode��5#   .   $	��150��6"   ��6=   �� $
 Code� �� UpdateSourceTrigger$ PropertyChanged=�	 �� ValidatesOnDataErrors	 . 
 �� Mode$
 TwoWay=�6�   �� 5%      $��5,0,5,0q�6k   $��Center=�6|   ��6$   �� # [ $ [NameP]�6|   �� 5&      -   5         ��Name$ txtName��5&      $	��250��6   ��6-   �� $
 Name�$
 TwoWay=�$ PropertyChanged=�6z   �� 5(      $��7,0,5,0q�6^   $��Center=�6o   ��6   �� # [ $ [TelephoneP]�6o   �� 5)      -   5        $ txtPhone��5)      $	��200��6   ��6.   �� $ Phone�$
 TwoWay=�$ PropertyChanged=�6|   �� 5+      -   5         ��Name$ 	btnSearch��5+      $��30��6:   $��30��6F   $��	10,0,10,0q�6Q   $��Right=�5,      ��6+   Z�  � ToolTip 6<   �� # [ $ [Search]�.��5-   	   �� $?��9pack://application:,,,/Shared;component/Images/Search.png��6   5.   	   �� 50      -   5        $ btnClear��50      $��30��68   $��30��6D   $��	10,0,10,0q�6O   $��Right=�51      ��6+   Z�  6<   �� # [ $ [Clear]�.��52   	   �� $D��>pack://application:,,,/Shared;component/Images/ClearSearch.png��6   53   	   �� 55      -   5        $ btnPrint��55   !   $��30��6�   $��30��6�    6J   �� # [ $ [Print]�y�56      ��   UserControls.Session   Inst# Z $ User.IsAdminOrDirector� �� 	Converter# [ .��57   	   �� $>��8pack://application:,,,/Shared;component/Images/Print.png��6   58      59      5:      5;      5<      )   #Microsoft.Windows.Controls.DataGrid  5C      -   5          Name$ dgNeededEstates��5E   L      AutoGenerateColumns .     CanUserResizeColumns .    CanUserReorderColumns .    CanUserSortColumns .    
IsReadOnly .    SelectionMode$ Extended=�5D   i   $��2��6�   $��Stretch=�5E      $	��Top=�64   ��5D      �� $ NeededEstates�$ demands�� � ContextMenu 5F      �� 5G      -	   5         ��Name$ 
mnuDemands��5G        ContextMenuVisibility#y��  6&   .@�5H      m� -
   5        ��5H      �� # [ $ [Open]�6g   m� 5I      -   5         m�Name$ mnuEdit��5I      ��6!   �� # [ $ [Edit]�6i   m� 5J      -   5        $ 	mnuDelete��5J      ��6#   �� # [ $ [Delete]�6m   m� 5K      -   5        $ mnuShowResult��5K      ��6'   �� # [ $ [SelectEstates]�6x   m� 5L      -   5        $ mnuAddtoFavorites��5L      ��6:   �� # [ $ [AddToFavoriteClients]�y�5M      �� # Z $ OfflineMode�m� 5N      -   5        $ mnuSelectShowEstate��5N      ��6<   �� # [ $ [ShowEstate]�y�5O      `� 5P       `� 	Converter# [
 6+   .1�5Q   "   �� # Z 6*   $ User.IsAdminOrDirector�6X   �� 5R   "   # Z 6*   $ OfflineMode�6X   5S      5U      5V         Columns 5X      3   -Microsoft.Windows.Controls.DataGridTextColumn  5Y      /   )Microsoft.Windows.Controls.DataGridColumn   SortMemberPath$
 Code��6�      Width8   2Microsoft.Windows.Controls.DataGridLengthConverter$
 Auto 6�   4   .Microsoft.Windows.Controls.DataGridBoundColumn   Binding 6"   �� $
 Code�$
 OneWay=�   Header 6M   �� # [ $ [Code]�6�     5Z      $ User.FullName��6�   $
 Auto 6�    6"   �� $
 User�$
 OneWay=�# [  6�   �� # [ $ [Broker]�6�     5[      $
 Auto 6�    6"   �� $ IsNeedForRent�$
 OneWay=�# [  6�   �� # [ $ 	[OrdType]�6�     5\      $
 Auto 6�       CanUserSort  .   6"   �� $ NeededEstateTypes�$
 OneWay=�# [   6�   �� # [ $ [EstateType]�6�     5]      $
 Auto 6�    6"   �� $ RoomsCountInterval�$
 OneWay=� 6[   �� # [ $ [Room]�6�     5^      $
 Auto 6�    6"   �� $ SquareInterval�$
 OneWay=� 6W   �� # [ $ [Square]�6�     5_      $
 Auto 6�    6.   �� $ FloorInterval�$
 OneWay=� 6b   �� # [ $ [Floor]�6�     5`      $
 Auto 6�    6"   �� $ PriceInterval�$
 OneWay=� 6V   �� # [ $ [Price]�6�     5a      $
 Auto 6�    6"   �� $ Currency.Name�$
 OneWay=� 6V   �� # [ $ 
[Currency]�6�     5b      $
 Auto 6�     .   6"   �� $ NeededRegions�$
 OneWay=�# [  6�   �� # [ $ [StateOrRegion]�6�     5c      $
 Auto 6�    6"   �� $ 	BuyerInfo�$
 OneWay=� 6R   �� # [ $ [Client]�6�     5d      $
 Auto 6�    6"   �� $ AddDate�$
 OneWay=�! �� StringFormat$! {0:dd.MM.yyyy}�� 6o   �� # [ $ [Added]�6�     5e      $
 Auto 6�    6"   �� $ LastModifiedDate�$
 OneWay=�# [ $! {0:dd.MM.yyyy}�� 6�   �� # [ $ 	[Updated]�6�   7   1Microsoft.Windows.Controls.DataGridTemplateColumn  5f      $
 Auto 6s    6&   �� # [ $ [AdditData]�"   CellTemplate" 5g      �� 5h      .R�5i   	   �� ��6   �� $ AdditionalDetails�$
 OneWay=�# [ # ^� ToolTip# 6�   �� $ AdditionalDetails�5j   	   5l        5m      $
 Auto 6�     .   6"   �� $ NeededRemonts�$
 OneWay=�# [  6�   �� # [ $ [TheRoomState]�6�     5n      $
 Auto 6�     .   6"   �� $ NeededProjects�$
 OneWay=�# [  6�   �� # [ $ [BuildingProject]�6�     5o      $
 Auto 6�     .   6"   �� $ NeededBuildingTypes�$
 OneWay=�# [	  6�   �� # [ $ [BuildingType]�6�   5q      5s      5u      