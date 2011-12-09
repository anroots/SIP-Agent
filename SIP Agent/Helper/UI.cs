using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Controls;
using System.Windows.Media;
using System.Timers;
using System.Windows.Threading;

namespace SIP_Agent.Helper
{
    /// <summary>
    /// Common helper functions for managing the UI
    /// </summary>
    public static class UI
    {
        /// <summary>
        /// Stores the object awaiting flash cancellation
        /// </summary>
        public static object flashObject;

        /// <summary>
        /// Stores the original background of a flashing object
        /// </summary>
        public static Brush flashBackground;


        /// <summary>
        /// Flash an UI element to give visual feedback on action result.
        /// An example would be flashing the Save button red after an unsuccessful save.
        /// </summary>
        /// <param name="sender"></param>
        public static void flash(object sender)
        {
            // Save the original object
            flashObject = sender;
            Button b = (Button)sender;

            // Change background
            flashBackground = b.Background;
            b.Background = Brushes.LimeGreen;

            // Activate the timer to re-set the original background
            Timer timer = new Timer(3000);
            timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
            timer.Start();

        }

        /// <summary>
        /// Called when the flashing timer activates. Resets the background,
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public static void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            // Stop and dispose of the timer
            Timer timer = (Timer)sender;
            timer.Stop();
            timer.Dispose();

            // Reset the background
            Button b = (Button)flashObject;
            b.Dispatcher.BeginInvoke(
  System.Windows.Threading.DispatcherPriority.Normal
  , new System.Windows.Threading.DispatcherOperationCallback(delegate
  {
      b.Background = flashBackground;

      b.Background.Clone().BeginAnimation(Button.BackgroundProperty, null);
      return null;
  }), null);

        }
    }
}
