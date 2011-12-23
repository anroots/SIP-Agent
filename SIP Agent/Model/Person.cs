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
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public string first_name { get { return CurrentRow.first_name.Trim(); } set { CurrentRow.first_name = value.Trim(); } }
        public string last_name { get { return CurrentRow.last_name.Trim(); } set { CurrentRow.last_name = value.Trim(); } }
        public string username { get { return CurrentRow.username == null ? null : CurrentRow.username.Trim(); } set { CurrentRow.username = value.Trim(); } }
        public string password { get { return CurrentRow.password.Trim(); } set { CurrentRow.password = Helper.Functions.HashPass(value.Trim()); } }
        public int company_id { get { return CurrentRow.company_id.GetValueOrDefault(); } set { CurrentRow.company_id = value; } }
        public string Phone { get { return GetPhone(); } }
        public string Email { get { return GetEmail(); } }

        [Column(IsDbGenerated = true)]
        public DateTime created { get { return CurrentRow.created; } }
        override public bool deleted { get { return CurrentRow.deleted; } set { CurrentRow.deleted = value; } }

        /// <summary>
        /// Holds phonebook entries
        /// </summary>
        protected IQueryable Contacts;

        /// <summary>
        /// Holds the current loaded row
        /// </summary>
        protected new person CurrentRow { get; set; }

        /// <summary>
        /// Acts as the storage for Company
        /// </summary>
        private Model.Company company;

        /// <summary>
        /// The ID of the Anonymous user
        /// </summary>
        public const int ANONYMOUS = 1;


        /// <summary>
        /// Holds the Persons Company object.
        /// Lazy loading is used, meaning the Company model is not loaded
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
            var q = from x in CurrentConnection.persons where x.id.Equals(PersonId) && x.deleted.Equals(0) select x;
            CurrentRow = q.FirstOrDefault();

            return true;
        }

        /// <summary>
        /// Validation checks before saving
        /// </summary>
        /// <returns></returns>
        public override int Save()
        {
            if (CurrentRow.id > 0 && (
                CurrentRow.first_name.Trim().Length == 0
                || CurrentRow.last_name.Trim().Length == 0
                || CurrentRow.username.Trim().Length == 0
                ))
            {
                return -1;
            }
            return base.Save();
        }

        /// <summary>
        /// Creates a new row in the database
        /// </summary>
        /// <returns>Insert ID of the new row</returns>
        override public int New()
        {
            base.New();

            CurrentRow = new person()
            {
                created = DateTime.Now,
                company_id = Model.Company.ANONYMOUS,
                first_name = "???",
                last_name = "???",
                username = "User_"+DateTime.Now.Ticks
            };

            CurrentConnection.persons.InsertOnSubmit(CurrentRow);
            CurrentConnection.SubmitChanges();
            return CurrentRow.id;
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
                            where x.password.Equals(Helper.Functions.HashPass(Password))
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

        /// <summary>
        /// Finds all persons
        /// </summary>
        /// <param name="Limit">The max number of rows to return</param>
        /// <returns>Pairs of ID and first + last names</returns>
        override public IQueryable FindAll(int Limit = 0)
        {
            base.FindAll();
            var results = from row in CurrentConnection.persons
                          where row.deleted.Equals(0)
                          select new { id = row.id, name = FullName(row) };
            if (Limit > 0)
            {
                return results.Take(Limit);
            }
            return results;

        }


        /// <summary>
        /// Take a DB person row and concat first + last names
        /// </summary>
        /// <param name="row"></param>
        /// <returns>FirstName LastName</returns>
        public static string FullName(person row)
        {
            // No name is known
            if (row == null || (row.first_name == null && row.last_name == null))
            {
                return null;
            }

            // Only last name is known
            if (row.first_name == null)
            {
                return row.last_name;
            }

            // Only first name is known
            else if (row.last_name == null)
            {
                return row.first_name;
            }

            // Both names are known
            return row.first_name.Trim() + " " + row.last_name.Trim();
        }

        /// <summary>
        /// Get previous calls (up to that point) by the caller
        /// </summary>
        /// <param name="Until">Previous calls up to that point</param>
        /// <returns></returns>
        public call[] PreviousCalls(DateTime Until)
        {
            ResetConnection();
            return (from row in CurrentConnection.calls
                    where
                    row.caller_id.Equals(id)
                    && row.deleted.Equals(0)
                    && (Until - row.received).TotalSeconds > 0
                    select row).ToArray();
        }

        /// <summary>
        /// Search for the person's phone
        /// </summary>
        /// <returns>Phone number or empty</returns>
        public string GetPhone()
        {
            if (Contacts == null)
            {
                LoadContacts();
            }

            foreach (phonebook book in Contacts)
            {
                if (book.phone != null && book.phone.Trim().Length > 0)
                {
                    return book.phone.Trim();
                }
            }
            return null;
        }

        /// <summary>
        /// Loads the loaded person's contact entries
        /// </summary>
        private void LoadContacts()
        {
            Contacts = from row in CurrentConnection.phonebooks
                       where
                       row.person_id.Equals(id)
                       && row.deleted.Equals(0)
                       select row;
        }

        /// <summary>
        /// Get's the person's email
        /// </summary>
        /// <returns>E-mail</returns>
        public string GetEmail()
        {
            if (Contacts == null)
            {
                LoadContacts();
            }

            foreach (phonebook book in Contacts)
            {
                if (book.email != null && book.email.Trim().Length > 0)
                {
                    return book.email.Trim();
                }
            }
            return null;
        }
    }
}
