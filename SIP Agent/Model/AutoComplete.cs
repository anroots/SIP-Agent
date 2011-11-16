using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent.Model
{
    public class AutoComplete
    {
        //public int id { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }


        /// <summary>
        /// Connect to database and select usable autocomplete values
        /// </summary>
        public static void ACNameValue()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var query = (from x in db.persons
                             select x).FirstOrDefault();
                

                string first_name = query.first_name;
                string last_name = query.last_name;

                List<string> PersonList = new List<string>();
                PersonList.Add(first_name+ " " +last_name);

                

            }

        }

    }
        /**
    public class AutoCompletePhone
    {
            public int phone { get; set; }

            public static void ACPhone(){

            using (DatabaseDataContext db = new DatabaseDataContext()){

          //  var query = (from x in db.persons
                         
                //TODO !! phone nr query
          }

        }

    }
  
        * */
}

