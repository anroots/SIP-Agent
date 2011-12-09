using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{

    [Table(Name = "Persons")]
    public class Person
    {
        [Column(IsPrimaryKey = true)]
        public int id { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public int company_id { get; set; }
        public DateTime created { get; set; }
        public bool deleted { get; set; }

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
        /// <param name="personID"></param>
        public Person(int personID)
        {

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var q = from x in db.persons where x.id.Equals(personID) && x.deleted.Equals(0) select x;
                if (q.Count() == 0)
                {
                    throw new Exception("Person with ID " + personID + " not found.");
                }

                // Todo : Refactor to bindings!
                var row = q.FirstOrDefault();
                id = row.id;
                first_name = row.first_name.Trim();
                last_name = row.last_name.Trim();
                username = row.username.Trim();
                password = row.password.Trim();
                company_id = row.company_id.Value;
                created = row.created.Value;
                deleted = row.deleted;
                string sss = "CID:" + (company_id > 0 ? company_id : Model.Company.ANONYMOUS); throw new Exception(sss);
                Company = new Model.Company(company_id > 0 ? company_id : Model.Company.ANONYMOUS);
            }
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
                    id = query.FirstOrDefault().id;

                    return true;
                }
            }
            return false;
        }

        public Person()
        {
            // TODO: Complete member initialization
        }

        public Person(int? nullable)
        {
            // TODO: Complete member initialization
            this.nullable = nullable;
        }

        public int? nullable { get; set; }
    }
}
