using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent.Helper.I18n
{
    /// <summary>
    /// Estonian translations file
    /// </summary>
    public static class Est
    {
        /// <summary>
        /// Get the whole translations table
        /// </summary>
        /// <returns>Dictionary of placeholders : translations</returns>
        public static Dictionary<string, string> Table()
        {
            return new Dictionary<string, string>() { 
            {"login_Login", "Logi sisse"},
            {"login_Username", "Kasutaja"},
            {"login_Password", "Parool"}
            };
        }
    }
}
