   M S B A M L   `   `   `  ����U  QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35[<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkitMicrosoft.Windows.Controls  5      A =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters 5	   
   G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:UserControlsUserControls 6M   "   UserControls.FavoriteClients   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation       5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      QControls<clr-namespace:Microsoft.Windows.Controls;assembly=WPFToolkit     5      F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5	   
   3UserControlsclr-namespace:UserControls     6M   -   5          >�Name$  demands��5	   }   
���   � � 	Resources 5
      :  4Shared.Converters.NeededEstateTypesToStringConverter &  "NeededEstateTypesToStringConverter6  0Shared.Converters.NeededRegionsToStringConverter " NeededRegionsToStringConverter5  /Shared.Converters.UserToTranslatedUserConverter ! UserToTranslatedUserConverter/  )Shared.Converters.IsRentToStringConverter  IsRentToStringConverter2  ,Shared.Converters.StringEmptyToNullConverter  NullToStringEmptyConverter5  /Shared.Converters.StringToOneRowStringConverter ! StringToOneRowStringConverter1  +Shared.Converters.BoolToVisibilityConverter  BoolToVisibilityConverter6  0Shared.Converters.NeededRemontsToStringConverter " NeededRemontsToStringConverter7	  1Shared.Converters.NeededProjectsToStringConverter # NeededProjectsToStringConverter<
  6Shared.Converters.NeededBuildingTypesToStringConverter (	 $NeededBuildingTypesToStringConverterD  >Shared.Converters.IsAdminOrDirectorToObjectVisibilityConverter 0
 ,IsAdminOrDirectorToObjectVisibilityConverter��%?  &	        &	      &	 &     &	 9     &	 L     &	 _     &	 r     &	 �     &	 �     &		 �     &	
 �       5   
   68     5   
   64     5   
   63     5   
   6-     5   
   60     5   
   63     5   
   6/     5   
   64   	  5   
   65   
  5   
   6:     5   
   6B   5      .��5      � $��3q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      .+�5   
   )   #Microsoft.Windows.Controls.DataGrid  -   5          Name$ dgNeededEstates��5    L      AutoGenerateColumns .     CanUserResizeColumns .    CanUserReorderColumns .    CanUserSortColumns .    
IsReadOnly . 	   SelectionMode$	 Extended=�5   i   $��2��6�   $��Stretch=�5       $	��Top=�64   ��5      �� 
 �� Path$
 NeededEstates� �� ElementName$ demands�� � ContextMenu 5!      �� 5"      -   5         ��Name$ 
mnuDemands��5"        ContextMenuVisibility#y��  62   .@�5#      m� -   5        ��5#      ��   CultureResources �� Source# [ $
 [Open]�6g   m� 5$      -   5         m�Name$ 	mnuDelete��5$      ��62   �� # [ $
 [RemoveFromThisList]�6�   m� 5%      -   5        $ mnuShowResult��5%      ��66   �� # [ $
 [SelectEstates]�6�   m� 5&      -   5        $ mnuSelectShowEstate��5&      ��6<   �� # [ $
 [ShowEstate]�y�5'      `� 5(       `� 	Converter# [
 6+   .1�5)   "   ��   UserControls.Session   Inst# Z 6*   $
 User.IsAdminOrDirector�6X   �� 5*   "   # Z 6*   $
 OfflineMode�6X   5+      5-      5.         Columns 50      3   -Microsoft.Windows.Controls.DataGridTextColumn  51      /   )Microsoft.Windows.Controls.DataGridColumn   SortMemberPath$
 Code��6�      Width8   2Microsoft.Windows.Controls.DataGridLengthConverter$
 Auto 6�   4   .Microsoft.Windows.Controls.DataGridBoundColumn   Binding 6.   �� $

 Code� �� Mode$ OneWay=�   Header 6Y   �� # [ $
 [Code]�6�     52      $ User.FullName��6�   $
 Auto 6�    6.   �� $

 User�$ OneWay=� �� 	Converter# [  6�   �� # [ $
 [Broker]�6�     53      $
 Auto 6�    6.   �� $
 IsNeedForRent�$ OneWay=�# [  6�   �� # [ $
 	[OrdType]�6�     54      $
 Auto 6�      CanUserSort .   6.   �� $
 NeededEstateTypes�$ OneWay=�# [   6�   �� # [ $
 [EstateType]�6     55      $
 Auto 6�    6.   �� $
 RoomsCountInterval�$ OneWay=� 6g   �� # [ $
 [Room]�6�     56      $
 Auto 6�    6.   �� $
 SquareInterval�$ OneWay=� 6c   �� # [ $
 [Square]�6�     57      $
 Auto 6�    6.   �� $
 FloorInterval�$ OneWay=� 6b   �� # [ $
 [Floor]�6�     58      $
 Auto 6�    6.   �� $
 PriceInterval�$ OneWay=� 6b   �� # [ $
 [Price]�6�     59      $
 Auto 6�    6.   �� $
 Currency.Name�$ OneWay=� 6b   �� # [ $
 
[Currency]�6�     5:      $
 Auto 6�    .   6.   �� $
 NeededRegions�$ OneWay=�# [  6�   �� # [ $
 [StateOrRegion]�6�     5;      $
 Auto 6�    6.   �� $
 	BuyerInfo�$ OneWay=� 6^   �� # [ $
 [Client]�6�     5<      $
 Auto 6�    6.   �� $
 AddDate�$ OneWay=� �� StringFormat$ {0:dd.MM.yyyy}�� 6{   �� # [ $
 [Added]�6�     5=      $
 Auto 6   6.   �� $
 LastModifiedDate�$ OneWay=�# [ $ {0:dd.MM.yyyy}�� 6�   �� # [ $
 	[Updated]�6  7   1Microsoft.Windows.Controls.DataGridTemplateColumn  5>      $
 Auto 6    62   �� # [ $
 [AdditData]�   CellTemplate 5?      �� 5@      .R�5A      �� ��6(   �� $
 AdditionalDetails�$ OneWay=�# [  ^� ToolTip 6�   �� $
 AdditionalDetails�5B      5D        5E      $
 Auto 6�    .   6.   �� $
 NeededRemonts�$ OneWay=�# [  6�   �� # [ $
 [TheRoomState]�6�     5F      $
 Auto 6�    .   6.   �� $
 NeededProjects�$ OneWay=�# [  6�   �� # [ $
 [BuildingProject]�6�     5G      $
 Auto 6�    .   6.   �� $
 NeededBuildingTypes�$ OneWay=�# [	  6�   �� # [ $
 [BuildingType]�6  5I      5K      5L      