   M S B A M L   `   `   `  ����C  ?FluidKit, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG1clr-namespace:FluidKit.Controls;assembly=FluidKitFluidKit.Controls  5   @   P LRealEstate.DataAccess, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\Bclr-namespace:RealEstate.DataAccess;assembly=RealEstate.DataAccessRealEstate.DataAccess 5   	    UserControls   UserControls.ImageViewer   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   KFluidControls1clr-namespace:FluidKit.Controls;assembly=FluidKit     6@   Y
DataAccessBclr-namespace:RealEstate.DataAccess;assembly=RealEstate.DataAccess     5   	   -   5          �Name$  imageViewer��5   	    � WindowState$ 	Maximized=�5   _    � WindowStyle$ 
ToolWindow=�6w    � ShowInTaskbar . 
���   � � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   	    � WindowStartupLocation$ CenterScreen=�6O    � 	Resources 5      ��%    5	      .��5
      �� $
��Auto=�6   $��Stretch=�66   $
��Auto=�6T   .��5   
   � $
��Auto��6   $
��Auto��6    � RowDefinitions 5      �� 5      �� 5      $��30 �6    .+�5      �� ��6   ��  �� Path$ Images�	 �� ElementName$	 imageViewer����5      �� 5      .R�5      �� $��4q�63   $
��Auto��6>   $
��1000��6M   $	��750��6^   ��6    �� 
 � ContextMenu
 5      �� 5   "    ��Name$
 cmnu��6.   .@�5   &   m�  m�Name$ mnuOpenFolder��6/   -   5        ��5   F   ��    CultureResources �� Source# [  $ [OpenContainingFolder]�
 � Tag 5   K   �� m� 5   &   $ mnuCopyImagesTo��6/   -   5        ��5   H   �� # [  $ [SavePhotosPPP]� 5   E   �� 5   #   5      5      5      �� 5!      -   5         ��Name$ btnOK��5!      $��1��6e   $��Right=�6r   $��0,0,10,0q�6�   $��Center=�6�   ��6   �� # [  $ [Close]�6�   5"      5#      5$      