   M S B A M L   `   `   `  ����U  QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls  5   @   A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 5       UserControls/   )UserControls.ClientSelectionFormForEstate   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation       5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     6@   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5      -   5          �Name$  selectionForm��5   2    � Title$" ClientSelectionFormForEstate��5   F   
����ح�
������� � ShowInTaskbar .  $	��650��5      $	��850��6    � 
ResizeMode$ NoResize=�6    � WindowStyle$
 None=�6I    � WindowStartupLocation$ CenterOwner=�6z    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5       � 	Resources 5      /  )Shared.Converters.IsRentToStringConverter   IsRentToStringConverter1  +Shared.Converters.BoolToVisibilityConverter  BoolToVisibilityConverter7  1Shared.Converters.BoolToVisibilityInvertConverter # BoolToVisibilityInvertConverter2  ,Shared.Converters.StringEmptyToNullConverter  StringEmptyToNullConverter��%t   &	        &	      &	 &     &	 9       5   
   6-     5	   
   6/     5
   
   65     5   
   60   5      .��5      � $��5q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      �� 5      $��35 �6   �� 5      $��40 �6   .+�5   
   �� $��2q�6e   ��6   ��   CultureResources	 �� Source#	 [ 
 �� Path$
 [SearchCriteria]�.��5      �  � DataContext 6   �� $
 SearchParameters� �� ElementName$ selectionForm�� 5      �� 5      $
��Auto �6$   .+�5      ��  �� Orientation$ 
Horizontal=�6   y�66   �� $
 IsForEstateSearch�$ selectionForm�� �� 	Converter# [ .+�5      �� $��0,0,5,0q�6g   $��Center=�6x   ��6    �� #	 [ $
 [NameP]�6x   �� 5      -   5         ��Name$ txtName��5   *   $	��150��6   ��6;   �� $

 Name� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�6�   �� 5      $��7,0,5,0q�6l   $��Center=�6}   ��6    �� #	 [ $
 [TelephoneP]�6}   �� 5      -   5        $ txtPhone��5   *   $	��100��6   ��6<   �� $
 Phone�$ TwoWay=�$ PropertyChanged=�6�   �� 5!      -   5         ��Name$ 	btnSearch��5!      $��30��6H   $��30��6T   $��	10,0,10,0q�6_   $��Right=�5"      ��6+   Z�  � ToolTip 6<   �� #	 [ $
 [Search]�.��5#      �� $?��9pack://application:,,,/Shared;component/Images/Search.png��6    5$      5%      � 5'      y�6   �� $
 IsForEstateSearch�$ selectionForm��# [  � ColumnDefinitions 5(      �� 5)      �� 5*      .+�5-      � $��0��6    5.      �� 5/      $
��Auto �6/   �� 50      $��5 �6/   �� 51       53      �� 54      $��30 �6,   �� 55      $��30 �6,   .+�58      �� $��Right=�6k   ��6$   �� #	 [ $
 [CodeP]�6k   �� 59      $��2��6�   ��6"   �� $

 Code�$ PropertyChanged=�$ TwoWay=� �� ValidatesOnDataErrors . 6�   �� 5;      $��Right=�6p   $��1��6�   ��6$   �� #	 [ $
 [TelephoneP]�6�   �� 5<      $��2��5=   
   $��1��6   ��5<   "   �� $
 Phone�$ PropertyChanged=�$ TwoWay=� . # [ 5=      5?      � 5A      $��1��6    5B      �� 5C      $
��Auto �6/   �� 5D      $��5 �6/   �� 5E       5G      �� 5H      $��30 �6,   �� 5I      $��30 �6,   �� 5J      $��30 �6,   .+�5M      �� $��Right=�6p   ��6$   �� #	 [ $
 [RoomCountP]�6p   �� 5N      -   5        $��txtRoomCountFrom��5N   "   $	��150��6:   $��Center=�6I   $
��Left=�6d   $��2��6   ��5O   	   �� $
 	RoomCount� . $ PropertyChanged=�$ TwoWay=�# [ �� 5Q      $��Right=�6m   $��1��6�   ��6$   �� #	 [ $
 	[SquareP]�6�   �� 5R      -   5        $��txtSquareFrom��5S      $	��150��6$   $��Center=�63   $
��Left=�6N   $��1��6i   $��2��6v   ��5R   "   �� $
 Square� . $ PropertyChanged=�$ TwoWay=�# [ 5S   v   �� 5U      -   5        $ btnSearchEstates��5U   !   $��25��6�   $	��100��5V   	   $��2��64   ��5U   ;   �� #	 [ $
 [Search]�5V   4   5W      5X      5Y      5Z      )   #Microsoft.Windows.Controls.DataGrid  5\   
   -   5          Name$ 	dgDemands��5_   P      AutoGenerateColumns .     CanUserResizeColumns .    CanUserReorderColumns .    CanUserSortColumns .    
IsReadOnly .    SelectionMode$ Single=�5]   i   $��1��6�   $��Stretch=�5_      $��Stretch=�64   $
��Auto=�5`   
   $
��Auto=�6:   $	��2,0q�6l   ��5]      �� $
 Demands�$ selectionForm�� �� SelectedItem 5^   
   �� $
 SelectedEstateDemand�$ selectionForm��$ TwoWay=�$ PropertyChanged=�   Columns 5a      3   -Microsoft.Windows.Controls.DataGridTextColumn  5b      /   )Microsoft.Windows.Controls.DataGridColumn   Width8   2Microsoft.Windows.Controls.DataGridLengthConverter$
 Auto 6�   4	   .Microsoft.Windows.Controls.DataGridBoundColumn  	  Binding  6.   �� $
 
ClientName�$ OneWay=�!   Header! 6_   �� #	 [ $
 [Client]�6�     5c      $
 Auto 6�     6.   �� $
 RentSell�$ OneWay=�# [  ! 6�   �� #	 [ $
 
[Ord.Type]�6�     5d      $
 Auto 6�     6.   �� $
 EstateTypes�$ OneWay=�! 6`   �� #	 [ $
 [EstateType]�6�     5e      $
 Auto 6�     6.   �� $
 Rooms�$ OneWay=�! 6Z   �� #	 [ $
 [Room]�6�     5f      $
 Auto 6�     6.   �� $
 Square�$ OneWay=�! 6[   �� #	 [ $
 [Square]�6�     5g      $
 Auto 6�     6.   �� $
 Price�$ OneWay=�! 6Z   �� #	 [ $
 [Price]�6�     5h      $
 Auto 6�     6.   �� $
 Regions�$ OneWay=�! 6\   �� #	 [ $
 [StateOrRegion]�6�   5j      �� 5l   
   $ 
Horizontal=�6   $��2��6.   $��Center=�6<   $��0,5,0,0q�6W   .+�5m      �� $��3,0,0,0q�6_   ��6   �� #	 [ $
 [DateP]�6_   (
  "System.Windows.Controls.DatePicker
  5n      -	   5        " 
 Name$" dpDate��5n      $��5,0,0,0q�6)   $	��200��6:   # 
  SelectedDate# 5o      �� $
 EstateAndDemand.ShowDate�$ TwoWay=�$ selectionForm��$ PropertyChanged=� . $ �� ValidatesOnExceptions$ . �� 5q      $��10,0,0,0q�6a   ��6   �� #	 [ $
 	[BrokerP]�6a   �� 5r      -
   5        % ��Name$% cbBroker��5r      $��5,0,0,0q�6)   $	��200��6:   & �� SelectedValuePath$& ID��5s      ' �� DisplayMemberPath$' FullName��6   ( �� 
IsEditable( .  ��5r   F   �� $
 Brokers�$ selectionForm��5s   <   5u      � 5v   
   $��3��6    5w      �� 5x      �� 5y      .+�5|      �  5}      �� 5~      $
��Auto �6'   �� 5      .+�5�      �� $��10,0,5,0q�6   $��Center=�6x   ��6.   �� #	 [ $
 
[CommentP]�6x   �� 5�      -   5        $ 
txtComment��5�   c   $��Stretch=�6   $��Center=�68   $��1��6S   ��5�      �� $
 EstateAndDemand.Comment�$ TwoWay=�$ selectionForm��$ PropertyChanged=� . $ . 5�   c   5�      �� 5�      $ 
Horizontal=�6   $��1��62   $��Right=�6B   $��0,0,10,0q�6^   .+�5�      �� -   5        $ btnOK��5�      ��6(   �� #	 [ $
 [Select]�6s   �� 5�      -   5        $ 	btnCancel��5�      $��5,0,0,0q�6�   ��6,   �� #	 [ $
 [Cancel]�6�   5�      5�      5�      5�      