   M S B A M L   `   `   `  ����U  QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls  5   @   G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA0clr-namespace:UserControls;assembly=UserControlsUserControls 5   	   A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 5   	    RealEstateApp(   "RealEstateApp.DeletedEstatesWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation       R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     6@   IUserControls0clr-namespace:UserControls;assembly=UserControls     5   	   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     6L   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6�   -   5          �Name$  selledEstatesForm��5       � ShowInTaskbar .  � WindowStartupLocation$ CenterScreen=�69    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   	    � WindowState$ 	Maximized=�6f    � 	Resources 5      7  1Shared.Converters.BoolToVisibilityInvertConverter #  BoolToVisibilityInvertConverterM  GShared.Converters.EstateToEstateFullAddressStringWithoutRegionConverter 9 5EstateToEstateFullAddressStringWithoutRegionConverter��%:   &	        &	        5	   
   65     5
   
   6K   5       � Title 5      �� 5   
    �� Path$ [DeletedEstates]�6     CultureResources �� Source# [ 6*   .��5      � $��3q�6   	 � RowDefinitions	 5   
   �� 5      $
��Auto �6   �� 5      �� 5      $��30 �6   .+�5   
   �� $
��Auto��6   $
��Auto��6   $	��1.3q�6,   
 �� CornerRadius$
 5��6B     NormalBorderBrush#��[ 6S   ._�5      9� $	��600��6a   $
��Left=�6m   $
��Auto��6�   $��3q�6�   ��6   �� *[FilterList]+# [ .��5      � $��3q�6   
�������$	��160��65   $	��Top=�6B    � ColumnDefinitions 5      �� 5      $
��Auto �6+   �� 5      $
��Auto �6+   �� 5      $
��Auto �6+   �� 5      $
��Auto �6+   	 5      �� 5      $��30 �6(   �� 5       $��30 �6(   �� 5!      $��30 �6(   �� 5"      $��30 �6(   �� 5#      $��30 �6(   .+�5&      �� $��0��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� *	[CodeP]+# [ 6�   �� 5'      $��0��6   $��1��6+   $��4,0,0,0q�6;   $
��Left=�5(      $��Center=�6"   $	��200��6=   ��5'   L   �� *SearchCriteria.Code+ �� ElementName$ selledEstatesForm�� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5(   =   �� 5*      $��1��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� *[EstateTypeP]+# [ 6�   �� 5+      -   5        $��1��5+      $��1��6,    �� 
IsEditable .  $��4,0,0,0q�6O    �� SelectedValuePath$ EstateTypeID��5-       �� DisplayMemberPath$ TypeName��6(   $
��Left=�6E   $��Center=�6`   ��5+   `   �� *EstateTypes+$ selledEstatesForm�� �� SelectedValue 5,      �� *SearchCriteria.EstateTypeID+$ selledEstatesForm��$ TwoWay=�$ PropertyChanged=�5-   {   �� 5/      $��1��6    $��2��6-   $��Right=�6�   $��Center=�6�   ��6=   �� *	[RegionP]+# [ 6�   �� 50      -   5        $��1��50      $��3��6,    .  $��4,0,0,0q�6O   $ RegionID��52      $
 Name��6$   $
��Left=�6=   $��Center=�6X   ��50   `   �� *	Regions+$ selledEstatesForm�� 51      �� *SearchCriteria.RegionID+$ selledEstatesForm��$ TwoWay=�$ PropertyChanged=�52   s   �� 54      $��2��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� *
[PriceP]+# [ 6�   �� 55       �� Orientation$ 
Horizontal=�6!   $��2��6:   $��1��6G   $��2��6W   $��4,0,0,0q�6k   $
��Left=�6|   $��Center=�6�   .+�56      �� -   5         ��Name$ txtPriceFrom��56   "   $	��145��6_   $��Center=�57   z   ��6   �� *SearchCriteria.PriceFrom+$ selledEstatesForm��$ TwoWay=� �� ValidatesOnDataErrors . 6z   �� 58      $	�� - ��6$   $��Center=�6/   �� 59      -   5        $ 
txtPriceTo��59   "   $	��145��6]   $��Center=�5:   x   ��6   �� *SearchCriteria.PriceTo+$ selledEstatesForm��$ TwoWay=� . 6x   5;      �� 5<      -   5         ��Name$ cbCurrencies��5<   <   $��2��6   $��3��6,    .  $��50��6�   $ 
CurrencyID��5>      $
 Name��6'   $��5,0,0,0q�6A   ��5<   e   �� *
Currencies+$ selledEstatesForm�� 5=      �� *SearchCriteria.CurrencyID+$ selledEstatesForm��$ TwoWay=�$ PropertyChanged=�5>   A   �� 5?      $��3��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� *[IntervalP]+# [ 6�   �� 5@      $ 
Horizontal=�6!   $��3��6:   $��1��6G   $��2��6W   $��4,0,0,0q�6k   $
��Left=�6|   $��Center=�6�   .+�5A      (  "System.Windows.Controls.DatePicker  -   5          Name$ 
dpDateFrom��5A   %   $	��145��6l   $��Center=�5B   �      SelectedDate 6   �� *SearchCriteria.DateFrom+$ selledEstatesForm��$ TwoWay=�$ PropertyChanged=� . 6�   �� 5C      $	�� - ��6$   $��Center=�6/     5D      -   5        $ dpDateTo��5D   %   $	��145��6j   $��Center=�5E   �    6   �� *SearchCriteria.DateTo+$ selledEstatesForm��$ TwoWay=�$ PropertyChanged=� . 6�   5F      �� 5G      $ 
Horizontal=�6!   $��4��6:   $��0��6G   $��4��6W   $��4,0,0,0q�6k   $��Right=�6|   $��Center=�6�   .+�5H      �� -	   5         ��Name$ btnSeach��5H   !   $	��100��6�   ��63   �� *
[Search]+# [ 6�   �� 5I      -
   5        $ btnClearSeach��5I   !   $	��100��6�   ��68   �� *	[Clear]+# [ 6�   5J      5K      5L      5M      )   #Microsoft.Windows.Controls.DataGrid  5N   
   -   5          Name$ 	dgEstates��5P   :      AutoGenerateColumns .     CanUserResizeColumns .    CanUserReorderColumns .    CanUserSortColumns . $��1��5O         
IsReadOnly . $��0,3,0,0q�6j   $��Stretch=�5P      $	��Top=�6"   ��5O      �� *DeletedEstates+$ selledEstatesForm��  � ContextMenu  5Q      �� 5R      -   5        ! ��Name$
! menu��5R      .@�5S      m� -   5        ��5S      �� *[Open]+# [ 6c   m� 5T      -   5        ��5T      �� *[ReturnToEstatesList]+# [ y�5U      �� *OfflineMode+" �� ConverterParameter$" !��# �� 	Converter## [    UserControls.Session$   Inst# Z$ 5V      %   Columns% 5X      3   -Microsoft.Windows.Controls.DataGridTextColumn  5Y      /   )Microsoft.Windows.Controls.DataGridColumn&   Width8   2Microsoft.Windows.Controls.DataGridLengthConverter$
& Auto 6�   '   SortMemberPath$
' Code��6�   4	   .Microsoft.Windows.Controls.DataGridBoundColumn( 	  Binding( 6.   �� *Code+$ OneWay=�)   Header) 6T   �� *[Code]+# [ 6�     5Z      $
& Auto 6�   $' EstateTypeID��6�   ( 6.   �� *EstateType.TypeName+$ OneWay=�) 6c   �� *[EstateType]+# [ 6�     5[      $
& Auto 6�   $' EstateTypeID��6�   ( 6.   �� *OrderType.Name+$ OneWay=�) 6^   �� *[OrderType]+# [ 6�     5\      $
& Auto 6�   $' Street.Name��6�   ( 6.   �� *Street.Name+$ OneWay=�) 6[   �� *
[Street]+# [ 6�     5]      $
& Auto 6�   *   CanUserSort* .  ( 6.   �� ## [ $ OneWay=�) 6�   �� *	[Address]+# [ 6�     5^      $
& Auto 6�   ( 6.   �� *Price+$ OneWay=�) 6U   �� *	[Price]+# [ 6�     5_      $
& Auto 6�   $' 
CurrencyID��6�   ( 6.   �� *Currency.Name+$ OneWay=�) 6]   �� *
[Currency]+# [ 6�     5`      $
& Auto 6�   ( 6.   �� *LastModifiedDate+$ OneWay=�+ �� StringFormat$+ {0:dd.MM.yyyy}��) 6   �� *[DeleteDate]+# [ 6�   5c      �� 5e   
   $��2��6   $ 
Horizontal=�6"   $��Bottom=�6;   $��Right=�6V   $��0,0,10,0q�6r   .+�5f      �� $
��Bold"�6L   $��Center=�6^   ��6   �� *Items.Count+$ 	dgEstates��6^   5g      5h      5i      