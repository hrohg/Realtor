   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5   	    UserControls#   UserControls.CheckAddressView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5   	   -   5          �Name$  checkAddress��5   "    � WindowStartupLocation$ CenterScreen=�5   	    � WindowState$ Normal=�6.    � WindowStyle$ 
ToolWindow=�6C    � 
ResizeMode$ NoResize=�6\   $	��130��5   	   $	��800��6    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��68    � 	Resources 5      4   .Shared.Converters.HasItemsToEnabilityConverter    HasItemsToEnabilityConverter2   ,Shared.Converters.StringEmptyToNullConverter  StringEmptyToNullConverter��%:   &	        &	        5   
   62     5	   
   60   5
      .��5      �� $
��Auto=�6   $��Disabled=�68   .��5   
   � $��5q�6    � RowDefinitions 5      �� 5      $��50 �6    �� 5      $��40 �6    .+�5      �� -   5         �� Orientation$ 
Horizontal=�5      $��0��62   	 � DataContext	 6?   �� 
 �� Path$
 SearchParameters� �� ElementName$ checkAddress��.+�5      �� $ Vertical=�6   .+�5      �� $��Center=�6g   ��6    ��   CultureResources �� Source# [ $
 [State]�6g   �� 5      -   5         ��Name$ cbStates��5   ]    �� 
IsEditable .  $��Center=�6�   $	��120��5   H    �� SelectedValuePath$ ID��6T    �� DisplayMemberPath$
 Name��6k   $��3,0,0,0q�6�   ��5      �� $
 States�$ checkAddress�� �� SelectedValue 5      �� $
 StateID� �� Mode$ TwoWay=�6�   5      �� 5      $ Vertical=�6   $��5,0,0,0q�64   .+�5      �� $��5,0,0,0q�6f   $��Center=�6w   ��6    �� # [ $
 [City]�6w   �� 5      -   5        $ cbCities��5   d    .  $��Center=�5   q   $	��120��5   G   $��3,0,0,0q�6S   $
 Name��5   A   $ CityID��6Z   ��5      �� $
 Cities�$ checkAddress�� 5      �� $
 CityID�$ TwoWay=�5   Z   5      �� 5      $ Vertical=�6   $��5,0,0,0q�64   .+�5      �� $
��Left=�6h   $��Center=�6�   ��6    �� # [ $
 [Region]�6�   �� 5      -   5        $��	cbRegions��5      $��2��60    .  $	��120��5       $
��Left=�6-   $
 Name��6H   $ RegionID��5#      ��5   @   �� $
 Regions�$ checkAddress��{�5!      �� $
 RegionsSingle�$ checkAddress�� �� 	Converter# [   5"      �� $
 RegionID�$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5#      5$      �� 5%      $ Vertical=�6   $��5,0,0,0q�64   .+�5&      �� $��0,0,3,0q�6h   ��6    �� # [ $
 [Street]�6h   �� 5'      -   5        $��	cbStreets��5'      $	��150��60    .  $
 Name��6R   $ StreetID��5(   g    6   �� $
 StreetID�$ TwoWay=�$ PropertyChanged=���5)   .   �� $
 StreetsSingle�$ checkAddress��5*      �� 5,      $ Vertical=�6   $��5,0,0,0q�64   .+�5-      �� $��5,0,3,0q�6e   ��6    �� # [ $
 [Apt]�6e   �� 5.      -   5        $��txtHomeNumber��5.   -   $	��120��6   ��6B   �� $
 
HomeNumber�$ TwoWay=�# [ 5/      �� 51      $ Vertical=�6   $��5,0,0,0q�64   .+�52      �� $��5,0,3,0q�6f   ��6    �� # [ $
 [AptP]�6f   �� 53      -   5        $��txtAptNumber��53   -   $	��120��6   ��54   .   �� $
 	AptNumber�$ TwoWay=�$ PropertyChanged=� �� ValidatesOnDataErrors . # [ 55      56      �� 58      $ 
Horizontal=�6   $��1��62   $��Right=�6?   $��Center=�6[   .+�59      �� -	   5         ��Name$ btnCheck��59      ��6+   �� # [ $
 [Check]�6u   �� 5:      -
   5        $ 	btnCancel��5:      $��10,0,0,0q�6�   ��6,   �� # [ $
 [Cancel]�6�   5;      5<      5=      5>      