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

                XDocument cl = XDocument.Load("CallLink.xml");

                var calls = from call in cl.Descendants("call")
                                select new
                                {
                                   url = call.Element("url").Value
                                };
                
                foreach (var call in calls)
                {
                    Console.WriteLine("Call link: " + call.url);

                }
            }
    }
}
