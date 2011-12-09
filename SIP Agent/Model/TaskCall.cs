using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    /// <summary>
    /// Binds tasks with calls
    /// </summary>
    [Table(Name = "TasksCalls")]
    class TaskCall : Crud, ICrud
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public int call_id { get { return CurrentRow.call_id; } set { CurrentRow.call_id = value; } }
        public int task_id { get { return CurrentRow.task_id; } set { CurrentRow.task_id = value; } }
        override public bool deleted { get { return false; } } // Mocked

        /// <summary>
        /// Represents the currently loaded row
        /// </summary>
        protected tasks_call CurrentRow;

       
        override public bool Load(int RowId)
        {
            CurrentConnection = new DatabaseDataContext();
            var q = from x in CurrentConnection.tasks_calls where x.id.Equals(RowId) select x;
            CurrentRow = q.FirstOrDefault();

            return true;
        }

        /// <summary>
        /// Creates a new row in the database
        /// </summary>
        /// <returns>Insert ID of the new row</returns>
        override public int New()
        {
            return -1; // FK constraints, call New(int, int) instead
        }

        /// <summary>
        /// Create a new binding between a task and a call
        /// </summary>
        /// <param name="TaskId">Task ID</param>
        /// <param name="CallId">Call ID</param>
        /// <returns>Insert ID of the new row</returns>
        public int New(int TaskId, int CallId) {

            // Check that there exists no identical binding
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var row = from x in db.tasks_calls where x.call_id == CallId && x.task_id == TaskId select id;
                if (row.Count() > 0)
                {
                    return -1;
                }
            }
            // Create a new mapping
            base.New();
            CurrentRow = new tasks_call();

            CurrentRow.task_id = TaskId;
            CurrentRow.call_id = CallId;

            CurrentConnection.tasks_calls.InsertOnSubmit(CurrentRow);
            CurrentConnection.SubmitChanges();

            return Save();
        }

        /// <summary>
        /// Unload the current row
        /// </summary>
        public void Unload()
        {
            CurrentRow = null;
        }


       
    }
}
