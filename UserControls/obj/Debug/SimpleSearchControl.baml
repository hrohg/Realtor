   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5      I ECustomControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]?clr-namespace:CustomControls.ValidPanel;assembly=CustomControlsCustomControls.ValidPanel 5       UserControls&    UserControls.SimpleSearchControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5      YCusomControls?clr-namespace:CustomControls.ValidPanel;assembly=CustomControls     5      -   5        $��simpleSearch��5      
���   �  � 	Resources  5      2   ,Shared.Converters.StringEmptyToNullConverter   StringEmptyToNullConverter��%   &	          5   
   60   5	      .��5
      *  $CustomControls.ValidPanel.ValidPanel  -   5          Name$ vPanel��5
      .+�5   
   � -   5         � DataContext 5      ��  �� Path$ SearchParameters� �� ElementName$ simpleSearch��.+�5      �� .��5      �  � ColumnDefinitions 5      �� 5      $��2* �6+   �� 5      $��10 �6+   �� 5      $��8* �6+    � RowDefinitions 5      �� 5      $��25 �6(   �� 5      $��25 �6(   �� 5      $��25 �6(   �� 5      �� 5      $��25 �6(   �� 5      $��25 �6(   �� 5      $��25 �6(   �� 5      $��25 �6(   �� 5      $��25 �6(   �� 5      $��25 �6(   �� 5      $��25 �6(   �� 5      $
��Auto �6(   .+�5"      �� $��Right=�6g   ��6    ��   CultureResources �� Source# [ $ [CodeP]�6g   �� 5#      $��2��6�   ��6   �� $
 Code� �� UpdateSourceTrigger$ PropertyChanged=�	 �� Mode$	 TwoWay=�
 �� ValidatesOnDataErrors
 . 6�   �� 5%      $��Right=�6c   $��1��6   ��6   �� # [ $ [TelephoneOrNameP]�6   �� 5&      $��2��6�   $��1��6�   ��6   �� $ TelephoneOrName�$ PropertyChanged=�$	 TwoWay=�
 .  �� 	Converter# [  6�   �� 5(      $��Right=�6i   $��2��6�   ��6    �� # [ $ 	[StreetP]�6�   �� 5)      $��2��6�   $��2��6�   ��6   �� $ 
StreetName�$ PropertyChanged=�$	 TwoWay=�
 . # [  6�   � 5+      $��3��6   $��3��6/   $��0,0,0,5q�6<    5,      �� 5-      �� 5.      .+�51      �� ��6#   �� # [ $ [OrderType]�.��52      �� -   5        $��lstOrderTypes��52   '   $��Stretch=�6<   $
��Left=�6Z   $��2q�53   S   ��6   �� $ 
OrderTypes�$ simpleSearch����54   "   �� 55   &   .R�56   *   �� -   5        $��2q�57   X   ��56   3   �� $
 Name���57   ;   �� 58   3   59   '   5;      5<      �� 5>      $��1��6t   ��6#   �� # [ $ [TheEstateType]�.��5?      �� -   5        $��lstRealEstateTypes��5?   '   $��Stretch=�6A   $
��Left=�6_   $��2q�5@   X   ��6   �� $ RealEstateTypes�$ simpleSearch����5A   "   �� 5B   &   .R�5C   *   �� -   5        $��2q�5D   ]   ��5C   3   �� $ TypeName���5D   @   �� 5E   4   5F   '   5H      5I      5J      �� 5L      $��4��6l   $��Right=�6y   ��6    �� # [ $ [RoomCountP]�6y   �� 5M       �� Orientation$ 
Horizontal=�6!   $
��Left=�6:   $��2��6U   $��4��6e   .+�5N      �� -   5        $��txtRoomCountFrom��5N   "   $	��150��6:   $��Stretch=�6I   $��Center=�6g   ��5O      �� $ RoomCountFrom�
 . $ PropertyChanged=�$	 TwoWay=�# [  �� 5P      $��3,0,3,0q�6h   ��6$   �� # [ $
 [to]�6h   �� 5Q      -	   5        $��txtRoomCountTo��5Q   "   $	��150��68   $��Stretch=�6G   $��Center=�6e   ��5R      �� $ RoomCountTo�
 . $ PropertyChanged=�$	 TwoWay=�# [  5S      �� 5U      $��Right=�6h   $��5��6�   ��6    �� # [ $ [FloorP]�6�   �� 5V      $ 
Horizontal=�6!   $
��Left=�6:   $��5��6U   $��2��6b   .+�5W      �� -
   5        $��txtFloorFrom��5X      $	��150��6#   $��Stretch=�62   $��Center=�6P   ��5W   "   �� $ 	FloorFrom�$ PropertyChanged=�
 . $	 TwoWay=�# [  5X   P   �� 5Y      $��3,0,3,0q�6h   ��6$   �� # [ $
 [to]�6h   �� 5Z      -   5        $��
txtFloorTo��5[      $	��150��6!   $��Stretch=�60   $��Center=�6N   ��5Z   "   �� $ FloorTo�
 . $ PropertyChanged=�$	 TwoWay=�# [  5[   N   5\      �� 5^      $��Right=�6h   $��6��6�   ��6    �� # [ $ [PriceP]�6�   �� 5_      $ 
Horizontal=�6!   $
��Left=�6:   $��6��6U   $��2��6b   .+�5a      �� -   5        $��txtPriceFrom��5b      $	��150��6#   $��Stretch=�62   $��Center=�6P   ��5a   "   �� $ 	PriceFrom�
 . $ PropertyChanged=�$	 TwoWay=�# [  5b   P   �� 5c      $��3,0,3,0q�6h   ��6$   �� # [ $
 [to]�6h   �� 5d      -   5        $��
txtPriceTo��5e      $	��150��6!   $��Stretch=�60   $��Center=�6N   ��5d   "   �� $ PriceTo�
 . $ PropertyChanged=�$	 TwoWay=�# [  5e   N   �� 5f      -   5        $��cbCurrencies��5f   #   $��30��67    �� 
IsEditable .   �� DisplayMemberPath$
 Name��5g      $
��Left=�5h      $��5,0,0,0q�6+    �� SelectedItem 5f   B   �� $ Currency�$	 TwoWay=�$ PropertyChanged=���5g   )   �� $ 
Currencies�$ simpleSearch��5h   +   5i      �� 5k      $��Right=�6i   $��7��6�   ��6    �� # [ $ 	[SquareP]�6�   �� 5l      $ 
Horizontal=�6!   $
��Left=�6:   $��7��6U   $��2��6b   .+�5n      �� -   5        $��txtSquareFrom��5o      $	��150��6$   $��Stretch=�63   $��Center=�6Q   ��5n   "   �� $ 
SquareFrom�
 . $ PropertyChanged=�$	 TwoWay=�# [  5o   Q   �� 5p      $��3,0,3,0q�6h   ��6$   �� # [ $
 [to]�6h   �� 5q      -   5        $��txtSquareTo��5r      $	��150��6"   $��Stretch=�61   $��Center=�6O   ��5q   "   �� $ SquareTo�
 . $ PropertyChanged=�$	 TwoWay=�# [  5r   O   5s      �� 5u      $��Right=�6i   $��8��6�   ��6    �� # [ $ 	[StatusP]�6�   �� 5v      -   5        $��	txtStatus��5w      $	��150��6    $
��Left=�6,   $��Center=�6G   $��8��6b   $��2��6o   ��5v      �� $ Status�
 . $ PropertyChanged=�$	 TwoWay=�# [  5w   o   �� 5y      $��3,0,3,0q�6i   $��9��6z   $��Right=�6�   $��Center=�6�   ��6    �� # [ $ 	[BrokerP]�6�   �� 5z      $��9��6�   $��2��6�   $	��150��5{      $
��Left=�6(   $��Center=�6C    �� SelectedValuePath$ ID��5|      $ FullName��66    .   �� SelectedValue 5z      �� $ BrokerID�
 . $ PropertyChanged=�$	 TwoWay=���5{   ^   �� $ Brokers�$ simpleSearch��5|   S   �� 5      -   5         ��Name$ tblkPricePerDay��5   k   $��Right=�6�   $��10��6�   ��6   �� # [ $ [PricePerDayP]�y�6�   �� $ PricePerDayVisibility�$ simpleSearch���� 5�      -   5         ��Name$ spPricePerDay��5�   s   $ 
Horizontal=�6!   $
��Left=�6:   $��10��6U   $��2��6c   y�6�   �� $ PricePerDayVisibility�$ simpleSearch��.+�5�      �� -   5        $��txtPricePerDayFrom��5�      $	��150��6)   $��Stretch=�68   $��Center=�6V   ��5�   "   �� $ PricePerDayFrom�
 . $ PropertyChanged=�$	 TwoWay=�# [  5�   V   �� 5�      $��3,0,3,0q�6h   ��6$   �� # [ $
 [to]�6h   �� 5�      -   5        $��txtPricePerDayTo��5�      $	��150��6'   $��Stretch=�66   $��Center=�6T   ��5�   "   �� $ PricePerDayTo�
 . $ PropertyChanged=�$	 TwoWay=�# [  5�   T   5�      �� 5�      -   5        $��	btnSearch��5�      $��11��6�   $��2��6�   $��Right=�5�   T   $��11q�6p   ��5�   .   �� # [ $ [Search]�{�5�      �� $ vPanel��$ IsValid�6p   �� 5�      -   5        $��btnClear��5�      $��11��6�   $
��Left=�6�   $��10q�6�   ��6-   �� # [ $ [Clear]�6�   5�      5�      5�      5�      5�      