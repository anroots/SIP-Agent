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

        private void passwordBox_PasswordChanged(object sender, RoutedEventArgs e)
        {

        }

        private void userBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void btn_login_Click(object sender, RoutedEventArgs e)
        {

            if (App.CurrentUser.Login(txtUsername.Text, txtPassword.Password))
            {
                Model.Log.New("Successful authentication for user " + txtUsername.Text);
                Switcher.Switch(new SystemStandby());
            }
            else
            {
                MessageBox.Show("Login Failed!");
                Model.Log.New("Failed authentication for user "+txtUsername.Text);
            }   
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            Model.Log.New("Initialized.");
            App.CurrentUser.Login("ando", "ando");  // stub
            Switcher.Switch(new TaskView(1)); // stub
        }

        /// <summary>
        /// Show the About window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button1_Click(object sender, RoutedEventArgs e)
        {
            Menu.Main.Help.About about = new Menu.Main.Help.About();
            about.Show();
        }

      
    }
}
