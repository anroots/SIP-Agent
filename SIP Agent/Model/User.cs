using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent.Model
{

    public class Person
    {

        private int ID { get; set; }
        private string first_name { get; set; }

        

        /// <summary>
        /// Authenticate the user
        /// </summary>
        /// <param name="Username"></param>
        /// <param name="Password"></param>
        /// <returns>True on succes, False on authenticate error</returns>
        public bool Login(string Username, string Password)
        {

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var query = from x 
                                in db.persons 
                            where  (x.first_name+x.last_name).Equals(Username) 
                            where x.password.Equals(Password)
                            select x;

                if (query.Count() > 0)
                {
                    this.ID = query.FirstOrDefault().id;
                    return true;
                }
            }
            return false;
        }

        public Person()
        {
            // TODO: Complete member initialization
        }
    }
}
