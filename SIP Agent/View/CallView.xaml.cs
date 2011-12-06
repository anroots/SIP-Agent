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
        /// <param name="callID">When given, open an already existing call</param>
        public CallView(int callID = 0)
        {
            InitializeComponent();

            // The XAML represents one call so create & load the model
            CurrentCall = new Model.Call(callID);

            LabelCallID.Content = callID.ToString(); // Call ID label

            userBox.Text = CurrentCall.Caller.first_name;
            summaryBox.Text = CurrentCall.summary;
            companyBox.Text = CurrentCall.Caller.Company.name;
            companyPic.Source = new BitmapImage(new Uri("pack://application:,,,/SIP Agent;component/Images/Avatars/" + CurrentCall.Caller.Company.id.ToString() + ".gif"));
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
                MessageBox.Show("Andmed baasi edukalt salvestatud");
            }
            else
            {
                MessageBox.Show("Viga Salvestamisel");
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
            Model.Call.playback(CurrentCall.id);
        }

        private void btnBindTask_Click(object sender, RoutedEventArgs e)
        {
            if (CurrentCall.BindTask(txtBindTaskId.Text))
            {
                txtBindTaskId.Clear();
            }
            else
            {
                MessageBox.Show("Sidumine ebaõnnestus: töö ID formaat on vigane või on kõne selle tööga juba seotud.");
            }
        }

       
    }
}
