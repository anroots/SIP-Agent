using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Controls;
using System.Windows.Media;

namespace SIP_Agent.Helper
{
    /// <summary>
    /// Common helper functions for managing the UI
    /// </summary>
    public static class UI
    {
        /// <summary>
        /// Flash an UI element to give visual feedback on action result.
        /// An example would be flashing the Save button red after an unsuccessful save.
        /// </summary>
        /// <param name="sender"></param>
        public static void flash(object sender)
        {
            Button btn = (Button)sender;

            var tmp = btn.Background;
            btn.Background = Brushes.LimeGreen;

            // Todo: now turn it off, please
            /*Timer timer = new Timer();
            timer.Interval = 1000;
            timer.SynchronizingObject =;
            timer.Start();
            btnSave.Background = tmp;
            */
        }
    }
}
