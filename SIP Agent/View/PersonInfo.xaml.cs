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
        public Model.Person CurrentPerson;

        /// <summary>
        /// Load an existing person
        /// </summary>
        /// <param name="personId"></param>
        public PersonInfo(int PersonId = 0)
        {
            InitializeComponent();
            Model.Log.Write("Initialized PersonInfo screen for person #:PersonId.", new Dictionary<string,string>(){{":PersonId", PersonId.ToString()}});
            CurrentPerson = new Model.Person(PersonId);
            
            TheGrid.DataContext = CurrentPerson;
            companyBox.ItemsSource = new Model.Company().FindAll();
            companyBox.SelectedIndex = Helper.UI.CmbIndexByValue(companyBox, CurrentPerson.company_id);
            phoneBox.Text = CurrentPerson.Phone;
            mailBox.Text = CurrentPerson.Email;
        }

        /// <summary>
        /// Don't load anything, just show empty fields
        /// </summary>
        public PersonInfo()
        {
            InitializeComponent();
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

        /// <summary>
        /// Save person data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_sSaveData_Click(object sender, RoutedEventArgs e)
        {
            CurrentPerson.first_name = firstNameBox.Text;
            CurrentPerson.last_name = lastNameBox.Text;
            CurrentPerson.username = userNameBox.Text;
            CurrentPerson.company_id = (int)companyBox.SelectedValue;

            if (passWordBox.Text.Length > 0)
            {
                CurrentPerson.password = passWordBox.Text;
            }

            if (CurrentPerson.Save() > 0)
            {
                Helper.UI.flash(sender, Helper.UI.SUCCESS_BRUSH);
                Model.Log.Write("Saved person #:PersonId.", new Dictionary<string,string>(){{":PersonId", CurrentPerson.id.ToString()}});
            } else {
                Helper.UI.flash(sender, Helper.UI.ERROR_BRUSH);
                Model.Log.Write("Saving of person #:PersonId failed.", new Dictionary<string,string>(){{":PersonId", CurrentPerson.id.ToString()}});
            }
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

    

        

        /// <summary>
        /// Mark person as deleted
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void checkBox1_Checked(object sender, RoutedEventArgs e)
        {
            CurrentPerson.deleted = true;
        }

        /// <summary>
        /// Mark person as undeleted
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void checkBox1_Unchecked(object sender, RoutedEventArgs e)
        {
            CurrentPerson.deleted = false;
        }
    

    }
}

