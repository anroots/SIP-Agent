using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name="task_statuses")]
    class TaskStatus : Crud, ICrud
    {

     [Column(IsPrimaryKey = true, IsDbGenerated = true)] 
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public string name { get { return CurrentRow.name; } set { CurrentRow.name = value; } }
        override public bool deleted { get { return CurrentRow.deleted; } }

        protected task_status CurrentRow;

        /// <summary>
        /// Load the model with the specified ID
        /// </summary>
        /// <param name="StatusId">The ID of the row in the database</param>
        /// <returns>True on success, False on failure</returns>
        override public bool Load(int StatusId)
        {
            CurrentConnection = new DatabaseDataContext();
            var q = from x in CurrentConnection.task_status where x.id.Equals(StatusId) && x.deleted.Equals(0) select x;
            CurrentRow = q.FirstOrDefault();
            return true;
        }

        /// <summary>
        /// Unload the current row
        /// </summary>
        public void Unload()
        {
            CurrentRow = null;
        }

        /// <summary>
        /// Creates a new entry in the database
        /// </summary>
        /// <returns>The insert ID of the new entry</returns>
        override public int New()
        {
            base.New();
            Load(0);
            CurrentConnection.task_status.InsertOnSubmit(CurrentRow);
            return Save();
        }

    


        /// <summary>
        /// Find all statuses
        /// </summary>
        /// <returns>IQueryable rows</returns>
        override public IQueryable FindAll()
        {
            base.FindAll();
                return from row in CurrentConnection.task_status
                       where row.deleted.Equals(0)
                       select new { id = row.id, name = row.name.Trim() };
            
        }

    }
}
