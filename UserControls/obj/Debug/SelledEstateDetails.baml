   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5   	    UserControls&    UserControls.SelledEstateDetails   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5   	   -   5          �Name$  sellInfo��5   e   
���   �$	��300��6L   $	��600��6Y    � WindowStartupLocation$ CenterScreen=�5       � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��6A   .��5      � $��3q�6    � DataContext 6   ��  �� Path$ 
SellEstate� �� ElementName$ sellInfo�� � RowDefinitions 5   
   �� 5	      $��30 �6   �� 5
      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6    � ColumnDefinitions 5   
   �� 5      $��3* �6   �� 5      $��5 �6   �� 5      $��7* �6   .+�5   
   �� $��Right=�6\   $��Center=�6x   ��6   ��    CultureResources �� Source# [  $ [PriceP]�6x   �� 5   
   	 �� Orientation$	 
Horizontal=�6   $��2��6.   $
��Left=�6>   $��Center=�6Y   .+�5      �� $	��150��62   ��6   �� $ Price�62   �� 5      -   5        
 ��Name$
 
cbCurrency��5       �� SelectedValuePath$ 
CurrencyID��5   s    �� DisplayMemberPath$
 Name��5      $��5,0,0,0q�60   $��Center=�6B   ��5   +   �� $ 
Currencies�$ sellInfo�� �� SelectedItem 5      �� $ Currency� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� SelectedValue 5      �� $ 
CurrencyID�$ TwoWay=�$ PropertyChanged=�5   B   5      �� 5   
   $��Right=�6^   $��1��6z   $��Center=�6�   ��6   �� # [  $ 
[SellDate]�6�   (  "System.Windows.Controls.DatePicker  5   
   $��1��5      $��2��6"   $��23��62   $��Center=�6>   $
��Left=�6Y      Text$  ��6t      SelectedDate 5      �� $ SellDate�$ TwoWay=�$ PropertyChanged=�5   t   �� 5!   
   $��2��6]   $��Right=�6j   $��Center=�6�   ��6   �� # [  $ 	[BrokerP]�6�   �� 5"   
   $ FullName��6N    �� 
IsEditable .  $ ID��5%   #   $��2��6:   $��2��6G   $��Center=�6X   ��5"      �� $ Brokers�$ sellInfo�� 5#      �� $
 User�$ TwoWay=�$ PropertyChanged=� 5$      �� $ BrokerID�$ TwoWay=�$ PropertyChanged=�5%   X   �� 5'   
   $	 
Horizontal=�6   $��Right=�6.   $��3��6J   $��3��6^   .+�5(      �� -   5         ��Name$ btnOK��5(       �� 	IsDefault . ��6$   �� # [  $ [Save]�6�   �� 5)      -   5        $ 	btnCancel��5)      $��10,0,0,0q�6�   ��6(   �� # [  $ [Close]�6�   5*      5+      5,      