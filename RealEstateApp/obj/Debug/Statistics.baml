   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5   @    RealEstateApp   RealEstateApp.Statistics   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     6@   -   5          �Name$  
statistics��5   �    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   V    � WindowStartupLocation$ CenterScreen=�5       � WindowState$ 	Maximized=�6(    � ShowInTaskbar .  � Title 5   	   ��    CultureResources �� Source# [   �� Path$ [Statistics]� � 	Resources 5      =   7Shared.Converters.ReportTypeToBrokerVisibilityConverter ) %ReportTypeToBrokerVisibilityConverter=   7Shared.Converters.ReportTypeToAgencyVisibilityConverter ) %ReportTypeToAgencyVisibilityConverter  BrokerNameStyle	 �� 
TargetType
 �� Property �� Value  PanelDarkBrush  ItemText��%�  &	       &	      &	 &     7  &	 �     '�� '    '�� o      5      65     5      65   �� 5	      "	 ��6"   .�5
      �� 
 � ��$ 20(�6    �� 5      
 � ��8   6"   �� 5      
 � ��$
 Bold"�6"   5      �� 5      "	 ��6   .�5      �� 
 � ��$
 Bold"�6"   �� 5      
 � ��$ 5,0,0,0q�6   5      �� 5      "	 ��6
   .�5      �� 
 � ��$ 13(�6    5      �� 5      "	 ��6
   .�5      �� 
 � ��$ Center=�6)   5      5      .��5      �� $
��Auto=�6   $
��Auto=�63   .��5      � $��3q�6	    � RowDefinitions 5      �� 5      $��70 �6   �� 5       $
��Auto �6   �� 5!      $
��Auto �6   �� 5"      $��40 �6   .+�5%      �� ��6   �� # [  $ [StatisticType]�.��5&      ��  �� Orientation$ 
Horizontal=�6   .+�5'      �� $��Center=�6`   ��6   �� # [  $ [StatisticType]�6`   �� 5(      -   5         ��Name$ cbReportType��5(   #    �� 
IsEditable .  $��5,0,0,0q�6z   $	��250��6�    �� DisplayMemberPath$
 Name��5)   	    �� SelectedValuePath$ ID��6"   ��5(   9   �� $ ReportTypes� �� ElementName$ 
statistics�� �� SelectedItem 5)   9   �� $ SelectedReportType� �� Mode$ TwoWay=�$ 
statistics��5*   	   �� 5,      -   5         ��Name$ spBroker��5,   =   $ 
Horizontal=�6   $��10,0,0,0q�6+   y�5-      �� $ SelectedReportType�$ 
statistics�� �� 	Converter# [ .+�5.      �� $��Center=�6[   ��6   �� # [  $ 	[BrokerP]�6[   �� 5/      -   5        $ 	cbBrokers��5/   $    .  $��5,0,0,0q�6t   $	��250��6�   $ FullName��50   	   $ ID��6&   ��5/   7   �� $ Brokers�$ 
statistics�� 50   =   �� $ SelectedBroker�$ TwoWay=�$ 
statistics��51   
   52      �� 53      -   5         ��Name$ btnPrintByBrokers��53      $��35��6I   $��35��6T   $��10,0,0,0q�6`   y�54      �� $ SelectedReportType�$ 
statistics��# [  � ToolTip 55      �� # [  $ [ShowReportByBrokers]�.��56      �� $>��8pack://application:,,,/Shared;component/Images/Print.png��6   $��Stretch=�6P   $��Stretch=�6n   57      58      59      �� 5;      $��1��6[   $��0,5,0,0q�6h   ��6   �� # [  $ [IntervalP]�.��5<      �� $ 
Horizontal=�6   $
��Left=�6*   $	��3,0q�6E   .+�5=      �� $��Center=�6W   $��3,0,3,0q�6r   ��6   �� # [  $ [From]�6r   (  "System.Windows.Controls.DatePicker  5>      -   5        $��Center=�5?   !      SelectedDate 5>      �� $ SearchCriteria.StartDate�$ 
statistics��$ TwoWay=� �� ValidatesOnDataErrors .  �� ValidatesOnExceptions .  �� UpdateSourceTrigger$ PropertyChanged=�5?   <   �� 5A      $��Center=�6U   $��5,0,3,0q�6p   ��6   �� # [  $
 [To]�6p     5B      -   5        $��Center=�5C   !    5B      �� $ SearchCriteria.EndDate�$ 
statistics��$ TwoWay=� .  . $ PropertyChanged=�5C   <   �� 5E      -   5        $ 	btnSearch��5E      $
��10,0q�6�   $��35��6�   $��35��6�    69   �� # [  $ [Search]�.��5F      �� $?��9pack://application:,,,/Shared;component/Images/Search.png��6   $��Stretch=�6Q   $��Stretch=�6o   5G      5H      5I      �� 5K      $��2��6V   $��3q�6c   ��6   �� # [  $ [Data]� � DataContext 6n   �� $ StatisticData�$ 
statistics��.��5L      �  � ColumnDefinitions 5M      �� 5N      �� 5O      $��5 �6   �� 5P       5R      �� 5S      $
��Auto �6   �� 5T      $��30 �6   �� 5U      $��30 �6   �� 5V      $��30 �6   �� 5W      $��30 �6   �� 5X      $��30 �6   .+�5Z      �� #��[ 5[   
   $��3��63   $	��3,5q�6G   ��5Z      �� $ SelectedBroker.FullName�$ 
statistics��y�6W   �� $ 
Visibility�$ spBroker��5[   G   �� 5]      $ 
Horizontal=�6   $��1��6+   $��0��68   .+�5^      �� ��6   �� # [  $ [AddedEstatesCountP]��� 5_      #��[ 6:   ��6   �� $ AddedEstatesCount�6:   5`      �� 5a      $ 
Horizontal=�6   $��2��6+   $��0��68   .+�5b      �� ��6   �� # [  $ [AllEstatesCountP]��� 5c      #��[ 65   ��6   �� $ EstatesCount�65   5d      �� 5f      $ 
Horizontal=�6   $��1��6+   $��2��68   .+�5g      �� ��6   �� # [  $ [AddedClientsCountP]��� 5h      #��[ 6:   ��6   �� $ AddedDemandsCount�6:   5i      �� 5j      $ 
Horizontal=�6   $��2��6+   $��2��68   .+�5k      �� ��6   �� # [  $ [AllClientsCountP]��� 5l      #��[ 65   ��6   �� $ DemandsCount�65   5m      �� 5o      $ 
Horizontal=�6   $��3��6+   $��0��68   .+�5p      �� ��6   �� # [  $ [UpdatedEstatesCountP]��� 5q      #��[ 6<   ��6   �� $ UpdatedEstatesCount�6<   5r      �� 5t      $ 
Horizontal=�6   $��3��6+   $��2��68   .+�5u      �� ��6   �� # [  $ [UpdatedClientsCountP]��� 5v      #��[ 6<   ��6   �� $ UpdatedDemandsCount�6<   5w      �� 5y      $ 
Horizontal=�6   $��4��6+   $��0��68   .+�5z      �� ��6   �� # [  $ [SoldEstatesCountP]��� 5{      #��[ 69   ��6   �� $ SoldEstatesCount�69   5|      �� 5}      $ 
Horizontal=�6   $��5��6+   $��0��68   .+�5~      �� ��6   �� # [  $ [ArendedEstatesCountP]��� 5      #��[ 6;   ��6   �� $ RentedEstatesCount�6;   5�      �� 5�      $ 
Horizontal=�6   $��4��6+   $��2��68   .+�5�      �� ��6   �� # [  $ [ShowedEstatesCountP]��� 5�      #��[ 6;   ��6   �� $ ShowedEstatesCount�6;   5�      �� 5�      $ 
Horizontal=�6   $��5��6+   $��2��68   .+�5�      �� ��6   �� # [  $ [ShowedClientsCountP]��� 5�      #��[ 6;   ��6   �� $ ShowedClientsCount�6;   5�      5�      5�      �� 5�      $ 
Horizontal=�6   $��Center=�6)   $��3��6D   $��Right=�6Q   .+�5�      �� -	   5        $ btnPrint��5�      $��5,0,10,0q�6�   $��35��6�   $��35��6�    66   �� # [  $ [Print]�.��5�      �� $>��8pack://application:,,,/Shared;component/Images/Print.png��6   $��Stretch=�6O   $��Stretch=�6m   5�      5�      5�      5�      5�      