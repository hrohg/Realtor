   M S B A M L   `   `   `  ����I  ECustomControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]?clr-namespace:CustomControls.ValidPanel;assembly=CustomControlsCustomControls.ValidPanel  5   @   A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 5   	    UserControls$   UserControls.RentEstateDetails   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   ZCustomControls?clr-namespace:CustomControls.ValidPanel;assembly=CustomControls     6@   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5   	   -   5          �Name$  rentDetailsForm��5   "   
���   � � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   _   $	��250��5   	   $	��500��6    � ShowInTaskbar .  � 	Resources 5      2  ,Shared.Converters.StringEmptyToNullConverter   StringEmptyToNullConverter��%   &	          5   
   60   5      .��5	      *   $CustomControls.ValidPanel.ValidPanel  -   5          Name$ vpEstate��5	       .+�5
   
   � $��3q�6    � DataContext 6   ��  �� Path$ 
RentEstate� �� ElementName$ rentDetailsForm�� � RowDefinitions 5      �� 5      $��30 �6    �� 5      $��30 �6    �� 5      $��30 �6    �� 5      $��30 �6    �� 5      $��30 �6    	 � ColumnDefinitions	 5      �� 5      $��3* �6#   �� 5      $��5 �6#   �� 5      $��7* �6#   .+�5      �� $��Right=�6W   $��Center=�6s   ��6   ��   CultureResources
 �� Source#
 [ $ [PriceP]�6s   �� 5       �� Orientation$ 
Horizontal=�6   $��2��62   $
��Left=�6B   $��Center=�6]   .+�5      �� $	��150��6z   ��6   �� $ Price� �� Mode$ TwoWay=� �� 	Converter# [  6z   �� 5      -   5         ��Name$ 
cbCurrency��5       �� SelectedValuePath$ 
CurrencyID��5       �� 
IsEditable .   �� DisplayMemberPath$
 Name��5      $��5,0,0,0q�60   $��Center=�6B   ��5   /   �� $ 
Currencies�$ rentDetailsForm�� �� SelectedItem 5      �� $ Currency�$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� SelectedValue 5      �� $ 
CurrencyID�$ TwoWay=�$ PropertyChanged=�5   B   5       �� 5"      $��Right=�6]   $��Center=�6y   $��1��6�   ��6   �� #
 [ $ [PricePerDayP]�6�   �� 5#      $ 
Horizontal=�6   $��2��62   $
��Left=�6B   $��Center=�6]   $��1��6x   .+�5$      �� $	��150��6�   ��6   �� $ PricePerDay�$ TwoWay=�# [  6�   �� 5%      $��5,0,0,0q�6O   ��6   �� $
 Text�$ 
cbCurrency��6O   5&      �� 5(      $��Right=�6Y   $��2��6u   $��Center=�6�   ��6   �� #
 [ $ 
[RentingP]�6�   �� 5)      $��2��6   $��2��6&   $ 
Horizontal=�66   .+�5*      (  "System.Windows.Controls.DatePicker  $��25��5+      $��Center=�6!   $
��Left=�6<      SelectedDate 5*      �� $ 	StartDate�$ TwoWay=�$ PropertyChanged=�5+   <   �� 5,      $��5,0,5,0q�6T   $��Center=�6e   ��6   �� #
 [ $
 [to]�6e     5-      $��25��5.      $��Center=�6!   $
��Left=�6<    5-      �� $ EndDate�$ TwoWay=�$ PropertyChanged=�5.   <   5/      �� 51      $��3��6X   $��Right=�6e   $��Center=�6�   ��6   �� #
 [ $ 	[BrokerP]�6�   �� 52      $ FullName��53   #    .  $��3��6S   $��2��6`   $��Center=�6q   $ ID��54   m   ��52      �� $ Brokers�$ rentDetailsForm�� 6Y   �� $
 User�$ TwoWay=�$ PropertyChanged=� 54      �� $ BrokerID�$ TwoWay=�$ PropertyChanged=�6m   �� 56      $ 
Horizontal=�6   $��Right=�62   $��3��6N   $��4��6b   $��0,0,10,0q�6o   $��Bottom=�6�   .+�57      �� -   5         ��Name$ btnOK��57       �� 	IsDefault . ��6   �� #
 [ $ [Save]�{�6�   �� $ vpEstate��$ IsValid��� 58      -   5        $ 	btnCancel��58      $��10,0,0,0q�6�   ��6    �� #
 [ $ [Close]�6�   59      5:      5;      5<      