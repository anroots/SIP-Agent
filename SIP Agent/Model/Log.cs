using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{

    /// <summary>
    /// Class for logging system activity
    /// </summary>
    [Table(Name = "Logs")]
    public class Log : Crud, ICrud
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public string text { get { return CurrentRow.text; } set { CurrentRow.text = value; } }
        public int person_id { get { return CurrentRow.person_id.Value; } set { CurrentRow.person_id = value; } }
        [Column(IsDbGenerated = true)]
        public DateTime created { get { return CurrentRow.created; } set { CurrentRow.created = value; } }

        /// <summary>
        /// The person who created the log
        /// </summary>
        public Person Person;

        /// <summary>
        /// Get log creator's full name
        /// </summary>
        public string PersonName { get { return Person.first_name.Trim() + " " + Person.last_name.Trim(); } }

        /// <summary>
        /// Holds the current Log row
        /// </summary>
        protected new log CurrentRow { get; set; }

        /// <summary>
        /// The log class should only have 1 instance at any time.
        /// This is called the singleton pattern.
        /// </summary>
        private static Model.Log instance;

        /// <summary>
        /// Don't allow constructing multiple
        /// instances from outside the class 
        /// - use the Instance property instead
        /// </summary>
        private Log() { }

        /// <summary>
        /// Returns the current singleton instance of the model
        /// </summary>
        public static Model.Log Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new Model.Log();
                }
                return instance;
            }
        }

        /// <summary>
        /// Load the model with the specified ID
        /// </summary>
        /// <param name="LogId">The ID of the row in the database</param>
        /// <returns>True on success, False on failure</returns>
        override public bool Load(int LogId)
        {
            base.Load(LogId);
            CurrentConnection = new DatabaseDataContext();
            var q = from x in CurrentConnection.logs where x.id.Equals(LogId) && x.deleted.Equals(0) select x;
            CurrentRow = q.FirstOrDefault();
            return true;
        }

        /// <summary>
        /// Write a new log message to the database
        /// </summary>
        /// <param name="text">The text of the log message</param>
        /// <returns>The insert ID of the new log row</returns>
        public static int Write(string text)
        {

            Model.Log LogInstance = Model.Log.Instance;

            // Create a new log entry
            LogInstance.New();
            LogInstance.text = text;
            LogInstance.Save();

            return LogInstance.id;
        }

        /// <summary>
        /// Creates a new row in the database
        /// </summary>
        /// <returns>Insert ID of the new row</returns>
        override public int New()
        {
            base.New();

            CurrentRow = new log();
            CurrentRow.created = DateTime.Now;
            CurrentRow.person_id = App.CurrentUser != null && App.CurrentUser.id > 0 ? App.CurrentUser.id : Model.Person.ANONYMOUS;

            CurrentConnection.logs.InsertOnSubmit(CurrentRow);
            CurrentConnection.SubmitChanges();

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
            
            var results = (from row in CurrentConnection.logs
                    where row.deleted.Equals(0)
                    select row).OrderByDescending(row => row.id);
             if (Limit > 0) {return results.Take(Limit);}return results;
        }

    }

}

