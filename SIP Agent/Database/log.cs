using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent
{
    /// <summary>
    /// Additions to the default log class (Database)
    /// </summary>
    public partial class log
    {
        public string ShortCreated { get { return Helper.UI.TodayDate(created); } }

        public string PersonName { get { return Model.Person.FullName(person); } }

        public string I18nText { get { return Translate.str(text); } }
    }
}

