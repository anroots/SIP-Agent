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
    /// Interaction logic for ClientInfo.xaml
    /// </summary>
    public partial class ClientInfo : UserControl, ISwitchable
    {
        public ClientInfo()
        {
            this.InitializeComponent();
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

        private void btn_sSaveData_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void btn_UserMain_Click(object sender, RoutedEventArgs e)
        {
            Switcher.Switch(new UserMain());
        }

    }
}
