   M S B A M L   `   `   `  ����F  BLab_56_shop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:Lab_56_shopLab_56_shop  5   	   "    Lab_56_shop.AddElementWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Lab_56_shop     5   	   -   5          �Name$  AddPage��5   	    � Title$" ShopRedactorAddElementWindow��5   	   $	��470��6.   $	��320��6;    � Icon$1 +D:\code\labs\WPF\Lab_56_shop\icons\shop.png��5	   	    � Cursor$3 -D:\code\labs\WPF\Lab_56_shop\icons\Cursor.cur��5
   	   ��5      �� 5   
    �� EndPoint$ 0.5,1&�6    �� 
StartPoint$ 0.5,0&�6/   .��5      �  � Color$ 	#FFE3B0CA��6   � 5      $ 	#FF762FE3��6    � Offset$ 1Q�6-   5      .��5      � $	��300��6   $	��450��6   $��0��6$   $��2��61    � RowDefinitions 5   
   �� 5      $	��100 �6   �� 5      $��90 �6   �� 5      $��90 �6   �� 5      $��90 �6   �� 5      $��60 �6   .+�5   
   �� $��4��6   ._�5       ��    TopLabelAddStyle#���   6    
 m_Add:#���  6@   5"      5#      � 5%   
   $��0��6   .+�5&      �� $��0��6     LabelAddStyle#���  6!     m_TovarNameAdd:#���  6I   �� 5'      -   5        	 ��Name$	 Add_Name��5'      $��0��6(   $��Center=�66     TextBoxStyle#���  6S   $	��275��6z   $��38��6�   $��0,44,0,0q�6�   5(      � 5,   
   $��1��6   .+�5-      �� $��0��6   #���  6!     m_TovarDescription:#���  6I   $��26��6y   $��	20,0,0,36q�6�   �� 5.      -   5        $	 Add_Description��5.      $��0��6/   $��Center=�6=   #���  6Z   $	��275��6�   $��38��6�   $��0,44,0,0q�6�   5/      � 51   
   $��2��6   .+�52      �� $��0��6   #���  6!     m_TovarImageLink:#���  6I   �� 53      -   5        $	 Add_ImageLink��53      $��0��6-   $��Center=�6;   #���  6X   $	��275��6   $��38��6�   $��0,44,0,0q�6�   54      � 55   
   $��3��6   .+�56      �� $��0��6   #���  6!     m_TovarPrice:#���  6I   �� 57      -   5        $	 	Add_Price��57      $��0��6)   $��Center=�67   #���  6T   $	��275��6{   $��38��6�   $��0,44,0,0q�6�   58      � 5;   
   $��4��6   .+�5<      �� $	��Top=�6T   $��170,15,30,0q�6l     AddMenuAddButtonStyle#���  6�   $	��100��6�   $��40��6�   $
 Hand��6�   ��6   �� *
AddTovar+
 �� ElementName$
 AddPage�� �� Mode$ OneWay=�6�   �� 5=      $	��Top=�6W   $��30,15,170,0q�6o    	 AddMenuCancelButtonStyle#��� 	 6�   $	��100��6�   $��40��6�   $
 Hand��6�   ��6   �� *CloseWindow+$
 AddPage��$ OneWay=�6�   5?      5C      5D      