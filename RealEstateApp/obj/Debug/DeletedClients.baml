   M S B A M L   `   `   `  ����U  QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls  5   	   G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA0clr-namespace:UserControls;assembly=UserControlsUserControls 5   	   A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 5   	    RealEstateApp"   RealEstateApp.DeletedClients   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation       5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     5   	   IUserControls0clr-namespace:UserControls;assembly=UserControls     5   	   F
converters/clr-namespace:Shared.Converters;assembly=Shared     5   	   -   5          �Name$  deletedClients��5   Z    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   E    � WindowState$ 	Maximized=�6�    � Title 5   	   ��    CultureResources �� Source# [   �� Path$ [DeletedClients]� � 	Resources 5	      :  4Shared.Converters.NeededEstateTypesToStringConverter & "NeededEstateTypesToStringConverter6  0Shared.Converters.NeededRegionsToStringConverter " NeededRegionsToStringConverter5  /Shared.Converters.UserToTranslatedUserConverter ! UserToTranslatedUserConverter/  )Shared.Converters.IsRentToStringConverter  IsRentToStringConverter2  ,Shared.Converters.StringEmptyToNullConverter  NullToStringEmptyConverter5  /Shared.Converters.StringToOneRowStringConverter ! StringToOneRowStringConverter1  +Shared.Converters.BoolToVisibilityConverter  BoolToVisibilityConverter6  0Shared.Converters.NeededRemontsToStringConverter " NeededRemontsToStringConverter7	  1Shared.Converters.NeededProjectsToStringConverter #	 NeededProjectsToStringConverter<
  6Shared.Converters.NeededBuildingTypesToStringConverter (
 $NeededBuildingTypesToStringConverterD  >Shared.Converters.IsAdminOrDirectorToObjectVisibilityConverter 0 ,IsAdminOrDirectorToObjectVisibilityConverter��%?  &	       &	      &	 &     &	 9     &	 L     &	 _     &	 r     &	 �     &		 �     &	
 �     &	 �       5
   
   68     5   
   64     5   
   63     5   
   6-     5   
   60     5   
   63     5   
   6/     5   
   64   	  5   
   65   
  5   
   6:     5   
   6B   5      .��5      � $��3q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      �� 5      $��30 �6   .+�5   
   �� $
��Auto��6   $
��Auto��6   $	��1.3q�6,    �� CornerRadius$ 5��6B     NormalBorderBrush#��[ 6S   ._�5      9� $��Stretch=�6a   $
��Auto��6   $��3q�6�   ��6   �� *[FilterList]+# [  .��5      �� $
��Auto=�6   $
��Auto=�6D   .��5       � 	 � DataContext	 6   �� $ SearchParameters�
 �� ElementName$
 deletedClients�� 5!      �� 5"      $��30 �6,   .+�5$      ��  �� Orientation$ 
Horizontal=�6%   .+�5&      �� $��Center=�6o   ��6(   �� # [  $ [CodeP]�6o   �� 5'      -   5        $��txtCode��5'   2   $	��150��6&   ��6A   �� $
 Code� �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors .  �� Mode$ TwoWay=�6�   �� 5)      $��5,0,5,0q�6o   $��Center=�6�   ��6(   �� # [  $ [NameP]�6�   �� 5*      -   5         ��Name$ txtName��5*   2   $	��250��6&   ��6C   �� $
 Name�$ TwoWay=�$ PropertyChanged=�6�   �� 5,      $��7,0,5,0q�6t   $��Center=�6�   ��6(   �� # [  $ [TelephoneP]�6�   �� 5-      -   5        $ txtPhone��5-   2   $	��200��6&   ��6D   �� $ Phone�$ TwoWay=�$ PropertyChanged=�6�   �� 5/      -   5         ��Name$ 	btnSearch��5/   %   $��30��6P   $��30��6\   $��	10,0,10,0q�6g   $��Right=�50      ��6+   Z�  � ToolTip 6<   �� # [  $ [Search]�.��51   "   �� $?��9pack://application:,,,/Shared;component/Images/Search.png��6(   52      �� 54      -   5        $ btnClear��54   %   $��30��6N   $��30��6Z   $��	10,0,10,0q�6e   $��Right=�55      ��6+   Z�  6<   �� # [  $ [Clear]�.��56   "   �� $D��>pack://application:,,,/Shared;component/Images/ClearSearch.png��6(   57      5:      5;      5<      5=      5>      )   #Microsoft.Windows.Controls.DataGrid  5@   
   -   5          Name$ dgNeededEstates��5B   L      AutoGenerateColumns .     CanUserResizeColumns .    CanUserReorderColumns .    CanUserSortColumns .    
IsReadOnly .    SelectionMode$ Extended=�5A   j   $��1��6�   $��Stretch=�5B      $	��Top=�64   ��5A      �� $ Clients�$
 deletedClients�� � ContextMenu 5C      �� 5D      -   5         ��Name$ 
mnuDemands��5D        ContextMenuVisibility#y��  62   .@�5E      m� -	   5        ��5E      �� # [  $ [Open]�6g   m� 5F      -
   5         m�Name$ mnuReturnToDemands��5F      ��6;   �� # [  $ [ReturnToDemandsList]�y�5G      `� 5H       `� 	Converter# [ 6+   .1�5I   "   ��   UserControls.Session   Inst# Z 6*   $ User.IsAdminOrDirector�6X   �� 5J   "   # Z 6*   $ OfflineMode�6X   5K      5M      5N         Columns 5P      3   -Microsoft.Windows.Controls.DataGridTextColumn  5Q      /   )Microsoft.Windows.Controls.DataGridColumn   SortMemberPath$
 Code��6�       Width8   2Microsoft.Windows.Controls.DataGridLengthConverter$
  Auto 6�   4   .Microsoft.Windows.Controls.DataGridBoundColumn!   Binding! 6.   �� $
 Code�$ OneWay=�"   Header" 6Y   �� # [  $ [Code]�6�     5R      $ User.FullName��6�   $
  Auto 6�   ! 6.   �� $
 User�$ OneWay=�# �� 	Converter## [ " 6�   �� # [  $ [Broker]�6�     5S      $
  Auto 6�   ! 6.   �� $ IsNeedForRent�$ OneWay=�## [ " 6�   �� # [  $ 	[OrdType]�6�     5T      $
  Auto 6�   $   CanUserSort$ .  ! 6.   �� $ NeededEstateTypes�$ OneWay=�## [ " 6�   �� # [  $ [EstateType]�6     5U      $
  Auto 6�   ! 6.   �� $ RoomsCountInterval�$ OneWay=�" 6g   �� # [  $ [Room]�6�     5V      $
  Auto 6�   ! 6.   �� $ SquareInterval�$ OneWay=�" 6c   �� # [  $ [Square]�6�     5W      $
  Auto 6�   ! 6.   �� $ FloorInterval�$ OneWay=�" 6b   �� # [  $ [Floor]�6�     5X      $
  Auto 6�   ! 6.   �� $ PriceInterval�$ OneWay=�" 6b   �� # [  $ [Price]�6�     5Y      $
  Auto 6�   ! 6.   �� $ Currency.Name�$ OneWay=�" 6b   �� # [  $ 
[Currency]�6�     5Z      $
  Auto 6�   $ .  ! 6.   �� $ NeededRegions�$ OneWay=�## [ " 6�   �� # [  $ [StateOrRegion]�6�     5[      $
  Auto 6�   ! 6.   �� $ 	BuyerInfo�$ OneWay=�" 6^   �� # [  $ [Client]�6�     5\      $
  Auto 6�   ! 6.   �� $ AddDate�$ OneWay=�% �� StringFormat$% {0:dd.MM.yyyy}��" 6{   �� # [  $ [Added]�6�     5]      $
  Auto 6  ! 6.   �� $ LastModifiedDate�$ OneWay=�## [ $% {0:dd.MM.yyyy}��" 6�   �� # [  $ 	[Updated]�6  7   1Microsoft.Windows.Controls.DataGridTemplateColumn  5^      $
  Auto 6   " 62   �� # [  $ [AdditData]�&   CellTemplate& 5_      �� 5`      .R�5a      �� ��6(   �� $ AdditionalDetails�$ OneWay=�## [ ' ^� ToolTip' 6�   �� $ AdditionalDetails�5b      5d        5e      $
  Auto 6�   $ .  ! 6.   �� $ RemontsList�$ OneWay=�## [ " 6�   �� # [  $ [TheRoomState]�6�     5f      $
  Auto 6�   $ .  ! 6.   �� $ ProjectsList�$ OneWay=�## [	 " 6�   �� # [  $ [BuildingProject]�6�     5g      $
  Auto 6�   $ .  ! 6.   �� $ BuildingTypesList�$ OneWay=�## [
 " 6�   �� # [  $ [BuildingType]�6  5i      � 5k   
   $��2��6   $��Bottom=�6   $��Stretch=�67   $��0,0,10,0q�6U   ( � ColumnDefinitions( 5l      �� 5m      �� 5n      .+�5p      �� $
��Bold"�6W   $��Center=�6i   $
��Left=�6�   $��10,0,0,0q�6�   ��6   �� $ Items.Count�$
 dgNeededEstates��6�   �� 5q      -   5        $ btnOk��5q      $��1��6n   $��Right=�6�   $	��100��6�   $��0,0,10,0q�6�   ��6$   �� # [  $ [Close]�6�   5r      5s      5t      