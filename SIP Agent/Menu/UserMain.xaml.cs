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
using SIP_Agent.Menu;
using System.Data.Objects.SqlClient;

namespace SIP_Agent
{
    /// <summary>
    /// Interaction logic for UserMain.xaml
    /// </summary>
    public partial class UserMain : UserControl, ISwitchable
    {

        protected Model.Call Call;

        public UserMain()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Initialize the page by providing CALL ID to load
        /// </summary>
        /// <param name="callID">When given, open an already existing call</param>
        public UserMain(int callID = 0)
        {
            InitializeComponent();

            callID = 1; // stub until autocomplete is ready

            // The XAML represents one call so create & load the model
            Call = new Model.Call(callID);

            lblCallID.Content = callID.ToString();

            //this.summaryBox.DataContext = Call;
            userBox.Text = Call.Caller.first_name;
            summaryBox.Text = Call.summary;
            companyBox.Text = Call.Caller.Company.name;
            companyPic.Source = new BitmapImage(new Uri("pack://application:,,,/SIP Agent;component/Images/Avatars/"+Call.Caller.Company.id.ToString()+".gif"));

        }
  

        #region ISwitchable Members
        public void UtilizeState(object state)
        {
            throw new NotImplementedException();
        }

        private void loginTextBlock_MouseLeftButtonDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
        //    Switcher.Switch(new Login());
        }


        #endregion

        private void image1_ImageFailed(object sender, ExceptionRoutedEventArgs e)
        {

        }

        private void SaveData_Click(object sender, RoutedEventArgs e)
        {
            SaveCustomerInfo();
        /*
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var query = (from x in db.persons
                             where x.ID == change.id
                             select x).FirstOrDefault();

                query.first_name = change.Nimi;
                query.last_name = change.Tehtud;
                query.Tegija_ID = change.tegija.ID;
                query.Prioriteet_ID = change.prioriteet.ID;
                //lisab muudatused
                db.SubmitChanges();

        */

               

        }

        private void SaveCustomerInfo()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                Model.Person per = new Model.Person();
                per.username = userBox.Text;

                Model.Company comp = new Model.Company();
                comp.name = companyBox.Text;

                phoneBox phon = new phoneBox();
                phon.phone = phoneBox.Text;

                //calls callInfo = new calls();
                //callInfo.summary = summaryBox.Text; // deprecated

                tasks callTask = new tasks();
                callTask.details = summaryBox.Text;


                //db.companies.InsertOnSubmit(comp);

                try
                {
                    //db.persons.InsertOnSubmit(per);

                    db.SubmitChanges();


                    MessageBox.Show("Andmed baasi edukalt salvestatud");
                }
                catch (Exception e)
                {
                    MessageBox.Show("Viga Salvestamisel");
                }

            }//Close db connection
        }

        private void phonePreview(object sender, TextCompositionEventArgs e)
        {
            foreach (char ch in e.Text)
                if (!Char.IsDigit(ch))
                    e.Handled = true;
        }
    }
}
