using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{


    [Table(Name = "Logs")]
    public class Log
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public int id { get; set; }
        public string text { get; set; }
        
        public int person_id { get; set; }
        [Column(IsDbGenerated=true)]
        public DateTime created { get; set; }

        public Person Person;

        /// <summary>
        /// Create a new log
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static int New(string text = null)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                log current = new log
                {
                    person_id = App.CurrentUser.id > 0 ? App.CurrentUser.id : 1,
                    created = DateTime.Now,
                    text = text
                };
                db.logs.InsertOnSubmit(current);
                db.SubmitChanges();
                return current.id;
            }
        }
    }

}

