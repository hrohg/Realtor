   M S B A M L   `   `   `  ����A  =Shared, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE/clr-namespace:Shared.Converters;assembly=SharedShared.Converters  5   @    UserControls+   %UserControls.ExpirationDateManagement   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @conv/clr-namespace:Shared.Converters;assembly=Shared     6@   -   5          �Name$  expWin��5   }    � WindowStartupLocation$ CenterScreen=�5   	    � WindowState$ Normal=�6.    � WindowStyle$ 
ToolWindow=�6C    � 
ResizeMode$ NoResize=�6\   $	��200��6r   $	��400��6    � 	Resources 5      1   +Shared.Converters.BoolToVisibilityConverter   BoolToVisibilityConverter��%   &	          5   
   6)   5      .��5      �  � RowDefinitions 5	   
   �� 5
      $
��Auto �6   �� 5      .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��5q�6.   .+�5      G� -   5         G�Name$ password��5      $	��200��6,   $��25��68   $��Center=�6D   6_   �� 5      -   5        $��OK��5   *   $��10,0,0,0q�67   $��Center=�6I   $��40��6d   5      �� 5   
   $ Vertical=�6   $��1��6,   $
��5,10q�69   y�5      �� 	 �� Path$	 
PasswordOK�
 �� ElementName$
 expWin�� �� 	Converter# [  .+�5      �� $ 
Horizontal=�6   .+�5      �� $��Expiration Date: ��6   $��Center=�65   (  "System.Windows.Controls.DatePicker  5      $��Center=�6k      SelectedDate 6   �� $	 ExpirationDate�$
 expWin�� �� Mode$ TwoWay=�6k   �� 5      -   5        $	��Set��5      $��10,0,0,0q�6>   $��Center=�6P   5      �� 5      -   5        $��Delete Expiration Date��5      $��	10,20,0,0q�6V   5      5      5      