using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{

    [Table(Name = "Phonebook")]
    public class Phonebook : Crud, ICrud
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public string phone { get { return CurrentRow.phone; } set { CurrentRow.phone = value; } }
        public string email { get { return CurrentRow.email; } set { CurrentRow.email = value; } }
        public int person_id { get { return CurrentRow.person_id.Value; } set { CurrentRow.person_id = value; } }
        [Column(IsDbGenerated = true)]
        override public bool deleted { get { return CurrentRow.deleted; } }

        /// <summary>
        /// Holds the current loaded row
        /// </summary>
        protected phonebook CurrentRow;


        /// <summary>
        /// Create and load the model
        /// </summary>
        /// <param name="PersonId"></param>
        public Phonebook(int EntryId)
        {
            if (EntryId == 0)
            {
                New();
            }
            else
            {
                Load(EntryId);
            }
        }

        /// <summary>
        /// Empty constructor
        /// </summary>
        public Phonebook()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PersonId"></param>
        /// <returns></returns>
        override public bool Load(int EntryId)
        {
            CurrentConnection = new DatabaseDataContext();
            var q = from x in CurrentConnection.phonebook where x.id.Equals(EntryId) && x.deleted.Equals(0) select x;
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
            CurrentRow = new phonebook();
            CurrentConnection.phonebook.InsertOnSubmit(CurrentRow);
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
