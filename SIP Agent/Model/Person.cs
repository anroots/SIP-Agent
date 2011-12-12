﻿using System;
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
             if (Limit > 0) {
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

       
       
    }
}
