   M S B A M L   `   `   `  ����  CodeGenerator    CodeGenerator.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  
MainWindow��5   	   $	��350��6   $	��625��6)   .��5      � $��5q�6    � RowDefinitions 5   
   �� 5      $��30 �6   �� 5      $��30 �6   �� 5	      $��30 �6   �� 5
      $��30 �6   �� 5      $��30 �6    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��5 �6   �� 5      .+�5   
   �� $$��Կոդավորման տիպը:��6   $��Center=�6,   $��Right=�6G   �� 5   
   -   5         ��Name$ cbTypes��5   J   $��2��6   $��Center=�6#   $	��400��6>   @�5      �� 5      $��Ժամանակ��6    �� 
IsSelected . 61   �� 5      $��
Տեքստ��6   5      �� 5   
   $(��"Կոդավորման տեքստը:��6   $��Center=�6.   $��Right=�6I   $��1��6e   �� 5   
   -   5         ��Name$ 	txtString��5   I   $��2��6   $��Center=�6"   $	��400��6=   $��1��6\   �� 5   
   -   5         ��Name$ btnGeterate��5      $��30��6@   $��30��6L   $��3��5      $��Center=�6%   $��2��6B   .��5       �� $=��7pack://application:,,,/Shared;component/Images/play.png��6   5!      �� 5#   
   $(��"Կոդավորված տեքստը:��6   $��Center=�6.   $��Right=�6I   $��3��6e   �� 5$   
   -   5        $ txtGeneratedCode��5$   h   $��2��6   $��Center=�6"   $	��400��6=   $��3��6I    �� 
IsReadOnly . 6h   �� 5&   
    �� Orientation$ 
Horizontal=�6   $��4��6.   $��Right=�6;   $
��15,0q�6W   $��3��6e   .+�5'      �� -   5        $ btnOK��5'      $��25��68   $��25��6D   .��5(      �� $@��:pack://application:,,,/Shared;component/Images/OkRound.png��6   5)      �� 5*      -   5        $ btnSaveInFile��5*      $��25��6I   $��25��6U   $��10,0,0,0q�6`   .��5+      �� $=��7pack://application:,,,/Shared;component/Images/save.png��6   5,      �� 5-      -   5        $ btnGenerateSerialNumbers��5-      $��25��6U   $��10,0,0,0q�6a   .��6s   Serial Numbers5/      50      51      52      