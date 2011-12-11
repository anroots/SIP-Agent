using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name = "Companies")]
    public class Company : Crud, ICrud
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow.id; } }
        public string name { get { return CurrentRow.name; } set { CurrentRow.name = value; } }
        [Column(IsDbGenerated = true)]
        public DateTime created { get { return CurrentRow.created; } }
        public string address { get { return CurrentRow.address; } set { CurrentRow.address = value; } }
        override public bool deleted { get { return CurrentRow.deleted; } }

        /// <summary>
        /// Holds the currently loaded row
        /// </summary>
        protected new company CurrentRow { get; set; }

        /// <summary>
        /// The ID of the Anonymous company
        /// </summary>
        public const int ANONYMOUS = 5;

        /// <summary>
        /// Empty constructor
        /// </summary>
        public Company()
        {

        }

        /// <summary>
        /// Create and load the model
        /// </summary>
        /// <param name="callId"></param>
        public Company(int companyId = 0)
        {
            if (companyId == 0)
            {
                New();
            }
            else
            {
                Load(companyId);
            }
        }

        /// <summary>
        /// Load the model with data (row from the DB)
        /// </summary>
        /// <param name="CompanyId"></param>
        /// <returns></returns>
        override public bool Load(int CompanyId)
        {
            CurrentConnection = new DatabaseDataContext();
            var q = from x in CurrentConnection.companies where x.id.Equals(CompanyId) && x.deleted.Equals(0) select x;
            CurrentRow = q.FirstOrDefault();

            return true;
        }

        /// <summary>
        /// Creates a new row in the database
        /// </summary>
        /// <returns>Insert ID of the new row</returns>
        override public int New()
        {
            base.New();
            CurrentRow = new company();
            CurrentConnection.companies.InsertOnSubmit(CurrentRow);
            CurrentConnection.SubmitChanges();
            return Save();
        }

       /// <summary>
        /// Find all non-deleted rows
        /// </summary>
        /// <param name="Limit">Max number of rows to return</param>
        /// <returns></returns>
        override public IQueryable FindAll(int Limit = 100){
            base.FindAll();
            return (from row in CurrentConnection.companies
                   where row.deleted.Equals(0)
                   select row).Take(Limit);
        }

    }
}
