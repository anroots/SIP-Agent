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
            // Set window position
            App.Current.MainWindow.Top = 10;
            App.Current.MainWindow.Left = 10;

            // Persons selectbox
            cmbClient.ItemsSource = new Model.Person().FindAll();

            // Fill Datagrids with info
            dataGridTasks.ItemsSource = new Model.Task().FindAll(50);
            //dataGridTasks.SelectedValuePath = "ID";
            dataGridCalls.ItemsSource = new Model.Call().FindAll(50);
            dataGridLogs.ItemsSource = Model.Log.Instance.FindAll(100);
        }




        /// <summary>
        /// Switch to call info screen
        /// Call is loaded with the selected person's info (as caller)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button2_Click(object sender, RoutedEventArgs e)
        {
            Model.Log.Write("Initialized make new call.");
            int callerID = SelectedPerson();
            // Caller has to be selected
            if (callerID == 0)
            {
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
            Model.Log.Write("Initialized change person information.");
            Switcher.Switch(new PersonInfo(SelectedPerson())); //When using SelectedPerson, it won't work.
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            Model.Log.Write("Initialized open task");
            Switcher.Switch(new TaskView(1));

        }

        /// <summary>
        /// Logout
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnLogout_Click(object sender, RoutedEventArgs e)
        {
            App.CurrentUser.Logout();
            Model.Log.Write("User logged out: " + App.CurrentUser.username);
            Switcher.Switch(new UserLogin());
        }

        private void dataGridTasks_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            int TaskId = (int)dataGridTasks.SelectedValue;
            Switcher.Switch(new TaskView(TaskId));
        }

    } // end of class
}

