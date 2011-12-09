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

namespace SIP_Agent.View
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {

                var clients = from row in db.persons
                              select new { id = row.id, name = row.first_name.Trim() + " " + row.last_name.Trim() };

                cmbClient.ItemsSource = clients;
                cmbClient.DisplayMemberPath = "name";
                cmbClient.SelectedValuePath = "id";

                sender = cmbClient.SelectedValuePath;
            }
        }




        /// <summary>
        /// Switch to call info screen
        /// Call is loaded with the selected person's info (as caller)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button2_Click(object sender, RoutedEventArgs e)
        {
            int callerID = SelectedPerson();
            // Caller has to be selected
            if (callerID == 0)
            {
                Model.Log.Write("text");
                return;
            }

            Call current = new Model.Call();
            int CallId = current.New();

            current.caller_id = callerID;
            current.Save();

            // Switch to a new view (pass on selected person ID)
            Switcher.Switch(new CallView(CallId));
        }

        /// <summary>
        /// Get the ID of the selected person
        /// </summary>
        /// <returns></returns>
        private int SelectedPerson()
        {
            // Caller has to be selected
            if (cmbClient.SelectedValue == null)
            {
                return 0;
            }

            // Get the selected person ID
            return Int32.Parse(cmbClient.SelectedValue.ToString());
        }

        /// <summary>
        /// Switch to person info edit screen
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnChangePerson_Click(object sender, RoutedEventArgs e)
        {
            Switcher.Switch(new PersonInfo(SelectedPerson()));
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            Switcher.Switch(new TaskView(1));
        }

    } // end of class
}

