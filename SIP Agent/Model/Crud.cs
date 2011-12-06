﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    /// <summary>
    /// Abstract class for all CRUD models
    /// </summary>
    public abstract class Crud : ICrud
    {

        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public int id {get {return CurrentRow.id;}}
        public bool deleted { get { return CurrentRow.deleted; } set { CurrentRow.deleted = value; } }

        protected task CurrentRow; // todo: How to specify anonymous type?

        /// <summary>
        /// Check if the model is loaded
        /// </summary>
        /// <returns></returns>
        public bool Loaded()
        {
            return id != null;
        }

        /// <summary>
        /// Load the model with the specified ID
        /// </summary>
        /// <param name="Id">The ID of the row in the database</param>
        /// <returns>True on success, False on failure</returns>
        abstract public bool Load(int Id);



        /// <summary>
        /// Save the currently loaded model
        /// </summary>
        /// <returns>-1 on failure, insert ID on success</returns>
        public int Save()
        {
            // Can't save a model that's not loaded
            if (!Loaded())
            {
                return -1;
            }

            using (DatabaseDataContext db = new DatabaseDataContext())
            {
                // Try saving the model
                try
                {
                    db.SubmitChanges();
                    return id;
                }
                catch (Exception e)
                {
                    return -1;
                }
            }
        }


        /// <summary>
        /// Mark the record as deleted
        /// </summary>
        /// <returns>True on success, False on failure</returns>
        public bool Delete()
        {
            if (!Loaded())
            {
                deleted = 1;
                if (Save() != -1)
                {
                    return true;
                }

            }
            return false;
        }
    }
}