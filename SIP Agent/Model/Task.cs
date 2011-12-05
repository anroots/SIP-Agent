using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent.Model
{
    public class Task
    {
        public int id { get; set; }
        public int parent_id { get; set; }
        public DateTime created { get; set; }
        public DateTime updated { get; set; }
        public string title { get; set; }
        public string details { get; set; }
        public int notifier_id { get; set; }
        public int assignee_id { get; set; }
        public int clerk_id { get; set; }
        public int status_id { get; set; }
        public int category_id { get; set; }
        public int deleted { get; set; }
    }
}
