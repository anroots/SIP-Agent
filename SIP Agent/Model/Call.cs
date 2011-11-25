using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{


    [Table(Name = "Calls")]
    public class Call
    {
        [Column(IsPrimaryKey = true)]
        public int id { get; set; }
        public string summary { get; set; }
        public int caller_id { get; set; }
        public int clerk_id { get; set; }
        public DateTime received { get; set; }
        public DateTime start { get; set; }
        public DateTime finished { get; set; }
        public int deleted { get; set; }


        public Call(int ID)
        {

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var q =from x in db.calls select x;
                summary = q.FirstOrDefault().summary;
            }
        }
    }
}
