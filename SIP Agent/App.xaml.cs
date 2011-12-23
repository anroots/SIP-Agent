using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Windows;

namespace SIP_Agent
{


    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static Model.Person CurrentUser;
        private string version = System.Diagnostics.FileVersionInfo.GetVersionInfo(System.Windows.Forms.Application.ExecutablePath).FileVersion;
        
        /// <summary>
        /// Whether we have a database connection
        /// </summary>
        public static bool DatabaseConnection = true;

        public String Version
        {
            get { return version; }
        }

        // Main constructor for the application
        App()
        {
            try
            {
                Model.Log.Write("App started.");
            }
            catch (System.Data.SqlClient.SqlException)
            {
                DatabaseConnection = false;
            }
        }
    }
}
