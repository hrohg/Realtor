   M S B A M L   `   `   `  ����  UserControls%    UserControls.CustomExceptionBox   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      -   5        $��ExceptionBox��5        � ShowInTaskbar  .  � SizeToContent$ Height=�6.   $	��520��6E   $	��420��6T    � WindowStyle$
 None=�5       � 
ResizeMode$ NoResize=�6    � WindowStartupLocation$ CenterScreen=�6.    � WindowState$ Normal=�5      $��1q�6      SolidBorderBrush#��[  6.    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   	    � Title 5   	   ��  �� ElementName$ txbTitle��	 �� Path$
	 Text�
 �� Mode$
 TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�.��5	      �  � RowDefinitions 5
   
   �� 5      $��20��6   �� 5      $��40��6   �� 5      $��40��6   �� 5      $
��Auto �6    � ColumnDefinitions 5   
   �� 5      �� 5      .+�5   
   ��   PanelLightBrush#���  6   $��20��6A   $	��Top=�6M   $��2��5      $��Stretch=�6%   ._�5      �� -   5         ��Name$ txbTitle��5      $��Center=�5      #��[  60   $��Center=�5      ��5      ��   CultureResources �� Source# [ $	 [Error]�5      5      �� 5   
   -   5        $ tbErrorMessage��5   E   $��0��6   $��1��6$   $��2��61   $��Stretch=�5      $
��Wrap=�60   $��12(�5      $��Center=�6     � ForceCursor .   �� TextAlignment$ Center=�6O   ��5      �� $ ExceptionBox��$	 ExceptionText��� 5    
   $��3q�6   $��Bottom=�6    $��Right=�6;   $��2��6W   $��1��6d    �� Orientation$ 
Horizontal=�6u   .+�5"      �� -   5         ��Name$ 	btDetails��5"      $��3q�6(   $��25��63   $��Right=�6�   ��6?   �� # [ $	 [DetailyPPP]�5#      �� 5$      -   5        $ btnSendReport��5$      $��3q�6,   $��25��6�    �� 	IsDefault . ��67   �� # [ $	 [SendError]�6�   5&      �� 5'   
   -   5        $
 btOK��5'   ,   $��Bottom=�6   $��2��6:   $��5,3,3,5q�6G   $
��Left=�6X   $��25��6s   ��6�   �� # [ $	 [Close]��� 5(      -   5         ��Name$ scroll��5(      $y�	Collapsed=�6!   $��10q�68   $��3��6D   $��2��6Q   $	��300��6e   $	��400��6u   $��Visible=�6�   .��5)      �� -   5        $ tbErrorMessageDetail��5)      $��Stretch=�5*      $��3q�61   $
��Wrap=�6<   $ Justify=�6P   $��12(�5+      $��Stretch=�6     .  ��5,      �� $ ExceptionBox��$	 ExceptionDetailText�5-      50      51      