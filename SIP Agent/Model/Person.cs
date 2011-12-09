using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{

    [Table(Name = "Persons")]
    public class Person : Crud, ICrud
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow == null? 0 : CurrentRow.id; } }
        public string first_name { get { return CurrentRow.first_name; } set { CurrentRow.first_name = value; } }
        public string last_name { get { return CurrentRow.last_name; } set { CurrentRow.last_name = value; } }
        public string username { get { return CurrentRow.username; } set { CurrentRow.username = value; } }
        public string password { get { return CurrentRow.password; } set { CurrentRow.password = value; } }
        public int company_id { get { return CurrentRow.company_id.Value; } set { CurrentRow.company_id = value; } }
        [Column(IsDbGenerated = true)]
        public DateTime created { get { return CurrentRow.created; } }
        override public bool deleted { get { return CurrentRow.deleted; } }

        /// <summary>
        /// Holds the current loaded row
        /// </summary>
        protected person CurrentRow;

        /// <summary>
        /// Acts as the storage for Company
        /// </summary>
        private Model.Company company;

        /// <summary>
        /// Holds the Persons Company object.
        /// Lazy loading is used meaning the Company model is not loaded
        /// before it's first accessed.
        /// </summary>
        public Model.Company Company
        {
            get
            {
                if (company == null)
                {
                    // Returns the Anonymous company instead of null
                    company = new Model.Company(company_id > 0 ? company_id : Model.Company.ANONYMOUS);
                    return company;
                }
                return company;
            }
            set { company = value; }
        }

        /// <summary>
        /// The ID of the Anonymous user
        /// </summary>
        public const int ANONYMOUS = 1;

        /// <summary>
        /// Create and load the model
        /// </summary>
        /// <param name="PersonId"></param>
        public Person(int PersonId)
        {
            if (PersonId == 0)
            {
                New();
            }
            else
            {
                Load(PersonId);
            }
        }

        /// <summary>
        /// Empty constructor
        /// </summary>
        public Person()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PersonId"></param>
        /// <returns></returns>
        override public bool Load(int PersonId)
        {
            CurrentConnection = new DatabaseDataContext();
            var q = from x in CurrentConnection.persons where x.id.Equals(PersonId) && x.deleted.Equals(0) select x;
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
            CurrentRow = new person();
            CurrentRow.created = DateTime.Now; // Todo: DB should generate this automatically. 
            CurrentConnection.persons.InsertOnSubmit(CurrentRow);
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


        /// <summary>
        /// Authenticate the user
        /// </summary>
        /// <param name="Username"></param>
        /// <param name="Password"></param>
        /// <returns>True on succes, False on authenticate error</returns>
        public bool Login(string Username, string Password)
        {

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var query = from x
                                in db.persons
                            where x.username.Equals(Username)
                            where x.password.Equals(Password)
                            select x;

                if (query.Count() > 0)
                {
                    return Load(query.FirstOrDefault().id);
                }
            }
            return false;
        }

        /// <summary>
        /// Log the user out
        /// </summary>
        public void Logout()
        {
            App.CurrentUser = null;
        }

       
    }
}
