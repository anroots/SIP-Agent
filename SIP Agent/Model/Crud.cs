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
        /// Default constructor - create a new DatabaseDataContext
        /// </summary>
        public Crud()
        {
            CurrentConnection = new DatabaseDataContext();
        }

        /// <summary>
        /// Destructor - clean up DatabaseDataContext
        /// </summary>
        ~Crud()
        {
            //CurrentConnection.Dispose();
            CurrentConnection = null;
        }

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
        virtual public bool Load(int Id)
        {
            ResetConnection();
            return true;
        }

        /// <summary>
        /// 
        /// </summary>
        virtual protected ICrud CurrentRow {get; set;}

        /// <summary>
        /// 
        /// </summary>
        virtual public void Unload() {
            CurrentRow = null;
        }

        /// <summary>
        /// Save the currently loaded model
        /// </summary>
        /// <returns>-1 on failure, insert ID on success</returns>
        virtual public int Save()
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
            ResetConnection();
            return 0;
        }


        /// <summary>
        /// Mark the record as deleted
        /// </summary>
        /// <returns>True on success, False on failure</returns>
        public void Delete()
        {
            if (Loaded())
            {
                Model.Log.Write("Deleted entity");
                deleted = true;
            }
        }

        /// <summary>
        /// Restore a deleted object
        /// </summary>
        public void Undelete()
        {
            if (Loaded())
            {
                deleted = false;
            }
        }

        /// <summary>
        /// Find all non-deleted rows
        /// </summary>
        /// <param name="Limit">Max number of rows to return</param>
        /// <returns></returns>
        virtual public IQueryable FindAll(int Limit = 0)
        {
            ResetConnection();
            return null;
        }

        /// <summary>
        /// Reset the DB connection
        /// </summary>
        protected void ResetConnection()
        {
            if (CurrentConnection != null)
            {
                CurrentConnection.Dispose();
            }
            CurrentConnection = new DatabaseDataContext();
        }
    }
}
