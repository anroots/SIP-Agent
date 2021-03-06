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
        public string CallerName { get { return CurrentRow == null ? null : CurrentRow.CallerName; } }
        public string ShortSummary { get { return CurrentRow.ShortSummary; } }
        override public bool deleted { get { return CurrentRow.deleted; } }


        /// <summary>
        /// Holds the current record
        /// </summary>
        protected new call CurrentRow { get; set; }

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
        /// Load the model with data (row from the DB)
        /// </summary>
        /// <param name="CallId"></param>
        /// <returns></returns>
        override public bool Load(int CallId)
        {
            base.Load(CallId);
            CurrentConnection = new DatabaseDataContext();
            var q = from x in CurrentConnection.calls where x.id.Equals(CallId) && x.deleted.Equals(0) select x;
            CurrentRow = q.FirstOrDefault();

            Caller = new Model.Person(caller_id > 0 ? (int)caller_id : Model.Person.ANONYMOUS);

            return true;
        }

        /// <summary>
        /// Creates a new row in the database
        /// </summary>
        /// <returns>Insert ID of the new row</returns>
        override public int New()
        {
            base.New();
            CurrentRow = new call();
            received = DateTime.Now;
            CurrentConnection.calls.InsertOnSubmit(CurrentRow);
            CurrentConnection.SubmitChanges();
            return CurrentRow.id;
        }

        /// <summary>
        /// Get URL for the call .mp3 located in the calls server
        /// </summary>
        /// <param name="callId">The ID of the call</param>
        /// <returns>URL to the file or null</returns>
        public static string getCallLink(int callId)
        {
            XDocument cl; // Holds the XML DOM

            try
            {
                // Contact the server API (XML response)
                cl = XDocument.Load(ConfigurationManager.AppSettings["callApiURL"] + callId);
            }
            catch (System.Net.WebException)
            {
                return null;
            }

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
        /// Wrapper for BindTask(int TaskId)
        /// </summary>
        /// <param name="TaskId"></param>
        /// <returns></returns>
        public bool BindTask(string TaskId)
        {
            if (!Loaded())
            {
                return false;
            }

            int task_id;
            try
            {
                task_id = Int32.Parse(TaskId);

            }
            catch (FormatException)
            {
                return false;
            }

            TaskCall c = new Model.TaskCall();
            return c.New(task_id, id) > 0;
        }

        /// <summary>
        /// Wrapper for CalcDuration(DateTime start, DateTime end)
        /// </summary>
        /// <param name="start"></param>
        /// <param name="end"></param>
        /// <returns></returns>
        public static string CalcDuration(DateTime? start, DateTime? end)
        {
            if (start == null || end == null)
            {
                return null;
            }
            return CalcDuration(start.Value, end.Value);
        }

        public static string CalcDuration(DateTime start, DateTime end)
        {
            if (start == null || end == null)
            {
                return null;
            }
            TimeSpan diff = end.Subtract(start);

            return diff.ToString("mm':'ss");

        }

        /// <summary>
        /// Find all non-deleted rows
        /// </summary>
        /// <param name="Limit">Max number of rows to return</param>
        /// <returns></returns>
        override public IQueryable FindAll(int Limit = 0)
        {
            base.FindAll();
            var results = (from row in CurrentConnection.calls
                    where row.deleted.Equals(0) && row.caller_id != null
                    select new {
                        ID = row.id,
                        CallerName = Model.Person.FullName(row.person), // FK row.person = caller_id
                        ShortSummary = row.ShortSummary,
                        Started = row.ShortStarted,
                        Finished = row.ShortFinished,
                        Duration = Model.Call.CalcDuration(row.start, row.finished)
                    }).OrderByDescending(row => row.ID);
            if (Limit > 0)
            {
                return results.Take(Limit);
            }
            return results;
        }



        /// <summary>
        /// Returns calls matching give ID's
        /// </summary>
        /// <param name="CallIds">An int array of call ID's</param>
        /// <returns>All calls whose ID's are within the CallIds param</returns>
        public call[] GetCalls(int[] CallIds)
        {
            return (from row in
                        (from call_row in CurrentConnection.calls select call_row)
                    where CallIds.Contains(row.id)
                    select row).ToArray<call>();
        }


        /// <summary>
        /// Get an array of all task IDs associated with the call
        /// </summary>
        /// <returns>An array of Task IDs</returns>
        public int[] AssociatedTasks()
        {
            return (from row in
                       CurrentConnection.tasks_calls
                    where row.call_id.Equals(id)
                    select row.call_id).ToArray();
        }
    }

}

