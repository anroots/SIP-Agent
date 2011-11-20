using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

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

            public static void getCallLink(int call_id)
            {
                {
                    

                }

            }
    }
}
