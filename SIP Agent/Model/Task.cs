using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name = "Tasks")]
    public class Task : Crud, ICrud
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public int? parent_id { get { return CurrentRow.parent_id; } set { CurrentRow.parent_id = value; } }
        public DateTime created { get { return CurrentRow.created; } }
        public DateTime? updated { get { return CurrentRow.updated; } set { CurrentRow.updated = value; } }
        public string title { get { return CurrentRow.title; } set { CurrentRow.title = value; } }
        public string details { get { return CurrentRow.details; } set { CurrentRow.details = value; } }
        public int? notifier_id { get { return CurrentRow.notifier_id; } set { CurrentRow.notifier_id = value; } }
        public int? assignee_id { get { return CurrentRow.assignee_id; } set { CurrentRow.assignee_id = value; } }
        public int clerk_id { get { return CurrentRow.clerk_id; } set { CurrentRow.clerk_id = value; } }
        public int status_id { get { return CurrentRow.status_id; } set { CurrentRow.status_id = value; } }
        public int category_id { get { return CurrentRow.category_id; } set { CurrentRow.category_id = value; } }
        override public bool deleted { get { return CurrentRow.deleted; } }

        /// <summary>
        /// Holds the current row
        /// </summary>
        protected new task CurrentRow { get; set; }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="TaskId"></param>
        public Task(int TaskId)
        {
            Load(TaskId); // Load Task data
        }

        /// <summary>
        /// 
        /// </summary>
        public Task()
        {
        }


        /// <summary>
        /// Load the model with the specified ID
        /// </summary>
        /// <param name="TaskId">The ID of the row in the database</param>
        /// <returns>True on success, False on failure</returns>
        override public bool Load(int TaskId)
        {
            base.Load(TaskId);
            var q = from x in CurrentConnection.tasks where x.id.Equals(TaskId) && x.deleted.Equals(0) select x;
            CurrentRow = q.FirstOrDefault();
            return true;
        }

        /// <summary>
        /// Creates a new entry in the database
        /// </summary>
        /// <returns>The insert ID of the new entry</returns>
        override public int New()
        {
            base.New();
            Load(0);
            CurrentConnection.tasks.InsertOnSubmit(CurrentRow);
            return Save();
        }


        /// <summary>
        /// Find all non-deleted rows
        /// </summary>
        /// <param name="Limit">Max number of rows to return</param>
        /// <returns></returns>
        override public IQueryable FindAll(int Limit = 0)
        {
            base.FindAll();
            var results = from row in CurrentConnection.tasks
                   where row.deleted.Equals(0)
                   select row;
             if (Limit > 0) {return results.Take(Limit);}return results;
        }

    }
}
