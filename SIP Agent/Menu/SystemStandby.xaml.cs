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
using SIP_Agent.Model;

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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void userBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            userBox.TextChanged += new TextChangedEventHandler(userBox_TextChanged);

            string typedString = userBox.Text;
            List<AutoComplete> ACNameList = new List<AutoComplete>();
            ACNameList.Clear();

            //TODO fix commented list
            List<string> PersonList = new List<string>();
            
            foreach (string item in PersonList)
            {
                if (!string.IsNullOrEmpty(userBox.Text))
                {
                    if (item.StartsWith(typedString))
                    {
                        //ACNameList.Add(item);
                        
                    }
                }
            }

            
            if (ACNameList.Count > 0)
            {
                SuggestionBox.ItemsSource = ACNameList;
                SuggestionBox.Visibility = Visibility.Visible;
            }
            else if (userBox.Text.Equals(""))
            {
                SuggestionBox.Visibility = Visibility.Collapsed;
                SuggestionBox.ItemsSource = null;
            }
            else
            {
                SuggestionBox.Visibility = Visibility.Collapsed;
                SuggestionBox.ItemsSource = null;
            }



        }

        private void btn_login_Click(object sender, RoutedEventArgs e)
        {
            Switcher.Switch(new CallView(2));
           
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


        private void SuggestionBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (SuggestionBox.ItemsSource != null)
            {
                SuggestionBox.Visibility = Visibility.Collapsed;
                userBox.TextChanged -= new TextChangedEventHandler(userBox_TextChanged);
                if (SuggestionBox.SelectedIndex != -1)
                {
                    userBox.Text = SuggestionBox.SelectedItem.ToString();
                }
                userBox.TextChanged += new TextChangedEventHandler(userBox_TextChanged);
            }

        }
    }
}
