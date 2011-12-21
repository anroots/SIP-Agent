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
using System.Diagnostics;

namespace SIP_Agent.View
{
    /// <summary>
    /// Interaction logic for UserLogin.xaml
    /// </summary>
    public partial class UserLogin : UserControl, ISwitchable
    {
        public UserLogin()
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
        /// Clicked the Login btn
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_login_Click(object sender, RoutedEventArgs e)
        {
            App.CurrentUser = new Model.Person();
            if (App.CurrentUser.Login(txtUsername.Text, txtPassword.Password))
            {
                Model.Log.Write("Successful authentication for user " + txtUsername.Text);
                Switcher.Switch(new SystemStandby());
            }
            else
            {
                Helper.UI.flash(sender, Helper.UI.ERROR_BRUSH);
                txtPassword.Clear();
                Model.Log.Write("Failed authentication for user "+txtUsername.Text);
            }   
        }

        /// <summary>
        /// Login view ready
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            Model.Log.Write("Initialized login screen.");
            App.CurrentUser = new Model.Person();
            txtUsername.Focus();

            // Uncomment to "cheat" login during development
            //App.CurrentUser.Login("ando", "ando");  // stub
            //Switcher.Switch(new SystemStandby()); // stub
        }

        /// <summary>
        /// Show the About Us window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Hyperlink_Click(object sender, RoutedEventArgs e)
        {
            Menu.Main.Help.About about = new Menu.Main.Help.About();
            about.Show();
        }

        private void Hyperlink_RequestNavigate(object sender, RequestNavigateEventArgs e)
        {
            Process.Start(new ProcessStartInfo(e.Uri.AbsoluteUri));
            e.Handled = true;
        }

        /// <summary>
        /// Close login screen on esc press
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UserControl_KeyUp(object sender, KeyEventArgs e)
        {

            if (e.Equals(Key.Escape))
            {
                App.Current.Shutdown(0);
            }
        }

        /// <summary>
        /// Exit
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button1_Click(object sender, RoutedEventArgs e)
        {
            App.Current.Shutdown();
        }
      
    }
}
