﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.488
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SIP_Agent
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="agent")]
	public partial class DatabaseDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void Insertperson(person instance);
    partial void Updateperson(person instance);
    partial void Deleteperson(person instance);
    #endregion
		
		public DatabaseDataContext() : 
				base(global::SIP_Agent.Properties.Settings.Default.agentConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DatabaseDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DatabaseDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DatabaseDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DatabaseDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<task> tasks
		{
			get
			{
				return this.GetTable<task>();
			}
		}
		
		public System.Data.Linq.Table<person> persons
		{
			get
			{
				return this.GetTable<person>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tasks")]
	public partial class task
	{
		
		private int _id;
		
		private string _title;
		
		private string _details;
		
		private bool _deleted;
		
		private System.Data.Linq.Binary _created;
		
		private System.Nullable<int> _notifier_id;
		
		public task()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.Always, DbType="Int NOT NULL IDENTITY", IsDbGenerated=true, UpdateCheck=UpdateCheck.Never)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this._id = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_title", DbType="NChar(255) NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string title
		{
			get
			{
				return this._title;
			}
			set
			{
				if ((this._title != value))
				{
					this._title = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_details", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string details
		{
			get
			{
				return this._details;
			}
			set
			{
				if ((this._details != value))
				{
					this._details = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_deleted", DbType="Bit NOT NULL", UpdateCheck=UpdateCheck.Never)]
		public bool deleted
		{
			get
			{
				return this._deleted;
			}
			set
			{
				if ((this._deleted != value))
				{
					this._deleted = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_created", AutoSync=AutoSync.Always, DbType="rowversion NOT NULL", CanBeNull=false, IsDbGenerated=true, IsVersion=true, UpdateCheck=UpdateCheck.Never)]
		public System.Data.Linq.Binary created
		{
			get
			{
				return this._created;
			}
			set
			{
				if ((this._created != value))
				{
					this._created = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_notifier_id", DbType="Int", UpdateCheck=UpdateCheck.Never)]
		public System.Nullable<int> notifier_id
		{
			get
			{
				return this._notifier_id;
			}
			set
			{
				if ((this._notifier_id != value))
				{
					this._notifier_id = value;
				}
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.persons")]
	public partial class person : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _first_name;
		
		private string _last_name;
		
		private bool _deleted;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void Onfirst_nameChanging(string value);
    partial void Onfirst_nameChanged();
    partial void Onlast_nameChanging(string value);
    partial void Onlast_nameChanged();
    partial void OndeletedChanging(bool value);
    partial void OndeletedChanged();
    #endregion
		
		public person()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_first_name", DbType="VarChar(20)")]
		public string first_name
		{
			get
			{
				return this._first_name;
			}
			set
			{
				if ((this._first_name != value))
				{
					this.Onfirst_nameChanging(value);
					this.SendPropertyChanging();
					this._first_name = value;
					this.SendPropertyChanged("first_name");
					this.Onfirst_nameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_last_name", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string last_name
		{
			get
			{
				return this._last_name;
			}
			set
			{
				if ((this._last_name != value))
				{
					this.Onlast_nameChanging(value);
					this.SendPropertyChanging();
					this._last_name = value;
					this.SendPropertyChanged("last_name");
					this.Onlast_nameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_deleted", DbType="Bit NOT NULL")]
		public bool deleted
		{
			get
			{
				return this._deleted;
			}
			set
			{
				if ((this._deleted != value))
				{
					this.OndeletedChanging(value);
					this.SendPropertyChanging();
					this._deleted = value;
					this.SendPropertyChanged("deleted");
					this.OndeletedChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591