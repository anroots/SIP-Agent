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
                Switcher.Switch(new SystemStandby());
            }
            else
            {
                MessageBox.Show("Login Failed!");
            }   
        }
    }
}
