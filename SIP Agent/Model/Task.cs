﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    [Table(Name = "Tasks")]
    public class Task : Crud, ICrud
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        override public int id { get { return CurrentRow == null ? 0 : CurrentRow.id; } }
        public int? parent_id { get { return CurrentRow.parent_id; } set { CurrentRow.parent_id = value; } }
        [Column(IsDbGenerated=true)]
        public DateTime created { get { return CurrentRow.created; } }
        public DateTime? updated { get { return CurrentRow.updated; } set { CurrentRow.updated = value; } }
        public string title { get { return CurrentRow.title; } set { CurrentRow.title = value; } }
        public string details { get { return CurrentRow.details; } set { CurrentRow.details = value; } }
        public int? notifier_id { get { return CurrentRow.notifier_id; } set { CurrentRow.notifier_id = value; } }
        public int? assignee_id { get { return CurrentRow.assignee_id; } set { CurrentRow.assignee_id = value; } }
        public int clerk_id { get { return CurrentRow.clerk_id; } set { CurrentRow.clerk_id = value; } }
        public int status_id { get { return CurrentRow.status_id; } set { CurrentRow.status_id = value; } }
        public int category_id { get { return CurrentRow.category_id; } set { CurrentRow.category_id = value; } }
        public task_statuse Status { get { return CurrentRow.task_statuse; } }
        public string NotifierName { get { return CurrentRow.NotifierName; } }
        public string AssigneeName { get { return CurrentRow.AssigneeName; } }
        public string ClerkName { get { return CurrentRow.ClerkName; } }
        public string CategoryName { get { return CurrentRow.CategoryName; } }
        override public bool deleted { get { return CurrentRow.deleted; } }

        /// <summary>
        /// Holds the current row
        /// </summary>
        protected new task CurrentRow { get; set; }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="TaskId"></param>
        public Task(int TaskId)
        {
            if (TaskId == 0)
            {
                New();
            }
            else
            {
                Load(TaskId);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public Task()
        {
        }


        /// <summary>
        /// Load the model with the specified ID
        /// </summary>
        /// <param name="TaskId">The ID of the row in the database</param>
        /// <returns>True on success, False on failure</returns>
        override public bool Load(int TaskId)
        {
            base.Load(TaskId);
            var q = from x in CurrentConnection.tasks where x.id.Equals(TaskId) && x.deleted.Equals(0) select x;
            CurrentRow = q.FirstOrDefault();
            return true;
        }

        /// <summary>
        /// Creates a new entry in the database
        /// </summary>
        /// <returns>The insert ID of the new entry</returns>
        override public int New()
        {
            base.New();

            // Set default values for the new Task
            CurrentRow = new task()
            {
                created = DateTime.Now,
                title = Translate.str("Untitled"),
                clerk_id = Model.Person.ANONYMOUS,
                assignee_id = Model.Person.ANONYMOUS,
                status_id = Model.TaskStatus.DEFAULT,
                category_id = Model.TaskCategory.DEFAULT
            };

            // Create new row in the DB
            CurrentConnection.tasks.InsertOnSubmit(CurrentRow);
            CurrentConnection.SubmitChanges();

            return CurrentRow.id;
        }


        /// <summary>
        /// Find all non-deleted rows
        /// </summary>
        /// <param name="Limit">Max number of rows to return</param>
        /// <returns></returns>
        override public IQueryable FindAll(int Limit = 0)
        {
            base.FindAll();
            var results = from row in CurrentConnection.tasks
                          where row.deleted.Equals(0)
                          select new { 
                            ID = row.id,
                            Created = row.ShortCreated,
                            Title = row.title,
                            StatusName = Translate.str(row.task_statuse.name),
                            AssigneeName = Model.Person.FullName(row.person),
                            NotifierName = Model.Person.FullName(row.person2)
                          };
            if (Limit > 0)
            {
                return results.Take(Limit);
            }
            return results;
        }

        /// <summary>
        /// Returns an array of all call ID's associated with this task
        /// </summary>
        /// <returns>An array of Call ID's</returns>
        public int[] Calls()
        {
            if (!Loaded())
            {
                return null;
            }
            return (from row in CurrentConnection.tasks_calls
                   where row.task_id.Equals(id)
                   select row.id).ToArray();
        }

        /// <summary>
        /// Returns tasks matching given ID's
        /// </summary>
        /// <param name="CallIds">An int array of task ID's</param>
        /// <returns>All tasks whose ID's are within the TaskIds param</returns>
        public task[] GetTasks(int[] TaskIds)
        {
            return (from row in
                        (from task_row in CurrentConnection.tasks select task_row)
                    where TaskIds.Contains(row.id)
                    select row).ToArray<task>();
        }
    }
}
