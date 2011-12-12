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
    }
}
