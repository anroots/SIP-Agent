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
    /// Interaction logic for UserLogin.xaml
    /// </summary>
    public partial class TaskView : UserControl, ISwitchable
    {
        public Model.Task CurrentTask;

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

            // Select data sources from DB
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                // Status dropdown
                var statuses = from row in db.task_statuses
                               select new { id = row.id, name = row.name.Trim() };

                cmbStatus.ItemsSource = statuses;
                cmbStatus.DisplayMemberPath = "name";
                cmbStatus.SelectedValuePath = "id";
                cmbStatus.SelectedIndex = CurrentTask.status_id;

                // Persons dropdown
                var persons = from row in db.persons
                              select new { id = row.id, name = row.first_name.Trim() + " "+row.last_name.Trim() };

                cmbAssignee.ItemsSource = persons;
                cmbAssignee.DisplayMemberPath = "name";
                cmbAssignee.SelectedValuePath = "id";

                cmbAssignee.SelectedIndex = CurrentTask.assignee_id != null ? (int)CurrentTask.assignee_id : 0;
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
            Switcher.Switch(new View.SystemStandby());
        }

        /// <summary>
        /// Save task info
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            // todo!
        }






    }
}
