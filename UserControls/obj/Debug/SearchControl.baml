   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5      I ECustomControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]?clr-namespace:CustomControls.ValidPanel;assembly=CustomControlsCustomControls.ValidPanel 6H    UserControls    UserControls.SearchControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5      V
ValidPanel?clr-namespace:CustomControls.ValidPanel;assembly=CustomControls     6H   -   5        $��searchControl��5   �   
���   �  � 	Resources  5      2   ,Shared.Converters.StringEmptyToNullConverter   StringEmptyToNullConverter0   *Shared.Converters.IntToVisibilityConverter  IntToVisibilityConverter4   .Shared.Converters.HasItemsToEnabilityConverter   HasItemsToEnabilityConverter7   1Shared.Converters.BoolToVisibilityInvertConverter # BoolToVisibilityInvertConverter1   +Shared.Converters.BoolToVisibilityConverter  BoolToVisibilityConverter��%�   &	        &	      &	 &     &	 9     &	 L       5      6*     5      6(     5      6,     5	      6/     5
      6)   5      .��5      *  $CustomControls.ValidPanel.ValidPanel  -   5          Name$ vPanel��5      .+�5      �� -   5         � DataContext 5      ��  �� Path$ SearchParameters� �� ElementName$ searchControl�� �� ScrollOwner 5      �� 5      -   5         ��Name$ scrollViewer��5   [   $
��Auto=�6   $
��Auto=�66   6[   .+�5      9� -   5        $��expRoomCount��5        9� 
IsExpanded . $��Stretch=�6�   $��2q�6�   ��64   ��   CultureResources �� Source# [ $ 
[MainData]�.��5      �� .��5      � 	 � ColumnDefinitions	 5      �� 5   	   $��2* �6   �� 5   	   $��10 �6   �� 5   	   $��8* �6   
 � RowDefinitions
 5      �� 5   	   $��25 �6   �� 5   	   $��25 �6   �� 5   	   $��25 �6   �� 5   	   $��25 �6   �� 5   	   $��25 �6   �� 5   	   $��25 �6   .+�5!      �� $��Right=�6^   ��6   �� # [ $ [RoomCountP]�6^   �� 5"       �� Orientation$ 
Horizontal=�6   $
��Left=�6,   $��2��6G   .+�5#   	   �� -   5        $��txtRoomCountFrom��5$      $	��150��6,   $��Stretch=�6;   $��Center=�6Y   ��5#      �� $ RoomCountFrom� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� 	Converter# [  5$   Y   �� 5%   	   $��3,0,3,0q�6W   ��6   �� # [ $
 [to]�6W   �� 5&   	   -   5        $��txtRoomCountTo��5'      $	��150��6*   $��Stretch=�69   $��Center=�6W   ��5&      �� $ RoomCountTo�$ TwoWay=�# [  5'   W   5(   	   �� 5)      $��Right=�6Z   $��1��6v   ��6   �� # [ $ [FloorP]�6v   �� 5*      $ 
Horizontal=�6   $
��Left=�6,   $��1��6G   $��2��6T   .+�5+   	   �� -   5        $��txtFloorFrom��5,      $	��150��6(   $��Stretch=�67   $��Center=�6U   ��5+      �� $ 	FloorFrom�$ TwoWay=�$ PropertyChanged=�# [  5,   U   �� 5-   	   $��3,0,3,0q�6W   ��6   �� # [ $
 [to]�6W   �� 5.   	   -	   5        $��
txtFloorTo��5/      $	��150��6&   $��Stretch=�65   $��Center=�6S   ��5.      �� $ FloorTo�$ TwoWay=�$ PropertyChanged=�# [  5/   S   50   	   �� 51      $��Right=�6Z   $��2��6v   ��6   �� # [ $ [PriceP]�6v   �� 52      $ 
Horizontal=�6   $
��Left=�6,   $��2��6G   $��2��6T   .+�54   	   �� -
   5        $��txtPriceFrom��55      $	��150��6(   $��Stretch=�67   $��Center=�6U   ��54      �� $ 	PriceFrom� �� ValidatesOnDataErrors . $ PropertyChanged=�$ TwoWay=�# [  55   U   �� 56   	   $��3,0,3,0q�6W   ��6   �� # [ $
 [to]�6W   �� 57   	   -   5        $��
txtPriceTo��58      $	��150��6&   $��Stretch=�65   $��Center=�6S   ��57      �� $ PriceTo�$ TwoWay=�$ PropertyChanged=�# [  58   S   �� 59   	   -   5        $��cbCurrencies��59      $��30��6&    �� 
IsEditable .   �� DisplayMemberPath$
 Name��5;      $
��Left=�5<      $��5,0,0,0q�60    �� SelectedItem 5:   '   �� $ Currency�$ TwoWay=�$ PropertyChanged=� . ��5;   .   �� $ 
Currencies�$ searchControl��5<   0   5=   	   �� 5?      $��Right=�6[   $��3��6w   ��6   �� # [ $ 	[SquareP]�6w   �� 5@      $ 
Horizontal=�6   $
��Left=�6,   $��3��6G   $��2��6T   .+�5B   	   �� -   5        $��txtSquareFrom��5C      $	��150��6)   $��Stretch=�68   $��Center=�6V   ��5B      �� $ 
SquareFrom�$ PropertyChanged=� . # [  5C   V   �� 5D   	   $��3,0,3,0q�6W   ��6   �� # [ $
 [to]�6W   �� 5E   	   -   5        $��txtSquareTo��5F      $	��150��6'   $��Stretch=�66   $��Center=�6T   ��5E      �� $ SquareTo�$ PropertyChanged=� . # [  5F   T   5G   	   �� 5I      $��Right=�6[   $��4��6w   ��6   �� # [ $ 	[StatusP]�6w   �� 5J      -   5        $��	txtStatus��5K      $	��150��6    $
��Left=�6,   $��Center=�6G   $��4��6b   $��2��6o   ��5J      �� $ Status� . $ PropertyChanged=�$ TwoWay=�# [  5K   o   �� 5M      -   5         ��Name$ tblkPricePerDayHeader��5M   m   $��5��6`   $��Center=�5N   $   $��Right=�6?   ��5M      �� # [ $ [PricePerDayP]�5N   ?   �� 5O      -   5         ��Name$ spPricePerDayHeader��5O   d   $ 
Horizontal=�6   $
��Left=�6,   $��5��6G   $��2��6T   .+�5Q   	   �� -   5        $��txtPricePerDayFrom��5R      $	��150��6.   $��Stretch=�6=   $��Center=�6[   ��5Q      �� $ PricePerDayFrom�$ PropertyChanged=� . # [  5R   [   �� 5S   	   $��3,0,3,0q�6W   ��6   �� # [ $
 [to]�6W   �� 5T   	   -   5        $��txtPricePerDayTo��5U      $	��150��6,   $��Stretch=�6;   $��Center=�6Y   ��5T      �� $ PricePerDayTo�$ PropertyChanged=� . # [  5U   Y   5V   	   5W      5X      5Y      9� 5Z      -   5        $��expRealEstateTypes��5Z   !    . $��Stretch=�6�   $��2q�6�   ��6;   �� # [ $ [EstateType/OrderType]�.��5[      � 	 5\      �� 5]      �� 5^      .+�5`      �� ��6   �� # [ $ [EstateType]�.��5a      �� -   5        $��lstRealEstateTypes��5a      $��Stretch=�6+   $
��Left=�6I   $��2q�5b   \   ��6   �� $ RealEstateTypes�$ searchControl����5c   	   �� 5d   
   .R�5e   &   �� -   5        $��2q�5f   `   ��5e   /   �� $ TypeName���5f   C   �� 6`   5g      5i   	   5j      �� 5k      $��1��6]   ��6   �� # [ $ [OrderType]�.��5l      �� -   5        $��lstOrderTypes��5l      $��Stretch=�6&   $
��Left=�6D   $��2q�5m   W   ��6   �� $ 
OrderTypes�$ searchControl����5n   	   �� 5o   
   .R�5p   &   �� -   5        $��2q�5q   [   ��5p   /   �� $
 Name���5q   >   �� 6[   5r      5t   	   5u      5v      5w      9� 5x      -   5        $��expRegionStreet��5x   !    . $��Stretch=�6�   $��2q�6�   ��68   �� # [ $ [StateOrStreet]�.��5y      � 
 5z      �� 5{      $��30 �6   �� 5|      $��50 �6   �� 5}      	 5      �� 5�      �� 5�      .+�5�      �� $ 
Horizontal=�6   $��2��6+   .+�5�      �� $��Center=�6Z   ��6   �� # [ $ [PlaceP]�6Z   �� 5�      -   5         ��Name$ txtPlaceName��5�      $��10,0,0,0q�6F   $	��300��6X   $��Center=�6d   ��6&   �� $ 	PlaceName�6d   �� 5�      -   5         ��Name$ chkIsOverseas��5�      $��Center=�6(   $��15,0,0,0q�5�   c   ��5�   C   �� # [ $ [OverseasEstate]� d� 	IsChecked 5�      �� $ 
IsOverseas�$ TwoWay=�$ PropertyChanged=�5�   2   5�      �� 5�      $ 
Horizontal=�6   $��1��6+   .+�5�      �� $ Vertical=�6   y�5�   
   �� $ 
IsOverseas�# [ .+�5�   	   �� $��Center=�6Z   ��6   �� # [ $ [State]�6Z   �� 5�   	   -   5         ��Name$ cbStates��5�   Q    .  $��Center=�6v   $	��120��5�   H    �� SelectedValuePath$ ID��6T   $
 Name��6k   $��3,0,0,0q�6�   ��5�      �� $ States�$ searchControl�� �� SelectedValue 5�      �� $ StateID�$ TwoWay=�6�   5�   	   �� 5�      $ Vertical=�6   y�5�   
   �� $ 
IsOverseas�# [ .+�5�   	   �� $��Center=�6\   ��6   �� # [ $ 	[Country]�6\   �� 5�   	   -   5        $ cbCountries��5�   T    .  $��Center=�6|   $	��120��5�   o   $ ID��6{   $
 Name��6�   $��3,0,0,0q�6�   ��5�      �� $ 	Countries�$ searchControl�� 5�      �� $ 	CountryID�$ TwoWay=�$ PropertyChanged=�6�   5�   	   �� 5�      $ Vertical=�6   $��5,0,0,0q�6*   .+�5�   	   �� $��5,0,0,0q�6Y   $��Center=�6j   ��6   �� # [ $ [City]�6j   �� 5�   	   -   5        $ cbCities��5�   d    .  $��Center=�5�   e   $	��120��5�   G   $��3,0,0,0q�6S   $
 Name��5�   A   $ CityID��6Z   ��5�      �� $ Cities�$ searchControl�� 5�      �� $ CityID�$ TwoWay=�5�   Z   5�   	   �� 5�      $ Vertical=�6   $��5,0,0,0q�6*   y�5�   
   �� $ 
IsOverseas�# [ .+�5�   	   �� $
��Left=�6[   $��Center=�6v   ��6   �� # [ $ [Region]�6v   �� 5�   	   -   5        $��	cbRegions��5�      $��2��6#    .  $	��120��5�      $
��Left=�6-   $
 Name��6H   $ RegionID��5�      ��5�   3   �� $ Regions�$ searchControl��{�5�      �� $ RegionsSingle�$ searchControl��# [  5�      �� $ RegionID�$ TwoWay=�$ PropertyChanged=�5�      5�   	   �� 5�      $ Vertical=�6   $��5,0,0,0q�6*   y�5�   
   �� $ 
IsOverseas�# [ .+�5�   	   �� $��0,0,3,0q�6[   ��6   �� # [ $ [Street]�6[   �� 5�   	   -    5        $��	cbStreets��5�      $	��150��6#    . $
 Name��6D   $ StreetID��5�   g    6   �� $ StreetID�$ TwoWay=�$ PropertyChanged=���5�   .   �� $ StreetsSingle�$ searchControl��5�   	   �� 5�      $ Vertical=�6   $��5,0,0,0q�6*   y�5�   
   �� $ 
IsOverseas�# [ .+�5�   	   �� $��5,0,3,0q�6X   ��6   �� # [ $ [Apt]�6X   �� 5�   	   -!   5        $��txtHomeNumber��5�       $	��120��6   ��65   �� $ 
HomeNumber�$ TwoWay=�$ PropertyChanged=�# [  5�   	   �� 5�      $ Vertical=�6   $��5,0,0,0q�6*   y�5�   
   �� $ 
IsOverseas�# [ .+�5�   	   �� $��5,0,3,0q�6Y   ��6   �� # [ $ [AptP]�6Y   �� 5�   	   -"   5        $��txtAptNumber��5�       $	��120��6   ��5�   .   �� $ 	AptNumber�$ TwoWay=�$ PropertyChanged=� . # [  5�   	   5�      �� 5�      $��2��6Z   ��6   �� # [ $ [Region]�y�6g   �� $ Items.Count�$ 
lstRegions��# [ .��5�      �� -#   5        $��
lstRegions��5�      $��Stretch=�6#   $
��Left=�6A   $��2q�5�   T   ��6   �� $ Regions�$ searchControl����5�   	   �� 5�   
   .R�5�   &   �� -$   5        $��2q�5�   W   ��5�   /   �� $
 Name���5�   :   �� 6W   5�      5�   	   5�      �� 5�      -%   5        $��	gbStreets��5�   j   $��1��6Z   $��2��6{   ��6   �� # [ $ [Street]�y�5�   
   �� $ 
IsOverseas�# [ .��5�      �� -&   5        $��
lstStreets��5�      $��Stretch=�6#   $
��Left=�6A   $��2q�5�   T   ��6   �� $ Streets�$ searchControl����6_   �� $ ActualHeight�$ 
lstRegions����5�   	   �� 5�   
   .R�5�   &   �� -'   5        $��2q�5�   W   ��5�   /   �� $
 Name���5�   :   �� 6W   5�      5�   	   5�      5�      5�      9� 5�      -(   5        $��
expRemonts��5�   !    . $��Stretch=�6�   $��2q�6�   ��63   �� # [ $ [StateOrProject]�.��5�      � 	 5�      �� 5�      �� 5�      �� 5�      .+�5�      �� $��Stretch=�6a   ��6   �� # [ $ [TheRoomState]�.��5�      �� -)   5        $��
lstRemonts��5�      $��Stretch=�6#   $
��Left=�6A   $��2q�5�   T   ��6   �� $ Remonts�$ searchControl����5�   	   �� 5�   
   .R�5�   &   �� -*   5        $��2q�5�   X   ��5�   /   �� $
 Name���5�   ;   �� 6X   5�      5�   	   5�      �� 5�      $��1��6c   $��Stretch=�6s   ��6   �� # [ $ [BuildingProject]�.��5�      �� -+   5        $��lstProjects��5�      $��Stretch=�6$   $
��Left=�6B   $��2q�5�   U   ��6   �� $ Projects�$ searchControl����5�   	   �� 5�   
   .R�5�   &   �� -,   5        $��2q�5�   Y   ��5�   /   �� $
 Name���5�   <   �� 6Y   5�      5�   	   5�      �� 5�      $��2��6`   $��Stretch=�6p   ��6   �� # [ $ [BuildingType]�.��5�      �� --   5        $��lstBuildingTypes��5�      $��Stretch=�6)   $
��Left=�6G   $��2q�5�   Z   ��6   �� $ BuildingTypes�$ searchControl����5�   	   �� 5�   
   .R�5�   &   �� -.   5        $��2q�5�   ^   ��5�   /   �� $
 Name���5�   A   �� 6^   5�      5�   	   5      5     5     9� 5      . ! �� IsDeferredScrollingEnabled . ��6    �� # [ $ [AdditionalDetails]�.��5     �� .��5     � 	 5     �� 5  	   �� 5  	   
 5
     �� 5  	   $
��Auto �6   .+�5     �� $ Vertical=�6   .+�5  	   ��  6   �� $ IsWoterAlways�$ TwoWay=�$ PropertyChanged=���6m   �� # [ $ [AlwaysWater]��� 5  	    6   �� $ IsHasGas�$ TwoWay=�$ PropertyChanged=���6h   �� # [ $ [Gas]��� 5  	   $ Vertical=�6   y�6+   �� $# NotEarthPlaceAddonsVisibility�$ searchControl��.+�5  
   ��  6   �� $ IsHasGarage�$ TwoWay=�$ PropertyChanged=���6l   �� # [ $ [Garage]��� 5  
    6   �� $ IsInNewBuilding�$ TwoWay=�$ PropertyChanged=���6p   �� # [ $ [NewBuilding]��� 5  
    6   �� $ IsHasFurniture�$ TwoWay=�$ PropertyChanged=���6o   �� # [ $ [Furniture]��� 5  
    6   �� $ IsEmpty�$ TwoWay=�$ PropertyChanged=���6h   �� # [ $ [Empty]��� 5  
    6   �� $ IsHasWarmingFloors�$ TwoWay=�$ PropertyChanged=���6s   �� # [ $ [HeatingFloor]��� 5  
    6   �� $ IsHasBalcony�$ TwoWay=�$ PropertyChanged=���6m   �� # [ $ [TntBalcony]�5  
   �� 5  	   $ Vertical=�6   y�6+   �� $ HouseAddonsVisible�$ searchControl��.+�5  
   ��  6   �� $ 	IsHasPool�$ TwoWay=�$ PropertyChanged=���6j   �� # [ $ [Pool]��� 5  
    6   �� $ IsHasPlayingRoom�$ TwoWay=�$ PropertyChanged=���6q   �� # [ $ 
[PlayRoom]�5  
   5  	   �� 5     $ Vertical=�6   $��1��6*   .+�5  	   ��  6   �� $ IsHasExpandingPosibility�$ TwoWay=�$ PropertyChanged=���6x   �� # [ $ [ExpandPosibility]��� 5  	    6   �� $ IsPossibleExchange�$ TwoWay=�$ PropertyChanged=���6r   �� # [ $ [ExchangePosible]��� 5   	    6   �� $ IsWithPhoto�$ TwoWay=�$ PropertyChanged=���6k   �� # [ $ [WithPhoto]��� 5"  	   $ Vertical=�6   y�6+   �� $# NotEarthPlaceAddonsVisibility�$ searchControl��.+�5#  
   ��  6   �� $ IsHasEuroWindows�$ TwoWay=�$ PropertyChanged=���6q   �� # [ $ [EuroWindows]��� 5$  
    6   �� $ IsHasPodval�$ TwoWay=�$ PropertyChanged=���6l   �� # [ $ [Podval]��� 5%  
    6   �� $ IsHasConditioner�$ TwoWay=�$ PropertyChanged=���6q   �� # [ $ [Conditioner]��� 5&  
    6   �� $ IsHasWasher�$ TwoWay=�$ PropertyChanged=���6l   �� # [ $ [Washer]��� 5'  
    6   �� $ IsHasWarmingSystem�$ TwoWay=�$ PropertyChanged=���6s   �� # [ $ [WarmingSystem]��� 5(  
    6   �� $ IsHasJakuzi�$ TwoWay=�$ PropertyChanged=���6l   �� # [ $ [Jakuzi]��� 5)  
    6   �� $ IsHasGasHeater�$ TwoWay=�$ PropertyChanged=���6o   �� # [ $ [GasVararan]�5*  
   �� 5+  	   $ Vertical=�6   y�6+   �� $! OfficePlaceAddonsVisibility�$ searchControl��.+�5,  
   ��  6   �� $  IsHasThreePhaseElectricity�$ TwoWay=�$ PropertyChanged=���6{   �� # [ $ [ThreePhaseElectricity]��� 5-  
    6   �� $ InNullableFloor�$ TwoWay=�$ PropertyChanged=���6p   �� # [ $ [NullableFloor]��� 5.  
    6   �� $ InFirstLine�$ TwoWay=�$ PropertyChanged=���6l   �� # [ $ [FirstLine]��� 5/  
   $
��Auto��6d   ��6   �� # [ $ [ConvenientFor]�.��50     �� -/   5         ��Name$ icConvenients��50  g   ��6   �� $ OfficePlaceConvenients�$ searchControl����51     �� 52     .R�53     �� $ chkConvenient��6R   -0   5        $��Center=�53  i   $��10,0,0,0q�54  q   ��53     �� $
 Name���65   �� 54  q   55     57     58     59  
   5:  	   5;     5<     5=     � 5>     	 5?     �� 5@     �� 5A     .+�5C     �� -1   5        $��btnClear��5C     $
��Left=�6~   $��10q�6�   $��Center=�6�   ��6   �� # [ $ [Clear]�6�   �� 5D     -2   5        $��	btnSearch��5D     $��Right=�6�   $��10q�5E  H   $��1��6T   $��Center=�6d   ��5D     �� # [ $ [Search]�{�5E     �� $ vPanel��$ IsValid�6d   5F     5G     5H     5I     