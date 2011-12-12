using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{

    [Table(Name = "phonebook")]
    public class Phonebook : Crud, ICrud
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public string phone { get { return CurrentRow.phone; } set { CurrentRow.phone = value; } }
        public string email { get { return CurrentRow.email; } set { CurrentRow.email = value; } }
        public int person_id { get { return CurrentRow.person_id.Value; } set { CurrentRow.person_id = value; } }
        override public bool deleted { get { return CurrentRow.deleted; } }

        /// <summary>
        /// Holds the current loaded row
        /// </summary>
        protected new phonebook CurrentRow {get; set;}


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
            var q = from x in CurrentConnection.phonebooks where x.id.Equals(EntryId) && x.deleted.Equals(0) select x;
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
            Load(0);
            CurrentConnection.phonebooks.InsertOnSubmit(CurrentRow);
            return Save();
        }


    }
}
