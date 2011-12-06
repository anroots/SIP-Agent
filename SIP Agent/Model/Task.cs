using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name = "Calls")]
    public class Task : Crud   {

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

        /// <summary>
        /// Holds the current DB object
        /// </summary>
        protected task Row;

        public Task(int TaskId)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                Row = Get(db, TaskId);

                id = Row.id;
                title = Row.title;
                status_id = Row.status_id;
                assignee_id = Row.assignee_id;
                details = Row.details;
            }
        }


        /// <summary>
        /// Check if the model is loaded
        /// </summary>
        /// <returns></returns>
        public bool Loaded()
        {
            return id != null;
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


        /// <summary>
        /// Save the model
        /// </summary>
        /// <returns></returns>
        public int Save()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var row = Get(db, id);
                Row.details = details;
                Row.title = title;
                try
                {
                    db.SubmitChanges();
                    return id;
                }
                catch (Exception e)
                {
                    return -1;
                }
            }
        }

  
    }
}
