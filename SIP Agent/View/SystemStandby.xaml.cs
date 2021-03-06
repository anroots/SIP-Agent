﻿using System;
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
        /// <summary>
        /// Main window position is set after login, this variable
        /// makes sure it's not set twice
        /// </summary>
        public static bool PositionSet = false;

        public SystemStandby()
        {
            InitializeComponent();
            Model.Log.Write("Initialized system standby view.");
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
        /// Control loaded
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            // Set window position
            if (SystemStandby.PositionSet == false)
            {
                App.Current.MainWindow.Top = 10;
                App.Current.MainWindow.Left = 10;
                SystemStandby.PositionSet = true;
            }

            // Persons selectbox
            cmbClient.ItemsSource = new Model.Person().FindAll();

            // Fill Datagrids with info
            dataGridTasks.ItemsSource = new Model.Task().FindAll(50);
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
            int callerID = SelectedPerson();
            // Caller has to be selected
            if (callerID == 0)
            {
                Helper.UI.flash(sender, Helper.UI.ERROR_BRUSH);
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
            return (int)cmbClient.SelectedValue;
        }

        /// <summary>
        /// Switch to person info edit screen
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnChangePerson_Click(object sender, RoutedEventArgs e)
        {
            if (SelectedPerson() > 0)
            {
                Switcher.Switch(new View.PersonInfo(SelectedPerson()));
            }
            else
            {
                Helper.UI.flash(sender, Helper.UI.ERROR_BRUSH);
            }
        }

        /// <summary>
        /// Logout
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnLogout_Click(object sender, RoutedEventArgs e)
        {
            Model.Log.Write("Logout ::UserName", new Dictionary<string,string>(){{":UserName", App.CurrentUser.username}});
            App.CurrentUser.Logout();
            Switcher.Switch(new UserLogin());
        }

        /// <summary>
        /// Open selected task
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dataGridTasks_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            try
            {
                int TaskId = (int)((DataGrid)sender).SelectedValue;
                Switcher.Switch(new TaskView(TaskId));
            }
            catch (NullReferenceException nex)
            {
                Console.WriteLine(nex.ToString());
            }
        }

        /// <summary>
        /// Open selected call
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dataGridCalls_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            try
            {
                int CallId = (int)((DataGrid)sender).SelectedValue;
                Switcher.Switch(new CallView(CallId));
            }
            catch (NullReferenceException nex)
            {
                Console.WriteLine(nex.ToString());
            }
        }

        /// <summary>
        /// Create new task
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnBewTask_Click(object sender, RoutedEventArgs e)
        {
            Switcher.Switch(new TaskView(0));
        }

        /// <summary>
        /// Doubleclick on log row - show message
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dataGridLogs_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            try
            {
                log row = (log)((DataGrid)sender).SelectedItem;
                MessageBox.Show(row.I18nText);
            }
            catch (NullReferenceException) { }
        }

        /// <summary>
        /// Create new person
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button1_Click(object sender, RoutedEventArgs e)
        {
            int PersonId = new Model.Person().New();
            Switcher.Switch(new PersonInfo(PersonId));
        }

    }
}

