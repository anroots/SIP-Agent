using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SIP_Agent
{
    /// <summary>
    /// Interaction logic for ClientInfo.xaml
    /// </summary>
    public partial class ClientInfo : UserControl, ISwitchable
    {
        public ClientInfo()
        {
            this.InitializeComponent();
        }

        #region ISwitchable Members
        public void UtilizeState(object state)
        {
            throw new NotImplementedException();
        }

        private void Button_Click(object sender, System.Windows.RoutedEventArgs e)
        {

        }
        #endregion

        private void btn_sSaveData_Click(object sender, RoutedEventArgs e)
        {
            SaveCustomerInfo();
        }

        private void SaveCustomerInfo()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                person pers = new person();
                pers.first_name = firstNameBox.Text;
                pers.last_name = lastNameBox.Text;

                db.persons.InsertOnSubmit(pers);


                phonebook phone = new phonebook();
                phone.phone = phoneBox.Text;
                phone.email = mailBox.Text;

                db.phonebooks.InsertOnSubmit(phone);

                company com = new company();
                com.name = companyBox.Text;

                db.companies.InsertOnSubmit(com);

                db.SubmitChanges();

                MessageBox.Show("Kliendi info salvestatud");

            }

            Switcher.Switch(new SystemStandby());

        }

    }
}

