   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5   	    UserControls,   &UserControls.UploadImagesSelectionForm   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   F
Converters/clr-namespace:Shared.Converters;assembly=Shared     5   	   -   5          �Name$
  form��5   I    � Title$ UploadImagesSelectionForm��5   L    � WindowStartupLocation$ CenterScreen=�6n    � WindowState$ 	Maximized=�6�    � ShowInTaskbar .  � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5       � 	Resources 5      7   1Shared.Converters.IsMainToBorderThiknessConverter #  IsMainToBorderThiknessConverter0   *Shared.Converters.IsMainToToolTipConverter  IsMainToToolTipConverter��%:   &	        &	        5      6/     5      6(   5	      .��5
      � $��3q�6    � RowDefinitions 5   
   �� 5      �� 5      $
��Auto �6   .+�5      �� $��Disabled=�6   $
��Auto=�6:   .��5      �� -   5        $��	lstImages��5      $��Stretch=�5   '   ! �� IsDeferredScrollingEnabled .  ��5   #   �� 	 �� Path$	 RealEstateImages�
 �� ElementName$

 form����5      �� 5      .R�5      �  � Orientation$ 
Horizontal=�6   $��5q�6*   5      ��5      �� 5      .R�5      ��  �� CornerRadius$ 5��6   $	��150��6.   $��3q�6;   
��������5      �� $	 IsMain� �� 	Converter# [   � ToolTip 5      �� $	 IsMain�# [  � ContextMenu 5      �� 5   	   .@�5   
   m� -   5        $��Գլխավոր��5      
 � Tag 6=   �� 5   
   ._�5!      � .+�5"      �� $	��150��6B   $��Center=�6O   ��6$   �� $	 Image�6O   �� 5#      $	��Top=�6M   $
��Left=�6e   $��40��6�   $��40��6�    d� 	IsChecked 6'   �� $	 
IsSelected�6�   5$      5%      5&      5(      5)      �� 5*       �� Orientation$ 
Horizontal=�6   $��Center=�6(   $��0,0,10,0q�6C   $��Right=�6U   $��1��6q   .+�5+      �� -   5        $��	btnUpload��5+   1   $'��!Ցուցադրել կայքում��6   6B   �� 5,      -   5         ��Name$ 	btnCancel��5,      $��Center=�6(   $��0,0,10,0q�6C   $�� Փակել ��6m   5-      50      51      