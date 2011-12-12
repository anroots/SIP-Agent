using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent.Helper
{
    class Functions
    {
        /// <summary>
        /// SHA1-encode a string
        /// </summary>
        /// <see cref="http://blog.logiclabz.com/c/function-to-encrypt-string-in-c-net-using-sha1-algorithm.aspx"/>
        /// <param name="input">Input string</param>
        /// <returns>SHA1-encoded string</returns>
        public static string HashPass(string input)
        {
            string rethash = "";
            try
            {
                System.Security.Cryptography.SHA1 hash = System.Security.Cryptography.SHA1.Create();
                System.Text.ASCIIEncoding encoder = new System.Text.ASCIIEncoding();
                byte[] combined = encoder.GetBytes(input);
                hash.ComputeHash(combined);
                rethash = Convert.ToBase64String(hash.Hash);
            }
            catch (Exception ex)
            {
                string strerr = "Error in HashCode : " + ex.Message;
            }
            return rethash;
        }

    }
}
