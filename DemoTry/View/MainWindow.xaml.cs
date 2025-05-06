using DemoTry.Model;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public ObservableCollection<PartnerExtended> Partners { get; set; } = new ();
        public readonly MasterFloorContext context = new();
        public MainWindow()
        {
            InitializeComponent();
            InitData();
            DataContext = this;
        }

        public void InitData()
        {
            var _partners = context.Partners.Include("TypeNavigation").ToList();
            var _partnerProducts = context.PartnerProducts.ToList();

            if (_partners == null)
            {
                MessageBox.Show("Список партнёров пуст. Проверьте содержимое базы данных", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
            }

            if (_partnerProducts == null)
            {
                MessageBox.Show("Список продаж пуст. Проверьте содержимое базы данных", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
            }

            foreach (Partner partner in _partners)
            {
                int quantity = 0;
                int discount = 0;
                List<PartnerProduct> sells = _partnerProducts.Where(pp => pp.Partner == partner.Tin).ToList();
                foreach (PartnerProduct partnerProduct in sells)
                {
                    quantity += partnerProduct.Quantity;
                }

                if (quantity < 10_000) Partners.Add(new(partner, 0));
                if (10_000 < quantity && quantity < 50_000) Partners.Add(new(partner, 5));
                if (50_000 < quantity && quantity < 300_000) Partners.Add(new(partner, 10));
                if (300_000 < quantity) Partners.Add(new(partner, 15));
            }
        }

        private void AddPartner_Click(object sender, RoutedEventArgs e)
        {
            PartnerWindow pw = new();
            pw.ShowDialog();
        }

        private void EditPartner_Click(object sender, RoutedEventArgs e)
        {
            PartnerWindow pw = new(null);
            pw.ShowDialog();
        }
    }
}
