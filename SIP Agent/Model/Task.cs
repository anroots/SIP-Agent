using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name = "Tasks")]
    public class Task : Crud
    {

        public int parent_id { get { return CurrentRow.id; } }
        public DateTime created { get; set; }
        public DateTime updated { get; set; }
        public string title { get; set; }
        public string details { get; set; }
        public int notifier_id { get; set; }
        public int? assignee_id { get; set; }
        public int clerk_id { get; set; }
        public int status_id { get; set; }
        public int category_id { get; set; }

        public Task(int TaskId)
        {
            Load(TaskId); // Load Task data
        }

        /// <summary>
        /// Load the model with the specified ID
        /// </summary>
        /// <param name="TaskId">The ID of the row in the database</param>
        /// <returns>True on success, False on failure</returns>
        override public bool Load(int TaskId)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var q = from x in db.tasks where x.id.Equals(TaskId) && x.deleted.Equals(0) select x;
                CurrentRow = q.FirstOrDefault();

                id = CurrentRow.id;
                title = CurrentRow.title;
                status_id = CurrentRow.status_id;
                assignee_id = CurrentRow.assignee_id;
                details = CurrentRow.details;
                return true;
            }
        }

    }
}
