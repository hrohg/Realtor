   M S B A M L   `   `   `  ����  UpdateModule    UpdateModule.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5          �Name$	  wnd��5   P    � WindowStartupLocation$ CenterScreen=�5   @    � WindowStyle$
 None=�6e    � Title$ Realtor update��5   	   $	��200��6    $	��500��6-    � Icon$ Application.ico��6]    � 
ResizeMode$ NoResize=�6t   .��5      ��  �� CornerRadius$ 5��6
   $��1q�6   
����ح���5      �� 5       j� Stretch$ Uniform=�6    �� Opacity$	 0.5Q�6"   	 �� ImageSource$	 Application.png��60   ._�5	      � 
 � RowDefinitions
 5
      �� 5      $��80 �6   �� 5      $��30 �6   �� 5      $��40 �6   �� 5      $��70 �6   .+�5      �� $��Realtor update module��6   $��Center=�6,   $��Center=�6G   $��16(�6d   $
��Bold"�6r   � 5      -   5         �Name$ progress��5      $	��450��6#   $��Center=�6/   $��1��6L   $��25��6Y   $
��10,0q�6e    � Value 5      ��  �� Path$ DownloadPercent� �� ElementName$	 wnd���� 5       �� Orientation$ 
Horizontal=�6   $��2��6)   $	��Top=�66   .+�5      �� $
��20,0q�6F   ��6   �� $ ProcessMessage�$	 wnd��6F   5      �� 5      -   5         ��Name$ 	btnCancel��5      $��Cancel��6   $	��100��60   $��25��6<   $��Bottom=�6H   $��2��5      $��Right=�6+   $
��10,0q�6G   5      5      5      