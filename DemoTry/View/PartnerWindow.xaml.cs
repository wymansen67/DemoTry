using DemoTry.Model;

using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using System.Windows.Shapes;

namespace DemoTry.View
{
    /// <summary>
    /// Логика взаимодействия для PartnerWindow.xaml
    /// </summary>
    public partial class PartnerWindow : Window
    {
        private Partner partner;
        public PartnerWindow()
        {
            InitializeComponent();
        }

        public PartnerWindow(Partner _partner)
        {
            InitializeComponent();
            partner = _partner;
        }
    }
}
