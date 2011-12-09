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
        /// The brush used when painting objects on errors
        /// </summary>
        public static Brush ERROR_BRUSH = Brushes.PaleVioletRed;

        /// <summary>
        /// The brush used when painting objects on success
        /// </summary>
        public static Brush SUCCESS_BRUSH = Brushes.LimeGreen;

        /// <summary>
        /// Flash an UI element to give visual feedback on action result.
        /// An example would be flashing the Save button red after an unsuccessful save.
        /// </summary>
        /// <param name="sender">The target object (button)</param>
        /// <param name="color">The Brush to paint the object with</param>
        /// <param name="duration">How long to flash</param>
        public static void flash(object sender, Brush color = null, int duration = 4000)
        {
            if (color == null) {
                color = UI.SUCCESS_BRUSH;
            }

            // Save the original object
            flashObject = sender;
            Button b = (Button)sender;

            // Change background
            flashBackground = b.Background;
            b.Background = color;

            // Activate the timer to re-set the original background
            Timer timer = new Timer(duration);
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
