   M S B A M L   `   `   `  ����G  CUserControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:UserControlsUserControls  5      U QGongSolutions.Wpf.DragDrop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullkLclr-namespace:GongSolutions.Wpf.DragDrop;assembly=GongSolutions.Wpf.DragDropGongSolutions.Wpf.DragDrop 5   	   -    'UserControls.EstateListColumnsSelection   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3UserControlsclr-namespace:UserControls     5      ]dragLclr-namespace:GongSolutions.Wpf.DragDrop;assembly=GongSolutions.Wpf.DragDrop     5   	   -   5          �Name$  listColumns��5   c   $	��400��6�    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$ 
ToolWindow=�6.   .��5	      ��  �� CornerRadius$ 5��6
   
����ح�$��2q�63   
�������._�5
      �� $��Disabled=�6   $
��Auto=�6:   .��5      � $��3q�6
    � RowDefinitions 5      �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5      �� -   5         ��Name$ 
lstColumns��5   L   )  #GongSolutions.Wpf.DragDrop.DragDrop   IsDragSource .    IsDropTarget .  �� SelectionMode$ Extended=�6`   ��5      ��    UserControls.Session	   Inst
 �� Source#
 Z	  �� Path$( "ApplicationSettings.ShowingColumns���5      �� 5      .R�5   	   �� 
�������$��0,0,5,0q�5   F    d� 	IsChecked 5      �� $
 Show� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=���5      �� $ 
ColumnName�6F   5   	   5      �� 5       �� Orientation$ 
Horizontal=�6   $��1��6*   $��0,5,10,0q�67   $��Right=�6I   .+�5      �� -   5         ��Name$ btnOK��5      $��35��61   $��35��6=   ��6H   Z� .��5      �� $@��:pack://application:,,,/Shared;component/Images/OKRound.png��6   5      �� 5      -   5        $ 	btnCancel��5      $��35��69   $��35��6E   $��Right=�6P   $��10,0,0,0q�6}   ��6l   Z� .��5      �� $D��>pack://application:,,,/Shared;component/Images/CancelRound.png��6   5       5!      5"      5#      5$      5%      