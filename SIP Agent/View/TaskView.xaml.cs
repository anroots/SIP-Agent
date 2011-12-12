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
using System.Timers;

namespace SIP_Agent
{
    /// <summary>
    /// Interaction logic for UserLogin.xaml
    /// </summary>
    public partial class TaskView : UserControl, ISwitchable
    {
        protected Model.Task CurrentTask;

        public TaskView(int TaskId)
        {
            InitializeComponent();

            // Load task info
            CurrentTask = new Model.Task(TaskId);

            // Populate controls with info
            LoadValues();

        }

        /// <summary>
        /// Load control values
        /// </summary>
        private void LoadValues()
        {

            txtTitle.DataContext = CurrentTask; // Title
            txtDetails.DataContext = CurrentTask; // Details

            // Status dropdown
            cmbStatus.ItemsSource = new Model.TaskStatus().FindAll();
            cmbStatus.SelectedIndex = CurrentTask.status_id;

            // Assignee dropdown
            cmbAssignee.ItemsSource = new Model.Person().FindAll();

            cmbAssignee.SelectedIndex = CurrentTask.assignee_id != null ? (int)CurrentTask.assignee_id : 0;

            // Find all associated calls for the calls DataGrid
            gridCalls.ItemsSource = new Model.Call().GetCalls(CurrentTask.Calls());

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
        /// Move back to the Standby screen
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            Model.Log.Write("Initialized system standby view.");
            Switcher.Switch(new View.SystemStandby());
        }

        /// <summary>
        /// Save task info
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (CurrentTask.Save() > -1)
            {
                Helper.UI.flash(sender, Helper.UI.SUCCESS_BRUSH);
                Model.Log.Write("Successfully saved task information" + CurrentTask);
            }
            else
            {
                Helper.UI.flash(sender, Helper.UI.ERROR_BRUSH);
                MessageBox.Show("Salvestamine ebaõnnestus.");
                Model.Log.Write("Failed to save task information" + CurrentTask);
            }
        }

        /// <summary>
        /// Change Assignee ID (but do not save yet!)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmbAssignee_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CurrentTask.assignee_id = (int)cmbAssignee.SelectedValue;
        }

        /// <summary>
        /// Change Status ID (but do not save yet!)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmbStatus_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CurrentTask.status_id = (int)cmbStatus.SelectedValue;
        }




    }
}
