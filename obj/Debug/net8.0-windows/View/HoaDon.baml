   M S B A M L   `   `   `  ����I  EQuanLyBenhVien, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:QuanLyBenhVien.ViewQuanLyBenhVien.View  5      M+clr-namespace:QuanLyBenhVien.CustomControlsQuanLyBenhVien.CustomControls  5           QuanLyBenhVien.View.HoaDon   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:QuanLyBenhVien.View     5      FcustomControls+clr-namespace:QuanLyBenhVien.CustomControls     5      X TFontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5      .��5      �   � RowDefinitions  5   
   �� 5      $��60 �6   6*   �� 5      $
��0.8* �6   6,   �� 5      $
��0.2* �6   6,   .+�5   
   *   $QuanLyBenhVien.CustomControls.Search  $��70,10,70,10q�6    &   System.Windows.Controls.DataGrid  5   
   $��1��6      AutoGenerateColumns$ False��5         CanUserAddRows$ False��5         CanUserDeleteRows$ False��5      $��	15,5,15,0q�5      $
��Auto��5         ColumnHeaderStyle 5      �� 5       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6   .�5      ��  �� Property � �� �� Value
 ��ح�63   �� 5       � ��$ Center=�6C   �� 5       � ��$ Inter)�63   �� 5        � ��$ 14(�61   �� 5!       � ��$
 Bold"�63   �� 5"       � ��$ 10q�60   5#         RowStyle 5'      �� 5(      )  #System.Windows.Controls.DataGridRow"  6   	 �� Triggers	 5)      P� 5*      
 P� Property
 �@ 
IsSelected P� Value$
 True��68   . �5+      ��  � ��
 �����6;   5,      5.         	CellStyle 52      �� 53      *  $System.Windows.Controls.DataGridCell"  6   .�54      ��  � ��$ 5q�60   	 55      P� 56      
 �@ 
IsSelected$
 True��68   . �57      ��  � ��
 �����6;   58      5:         Columns 5=      0  *System.Windows.Controls.DataGridTextColumn  5>      ,  &System.Windows.Controls.DataGridColumn   Header$ Mã hóa đơn��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 69     5?      $ Tên hóa đơn��6%   $ * 6:     5@      $ Mã bệnh nhân��6%   $
 1.1* 6;     5A      $ Mã nhân viên��6%   $ * 6;     5B      $ Ngày lập��6%   $ * 67     5C      $ Thành tiền��6%   $ * 69     5D      $ Trạng thái��6%   $ * 69   5F      �� 5H   
   $��2��6    �� Orientation$ 
Horizontal=�6"   $��RightToLeft=�6;   .+�5I      ��    childviewButton#��[  6   $��52,0,0,0q�5J      $
��Xóa��5K      �� 5M      #��[  6   $��52,0,0,0q�5N      $��Cập nhật��5O      �� 5Q      #��[  6   $��52,0,0,0q�5R      $��Thêm��5S      5T      5U      5V      