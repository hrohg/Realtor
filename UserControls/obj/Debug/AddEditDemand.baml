   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5      I ECustomControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]?clr-namespace:CustomControls.ValidPanel;assembly=CustomControlsCustomControls.ValidPanel 5      G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:UserControlsUserControls 5          UserControls.AddEditDemand   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5      V
ValidPanel?clr-namespace:CustomControls.ValidPanel;assembly=CustomControls     5      3UserControlsclr-namespace:UserControls     5      -   5          >�Name$  addEditDemand��5   >   
���   � � 	Resources 5      2   ,Shared.Converters.StringEmptyToNullConverter   StringEmptyToNullConverter1   +Shared.Converters.BoolToVisibilityConverter  BoolToVisibilityConverter9   3Shared.Converters.EstateToActionButtonTextConverter % !EstateToActionButtonTextConverterO   IShared.Converters.NeededBuildingTypesToVisibleWhenOfficeSelectedConverter ; 7NeededBuildingTypesToVisibleWhenOfficeSelectedConverter+   %Shared.Converters.NullToBoolConverter  NullToBoolConverter��%�   &	        &	      &	 &     &	 9     &	 L       5	      6*     5
      6)     5      61     5      6G     5      6#   5      .��5      �� $��Stretch=�6   $��Stretch=�6.   $
��Auto=�6J   $
��Auto=�6o   .��5      *  $CustomControls.ValidPanel.ValidPanel  -   5          Name$ 
validPanel��5      .+�5      � -   5        $��3q�5   
    � DataContext 6   ��  �� Path$ Demand� �� ElementName$ addEditDemand�� � RowDefinitions 5      �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��30 �6   .+�5      �� ��6   ��   CultureResources �� Source# [ $ 
[MainData]�.��5      �  � ColumnDefinitions 5      �� 5   	   $��2* �6   �� 5   	   $��10 �6   �� 5    	   $��8* �6    5"      �� 5#   	   $��25 �6   �� 5$   	   $��25 �6   �� 5%   	   $��25 �6   �� 5&   	   $��25 �6   �� 5'   	   $��25 �6   .+�5*      �� $��Right=�6k   $��Center=�6�   ��6$   �� # [ $ [CodeP]�6�   �� 5+      -   5        $��txtCode��5+   "   $��2��61   $	��330��6A   $
��Left=�6P   ��5,   *   �� $
 Code�	 �� UpdateSourceTrigger$	 PropertyChanged=�
 �� ValidatesOnDataErrors
 .  �� Mode$ TwoWay=��� 5.      $��Right=�6p   $��1��6�   ��6$   �� # [ $ [RoomCountP]�6�   �� 5/       �� Orientation$ 
Horizontal=�6%   $
��Left=�6>   $��2��6Y   $��1��6i   .+�50   	   �� -   5        $��txtRoomCountFrom��51      $	��150��6#   $��Stretch=�62   $��Center=�6P   ��50      �� $ RoomCountFrom�$ TwoWay=�$	 PropertyChanged=� �� 	Converter# [  51   P   �� 52   	   $��3,0,3,0q�6X   ��6   �� # [ $ [toP]�6X   �� 53   	   -   5        $��txtRoomCountTo��54      $	��150��6!   $��Stretch=�60   $��Center=�6N   ��53      �� $ RoomCountTo�$ TwoWay=�$	 PropertyChanged=�# [  54   N   55   	   �� 57      $��Right=�6Z   $��2��6v   ��6   �� # [ $ [FloorP]�6v   �� 58      $ 
Horizontal=�6   $
��Left=�6,   $��2��6G   $��2��6T   .+�59   	   �� -   5        $��txtFloorFrom��5:      $	��150��6   $��Stretch=�6.   $��Center=�6L   ��59      �� $ 	FloorFrom�$ TwoWay=�# [  5:   L   �� 5;   	   $��3,0,3,0q�6X   ��6   �� # [ $ [toP]�6X   �� 5<   	   -   5        $��
txtFloorTo��5=      $	��150��6   $��Stretch=�6,   $��Center=�6J   ��5<      �� $ FloorTo�$ TwoWay=�$	 PropertyChanged=�# [  5=   J   5>   	   �� 5?      $��Right=�6Z   $��3��6v   ��6   �� # [ $ [PriceP]�6v   �� 5@      $ 
Horizontal=�6   $
��Left=�6,   $��3��6G   $��2��6T   .+�5B   	   �� -	   5        $��txtPriceFrom��5C      $	��150��6   $��Stretch=�6.   $��Center=�6L   ��5B      �� $ 	PriceFrom�$ TwoWay=�$	 PropertyChanged=�# [  5C   L   �� 5D   	   $��3,0,3,0q�6X   ��6   �� # [ $ [toP]�6X   �� 5E   	   -
   5        $��
txtPriceTo��5F      $	��150��6   $��Stretch=�6,   $��Center=�6J   ��5E      �� $ PriceTo�$ TwoWay=�$	 PropertyChanged=�# [  5F   J   �� 5G   	   -   5        $��cbCurrencies��5G      $��30��6&    �� 
IsEditable .   �� DisplayMemberPath$
 Name��5H   
   $
��Left=�5I   
   $��5,0,0,0q�6%    �� SelectedValuePath$ 
CurrencyID��5J   '   ��5H   #   �� $ 
Currencies�$ addEditDemand�� �� SelectedValue 5I   6   �� *
CurrencyID+$ TwoWay=�$	 PropertyChanged=�
 .  �� SelectedItem 5J   F   �� $ Currency�$	 PropertyChanged=�$ TwoWay=�5K   	   �� 5L      $��Right=�6[   $��4��6w   ��6   �� # [ $ 	[SquareP]�6w   �� 5M      $ 
Horizontal=�6   $
��Left=�6,   $��4��6G   $��2��6T   .+�5N   	   �� -   5        $��txtSquareFrom��5O   &   $	��150��6;   $��Stretch=�6J   $��Center=�6h   ��5N      �� $ 
SquareFrom�$ TwoWay=�$	 PropertyChanged=�# [  5O   h   �� 5P   	   $��3,0,3,0q�6X   ��6   �� # [ $ [toP]�6X   �� 5Q   	   -   5        $��txtSquareTo��5R   &   $	��150��69   $��Stretch=�6H   $��Center=�6f   ��5Q      �� $ SquareTo�$ TwoWay=�$	 PropertyChanged=�# [  5R   f   5S   	   5T      5U      �� 5W      $��3q�6b   $��1��6m   ��6   �� # [ $ [ContactDetails]�.��5X      �  5Y      �� 5Z   	   $��25 �6   �� 5[   	   $��25 �6   �� 5\   	   $��25 �6   �� 5]   	   $��25 �6   �� 5^   	    5`      �� 5a   	   $	��35* �6   �� 5b   	   $��5 �6   �� 5c   	   $	��65* �6   .+�5f      �� $��Right=�6Y   ��6   �� # [ $ [NameP]�6Y   �� 5g      -   5        $��txtSellerName��5g      $��2��6F   ��6%   �� $ 
SellerName�6F   �� 5i      $��1��6_   $��Right=�6l   ��6   �� # [ $ [Telephone1P]�6l   �� 5j      -   5        $��txtTelephone1��5j      $��2��6S   $��1��6c   ��6%   �� $ 
Telephone1�$ TwoWay=�6c   �� 5l      $��2��6_   $��Right=�6l   ��6   �� # [ $ [Telephone2P]�6l   �� 5m      -   5        $��txtTelephone2��5m      $��2��6x   $��2��6�   ��6%   �� $ 
Telephone2�$	 PropertyChanged=�$ TwoWay=�6�   �� 5o      $��3��6l   $��Right=�6y   ��6$   �� # [ $ [EmailP]�6y   �� 5p      -   5        $��txtEmail��5p      $��2��6n   $��3��6~   ��6    �� $ Email�$	 PropertyChanged=�$ TwoWay=�6~   �� 5r      $��4��6c   $��Right=�6p   ��6   �� # [ $ [AdditionalDataP]�6p   �� 5s      -   5        $��txtAdditionalDetails��5s      $��2��6T   $��4��6d    �� AcceptsReturn .  �� 
AcceptsTab . $ �� HorizontalScrollBarVisibility$ Disabled=�5t   &   $��Stretch=�6O   $	��Top=�6m   $	��200��6�   ��5s   ,   �� $ AdditionalDetails�5t   �   5u      5v      � 5x      $��2��6   $��Stretch=�6    5y      �� 5z      �� 5{      �� 5|      .+�5~      �� $��0��6`   $��3q�6p   ��6   �� # [ $ [TheOrderType]�.��5      �� $ Vertical=�6   .+�5�      	� -   5         	�Name$ rbSell��5�   *    	� 	GroupName$ sellRent��6�    d� 	IsChecked$
 TrueY�6�   ��6:   �� # [ $ [Buy]�6�   	� 5�      -   5        $ rbRent��5�   *   $ sellRent��6�   ��6:   �� # [ $ [Rent]�6�   5�   	   5�      �� 5�      $��1��6a   $��3q�6q   ��6   �� # [ $ [TheEstateType]�.��5�      �� -   5        $��lstRealEstateTypes��5�      $��Stretch=�6+   $
��Left=�6I   $��2q�5�   g   ��6#   �� $ EstateTypes�$ addEditDemand����5�   	   �� 5�   
   .R�5�      �� $��chkEstateType��6`   -   5        $��2q�5�   p   ��5�      �� $ TypeName���5�   S   �� 6p   5�      5�   	   5�      �� 5�      $��2��6[   $��3q�6k   ��6   �� # [ $ 	[Regions]�.��5�      �� -   5        $��
lstRegions��5�      $��Stretch=�6#   $
��Left=�6A   $��2q�5�   _   ��6   �� $ Regions�$ addEditDemand����5�   	   �� 5�   
   .R�5�      �� $��	chkRegion��6S   -   5        $��2q�5�   g   ��5�      �� $
 Name���5�   J   �� 6g   5�      5�   	   5�      5�      � 5�      $��3��6   $��Stretch=�6    5�      �� 5�      �� 5�      �� 5�      .+�5�      �� $��3q�6`   ��6   �� # [ $ [TheRoomState]�.��5�      �� -   5        $��
lstRemonts��5�      $��Stretch=�6#   $
��Left=�6A   $��2q�5�   T   ��6   �� $ Remonts�$ addEditDemand����5�   	   �� 5�   
   .R�5�      ��  ��Name$ 	chkRemont��6T   -   5        $��2q�5�   X   ��5�      �� $
 Name���5�   ;   �� 6X   5�      5�   	   5�      �� 5�      $��1��6c   $��Stretch=�6s   $��3q�6�   ��6   �� # [ $ [BuildingProject]�.��5�      �� -   5        $��lstProjects��5�      $��Stretch=�6$   $
��Left=�6B   $��2q�5�   U   ��6   �� $ Projects�$ addEditDemand����5�   	   �� 5�   
   .R�5�      �� $ 
chkProject��6U   -   5        $��2q�5�   Y   ��5�      �� $
 Name���5�   <   �� 6Y   5�      5�   	   5�      �� 5�      $��2��6`   $��Stretch=�6p   $��3q�6�   ��6   �� # [ $ [BuildingType]�.��5�      �� -   5        $��lstBuildingTypes��5�      $��Stretch=�6)   $
��Left=�6G   $��2q�5�   Z   ��6   �� $ BuildingTypes�$ addEditDemand����5�   	   �� 5�   
   .R�5�      �� $ chkBuildingType��6Z   -   5        $��2q�5�   ^   ��5�      �� $
 Name���5�   A   �� 6^   5�      5�   	   5�      5�      � 5�      $��4��6   $��Right=�6   $��3q�65   y�5�      ��   UserControls.Session   Inst# Z $ User.IsAdminOrDirector�# [  5�      �� 5�      $	��35* �6   �� 5�      $��5 �6   �� 5�      $	��65* �6    5�      �� 5�      $��30 �6   .+�5�      �� $��Right=�6Z   $��Center=�6v   ��6   �� # [ $ 	[BrokerP]�6v   �� 5�      -   5         ��Name$ 	cbBrokers��5�   #    .  $��2��5�   d   $
��Left=�6t   $ ID��5�   
   $ FullName��6!   ��5�   6   �� $ Brokers�$ addEditDemand�� 5�      �� $
 User�$ TwoWay=�$	 PropertyChanged=� 5�   
   �� $ BrokerID�$ TwoWay=�$	 PropertyChanged=�5�   !   5�      �� 5�      $��5��6   $��3q�6   .��5�      �  5�      �� 5�   	   �� 5�   	   .+�5�      �� $ Vertical=�6   .+�5�   	   ��  6   �� $ IsHasGarage�$ TwoWay=�# [ ��6v   �� # [ $ [Garage]��� 5�   	    6   �� $ IsInNewBuilding�$ TwoWay=�# [ ��6z   �� # [ $ [NewBuilding]��� 5�   	    6   �� $ IsExchangePossible�$ TwoWay=�# [ ��6}   �� # [ $ [ExchangePosible]��� 5�   	    6   �� $ IsHasGas�$ TwoWay=�# [ ��6s   �� # [ $ [Gas]��� 5�   	    6   �� $ IsInNullableFloor�$ TwoWay=�# [ ��6|   �� # [ $ [NullableFloor]�5�   	   �� 5�      $ Vertical=�6   $��1��6*   .+�5�   	   ��  6   �� $ IsEmpty�$ TwoWay=�# [ ��6r   �� # [ $ [Empty]��� 5�   	    6   �� $ IsHasPodval�$ TwoWay=�# [ ��6v   �� # [ $ [Podval]��� 5�   	    6   �� $ IsInFirstLine�$ TwoWay=�# [ ��6x   �� # [ $ [FirstLine]��� 5�   	    6   �� $  IsHasThreePhaseElectricity�$ TwoWay=�# [ ��6�   �� # [ $ [ThreePhaseElectricity]�5�   	   5�      5�      �� 5�      $ 
Horizontal=�6   $��6��6*   $��Right=�67   $��0,0,10,0q�6S   $��Bottom=�6e   .+�5�      �� -    5         ��Name$ btnOK��5�      ��6   �� $ ID�# [ {�5�      �� $ 
validPanel��$ IsValid��� 5�      -!   5        $ btnClear��5�      $��10,0,0,0q�6�   ��6    �� # [ $ [Clear]�6�   5�      5�      5�      5�      5�      