﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Data.EntityClient;
using System.ComponentModel;
using System.Xml.Serialization;
using System.Runtime.Serialization;

[assembly: EdmSchemaAttribute()]

namespace SIP_Agent
{
    #region Contexts
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    public partial class agentEntities1 : ObjectContext
    {
        #region Constructors
    
        /// <summary>
        /// Initializes a new agentEntities1 object using the connection string found in the 'agentEntities1' section of the application configuration file.
        /// </summary>
        public agentEntities1() : base("name=agentEntities1", "agentEntities1")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new agentEntities1 object.
        /// </summary>
        public agentEntities1(string connectionString) : base(connectionString, "agentEntities1")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new agentEntities1 object.
        /// </summary>
        public agentEntities1(EntityConnection connection) : base(connection, "agentEntities1")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        #endregion
    
        #region Partial Methods
    
        partial void OnContextCreated();
    
        #endregion
    
        #region ObjectSet Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<tasks> tasks
        {
            get
            {
                if ((_tasks == null))
                {
                    _tasks = base.CreateObjectSet<tasks>("tasks");
                }
                return _tasks;
            }
        }
        private ObjectSet<tasks> _tasks;
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<users> usersSet
        {
            get
            {
                if ((_usersSet == null))
                {
                    _usersSet = base.CreateObjectSet<users>("usersSet");
                }
                return _usersSet;
            }
        }
        private ObjectSet<users> _usersSet;

        #endregion
        #region AddTo Methods
    
        /// <summary>
        /// Deprecated Method for adding a new object to the tasks EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddTotasks(tasks tasks)
        {
            base.AddObject("tasks", tasks);
        }
    
        /// <summary>
        /// Deprecated Method for adding a new object to the usersSet EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddTousersSet(users users)
        {
            base.AddObject("usersSet", users);
        }

        #endregion
    }
    

    #endregion
    
    #region Entities
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="agentModel", Name="tasks")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class tasks : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new tasks object.
        /// </summary>
        /// <param name="id">Initial value of the id property.</param>
        /// <param name="title">Initial value of the title property.</param>
        public static tasks Createtasks(global::System.Int32 id, global::System.String title)
        {
            tasks tasks = new tasks();
            tasks.id = id;
            tasks.title = title;
            return tasks;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 id
        {
            get
            {
                return _id;
            }
            set
            {
                if (_id != value)
                {
                    OnidChanging(value);
                    ReportPropertyChanging("id");
                    _id = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("id");
                    OnidChanged();
                }
            }
        }
        private global::System.Int32 _id;
        partial void OnidChanging(global::System.Int32 value);
        partial void OnidChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String title
        {
            get
            {
                return _title;
            }
            set
            {
                if (_title != value)
                {
                    OntitleChanging(value);
                    ReportPropertyChanging("title");
                    _title = StructuralObject.SetValidValue(value, false);
                    ReportPropertyChanged("title");
                    OntitleChanged();
                }
            }
        }
        private global::System.String _title;
        partial void OntitleChanging(global::System.String value);
        partial void OntitleChanged();

        #endregion
    
    }
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="agentModel", Name="users")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class users : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new users object.
        /// </summary>
        /// <param name="id">Initial value of the id property.</param>
        public static users Createusers(global::System.Int32 id)
        {
            users users = new users();
            users.id = id;
            return users;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 id
        {
            get
            {
                return _id;
            }
            set
            {
                if (_id != value)
                {
                    OnidChanging(value);
                    ReportPropertyChanging("id");
                    _id = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("id");
                    OnidChanged();
                }
            }
        }
        private global::System.Int32 _id;
        partial void OnidChanging(global::System.Int32 value);
        partial void OnidChanged();

        #endregion
    
    }

    #endregion
    
}
