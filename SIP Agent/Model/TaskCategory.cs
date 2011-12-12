using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name = "task_categories")]
    class TaskCategory : Crud, ICrud
    {

        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public string name { get { return CurrentRow.name; } set { CurrentRow.name = value; } }
        override public bool deleted { get { return CurrentRow.deleted; } }

        /// <summary>
        /// Default category for new tasks
        /// </summary>
        public const int DEFAULT = 1;

        /// <summary>
        /// Holds the currently loaded row
        /// </summary>
        protected new task_category CurrentRow { get; set; }

        /// <summary>
        /// Load the model with the specified ID
        /// </summary>
        /// <param name="StatusId">The ID of the row in the database</param>
        /// <returns>True on success, False on failure</returns>
        override public bool Load(int StatusId)
        {
            var q = from x in CurrentConnection.task_categories where x.id.Equals(StatusId) && x.deleted.Equals(0) select x;
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
            CurrentConnection.task_categories.InsertOnSubmit(CurrentRow);
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
            var results = from row in CurrentConnection.task_categories
                          where row.deleted.Equals(0)
                          select new { id = row.id, name = Translate.str(row.name) };
            if (Limit > 0)
            {
                return results.Take(Limit);
            }
            return results;
        }

    }
}
