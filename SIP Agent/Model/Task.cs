using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name = "Calls")]
    public class Task
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public int id { get; set; }
        public int parent_id { get; set; }
        public DateTime created { get; set; }
        public DateTime updated { get; set; }
        public string title { get; set; }
        public string details { get; set; }
        public int notifier_id { get; set; }
        public int? assignee_id { get; set; }
        public int clerk_id { get; set; }
        public int status_id { get; set; }
        public int category_id { get; set; }
        public int deleted { get; set; }

        public Task(int TaskId)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var row = Get(db, TaskId);

                id = row.id;
                title = row.title;
                status_id = row.status_id;
                assignee_id = row.assignee_id;
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="db"></param>
        /// <param name="TaskId"></param>
        /// <returns></returns>
        public task Get(DatabaseDataContext db, int TaskId = 0)
        {
            var q = from x in db.tasks where x.id.Equals(TaskId) && x.deleted.Equals(0) select x;
            return q.FirstOrDefault();
        }
    }
}
