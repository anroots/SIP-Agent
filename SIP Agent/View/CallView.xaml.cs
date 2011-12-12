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

namespace SIP_Agent.View
{
    /// <summary>
    /// Interaction logic for CallView.xaml
    /// </summary>
    public partial class CallView : UserControl, ISwitchable
    {

        protected Model.Call CurrentCall;

        public CallView()
        {
            InitializeComponent();
        }


        /// <summary>
        /// Initialize the page by providing CALL ID to load
        /// </summary>
        /// <param name="callId">When given, open an already existing call</param>
        public CallView(int CallId = 0)
        {
            InitializeComponent();

            Model.Log.Write("Initialized call view for call #"+CallId);

            CurrentCall = new Model.Call(CallId);

            LabelCallID.Content = CallId.ToString(); // Call ID label

            // Bind data about the caller only if not null
            if (CurrentCall.Caller.Loaded())
            {
                userBox.Text = CurrentCall.CallerName;
                companyBox.Text = CurrentCall.Caller.Company.name;
                // Previous calls by caller
                lastCallsData.ItemsSource = new Model.Person(CurrentCall.Caller.id)
                    .PreviousCalls(CurrentCall.received);
            }
            summaryBox.Text = CurrentCall.summary;

            try
            {
                companyPic.Source = new BitmapImage(new Uri("pack://application:,,,/SIP Agent;component/Images/Avatars/" + CurrentCall.Caller.Company.id.ToString() + ".gif"));
            }
            catch (Exception) // The default pic remains on exception (404)
            {
            }

            lastEntry.ItemsSource = new Model.Task().GetTasks(CurrentCall.AssociatedTasks()); // Tasks associated with the call

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

     

        private void SaveData_Click(object sender, RoutedEventArgs e)
        {
            CurrentCall.summary = summaryBox.Text;
            if (CurrentCall.Save() != 0)
            {
                Helper.UI.flash(btn_saveData);
                Model.Log.Write("Successfully saved summary data.");
            }
            else
            {
                Helper.UI.flash(sender, Helper.UI.ERROR_BRUSH);
                MessageBox.Show("Viga Salvestamisel");
                Model.Log.Write("Failed to save summary data: " + summaryBox.Text);
            }

        }



        private void phonePreview(object sender, TextCompositionEventArgs e)
        {
            foreach (char ch in e.Text)
                if (!Char.IsDigit(ch))
                    e.Handled = true;
        }

        /// <summary>
        /// Open call .mp3 in external player
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnPlayback_Click(object sender, RoutedEventArgs e)
        {
            if (Model.Call.playback(CurrentCall.id))
            {
                Helper.UI.flash(sender, Helper.UI.SUCCESS_BRUSH);
            }
            else
            {
                Helper.UI.flash(sender, Helper.UI.ERROR_BRUSH);
            }
        }

        private void btnBindTask_Click(object sender, RoutedEventArgs e)
        {
            if (CurrentCall.BindTask(txtBindTaskId.Text))
            {
                txtBindTaskId.Clear();
                Helper.UI.flash(sender);
                Model.Log.Write("Successful binding of call #"+CurrentCall.id+" to task #"+txtBindTaskId.Text);
            }
            else
            {
                Helper.UI.flash(sender, Helper.UI.ERROR_BRUSH);
                MessageBox.Show("Sidumine ebaõnnestus: töö ID formaat on vigane või on kõne selle tööga juba seotud.");
                Model.Log.Write("Binding failed");
            }
        }

        /// <summary>
        /// Back to standby screen
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            Switcher.Switch(new SystemStandby());
        }

        /// <summary>
        /// Switch to task view
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lastEntry_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            Switcher.Switch(new TaskView((int)((DataGrid)sender).SelectedValue));
        }

       
    }
}
