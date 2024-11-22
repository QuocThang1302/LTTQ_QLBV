using System.Reflection;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyBenhVien.View
{
    public partial class LoginView : Window
    {
        public LoginView() => InitializeComponent();


        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                DragMove();
            }
        }

        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
