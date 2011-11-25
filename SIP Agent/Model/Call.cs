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

        // Call has relation to caller
        // Todo : find a more resource - friendly way
        public Person Caller;

        /// <summary>
        /// Create and load the model
        /// </summary>
        /// <param name="callID"></param>
        public Call(int callID)
        {

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var q = from x in db.calls where x.id.Equals(callID) && x.deleted.Equals(0) select x;
                if (q.Count() == 0)
                {
                    throw new Exception("Call with ID "+ callID.ToString()+" not found");
                }

                // Todo: refactor to bindings!
                var row = q.FirstOrDefault();
                id = row.id;
                summary = row.summary;
                caller_id = row.caller_id.Value;
                clerk_id = row.clerk_id.Value;
                received = row.received;
                start = row.start.Value;
                finished = row.finished.Value;
                deleted = row.deleted;
                Caller = new Person(caller_id);
                
            }
        }
    }
}
