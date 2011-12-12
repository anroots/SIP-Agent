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

            Model.Log.Write("Opened task #:TaskId.", new Dictionary<string, string>() { { ":TaskId", TaskId.ToString() } });

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
            // Task statuses
            cmbStatus.ItemsSource = new Model.TaskStatus().FindAll();

            // Task categories
            cmbCategory.ItemsSource = new Model.TaskCategory().FindAll();

            // All 3 persons selectboxes have same sources
            cmbAssignee.ItemsSource
                = cmbNotifier.ItemsSource
                = cmbClerk.ItemsSource
                = new Model.Person().FindAll();


            // Pre-fill values on existing tasks
            if (CurrentTask.Loaded())
            {
                txtTitle.DataContext = CurrentTask; // Title
                txtDetails.DataContext = CurrentTask; // Details
                lblTaskId.Content = CurrentTask.id; // ID

                // Info tab
                lblCreated.Content = CurrentTask.created.ToString();
                lblUpdated.Content = CurrentTask.updated == null ? Translate.str("Not yet changed") : CurrentTask.updated.Value.ToString();
                lblNotifier.Content = CurrentTask.NotifierName;
                lblClerk.Content = CurrentTask.ClerkName;
                lblCategory.Content = CurrentTask.CategoryName;

                // Status dropdown
                cmbStatus.SelectedIndex = Helper.UI.CmbIndexByValue(cmbStatus, CurrentTask.status_id);
                // Assignee dropdown
                cmbAssignee.SelectedIndex = Helper.UI.CmbIndexByValue(cmbAssignee, CurrentTask.assignee_id);
                // Clerk dropdown
                cmbClerk.SelectedIndex = Helper.UI.CmbIndexByValue(cmbClerk, CurrentTask.clerk_id);
                // Notifier dropdown
                cmbNotifier.SelectedIndex = Helper.UI.CmbIndexByValue(cmbNotifier, CurrentTask.notifier_id);
                // Task category dropdown
                cmbCategory.SelectedIndex = Helper.UI.CmbIndexByValue(cmbCategory, CurrentTask.category_id);

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
            CurrentTask.status_id = (int)((ComboBox)sender).SelectedValue;
        }

        // Open call view
        private void gridCalls_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            int CallId = (int)((DataGrid)sender).SelectedValue;
            Switcher.Switch(new View.CallView(CallId));
        }

        /// <summary>
        /// Notifier changed
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmbNotifier_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CurrentTask.notifier_id = (int)((ComboBox)sender).SelectedValue;
        }

        /// <summary>
        /// Clerk changed
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmbClerk_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CurrentTask.clerk_id = (int)((ComboBox)sender).SelectedValue;
        }

        /// <summary>
        /// Category changed
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmbCategory_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CurrentTask.category_id = (int)((ComboBox)sender).SelectedValue;
        }




    }
}
