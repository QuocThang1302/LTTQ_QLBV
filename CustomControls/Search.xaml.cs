using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QuanLyBenhVien.CustomControls
{
    public partial class Search : UserControl
    {
        public Search()
        {
            InitializeComponent();
        }

        private string tmp;

        public string Tmp
        {
            get { return tmp; }
            set
            {
                tmp = value;
                txtTmp.Text = tmp;
            }
        }

        private void tbInput_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (string.IsNullOrEmpty(tbInput.Text))
                txtTmp.Visibility = Visibility.Visible;
            else txtTmp.Visibility = Visibility.Hidden;
        }
    }
}
