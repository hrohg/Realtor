   M S B A M L   `   `   `  ����  UserControls     UserControls.CommentWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5          �Name$  commentWindow��5   S   $	��300��5   	   $	��500��6    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��6"    � WindowStartupLocation$ CenterScreen=�5   	    � WindowState$ Normal=�6.    � WindowStyle$ SingleBorderWindow=�6C    � 
ResizeMode$ NoResize=�6z    � Title 5   	   ��    CultureResources �� Source# [   �� Path$ 	[Comment]�.��5      � $��3q�6   	 � RowDefinitions	 5   
   �� 5	      �� 5
      $��30 �6   .+�5   
   �� $��Stretch=�6}   $	��Top=�5      $	��260��6*   
 �� TextWrapping$

 Wrap=�5       �� AutoWordSelection .  �� AcceptsReturn .  �� 
AcceptsTab . ��5      �� $ Comment� �� ElementName$ commentWindow�� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5   T   �� 5   
    �� Orientation$ 
Horizontal=�6   $��Right=�6.   $��Center=�6J   $��1��6e   .+�5      �� -   5         ��Name$ btnSave��5      $��Center=�6o   ��6&   �� # [  $ [Save]�6�   �� 5      -   5        $ 	btnCancel��5      $
��10,0q�6s   $��Center=�6�   ��6(   �� # [  $ [Cancel]�6�   5      5      5      