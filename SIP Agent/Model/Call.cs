﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Xml.Linq;
using System.Configuration;

namespace SIP_Agent.Model
{


    [Table(Name = "Calls")]
    public class Call : Crud, ICrud
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public string summary { get { return CurrentRow.summary; } set { CurrentRow.summary = value; } }
        public int? caller_id { get { return CurrentRow == null ? null : CurrentRow.caller_id; } set { CurrentRow.caller_id = value; } }
        public int? clerk_id { get { return CurrentRow.clerk_id; } set { CurrentRow.clerk_id = value; } }
        public DateTime received { get { return CurrentRow.received; } set { CurrentRow.received = value; } }
        public DateTime? start { get { return start == null ? null : CurrentRow.start; } set { CurrentRow.start = value; } }
        public DateTime? finished { get { return finished == null ? null : CurrentRow.finished; } set { CurrentRow.finished = value; } }
        override public bool deleted { get { return CurrentRow.deleted; } }

        /// <summary>
        /// 
        /// </summary>
        protected call CurrentRow;

        // Call has relation to caller
        // Todo : find a more resource - friendly way
        public Person Caller;

   

        /// <summary>
        /// Create and load the model
        /// </summary>
        /// <param name="callId"></param>
        public Call(int callId = 0)
        {
            if (callId == 0)
            {
                New();
            }
            else
            {
                Load(callId);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="CallId"></param>
        /// <returns></returns>
        override public bool Load(int CallId)
        {
            CurrentConnection = new DatabaseDataContext();
            var q = from x in CurrentConnection.calls where x.id.Equals(CallId) && x.deleted.Equals(0) select x;
            CurrentRow = q.FirstOrDefault();

            Caller = new Model.Person(caller_id > 0 ? caller_id : Model.Person.ANONYMOUS);

            return true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        override public int New()
        {
            base.New();
            CurrentRow = new call();
            received = DateTime.Now;
            CurrentConnection.calls.InsertOnSubmit(CurrentRow);
            CurrentConnection.SubmitChanges();
            int InsertId = Save();
            Load(InsertId);
            return id;
        }

        public void Unload()
        {
            CurrentRow = null;
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
            catch (Exception)
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

        /// <summary>
        /// Bind a call with a task
        /// </summary>
        /// <param name="TaskId"></param>
        /// <returns></returns>
        public bool BindTask(int TaskId)
        {
            if (Loaded()) // Check that the model is loaded
            {
                using (DatabaseDataContext db = new DatabaseDataContext())
                {
                    var row = from x in db.tasks_calls where x.call_id == id && x.task_id == TaskId select id;
                    if (row.Count() == 0) // Check that there exists no identical binding
                    {
                        // todo: insert new row to tasks_calls
                        return true;
                    }
                }
            }
            return false;
        }

        /// <summary>
        /// Wrapper for BindTask(int TaskId)
        /// </summary>
        /// <param name="TaskId"></param>
        /// <returns></returns>
        public bool BindTask(string TaskId)
        {
            try
            {
                return BindTask(Int32.Parse(TaskId));
            }
            catch (FormatException e)
            {
                return false;
            }
        }
    }

}

