using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name = "Companies")]
    public class Company
    {
        [Column(IsPrimaryKey = true)]
        public int id { get; set; }
        public string name { get; set; }
        public DateTime created { get; set; }
        public string address { get; set; }
        public int deleted { get; set; }


        public Company()
        {
            // ?? 
        }

        /// <summary>
        /// Create and load the model
        /// </summary>
        /// <param name="companyID"></param>
        public Company(int companyID)
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var q = from x in db.companies where x.id.Equals(companyID) && x.deleted.Equals(0) select x;
                if (q.Count() == 0)
                {
                    throw new Exception("Company with ID " + companyID + " not found.");
                }

                // Very banal approace. Todo: bindings!
                var row = q.FirstOrDefault();
                id = row.id;
                name = row.name;
                created = row.created;
                address = row.address;
                deleted = row.deleted;
            }
        }
    }
}
