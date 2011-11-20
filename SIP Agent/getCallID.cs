using System;   
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;


namespace SIP_Agent
{
    class QueryCallID
    {
        
            public static void getCallID(int call)
            {

                using (DatabaseDataContext db = new DatabaseDataContext())
                {
                    var query = from x in db.calls
                                where (x.id).Equals(call)
                                select x;

                    Console.WriteLine(query);               
    
            }
               
        }
            private int test = 2;
            public static void getCallLink(int test)
            {
                
                    var link = XDocument.Load("http://projects.sqroot.eu/sip-agent/stub.xml");

                    var setting = link.Root.Descendants.First(e => e.Element("key")).Value == "call";
                    var call_id = setting.Element("url").Value;
                    
                

            }
    }
}
