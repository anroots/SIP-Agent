using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent
{
    /// <summary>
    /// Additions to the default call class (Database)
    /// </summary>
    public partial class call
    {
        public string ShortReceived { get { return Helper.UI.TodayDate(received); } }
        public string ShortStarted { get { return Helper.UI.TodayDate(start); } }
        public string ShortFinished { get { return Helper.UI.TodayDate(finished); } }
        public string CallerName { get { return Model.Person.FullName(person); } }

    }
}
