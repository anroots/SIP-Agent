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
using SIP_Agent.Model;

namespace SIP_Agent
{
    /// <summary>
    /// Interaction logic for SystemStandby.xaml
    /// </summary>
    public partial class SystemStandby : UserControl, ISwitchable
    {
        public SystemStandby()
        {
            InitializeComponent();

        }


        #region Event For Child Window
        private void btn_login_Click(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {

        }


        #endregion

        #region ISwitchable Members

        public void UtilizeState(object state)
        {
            throw new NotImplementedException();
        }




        #endregion

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {

                var clients = from obj in db.persons
                              select new { id = obj.id, name = obj.first_name, last = obj.last_name };

                cmbClient.ItemsSource = clients;
                cmbClient.DisplayMemberPath = "name";
                cmbClient.SelectedValuePath = "id";

                sender = cmbClient.SelectedValuePath;


            }

            // Do not load your data at design time.
            // if (!System.ComponentModel.DesignerProperties.GetIsInDesignMode(this))
            // {
            // 	//Load your data here and assign the result to the CollectionViewSource.
            // 	System.Windows.Data.CollectionViewSource myCollectionViewSource = (System.Windows.Data.CollectionViewSource)this.Resources["Resource Key for CollectionViewSource"];
            // 	myCollectionViewSource.Source = your data
            // }
        }

        /// <summary>
        /// Show the About window on menu click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Help_About_Click(object sender, RoutedEventArgs e)
        {
            Menu.Main.Help.About about = new Menu.Main.Help.About();
            about.Show();
        }

        private void cbClient_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {

                var clients = from x in db.persons
                              select new { id = x.id, name = x.first_name, last = x.last_name };

                cmbClient.ItemsSource = clients;
                cmbClient.DisplayMemberPath = "name";
                cmbClient.SelectedValuePath = "id";

                var clientID = (from x in db.persons
                                select x.id).FirstOrDefault();

                int callID = (int)clientID;

                var clientFirst_name = (from x in db.persons
                                        select x.first_name).FirstOrDefault();


                Switcher.Switch(new CallView(callID));

            }

        }
    }
}

