   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5      C ?FluidKit, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG1clr-namespace:FluidKit.Controls;assembly=FluidKitFluidKit.Controls 5      P LRealEstate.DataAccess, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\Bclr-namespace:RealEstate.DataAccess;assembly=RealEstate.DataAccessRealEstate.DataAccess 5      G CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:UserControlsUserControls 6[      UserControls.EstateView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R	 NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml 	    5      F
Converters/clr-namespace:Shared.Converters;assembly=Shared 	    5      KFluidControls1clr-namespace:FluidKit.Controls;assembly=FluidKit 	    5      Y
DataAccessBclr-namespace:RealEstate.DataAccess;assembly=RealEstate.DataAccess 	    5      3UserControlsclr-namespace:UserControls 	    6[   -   5          �Name$  
estateView��5   �    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5      
���   � � WindowState$ 	Maximized=�5       � WindowStyle$ SingleBorderWindow=�6    � Title 5   ^   ��  �� Path$ REstate� �� ElementName$ 
estateView�� � 	Resources 5	      2   ,Shared.Converters.EstateToFloorViewConverter   EstateToFloorViewConverter1   +Shared.Converters.NullToVisibilityConverter  NullToVisibilityConverter8   2Shared.Converters.VideoObjToVideoFilePathConverter $  VideoObjToVideoFilePathConverter  ReflectionBrush �� 
StartPoint	 �� EndPoint
 � Offset � Color  TestDataTemplate �� DataType'  !RealEstate.DataAccess.EstateImage ��Name �� Padding  TestDataTemplate_Reflection � RowDefinitions J� OpacityMask !� Visual �� RelativeTransform �� ScaleX �� ScaleY �� CenterX �� CenterY  ItemTemplate �� CornerRadius+   %Shared.Converters.BoolInvertConverter  BoolInvertConverterC   =Shared.Converters.BoolToVideoPlayerButtonImageSourceConverter / +BoolToVideoPlayerButtonImageSourceConverter8   2Shared.Converters.StrignEmptyToVisibilityConverter $	  StrignEmptyToVisibilityConverter0   *Shared.Converters.IntToVisibilityConverter 
 IntToVisibilityConverter6	   0Shared.Converters.EstateToSquaresStringConverter " EstateToSquaresStringConverter:
   4Shared.Converters.EstateToFullAddressStringConverter & "EstateToFullAddressStringConverter9   3Shared.Converters.EstateToRoomsCountStringConverter % !EstateToRoomsCountStringConverter7   1Shared.Converters.CollectionToVisibilityConverter # CollectionToVisibilityConverter��%  &	        &	      &	 &     &	 9     &	 �     &	 �    7  &	 �    &	 �    &	 �    &		      &	
     &	 &    &	 9    &	 L    &	 _      5
   
   60     5   
   6/     5   
   66   �� 5   
   $	 0,0&�5      $		 0,1&�5      .��5      � $
 0Q�6   $ 	#7F000000��5      � 5      $
 .5Q�6   $ Transparent��5      5      �� 5   
   "  60   .R�5      �� $ ElementVisual��6   
�������$ 5q�6?   $��5q�6K   
�������$��0��5   -   ._�5      �� $
��Fill=�6+   ��6   �� 6+   5      5      �� 5   
   .R�5       �  5!      �� 5"      $
��0.5* �6$   �� 5#      $
��0.5* �6$   .+�5&      �� $ ElementVisual��6   $��2q�5'      
�������
���   �$ 2q�5*      ._�5+      �� $
��Fill=�5,      ��5+      �� 5,      5-      �� 5.      8   $��1��5/      ��50      �� *ActualHeight+$ ElementVisual����51      !� 52       6&   �� $ ElementVisual�� 53      �� 54   "   $ 1Q�61   $ -1Q�55   1   $	 0.5Q�56   1   $	 0.5Q�57   1   59      5;      5<      5=      �� 5>   
   .R�5?      �� ���	#FFB1B1B1$��2q�5@      ���	#7FFFFFFF$ 0,20,0,0q�5B      $ 3��5C      ._�5D      �� $
��Left=�5E      $	��Top=�5F      $
��Fill=�5G      ��5D      �� *Image+5G      5H      5I        5J   
   6)     5K   
   6A     5L   
   66     5M   
   6.   	  5N   
   64   
  5O   
   68     5P   
   67     5Q   
   65   5R       � ContextMenu 5S      �� 5T   
   .@�5U      m� -   5        ��5U      ��   CultureResources �� Source# [ $ [Copy]�6_   5V      .��5X      �� $
��Auto=�6   $
��Auto=�68   .��5Y   
   � $��3q�6L    � DataContext 6   �� $ REstate�$ 
estateView�� � ColumnDefinitions 5Z      �� 5[      �� 5\      $��10 �6#   �� 5]       5_      �� 5`      $
��Auto �6    �� 5b      $
��Auto �6    �� 5c      $
��Auto �6    �� 5d      $
��Auto �6    �� 5e      $
��Auto �6    �� 5f      $
��Auto �6    �� 5g      �� 5h      $��30 �6    .+�5j      �� $��3��6   .+�5k      ��  �� Orientation$ 
Horizontal=�6   $��Center=�66   $��40��6T   $	��Top=�6`   .+�5l      �� $ 
Horizontal=�6!   $��Center=�6:   $��40��6X   $	��Top=�6d   y�5m      �� $ Price� �� 	Converter# [ .+�5n      �� ��6$   �� # [ $ [PriceP]��� 5o      $��3,0,0,0q�6@   $
��Bold"�6R   ��6$   �� $ Price�6R   �� 5p      $��3,0,0,0q�6H   $
��Bold"�6Y   ��6$   �� $ Currency.Name�6Y   5q      �� 5s      $ 
Horizontal=�6!   $��Center=�6:   $	��Top=�6W   $��40��6o   y�5t      �� $ 	OldPrices�# [ .+�5u      �� ��6'   �� $ 	OldPrices���5v      �� 5w   "   .R�5x   &   � 5y   #   ��5{      �� 5|   "   .R�5}   &   �� $ Vertical=�61   .+�5~   *   �� $ 
Horizontal=�65   .+�5   .   �� 
���  ��$��Strikethrough{�6i   $��10,0,0,0q�6�   $
��Bold"�6�   ��68   �� $ 	OldPrice1�6�   �� 5�   .   $��5,0,0,0q�6\   
���  ��$��Strikethrough{�6~   $
��Bold"�6�   ��68   �� $ Currency.Name�6�   5�   +   �� 5�   *   
���  ��$��0,-2,0,0q�6�   $��Center=�6�   $��10(�6�   ��64   �� $ 
ChangeDate� �� StringFormat$ 
dd.MM.yyyy��6�   5�   '   5�   #   5�      5�      5�      �� 5�      $ 
Horizontal=�6   $��Center=�66   $��40��6T   $	��Top=�6`   y�5�      �� $ PricePerDay�# [ .+�5�      �� ��6    �� # [ $ [PricePerDayP]��� 5�      $��3,0,0,0q�6B   $
��Bold"�6T   ��6    �� $ PricePerDay�6T   �� 5�      $��3,0,0,0q�6D   $
��Bold"�6U   ��6    �� $ Currency.Name�6U   5�      5�      � 5�      $��1��6    5�      �� 5�      $
��Auto �6'   �� 5�      $��5 �6'   �� 5�      $��* �6'    5�      �� 5�      $��30 �6$   �� 5�      $��30 �6$   �� 5�      $��30 �6$   �� 5�      $��30 �6$   �� 5�      $
��Auto �6$   �� 5�      $
��Auto �6$   .+�5�      �� $��Center=�6i   $��Right=�6�   ��6   �� # [ $ [SellOrRentP]�6�   �� 5�      $��2��6A   $
��Bold"�6Q   $��Center=�6c   ��6   �� $ OrderType.Name�6c   �� 5�      $��1��6l   $��Center=�6y   $��Right=�6�   ��6   �� # [ $ [TheEstateTypeP]�6�   �� 5�      $��2��6F   $��1��6V   $
��Bold"�6c   $��Center=�6u   ��6   �� $ EstateType.TypeName�6u   �� 5�      $��2��6f   $��Center=�6s   $��Right=�6�   ��6   �� # [ $ 
[AddressP]�6�   �� 5�      $��2��6E   $��2��6U   $
��Bold"�6b   $��Center=�6t   ��6   �� $ ShortAddressString�6t   �� 5�      $��3��6f   $��Center=�6s   $��Right=�6�   ��6   �� # [ $ 
[RoofingP]�6�   �� 5�      $��2��6:   $
��Bold"�6J   $��Center=�6\   $
��Left=�6w   $��3��6�   ��6   �� $ Roofing�6�   �� 5�      $��4��6n   $	��Top=�6{   $��Right=�6�   ��6   �� # [ $ [ExchangePosibleP]�6�   �� 5�      $��2��6?   $��4��6O   $
��Bold"�6\   $��Center=�6n   ��6   �� $ ExchangeWith�6n   �� 5�      $��5��6m   $	��Top=�6z   $��Right=�6�   ��6   �� # [ $ [AdditionalDataP]�6�   �� 5�      $��2��6H   $��5��6X   $
��Bold"�6e   $��Center=�6w   $
��Wrap=�6�   $	��500��6�   ��6   �� $ AdditionalInformation�6�   5�      � 5�      $��2��6   $��1��6#    5�      �� 5�      $
��Auto �6'   �� 5�      $��5 �6'   �� 5�      $��* �6'    5�      �� 5�      $��30 �6$   �� 5�      $��30 �6$   �� 5�      $��30 �6$   �� 5�      $��30 �6$   �� 5�      $��30 �6$   �� 5�      $��30 �6$   .+�5�      �� $��Center=�6e   $��Right=�6�   ��6   �� # [ $ 	[SquareP]�6�   �� 5�      $��2��6g   $
��Bold"�6w   $��Center=�6�   ��6   �� # [ 6�   �� 5�      $��1��6h   $��Center=�6u   $��Right=�6�   ��6   �� # [ $ [RoomCountP]�6�   �� 5�      $��2��6j   $
��Bold"�6z   $��Center=�6�   $
��Left=�6�   $��1��6�   ��6   �� # [ 6�   �� 5�      $��Center=�6d   $��Right=�6   $��2��6�   ��6   �� # [ $ [FloorP]�6�   �� 5�      $��2��6c   $��2��6p   $
��Bold"�6�   $��Center=�6�   $
��Left=�6�   ��6   �� # [  6�   �� 5�      $��3��6g   $��Center=�6t   $��Right=�6�   ��6   �� # [ $ [TheUsingP]�6�   �� 5�      $��2��6G   $
��Bold"�6W   $��Center=�6i   $
��Left=�6�   $��3��6�   ��6   �� $ SignificanceOfTheUse�6�   �� 5�      $��4��6z   $��Center=�6�   $��Right=�6�   ��6   �� # [ $$ [TheOperationalSignificancesP]�6�   �� 5�      $��2��6J   $
��Bold"�6Z   $��Center=�6l   $
��Left=�6�   $��4��6�   ��6   �� $ OperationalSignificance�6�   5�      �� 5�      -   5         ��Name$ spAttributes��5�   D   $��2��6   $��Stretch=�6&   $	��Top=�6Z   $��0��6r   �� 5�      -   5        $ spAttributesRight��5�   D   $��2��6   $��Stretch=�6&   $	��Top=�6_   $��2��6w   �� 5�      -   5        $ spAdvancedAttributes��5�   D   $��3��6   $��Stretch=�6&   $	��Top=�6b   $��0��6z   �� 5�      -   5        $ spAdvancedAttributesRight��5�   D   $��3��6   $��Stretch=�6&   $	��Top=�6g   $��2��6   �� 5�      $ 
Horizontal=�6   $��4��62   $
��Left=�6?   .+�5�      �� -   5          ��Name$  btnVideo��5�      $��40��5�      $
��Left=�6!   $��	20,2,10,2q�6<   $��4��6O   y�5�   B   �� $ Videos.Count�$ 
estateView��# [
 ! � ToolTip! 5�   \   �� # [ $ [Videos]�.��5�      �� $>��8pack://application:,,,/Shared;component/Images/video.png��6   5�      �� 5�      -   5        $  btnPlaceOnMap��5�      $
��10,2q�6�   $��40��6�   $��40��6�   ! 6L   �� # [ $ [PlaceOnMap]�y�5�      �� $	 Lat�# [	 .��5�      �� $=��7pack://application:,,,/Shared;component/Images/map1.png��6   5�      �� 5�      -	   5        $  	btnImages��5�      $
��10,2q�6�   $��40��6�   $��40��6�   ! 6D   �� # [ $ [Images]�y�5�      �� $ EstateImages.Count�# [
 .��5�      �� $>��8pack://application:,,,/Shared;component/Images/photo.png��6   5�      5�      9� 5�      $��3��5      $��6��6+   $��Stretch=�68   ��5�      �� # [ $ [Seller]�" 9� 
IsExpanded" 5�      ��   UserControls.Session#   Inst# Z# $ IsClientShowingMode�# [ $ �� Mode$$ OneWay=�.��5     �  5     �� 5     $	��200 �6+   �� 5     $��5 �6+   �� 5     $��* �6+    5     �� 5     $��30 �6(   �� 5	     $��30 �6(   �� 5
     $��30 �6(   .+�5     �� $��Right=�6j   ��6    �� # [ $ 
[AddressP]�6j   �� 5     $
��Left=�6o   $��2��6�   ��6    �� # [ 6�   �� 5     $��Right=�6p   $��1��6�   ��6    �� # [ $ [SellerContacts]�6�   �� 5     $
��Left=�6A   $��1��6\   $��2��6i   ��6    �� $ 
SellerInfo�6i   5     5     �� 5     -
   5        $  btnOK��5     $��7��6n   $��3��6{   $��Right=�6�   $��0,0,10,0q�6�   $��Center=�6�   ��6$   �� # [ $ [Close]�6�   5     5     5     