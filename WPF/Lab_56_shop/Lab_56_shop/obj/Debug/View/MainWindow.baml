   M S B A M L   `   `   `  ����F  BLab_56_shop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:Lab_56_shopLab_56_shop  5   	       Lab_56_shop.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Lab_56_shop     5   	   -   5          �Name$  MainPage��5   	    � Title$ ShopRedactorMainWindow��5   	   $
��1080��6(   $��1919.8��66    � Icon$1 +D:\code\labs\WPF\Lab_56_shop\icons\shop.png��5	   	    � Cursor$3 -D:\code\labs\WPF\Lab_56_shop\icons\Cursor.cur��5
   	      WindowTheme#���   5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $��300px �6   �� 5      $	��220��6   $��8* �6.   �� 5      $	��40* �6     � RowDefinitions 5   
   �� 5      $
��40px �6   �� 5      $��1* �6   .+�5#   
   � -   5         �Name$ TopButtonsPanel��5#      $��0��6)   $��3��6:    5$      �� 5%      .+�5'      �� 
�������$
��auto��6)   $��0q�68    �� CornerRadius$ 0 0 5 5��5(      ._�5)      ��  �� Orientation$ 
Horizontal=�6   .+�5*      $   Lab_56_shop.UserControlElement  �� 5+      
������ 
���   ���6   �� *DataContext.Search+	 �� Mode$	 OneWay=�
 �� RelativeSource
 ��  �� AncestorType$ WindowL���6�   ��  �� ElementName$ MainPage��.��5,      �� $6��0D:\code\labs\WPF\Lab_56_shop\icons\magnifier.png��6    6\   5-      5.      5/      51      � 56   
   -   5        $ GoodsCatalog��56      $��1��6(   $��0��65   $��2��6E   $��30q�6Y    5;      �� 5=      $��1* �6#    5A      �� 5B      $
��50px �6    �� 5C      $
��100* �6    .+�5F      � $��0��6   $��2��6    .+�5G      �� 
�������$ 
15 15 0 0 ��6,   ._�5H      ��   TopLabelStyle#���  6     m_Controls:#���  6E   5J      5K      5M      �� 5O      $��1��6   
�������$
��auto��66   $
��auto��6C   ._�5P      � -   5         �Name$ 
TovariMain��5P       � Orientation$ 
Horizontal=�60   $
��Left=�6I   .+�5R      �� $	��Top=�6�   $��
50 35 0 0 q�6�     AddButtonStyle#���  6�   $	��350��6  $��40��6#  $
 Hand��6/  ��6   �� *DataContext.OpenAddWindow+$	 OneWay=�
 �� $ WindowL���6�   �� $ MainPage��6/  �� 5S      $	��Top=�6�   $��
50 35 0 0 q�6�     DeleteButtonStyle#���  6�   $	��350��6  $��40��6)  $
 Hand��65  ��6   �� *DataContext.OpenDeleteWindow+$	 OneWay=�
 �� $ WindowL���6�   �� $ MainPage��65  �� 5T      $	��Top=�6�   $��
50 35 0 0 q�6�     ChangeButtonStyle#���  6�   $	��350��6  $��40��6)  $
 Hand��65  ��6   �� *DataContext.OpenUpdateWindow+$	 OneWay=�
 �� $ WindowL���6�   �� $ MainPage��65  �� 5U      -   5        $	��Top=�5U      $��
50 35 0 0 q�66    ! ChangeLocalizationButtonStyle#���  6K   $	��350��6�   $��40��6�   $
 Hand��6�   6�   �� 5V      $	��Top=�6�   $��
50 35 0 0 q�6�     ChangeThemeButtonStyle#���  6�   $	��350��6  $��40��6)  $
 Hand��65  ��6   �� *DataContext.ChangeTheme+$	 OneWay=�
 �� $ WindowL���6�   �� $ MainPage��65  �� 5W      $	��Top=�6�   $��
50 35 0 0 q�6�    % !OpenPresentationWindowButtonStyle#���  6�   $	��350��63  $��40��6?  $
 Hand��6K  ��6   �� *$"DataContext.OpenPresentationWindow+$	 OneWay=�
 �� $ WindowL���6�   �� $ MainPage��6K  �� 5X      $	��Top=�6�   $��
50 35 0 0 q�6�    	 Open7labButtonStyle#��� 	 6�   $	��350��6  $��40��6'  $
 Hand��63  ��6   �� *DataContext.OpenLab7Task+$	 OneWay=�
 �� $ WindowL���6�   �� $ MainPage��63  �� 5Y      -   5        $	��Top=�5Y      $��
50 35 0 0 q�65    
 UndoButtonStyle#��� 
 6J   $	��150��6t   $��40��6�   $
 Hand��6�   6�   �� 5Z      -   5        $	��Top=�5Z      $��
50 35 0 0 q�65     RedoButtonStyle#���  6J   $	��150��6t   $��40��6�   $
 Hand��6�   6�   5\      5]      5^      � 5`   
   -   5        $ JointStockGoods��5`      $��1��6*   $��Center=�67   $��2��6T   $��	0 30 0 30q�6e   $
��Auto��6x    5b      �� 5c      $
��50px �6    �� 5d      $
��100* �6    .+�5g      � $��0��6   .+�5h      �� 
�������$ 
15 15 0 0 ��6,   ._�5i      �� #���  6     	m_Tovari:#���  6E   5k      5l      5n      �� 5p      -	   5         ��Name$ listviewProducts��5p      $��2��62    �� View 5q      �� 5r      .P�5s      ��  �� Width$	 500��6+    �� CellTemplate 5t      �� 5u   "   .R�5v   &   �� .+�5w   *   �� $
��Wrap=�65   �� 5x   *     TovarNameRunStyle#���  6.     m_TovarName:#��  6Z   6�    �� 5y   *   #���  6.   �6Z   ��  �� Path$ product_name�6�   5{   +   �� 5|   *    ��Name$ description��64   $
��Wrap=�6I   $��zz��6]   �� 5}   *     TovarDescriptionRunStyle#���  6/     m_Description:#��  6b   6�    �� 5~   *   #���  6.   �6a   �� $ product_description�6�   5   +   �� 5�   *   $
��Wrap=�64   �� 5�   *     TovarPriceRunStyle#���  6.     m_Price:#��  6[   6    �� 5�   *   #���  6.   �6[   �� $ price�6y   5�   +   5�   '   5�   #   5�      �� 5�      $	 200��6*    5�      �� 5�   "   .R�5�   &   �� ��6,   �� $ 	imagepath�5�   #   5�      5�      5�      5�      5�      5�      