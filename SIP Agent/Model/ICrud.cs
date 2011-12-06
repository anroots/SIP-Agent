﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent.Model
{
    /// <summary>
    /// Interface for models implementing the CRUD behaviour
    /// </summary>
    public interface ICrud
    {
        /// <summary>
        /// Save the currently loaded object and all modifications to it's properties
        /// </summary>
        /// <returns>Saving returns the insert ID of the saved row or -1 on failure</returns>
        int Save();

        /// <summary>
        /// Delete the currently loaded object.
        /// No record is deleted permanately (except pivot table entries),
        /// rather, their deleted column is set to 1
        /// </summary>
        /// <returns>True on success, False on failure</returns>
        bool Delete();

        /// <summary>
        /// Check whether the current model is loaded
        /// </summary>
        /// <returns>True / False</returns>
        bool Loaded();

        /// <summary>
        /// Load the model with the row, specified by Id
        /// </summary>
        /// <param name="Id">The ID of the row to load</param>
        /// <returns>True on success, False on failure</returns>
        bool Load(int Id);
    }
}
