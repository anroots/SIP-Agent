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

namespace SIP_Agent.View
{
    /// <summary>
    /// Interaction logic for PersonInfo.xaml
    /// </summary>
    public partial class PersonInfo : UserControl, ISwitchable
    {
        /// <summary>
        /// Holds the data for the currently loaded Person
        /// </summary>
        public Model.Person Person;

        /// <summary>
        /// Load an existing person
        /// </summary>
        /// <param name="personId"></param>
        public PersonInfo(int personId = 0)
        {
            Person = new Model.Person(personId);
        }

        /// <summary>
        /// Don't load anything, just show empty fields
        /// </summary>
        public PersonInfo()
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
                pers.username = userNameBox.Text;
                pers.password = passWordBox.Text;

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

            Switcher.Switch(new View.SystemStandby());

        }

        /// <summary>
        /// Navigate back to standby screen
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            Switcher.Switch(new View.SystemStandby());
        }

        private void companyBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {

                var companies = from x in db.companies
                                select new { name = x.name };

                companyBox.ItemsSource = companies;
            }
        }

        private void checkBox1_Checked(object sender, RoutedEventArgs e)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                person pers = new person();
                pers.username = userNameBox.Text;
                pers.password = passWordBox.Text;

                db.persons.DeleteOnSubmit(pers);

                db.SubmitChanges();

                MessageBox.Show("Kasutaja info kustutatud");
            }
        }


    }
}

