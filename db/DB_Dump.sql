USE [sip-agent]
GO
/****** Object:  Table [dbo].[tasks_calls]    Script Date: 11/20/2011 21:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tasks_calls](
	[call_id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_tasks_calls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tasks]    Script Date: 11/20/2011 21:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tasks](
	[id] [int] NOT NULL,
	[parent_id] [int] NOT NULL,
	[created] [timestamp] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[details] [nvarchar](max) NOT NULL,
	[notifier_id] [int] NOT NULL,
	[assignee_id] [int] NOT NULL,
	[clerk_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_tasks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[task_statuses]    Script Date: 11/20/2011 21:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_statuses](
	[id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
	[deleted] [tinyint] NULL,
	[parent_id] [int] NULL,
 CONSTRAINT [PK_task_statuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task_categories]    Script Date: 11/20/2011 21:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[task_categories](
	[id] [int] NOT NULL,
	[name] [varchar](45) NOT NULL,
	[parent_id] [int] NULL,
	[deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_task_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phonebook]    Script Date: 11/20/2011 21:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phonebook](
	[id] [int] NOT NULL,
	[phone] [nchar](20) NULL,
	[email] [nchar](40) NULL,
	[person_id] [int] NULL,
	[deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_phonebook] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persons]    Script Date: 11/20/2011 21:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nchar](64) NULL,
	[last_name] [nchar](64) NULL,
	[username] [nchar](32) NULL,
	[password] [nchar](32) NULL,
	[created] [timestamp] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_persons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 11/20/2011 21:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[companies](
	[id] [int] NOT NULL,
	[name] [varchar](60) NOT NULL,
	[created] [timestamp] NOT NULL,
	[address] [text] NOT NULL,
	[deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[calls]    Script Date: 11/20/2011 21:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calls](
	[id] [int] NOT NULL,
	[summary] [text] NULL,
	[caller_id] [int] NULL,
	[clerk_id] [int] NULL,
	[start] [datetime] NULL,
	[finished] [datetime] NULL,
	[deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_calls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF_calls_deleted]    Script Date: 11/20/2011 21:35:03 ******/
ALTER TABLE [dbo].[calls] ADD  CONSTRAINT [DF_calls_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_phonebook_deleted]    Script Date: 11/20/2011 21:35:03 ******/
ALTER TABLE [dbo].[phonebook] ADD  CONSTRAINT [DF_phonebook_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_task_categories_deleted]    Script Date: 11/20/2011 21:35:03 ******/
ALTER TABLE [dbo].[task_categories] ADD  CONSTRAINT [DF_task_categories_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_task_statuses_deleted]    Script Date: 11/20/2011 21:35:03 ******/
ALTER TABLE [dbo].[task_statuses] ADD  CONSTRAINT [DF_task_statuses_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  ForeignKey [FK_task_categories_task_categories]    Script Date: 11/20/2011 21:35:03 ******/
ALTER TABLE [dbo].[task_categories]  WITH CHECK ADD  CONSTRAINT [FK_task_categories_task_categories] FOREIGN KEY([id])
REFERENCES [dbo].[task_categories] ([id])
GO
ALTER TABLE [dbo].[task_categories] CHECK CONSTRAINT [FK_task_categories_task_categories]
GO
