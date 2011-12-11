using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name="task_status")]
    class TaskStatus : Crud, ICrud
    {

     [Column(IsPrimaryKey = true, IsDbGenerated = true)] 
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public string name { get { return CurrentRow.name; } set { CurrentRow.name = value; } }
        override public bool deleted { get { return CurrentRow.deleted; } }

        protected new task_statuse CurrentRow { get; set; }

        /// <summary>
        /// Load the model with the specified ID
        /// </summary>
        /// <param name="StatusId">The ID of the row in the database</param>
        /// <returns>True on success, False on failure</returns>
        override public bool Load(int StatusId)
        {
            var q = from x in CurrentConnection.task_statuses where x.id.Equals(StatusId) && x.deleted.Equals(0) select x;
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
            CurrentConnection.task_statuses.InsertOnSubmit(CurrentRow);
            return Save();
        }




        /// <summary>
        /// Find all non-deleted rows
        /// </summary>
        /// <param name="Limit">Max number of rows to return</param>
        /// <returns></returns>
        override public IQueryable FindAll(int Limit = 100)
        {
            base.FindAll();
            return (from row in CurrentConnection.task_statuses
                       where row.deleted.Equals(0)
                       select new { id = row.id, name = row.name.Trim() }).Take(Limit);
            
        }

    }
}
