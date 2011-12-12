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

        /// <summary>
        /// Holds the current task row
        /// </summary>
        protected Model.Task CurrentTask;

        /// <summary>
        /// Default constructor - load a task with given ID
        /// </summary>
        /// <param name="TaskId">Task ID to load</param>
        public TaskView(int TaskId)
        {
            InitializeComponent();

            Model.Log.Write("Opened task #:TaskId.", new Dictionary<string, string>(){{":TaskId", TaskId.ToString()}});

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
            cmbStatus.ItemsSource = new Model.TaskStatus().FindAll();
            cmbAssignee.ItemsSource = new Model.Person().FindAll();

            if (CurrentTask.Loaded())
            {
                txtTitle.DataContext = CurrentTask; // Title
                txtDetails.DataContext = CurrentTask; // Details

                // Status dropdown
                cmbStatus.SelectedIndex = CurrentTask.status_id - 1;

                // Assignee dropdown
                cmbAssignee.SelectedIndex = CurrentTask.assignee_id == null ? 0 : (int)CurrentTask.assignee_id - 1;


                // Find all associated calls for the calls DataGrid
                gridCalls.ItemsSource = new Model.Call().GetCalls(CurrentTask.Calls());
            }
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

        // Open call view
        private void gridCalls_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            int CallId = (int)((DataGrid)sender).SelectedValue;
            Switcher.Switch(new View.CallView(CallId));
        }




    }
}
