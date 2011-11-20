using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent
{
    public struct calls
    {
        public int id { get; set; }
        public string summary { get; set; }
        public int caller_id { get; set; }
        public int clerk_id { get; set; }
        public DateTime start { get; set; }
        public DateTime end { get; set; }
        public int deleted { get; set; }
    }
}
