using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Xml.Linq;
using System.Configuration;

namespace SIP_Agent.Model
{


    [Table(Name = "Calls")]
    public class Call
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public int id { get; set; }
        public string summary { get; set; }
        public int caller_id { get; set; }
        public int clerk_id { get; set; }
        public DateTime received { get; set; }
        public DateTime start { get; set; }
        public DateTime? finished { get; set; }
        public int deleted { get; set; }

        // Call has relation to caller
        // Todo : find a more resource - friendly way
        public Person Caller;

        /// <summary>
        /// Create and load the model
        /// </summary>
        /// <param name="callID"></param>
        public Call(int callID = 0)
        {
            if (callID == 0)
            {
                return;
            }
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                var row = Get(db, callID);

                // Todo: refactor to bindings!

                id = row.id;
                summary = row.summary;
                caller_id = row.caller_id.Value;
                clerk_id = row.clerk_id.Value;
                received = row.received;
                start = row.start.Value;
                finished = row.finished;
                deleted = row.deleted;
                Caller = new Person(caller_id);

            }
        }

        /// <summary>
        /// Get row resource by ID
        /// </summary>
        /// <param name="db"></param>
        /// <param name="callID"></param>
        /// <returns></returns>
        public call Get(DatabaseDataContext db, int callID = 0)
        {

            var q = from x in db.calls where x.id.Equals(callID) && x.deleted.Equals(0) select x;
            /*if (q.Count() == 0)
            {
                throw new Exception("Call with ID "+ callID.ToString()+" not found");
            }*/

            // Todo: refactor to bindings!
            return q.FirstOrDefault();
        }


        /// <summary>
        /// Save record back to the database
        /// </summary>
        /// <returns></returns>
        public int Save()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                if (id == 0)
                {
                    db.SubmitChanges();
                    return id;
                }
                var row = Get(db, id);
                row.summary = summary;
                try
                {
                    db.SubmitChanges();
                    return id;
                }
                catch (Exception e)
                {
                    return 0;
                }
            }
        }

        /// <summary>
        /// Create a new call
        /// </summary>
        /// <returns></returns>
        public int New()
        {
            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                call current = new call
                {
                    caller_id = caller_id,
                    clerk_id = App.CurrentUser.id,
                    received = DateTime.Now,
                    start = DateTime.Now,
                    finished = null,
                };
                db.calls.InsertOnSubmit(current);
                db.SubmitChanges();
                return current.id;
            }
        }

        /// <summary>
        /// Get URL for the call .mp3 located in the calls server
        /// </summary>
        /// <param name="callId">The ID of the call</param>
        /// <returns>URL to the file or null</returns>
        public static string getCallLink(int callId)
        {
            // Contact the server API (XML response)
            XDocument cl = XDocument.Load(ConfigurationManager.AppSettings["callApiURL"] + callId);

            // Try to find the URL from the servers response
            try
            {
                var calls = (from call in cl.Descendants("call")
                             select call).Take(1);

                if ((calls.Count()) < 1)
                {
                    return null;
                }
                return calls.FirstOrDefault().Element("url").Value;
            }
            // Return null on errors
            catch (Exception e)
            {
            }
            return null;
        }

        /// <summary>
        /// Open the call sound file in an external (system default) sound player.
        /// The file itself is streamed from a remote location
        /// </summary>
        /// <param name="callId">The ID of the call to play</param>
        /// <returns>True on success, False on errors</returns>
        public static bool playback(int callId)
        {
            string callUrl = getCallLink(callId);
            if (callUrl == null)
            {
                return false;
            }
            else
            {
                System.Diagnostics.Process.Start(callUrl);
                return true;
            }
        }
    }

}

