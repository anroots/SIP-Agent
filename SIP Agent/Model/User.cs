using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent.Model
{

    public class User
    {

        private int ID { get; set; }

        

        /// <summary>
        /// Authenticate the user
        /// </summary>
        /// <param name="Username"></param>
        /// <param name="Password"></param>
        /// <returns>True on succes, False on authenticate error</returns>
        public bool Login(string Username, string Password)
        {
            // TODO!
            this.ID = 1;
            return true;
        }

        public User()
        {
            // TODO: Complete member initialization
        }
    }
}
