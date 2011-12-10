using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent.Helper
{
    /// <summary>
    /// Translate (translation) class
    /// Used by the system to translate GUI elements and messages.
    /// </summary>
    public static class Translate
    {
        // Language constants, use them to refer to languages
        public const string ESTONIAN = "Est";
        public const string ENGLISH = "Eng";

        /// <summary>
        /// Default language
        /// </summary>
        private static string defaultLang = Translate.ESTONIAN;

        /// <summary>
        /// Current language
        /// </summary>
        private static string lang = Translate.defaultLang;


        /// <summary>
        /// A list of languages supported by the system
        /// </summary>
        private static List<string> supported = new List<string>() { 
            Translate.ESTONIAN,
            Translate.ENGLISH
        };


        /// <summary>
        /// Get or set the current language
        /// </summary>
        public static string Lang
        {
            get { return lang; }
            set
            {
                // Specified language if supported, else default
                if (supported.Contains(value))
                {
                    lang = value;
                }
                else
                {
                    lang = defaultLang;
                }
            }
        }

        /// <summary>
        /// Translate a string placeholder into the current language
        /// </summary>
        /// <param name="input">String placeholder from a translations file</param>
        /// <param name="replacements">A dictionary of replacements to do in the translated string</param>
        /// <returns>Translated string or input itself if string not found</returns>
        public static string str(string input, Dictionary<string, string> replacements = null)
        {
            // todo: Multilanguage support (reflection), dynamic loading and unloading
            Dictionary<string, string> translations = I18n.Est.Table();

            // Lookup the translation
            if (translations.ContainsKey(input))
            {
                input = translations[input];
            }

            // Do replacements within the translated text
            if (replacements != null)
            {
                foreach (KeyValuePair<string, string> replacement in replacements)
                {
                    if (input.Contains(replacement.Key))
                    {
                        input = input.Replace(replacement.Key, replacement.Value);
                    }
                }
            }

            return input;
        }
    }
}
