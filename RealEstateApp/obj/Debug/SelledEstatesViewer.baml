   M S B A M L   `   `   `  ����U  QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls  5   @   G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA0clr-namespace:UserControls;assembly=UserControlsUserControls 5   	   A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 5   	    RealEstateApp'   !RealEstateApp.SelledEstatesViewer   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation       5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     6@   IUserControls0clr-namespace:UserControls;assembly=UserControls     5   	   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5   	   -   5          �Name$  selledEstatesForm��5   �    � ShowInTaskbar .  � WindowStartupLocation$ CenterScreen=�6�    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   	    � WindowState$ 	Maximized=�6f    � Title 5   a   ��    CultureResources �� Source# [   �� Path$ [SoldEstates]� � 	Resources 5      7  1Shared.Converters.BoolToVisibilityInvertConverter # BoolToVisibilityInvertConverterM  GShared.Converters.EstateToEstateFullAddressStringWithoutRegionConverter 9 5EstateToEstateFullAddressStringWithoutRegionConverter5  /Shared.Converters.StringToOneRowStringConverter ! StringToOneRowStringConverter��%W   &	       &	      &	 &       5   
   65     5	   
   6K     5
   
   63   5      .��5      � $��3q�6   	 � RowDefinitions	 5   
   �� 5      $
��Auto �6   �� 5      �� 5      $��30 �6   .+�5   
   �� $
��Auto��6   $
��Auto��6   $	��1.3q�6,   
 �� CornerRadius$
 5��6B     NormalBorderBrush#��[ 6S   ._�5      9� $	��600��6e   $
��Left=�6q   $
��Auto��6�   $��3q�6�   ��6   �� # [  $ [FilterList]�.��5      � $��3q�6   
�������$	��160��65   $	��Top=�6B    � ColumnDefinitions 5      �� 5      $
��Auto �6+   �� 5      �� 5      $
��Auto �6+   �� 5      	 5      �� 5      $��30 �6(   �� 5      $��30 �6(   �� 5      $��30 �6(   �� 5      $��30 �6(   �� 5       $��30 �6(   .+�5#      �� $��0��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ [CodeP]�6�   �� 5$      $��0��6   $��1��6+   $��4,0,0,0q�6;   $
��Left=�5%   	   $��Center=�6$   $	��200��6?   ��5$   L   �� $ SearchCriteria.Code� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� ElementName$ selledEstatesForm��5%   ?   �� 5'      $��1��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ [EstateTypeP]�6�   �� 5(      -   5        $��1��5(      $��1��6,    �� 
IsEditable .  $��4,0,0,0q�6O    �� SelectedValuePath$ EstateTypeID��5*   	    �� DisplayMemberPath$ TypeName��6*   $
��Left=�6G   $��Center=�6b   ��5(   `   �� $ EstateTypes�$ selledEstatesForm�� �� SelectedValue 5)   	   �� $! SearchCriteria.EstateTypeID�$ TwoWay=�$ PropertyChanged=�$ selledEstatesForm��5*   }   �� 5,      $��1��6    $��2��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ 	[RegionP]�6�   �� 5-      -   5        $��1��5-      $��3��6,    .  $��4,0,0,0q�6O   $ RegionID��5/   	   $
 Name��6&   $
��Left=�6?   $��Center=�6Z   ��5-   `   �� $ Regions�$ selledEstatesForm�� 5.   	   �� $ SearchCriteria.RegionID�$ TwoWay=�$ PropertyChanged=�$ selledEstatesForm��5/   u   �� 51      $��2��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ [PriceP]�6�   �� 52       �� Orientation$ 
Horizontal=�6!   $��2��6:   $��1��6G   $��3��6W   $��4,0,0,0q�6k   $
��Left=�6|   $��Center=�6�   .+�53      �� -   5         ��Name$ txtPriceFrom��53   "   $	��145��6_   $��Center=�54   �   ��6	   �� $ SearchCriteria.PriceFrom�$ TwoWay=� �� ValidatesOnDataErrors . $ selledEstatesForm��6�   �� 55      $	�� - ��6$   $��Center=�6/   �� 56      -   5        $ 
txtPriceTo��56   "   $	��145��6]   $��Center=�57   ~   ��6	   �� $ SearchCriteria.PriceTo�$ TwoWay=� . $ selledEstatesForm��6~   �� 58      -   5        $��cbCurrencies��58   #    .  $��50��6�   $ 
CurrencyID��5:   
   $
 Name��6)   $��5,0,0,0q�6C   ��58   J   �� $ 
Currencies�$ selledEstatesForm�� 59   
   �� $ SearchCriteria.CurrencyID�$ TwoWay=�$ PropertyChanged=�$ selledEstatesForm��5:   C   5;      �� 5<      $��3��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ [IntervalP]�6�   �� 5=      $ 
Horizontal=�6!   $��3��6:   $��1��6G   $��3��6W   $��4,0,0,0q�6k   $
��Left=�6|   $��Center=�6�   .+�5>      (  "System.Windows.Controls.DatePicker  -   5          Name$ 
dpDateFrom��5>   %   $	��145��6l   $��Center=�5?   �      SelectedDate 6	   �� $ SearchCriteria.DateFrom�$ TwoWay=�$ PropertyChanged=� . $ selledEstatesForm��6�   �� 5@      $	�� - ��6$   $��Center=�6/     5A      -   5        $ dpDateTo��5A   %   $	��145��6j   $��Center=�5B   �    6	   �� $ SearchCriteria.DateTo�$ TwoWay=�$ PropertyChanged=� . $ selledEstatesForm��6�   5C      �� 5E      $ 
Horizontal=�6!   $��4��6:   $��3��6G   .+�5F      �� -	   5         ��Name$ 	btnSearch��5F   !   $	��100��5G      ��5F   4   �� # [  $ [Search]�5G      �� 5H      -
   5        $ btnClearSeach��5H   !   $	��100��5I      $	��5,0q�6*   ��5H   8   �� # [  $ [Clear]�5I   *   5J      5K      5L      5M      )   #Microsoft.Windows.Controls.DataGrid  5N   
   -   5          Name$ 	dgEstates��5P   >      AutoGenerateColumns .     CanUserResizeColumns .    CanUserReorderColumns .    CanUserSortColumns . $��1��5O         
IsReadOnly . $��0,3,0,0q�6r   $��Stretch=�5P      $	��Top=�6&   ��5O      �� $ SelledEstates�$ selledEstatesForm�� � ContextMenu 5Q      �� 5R      -   5          ��Name$
  menu��5R      .@�5S      m� -   5        ��5S      �� # [  $ [Open]�6g   m� 5T      -   5        ��5T      �� # [  $ [Edit]�y�5U   
   ��   UserControls.Session!   Inst# Z! $ OfflineMode�" �� 	Converter#" [ # �� ConverterParameter$# !��m� 5V      -   5        ��5V      �� # [  $ [ReturnToEstatesList]�y�5W   
   �� # Z! $ OfflineMode�#" [ $# !��5X      $   Columns$ 5Z      3   -Microsoft.Windows.Controls.DataGridTextColumn  5[      /   )Microsoft.Windows.Controls.DataGridColumn%   Width8	   2Microsoft.Windows.Controls.DataGridLengthConverter$
% Auto	 6�   &   SortMemberPath$
& Code��6�   4
   .Microsoft.Windows.Controls.DataGridBoundColumn' 
  Binding' 6.   �� $ Estate.Code�$ OneWay=�(   Header( 6`   �� # [  $ [Code]�6�     5\      $
% Auto	 5]   .   $& EstateTypeID��6;   ' 5\   .   �� $  Estate.EstateType.TypeName�$ OneWay=�( 6o   �� # [  $ [EstateType]�5]   ;     5^      $
% Auto	 5_   y   )   CanUserSort) .  ' 5^   .   �� $ Estate�$ OneWay=�#" [ ( 5_   .   �� # [  $ 	[Address]�6�     5`      $
% Auto	 5a   .   $& Estate.Street.Name��6;   ' 5`   .   �� $ Estate.Street.Name�$ OneWay=�( 6g   �� # [  $ [Street]�5a   ;     5b      $
% Auto	 6�   ' 6.   �� $ Price�$ OneWay=�( 6Z   �� # [  $ [Price]�6�     5c      $
% Auto	 6�   $& 
CurrencyID��6�   ' 6.   �� $ Currency.Name�$ OneWay=�( 6b   �� # [  $ 
[Currency]�6�     5d      $
% Auto	 6�   ' 6.   �� $ SellDate�$ OneWay=�* �� StringFormat$* {0:dd.MM.yyyy}��( 6|   �� # [  $ 
[SellDate]�6�     5e      $
% Auto	 6�   ' 6.   �� $ User.FullName�$ OneWay=�( 6b   �� # [  $ [Broker]�6�   7   1Microsoft.Windows.Controls.DataGridTemplateColumn  5f      $
% Auto	 6�   ( 62   �� # [  $ [AdditionalDetails]�+   
Visibility+ 5g      �� # Z! $1 +ApplicationSettings.ShowingColumns[16].Show�  BoolToVisibilityConverter#" [ $ PropertyChanged=�$ OneWay=�,   CellTemplate, 5h      �� 5i      .R�5j      �� ��6(   �� $" Estate.AdditionalInformation�$ OneWay=�#" [ - ^� ToolTip- 6�   �� $ AdditionalInformation�5k      5m      5o      �� 5q   
   $��2��6   $ 
Horizontal=�6"   $��Bottom=�6;   $��Right=�6V   $��0,0,10,0q�6r   .+�5r      �� $��Center=�6_   ��6   �� # [  $ [Count]�6_   �� 5s      $
��Bold"�6Q   $��Center=�6c   ��6   �� $ Items.Count�$ 	dgEstates��6c   5t      5u      5v      