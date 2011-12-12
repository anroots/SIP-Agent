using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent
{
    /// <summary>
    /// Additions to the default call class (Database)
    /// </summary>
    public partial class task
    {
        public string ShortCreated { get { return Helper.UI.TodayDate(created); } }
        public string AssigneeName { get { return Model.Person.FullName(person); } }
        public string ClerkName { get { return Model.Person.FullName(person1); } }
        public string NotifierName { get { return Model.Person.FullName(person2); } }
        public string CategoryName { get { return task_category.name; } }
    }
}
