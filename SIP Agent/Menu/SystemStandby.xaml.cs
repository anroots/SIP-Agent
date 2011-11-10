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
    /// Interaction logic for SystemStandby.xaml
    /// </summary>
    public partial class SystemStandby : UserControl, ISwitchable
    {
        public SystemStandby()
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
            Switcher.Switch(new UserMain());
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {

            // Do not load your data at design time.
            // if (!System.ComponentModel.DesignerProperties.GetIsInDesignMode(this))
            // {
            // 	//Load your data here and assign the result to the CollectionViewSource.
            // 	System.Windows.Data.CollectionViewSource myCollectionViewSource = (System.Windows.Data.CollectionViewSource)this.Resources["Resource Key for CollectionViewSource"];
            // 	myCollectionViewSource.Source = your data
            // }
        }

        /// <summary>
        /// Show the About window on menu click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Help_About_Click(object sender, RoutedEventArgs e)
        {
            Menu.Main.Help.About about = new Menu.Main.Help.About();
            about.Show();
        }


    }
}
