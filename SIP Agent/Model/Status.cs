using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent.Model
{

    class Status // Todo Implement ICrud
    {
        /// <summary>
        /// Find all statuses
        /// </summary>
        /// <returns>IQueryable rows</returns>
        public static IQueryable FindAll()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                return from row in db.task_statuses
                       where row.deleted.Equals(0)
                       select new { id = row.id, name = row.name.Trim() };
            }
        }

    }
}
