using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace SIP_Agent.Model
{
    /// <summary>
    /// Abstract class for all CRUD models
    /// </summary>
    public abstract class Crud
    {
        // Define common columns
        [Column(IsPrimaryKey = true, IsDbGenerated = true)] // Defines as the primary key.
        abstract public int id { get; }
        virtual public bool deleted { get; set; }


        /// <summary>
        /// Stores the current database connection.
        /// In order for SubmitChanges to work the connection must stay open.
        /// The connection can be released by the Unload method.
        /// </summary>
        protected DatabaseDataContext CurrentConnection;


        /// <summary>
        /// Check if the model is loaded
        /// </summary>
        /// <returns></returns>
        public bool Loaded()
        {
            return id > 0;
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
            // Try saving the model
            try
            {
                CurrentConnection.SubmitChanges();
                return id;
            }
            catch (Exception)
            {
                return -1;
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        virtual public int New()
        {
            if (CurrentConnection == null)
            {
                CurrentConnection = new DatabaseDataContext();
            }
            return 0;
        }


        /// <summary>
        /// Mark the record as deleted
        /// </summary>
        /// <returns>True on success, False on failure</returns>
        public bool Delete()
        {
            if (!Loaded())
            {
                deleted = true;
                if (Save() != -1)
                {
                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// Find all rows
        /// </summary>
        /// <returns></returns>
        virtual public IQueryable FindAll()
        {
            if (CurrentConnection == null)
            {
                CurrentConnection = new DatabaseDataContext();
            }
            return null;
        }
    }
}
