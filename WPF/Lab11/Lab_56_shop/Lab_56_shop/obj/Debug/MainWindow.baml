   M S B A M L   `   `   `  ����F  BLab_56_shop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:Lab_56_shopLab_56_shop  5   	       Lab_56_shop.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Lab_56_shop     5   	   -   5          �Name$  MainPage��5   	    � Title$ ShopRedactorMainWindow��5   	   $
��1080��6(   $��1919.8��66    � Icon$1 +D:\code\labs\WPF\Lab_56_shop\icons\shop.png��5	   	    � Cursor$3 -D:\code\labs\WPF\Lab_56_shop\icons\Cursor.cur��5
   	      WindowTheme#���   5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $��300px �6   �� 5      $	��220��6   $��8* �6.   �� 5      $	��40* �6     � RowDefinitions 5   
   �� 5      $
��40px �6   �� 5      $��1* �6   .+�5"   
   � -   5         �Name$ TopButtonsPanel��5"      $��0��6)   $��3��6:    5#      �� 5$      .+�5&      �� 
�������$
��auto��6)   $��0q�68    �� CornerRadius$ 0 0 5 5��5'      ._�5(      ��  �� Orientation$ 
Horizontal=�6   .+�5)      $   Lab_56_shop.UserControlElement  �� 5*      
������ 
���   ���6   �� *Search+	 �� ElementName$	 MainPage��
 �� Mode$
 OneWay=�.��5+      �� $6��0D:\code\labs\WPF\Lab_56_shop\icons\magnifier.png��6    6\   5,      5-      5.      50      � 55   
   -   5        $ GoodsCatalog��55      $��1��6(   $��0��65   $��2��6E   $��30q�6Y    56      �� 58      $��1* �6#    5<      �� 5=      $
��50px �6    �� 5>      $
��100* �6    .+�5A      � $��0��6   $��2��6    .+�5B      �� 
�������$ 
15 15 0 0 ��6,   ._�5C      ��   TopLabelStyle#���  6     m_Controls:#���  6E   5E      5F      5H      �� 5J      $��1��6   
�������$
��auto��66   $
��auto��6C   ._�5K      � -   5         �Name$ 
TovariMain��5K       � Orientation$ 
Horizontal=�60   $
��Left=�6I   .+�5M      �� $	��Top=�6b   $��
50 35 0 0 q�6z     AddButtonStyle#���  6�   $	��350��6�   $��40��6�   $
 Hand��6�   ��6   �� *OpenAddWindow+$	 MainPage��$
 OneWay=�6�   �� 5N      $	��Top=�6e   $��
50 35 0 0 q�6}     DeleteButtonStyle#���  6�   $	��350��6�   $��40��6�   $
 Hand��6�   ��6   �� *OpenDeleteWindow+$	 MainPage��$
 OneWay=�6�   �� 5O      $	��Top=�6e   $��
50 35 0 0 q�6}     ChangeButtonStyle#���  6�   $	��350��6�   $��40��6�   $
 Hand��6�   ��6   �� *OpenUpdateWindow+$	 MainPage��$
 OneWay=�6�   �� 5P      -   5        $	��Top=�5P      $��
50 35 0 0 q�66    ! ChangeLocalizationButtonStyle#���  6K   $	��350��6�   $��40��6�   $
 Hand��6�   6�   �� 5Q      $	��Top=�6`   $��
50 35 0 0 q�6x     ChangeThemeButtonStyle#���  6�   $	��350��6�   $��40��6�   $
 Hand��6�   ��6   �� *ChangeTheme+$	 MainPage��$
 OneWay=�6�   �� 5R      $	��Top=�6k   $��
50 35 0 0 q�6�    % !OpenPresentationWindowButtonStyle#���  6�   $	��350��6�   $��40��6�   $
 Hand��6�   ��6   �� *OpenPresentationWindow+$	 MainPage��$
 OneWay=�6�   �� 5S      $	��Top=�6a   $��
50 35 0 0 q�6y    	 Open7labButtonStyle#��� 	 6�   $	��350��6�   $��40��6�   $
 Hand��6�   ��6   �� *OpenLab7Task+$	 MainPage��$
 OneWay=�6�   �� 5T      -   5        $	��Top=�5T      $��
50 35 0 0 q�65    
 UndoButtonStyle#��� 
 6J   $	��150��6t   $��40��6�   $
 Hand��6�   6�   �� 5U      -   5        $	��Top=�5U      $��
50 35 0 0 q�65     RedoButtonStyle#���  6J   $	��150��6t   $��40��6�   $
 Hand��6�   6�   5W      5X      5Y      � 5[   
   -   5        $ JointStockGoods��5[      $��1��6*   $��Center=�67   $��2��6T   $��	0 30 0 30q�6e   $
��Auto��6x    5]      �� 5^      $
��50px �6    �� 5_      $
��100* �6    .+�5b      � $��0��6   .+�5c      �� 
�������$ 
15 15 0 0 ��6,   ._�5d      �� #���  6     	m_Tovari:#���  6E   5f      5g      5i      �� 5k      -	   5         ��Name$ listviewProducts��5k      $��2��62    �� View 5l      �� 5m      .P�5n      ��  �� Width$	 500��6+    �� CellTemplate 5o      �� 5p   "   .R�5q   &   �� .+�5r   *   �� $
��Wrap=�65   �� 5s   *     TovarNameRunStyle#���  6.     m_TovarName:#��  6Z   6�    �� 5t   *   #���  6.   �6Z   ��  �� Path$ product_name�6�   5v   +   �� 5w   *    ��Name$ description��64   $
��Wrap=�6I   $��zz��6]   �� 5x   *     TovarDescriptionRunStyle#���  6/     m_Description:#��  6b   6�    �� 5y   *   #���  6.   �6a   �� $ product_description�6�   5z   +   �� 5{   *   $
��Wrap=�64   �� 5|   *     TovarPriceRunStyle#���  6.     m_Price:#��  6[   6    �� 5}   *   #���  6.   �6[   �� $ price�6y   5~   +   5   '   5�   #   5�      �� 5�      $	 200��6*    5�      �� 5�   "   .R�5�   &   �� ��6,   �� $ 	imagepath�5�   #   5�      5�      5�      5�      5�      5�      