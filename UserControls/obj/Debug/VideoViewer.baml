   M S B A M L   `   `   `  ����  UserControls    UserControls.VideoViewer   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5          �Name$  	videoView��5   !    � Icon$D >pack://application:,,,/Shared;component/Images/Application.png��5   	    � WindowState$ 	Maximized=�5   	   .��5      �  � RowDefinitions 5      �� 5      �� 5	      $��75 �6   �� 5
      $��35 �6   .+�5      � .+�5      �� 
�������$��1q�6$   ._�5      r� -   5         r�Name$ player��5   9   $
��Auto��6    r� LoadedBehavior$ Manual=�6!    r� UnloadedBehavior$
 Stop=�6I    r� Stretch$
 Fill=�5      6P   5      �� 5      -   5         ��Name$ bManage��5   {   $��60��6   	 �� CornerRadius$	 3,3,0,0��6   
�������$��Stretch=�6B   $��Bottom=�6`   ��5      �� 5      
 �� 
TargetType"
 ��6    �� Triggers 5      P� 5   	    P� Property �@J�IsMouseOver P� Value . . �5   
   ��  �� Property �@J�Opacity �� Value$	 0.8Q�6$   5   
   P� 5   	    �@J�IsMouseOver .  . �5   
   ��  �@J�Opacity$ 0Q�6$   5   
   5      ._�5      ��  �� Orientation$ 
Horizontal=�6   $��Center=�6*   .+�5       �� -   5        $=��7pack://application:,,,/Shared;component/Images/play.png��5       $��5q�6o   �� 5"      -   5        $>��8pack://application:,,,/Shared;component/Images/pause.png��5"      $��5q�6q   �� 5$      -   5        $=��7pack://application:,,,/Shared;component/Images/stop.png��5$      $��5q�6o   �� 5&      $?��9pack://application:,,,/Shared;component/Images/volume.png��6   $��Center=�6P   $��20��6k   $��20��6w   �� 5'      -   5        $��volumeSlider��5'      $��Center=�6"    � Minimum$ 0Q�6^    � Maximum$ 1Q�6j    � Value$	 0.5Q�6v   $��70��6�   $��2,0,0,0q�6�   �� 5)      -   5        $��timelineSlider��5)      $
��10,2q�6$   $	��150��6U   $��Center=�6a   5*      5+      5-      �� 5.      -	   5         ��Name$ lbVideos��5.   e   $��Stretch=�6G   $��10q�5/      $��1��6   $��0q�6%   ��5.      ��  �� Path$ Videos� �� ElementName$ 	videoView����50      �� 51      .R�52      � $��Center=�6   53      ��55      �� 56      .R�57      �� 
�������$��1q�6&   $��5q�6:   ._�58      �� -
   5        $>��8pack://application:,,,/Shared;component/Images/video.png��58      $��40��6P   $��Center=�6t   
 � Tag 59      �� 5:      5;      5=      �� 5?      -   5        $��2��5?      $��Right=�6   $
��20,2q�64   .��5@      �� $>��8pack://application:,,,/Shared;component/Images/close.png��6   5A      5B      5D      