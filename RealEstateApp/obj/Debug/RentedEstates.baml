   M S B A M L   `   `   `  ����U  QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls  5   @   A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 6�   G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA0clr-namespace:UserControls;assembly=UserControlsUserControls 5   	    RealEstateApp!   RealEstateApp.RentedEstates   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation       5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     6@   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     6�   IUserControls0clr-namespace:UserControls;assembly=UserControls     5   	   -   5          �Name$  rentedEstatesForm��5   r   $	��800��6Y   $	��900��6f    � WindowState$ 	Maximized=�6�    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   +    � Title 5   	   ��    CultureResources �� Source# [   �� Path$ [RentedEstates]� � 	Resources 5      2  ,Shared.Converters.StringEmptyToNullConverter  StringEmptyToNullConverter7  1Shared.Converters.BoolToVisibilityInvertConverter # BoolToVisibilityInvertConverterM  GShared.Converters.EstateToEstateFullAddressStringWithoutRegionConverter 9 5EstateToEstateFullAddressStringWithoutRegionConverter��%W   &	       &	      &	 &       5   
   60     5	   
   65     5
   
   6K   5      .��5      � $��3q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      �� 5      $��30 �6   .+�5   
   �� $
��Auto��6   $
��Auto��6   $	��1.3q�6,    �� CornerRadius$ 5��6B     NormalBorderBrush#��[ 6S   ._�5      9� $	��600��6e   $
��Left=�6q   $
��Auto��6�   $��3q�6�   ��6   �� # [  $ [FilterList]�.��5      � $��3q�6   
�������$	��190��65   $	��Top=�6B   	 � ColumnDefinitions	 5      �� 5      $
��Auto �6+   �� 5      �� 5      $
��Auto �6+   �� 5       5      �� 5      $��30 �6(   �� 5      $��30 �6(   �� 5      $��30 �6(   �� 5      $��30 �6(   �� 5       $��30 �6(   �� 5!      $��30 �6(   .+�5$      �� $��0��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ [EstateTypeP]�6�   �� 5%      -   5        $��0��5%      $��1��6,   
 �� 
IsEditable
 .  $��4,0,0,0q�6O    �� SelectedValuePath$ EstateTypeID��5'   	    �� DisplayMemberPath$ TypeName��6*   $
��Left=�6G   $��Center=�6b   ��5%   `   �� $ EstateTypes� �� ElementName$ rentedEstatesForm�� �� SelectedValue 5&   	   �� $! SearchCriteria.EstateTypeID� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�$ rentedEstatesForm��5'   }   �� 5)      $��0��6    $��2��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ 	[RegionP]�6�   �� 5*      -   5        $��0��5*      $��3��6,   
 .  $��4,0,0,0q�6O   $ RegionID��5,   	   $
 Name��6&   $
��Left=�6?   $��Center=�6Z   ��5*   `   �� $ Regions�$ rentedEstatesForm�� 5+   	   �� $ SearchCriteria.RegionID�$ TwoWay=�$ PropertyChanged=�$ rentedEstatesForm��5,   u   �� 5.      $��1��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ [PriceP]�6�   �� 5/       �� Orientation$ 
Horizontal=�6!   $��1��6:   $��1��6G   $��3��6W   $��4,0,0,0q�6k   $
��Left=�6|   $��Center=�6�   .+�50      �� -   5         ��Name$ txtPriceFrom��50   "   $	��145��6_   $��Center=�51   �   ��6	   �� $ SearchCriteria.PriceFrom�$ TwoWay=� �� ValidatesOnDataErrors . $ rentedEstatesForm�� �� 	Converter# [ 6�   �� 52      $	�� - ��6$   $��Center=�6/   �� 53      -   5        $ 
txtPriceTo��53   "   $	��145��6]   $��Center=�54   ~   ��6	   �� $ SearchCriteria.PriceTo�$ TwoWay=� . $ rentedEstatesForm��6~   �� 55      -   5        $��cbCurrencies��55   #   
 .  $��50��6�   $ 
CurrencyID��57   
   $
 Name��6)   $��5,0,0,0q�6C   ��55   J   �� $ 
Currencies�$ rentedEstatesForm�� 56   
   �� $ SearchCriteria.CurrencyID�$ TwoWay=�$ PropertyChanged=�$ rentedEstatesForm��# [ 57   C   58      �� 5:      $��2��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ [PricePerDayP]�6�   �� 5;      $ 
Horizontal=�6!   $��2��6:   $��1��6G   $��3��6W   $��4,0,0,0q�6k   $
��Left=�6|   $��Center=�6�   .+�5<      �� -   5        $ txtPricePerDayFrom��5<   "   $	��145��6e   $��Center=�5=   �   ��6	   �� $$ SearchCriteria.PricePerDayFrom�$ TwoWay=� . $ rentedEstatesForm��# [ $ PropertyChanged=�6�   �� 5>      $	�� - ��6$   $��Center=�6/   �� 5?      -   5        $ txtPerDayPriceTo��5?   "   $	��145��6c   $��Center=�5@   �   ��6	   �� $" SearchCriteria.PricePerDayTo�$ TwoWay=� . $ rentedEstatesForm��# [ 6�   �� 5A      $��3,0,0,0q�6f   $��Center=�6w   ��6$   �� $ SelectedItem.Name�$ cbCurrencies��6w   5B      �� 5D      $��3��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ [IntervalStartP]�6�   �� 5E      $ 
Horizontal=�6!   $��3��6:   $��1��6G   $��3��6W   $��4,0,0,0q�6k   $
��Left=�6|   $��Center=�6�   .+�5F      (  "System.Windows.Controls.DatePicker  -	   5          Name$ 
dpDateFrom��5F   %   $	��145��6l   $��Center=�5G   �      SelectedDate 6	   �� $ SearchCriteria.DateFrom�$ TwoWay=�$ PropertyChanged=� . $ rentedEstatesForm��6�   �� 5H      $	�� - ��6$   $��Center=�6/     5I      -
   5        $ dpDateTo��5I   %   $	��145��6j   $��Center=�5J   �    6	   �� $ SearchCriteria.DateTo�$ TwoWay=�$ PropertyChanged=� . $ rentedEstatesForm��6�   5K      �� 5M      $��4��6    $��0��6-   $��Right=�6�   $��Center=�6�   ��6=   �� # [  $ [IntervalEndP]�6�   �� 5N      $ 
Horizontal=�6!   $��4��6:   $��1��6G   $��3��6W   $��4,0,0,0q�6k   $
��Left=�6|   $��Center=�6�   .+�5O        -   5        $ dpDateEndFrom��5O   %   $	��145��6o   $��Center=�5P   �    6	   �� $  SearchCriteria.EndDateFrom�$ TwoWay=�$ PropertyChanged=� . $ rentedEstatesForm��6�   �� 5Q      $	�� - ��6$   $��Center=�6/     5R      -   5        $ dpDateEndTo��5R   %   $	��145��6m   $��Center=�5S   �    6	   �� $ SearchCriteria.EndDateTo�$ TwoWay=�$ PropertyChanged=� . $ rentedEstatesForm��6�   5T      �� 5V      -   5         ��Name$ btnClearSeach��5V      $��5��6�   $��3��6�   $	��100��6�   ��64   �� # [  $ [Clear]�6�   5W      5X      5Y      )   #Microsoft.Windows.Controls.DataGrid  5[   
   -   5          Name$ 	dgEstates��5]   A      AutoGenerateColumns .     CanUserResizeColumns .    CanUserReorderColumns .    CanUserSortColumns . $��1��5[   �      
IsReadOnly . $��0,3,0,0q�5\   f   $��Stretch=�5]      $	��Top=�6)   ��5\      �� $ RentEstates�$ rentedEstatesForm�� � ContextMenu 5^      �� 5_      -   5         ��Name$
 menu��5_      .@�5`      m� -   5        ��5`      �� # [  $ [Open]�6g   m� 5a      -   5        ��5a      �� # [  $ [Edit]�y�5b   
   ��   UserControls.Session    Inst# Z  $ OfflineMode�# [ ! �� ConverterParameter$! !��m� 5c      -   5        ��5c      �� # [  $ [Delete]�y�5d   
   �� # Z  $ OfflineMode�# [ $! !��m� 5e      -   5        ��5e      �� # [  $ [ReturnToEstatesList]�y�5f   
   �� # Z  $ OfflineMode�# [ $! !��5g      "   Columns" 5i      3   -Microsoft.Windows.Controls.DataGridTextColumn  5j      /   )Microsoft.Windows.Controls.DataGridColumn#   Width8	   2Microsoft.Windows.Controls.DataGridLengthConverter$
# Auto	 5k   v   $   SortMemberPath$
$ Code��6�   4
   .Microsoft.Windows.Controls.DataGridBoundColumn% 
  Binding% 5j   .   �� $ Estate.Code�$ OneWay=�&   Header& 5k   .   �� # [  $ [Code]�6�     5l      $
# Auto	 5m      $$ EstateTypeID��6�   % 5l   .   �� $  Estate.EstateType.TypeName�$ OneWay=�& 5m   .   �� # [  $ [TheEstateType]�6�     5n      $
# Auto	 5o   y   '   CanUserSort' .  % 5n   .   �� $ Estate�$ OneWay=�# [ & 5o   .   �� # [  $ 	[Address]�6�     5p      $
# Auto	 5q   x   $$ Estate.Street.Name��6�   % 5p   .   �� $ Estate.Street.Name�$ OneWay=�& 5q   .   �� # [  $ [Street]�6�     5r      $
# Auto	 5s   w   % 5r   .   �� $ Price�$ OneWay=�& 5s   .   �� # [  $ [Price]�6w     5t      $
# Auto	 5u   }   % 5t   .   �� $ PricePerDay�$ OneWay=�& 5u   .   �� # [  $ [PricePerDay]�6}     5v      $
# Auto	 5w   }   $$ 
CurrencyID��6�   % 5v   .   �� $ Currency.Name�$ OneWay=�& 5w   .   �� # [  $ [TheCurrency]�6�     5x      $
# Auto	 5y   v   % 5x   .   �� $ 	StartDate�$ OneWay=�( �� StringFormat$( {0:dd.MM.yyyy}��& 5y   .   �� # [  $ [From]�6v     5z      $
# Auto	 5{   t   % 5z   .   �� $ EndDate�$ OneWay=�$( {0:dd.MM.yyyy}��& 5{   .   �� # [  $
 [To]�6t     5|      $
# Auto	 5}   x   % 5|   .   �� $ User.FullName�$ OneWay=�& 5}   .   �� # [  $ [Broker]�6x   5      � 5�   
   $��2��6   	 5�      �� 5�      �� 5�      .+�5�      �� $ 
Horizontal=�6   $
��Left=�62   $��Center=�6M   .+�5�      �� $��Center=�6c   ��6   �� # [  $ [Count]�6c   �� 5�      $
��Bold"�6U   $��Center=�6g   ��6   �� $ Items.Count�$ 	dgEstates��6g   5�      �� 5�      -   5        $ 	btnCancel��5�      $��10,0,0,0q�5�      $��Right=�6'   $��1��6C   $��Center=�6S   ��5�   (   �� # [  $ [Close]�5�   S   5�      5�      5�      