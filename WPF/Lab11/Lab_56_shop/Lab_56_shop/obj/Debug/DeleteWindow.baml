   M S B A M L   `   `   `  ����F  BLab_56_shop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:Lab_56_shopLab_56_shop  5   	       Lab_56_shop.DeleteWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Lab_56_shop     5   	   -   5          �Name$  
DeletePage��5   	    � Title$ DeleteWindow��5   	   $	��210��6   $	��320��6+   ��5	      �� 5
   
    �� EndPoint$ 0.5,1&�6    �� 
StartPoint$ 0.5,0&�6/   .��5      �  � Color$ 	#FFE3B0CA��6   � 5      $ 	#FF762FE3��6    � Offset$ 1Q�6-   5      .��5      � $	��300��6   $	��450��6   $��0��6$   $��2��61    � RowDefinitions 5   
   �� 5      $	��100 �6   �� 5      $��90 �6   .+�5   
   �� $��4��6   ._�5      ��    TopLabelAddStyle#���   6     m_DeleteElem:#���  6@   5      5      � 5   
   $��0��6   .+�5       �� $��0��6     LabelAddStyle#���  6!     m_TovarNameToDelete:#���  6I   �� 5!      -   5         ��Name$ Delete_Name��5!      $��0��6+   $��Center=�69     TextBoxStyle#���  6V   $	��275��6}   $��38��6�   $��0,44,0,0q�6�   5"      � 5$   
   $��1��6   .+�5%      �� $	��Top=�6Z   $��170,15,30,0q�6r     AddMenuDeleteButtonStyle#���  6�   $	��100��6�   $��40��6�    � Cursor$
 Hand��6�   ��6   �� *DeleteTovar+	 �� ElementName$	 
DeletePage��
 �� Mode$
 OneWay=�6�   �� 5&      $	��Top=�6Z   $��30,15,170,0q�6r     AddMenuCancelButtonStyle#���  6�   $	��100��6�   $��40��6�   $
 Hand��6�   ��6   �� *CloseWindow+$	 
DeletePage��$
 OneWay=�6�   5(      5,      5-      