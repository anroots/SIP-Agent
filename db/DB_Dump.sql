USE [agent]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 11/21/2011 11:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[companies](
	[id] [int] NOT NULL,
	[name] [varchar](60) NOT NULL,
	[created] [datetime] NOT NULL,
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
INSERT [dbo].[companies] ([id], [name], [created], [address], [deleted]) VALUES (1, N'Diara OÜ', CAST(0x00009E5E000007D5 AS DateTime), N'Peterburi mnt 46', 0)
INSERT [dbo].[companies] ([id], [name], [created], [address], [deleted]) VALUES (2, N'CoffeeIn', CAST(0x00009EBA00CC1230 AS DateTime), N'Kristiine 32a', 0)
INSERT [dbo].[companies] ([id], [name], [created], [address], [deleted]) VALUES (3, N'IT Kolledþ', CAST(0x00009E8800FA7E2C AS DateTime), N'Raja 4c', 0)
INSERT [dbo].[companies] ([id], [name], [created], [address], [deleted]) VALUES (4, N'Testfirma', CAST(0x00009E5E00FA7D00 AS DateTime), N'Kustutajate tee 3', 1)
/****** Object:  Table [dbo].[task_statuses]    Script Date: 11/21/2011 11:45:04 ******/
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
CREATE NONCLUSTERED INDEX [IX_parent_id] ON [dbo].[task_statuses] 
(
	[parent_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (1, N'New       ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (2, N'Planned   ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (3, N'Active    ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (4, N'Archived  ', 1, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (5, N'Resolved  ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (6, N'Feedback  ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (7, N'Closed    ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (8, N'Deleted   ', 0, NULL)
/****** Object:  Table [dbo].[task_categories]    Script Date: 11/21/2011 11:45:04 ******/
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
CREATE NONCLUSTERED INDEX [IX_task_categories_parent_id] ON [dbo].[task_categories] 
(
	[parent_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (1, N'Hardware', 1, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (2, N'Software', NULL, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (3, N'Consultation', NULL, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (4, N'Installation', 1, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (5, N'Installation', 2, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (6, N'Repair', 1, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (7, N'Repair', 2, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (8, N'Default', NULL, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (9, N'Catering', NULL, 1)
/****** Object:  Table [dbo].[phonebook]    Script Date: 11/21/2011 11:45:04 ******/
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
CREATE NONCLUSTERED INDEX [IX_phonebook_person_id] ON [dbo].[phonebook] 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[phonebook] ([id], [phone], [email], [person_id], [deleted]) VALUES (1, N'+372581314512       ', N'ando@roots.ee                           ', 1, 0)
INSERT [dbo].[phonebook] ([id], [phone], [email], [person_id], [deleted]) VALUES (2, N'+3726654124         ', NULL, NULL, 0)
INSERT [dbo].[phonebook] ([id], [phone], [email], [person_id], [deleted]) VALUES (3, N'+66211521582        ', N'janne.olgren@riasg.lt                   ', NULL, 1)
INSERT [dbo].[phonebook] ([id], [phone], [email], [person_id], [deleted]) VALUES (4, N'+37254124121        ', N'tonis@tonis.ee                          ', 4, 0)
/****** Object:  Table [dbo].[persons]    Script Date: 11/21/2011 11:45:04 ******/
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
	[created] [datetime] NULL,
	[company_id] [int] NULL,
	[deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_persons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_persons_company_id] ON [dbo].[persons] 
(
	[company_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[persons] ON
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (1, N'Ando                                                            ', N'Roots                                                           ', N'ando                            ', N'ando                            ', CAST(0x00009E5E00B85894 AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (2, N'Tõnis                                                           ', N'Umbsaar                                                         ', N'tonis                           ', N'tonis                           ', CAST(0x00009E5E00B89200 AS DateTime), 2, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (3, N'Test                                                            ', N'Kustutatud                                                      ', NULL, NULL, CAST(0x00009E4A00000000 AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[persons] OFF
/****** Object:  Table [dbo].[calls]    Script Date: 11/21/2011 11:45:04 ******/
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
	[received] [datetime] NOT NULL,
	[finished] [datetime] NULL,
	[deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_calls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_calls_caller_id] ON [dbo].[calls] 
(
	[caller_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_calls_clerk_id] ON [dbo].[calls] 
(
	[clerk_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (1, N'Testkõne', 1, 1, CAST(0x00009EDA00C5C100 AS DateTime), CAST(0x00009EDA00C5C100 AS DateTime), CAST(0x00009EDA00D5F570 AS DateTime), 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (2, N'Küsiti projekti tähtaja kohta, aga vastust ei olnud', 4, 1, CAST(0x00009FA10128AD38 AS DateTime), CAST(0x00009FA10128A180 AS DateTime), CAST(0x00009FA1012B6C58 AS DateTime), 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (3, NULL, NULL, NULL, NULL, CAST(0x00009EDB00C5C100 AS DateTime), NULL, 0)
/****** Object:  Table [dbo].[tasks]    Script Date: 11/21/2011 11:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tasks](
	[id] [int] NOT NULL,
	[parent_id] [int] NULL,
	[created] [datetime] NOT NULL,
	[updated] [datetime] NULL,
	[title] [varchar](255) NOT NULL,
	[details] [text] NULL,
	[notifier_id] [int] NULL,
	[assignee_id] [int] NULL,
	[clerk_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_tasks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [assignee_id] ON [dbo].[tasks] 
(
	[assignee_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [caregory_id] ON [dbo].[tasks] 
(
	[category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [clerk_id] ON [dbo].[tasks] 
(
	[clerk_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_notifier_id] ON [dbo].[tasks] 
(
	[notifier_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [parent_id] ON [dbo].[tasks] 
(
	[parent_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [status_id] ON [dbo].[tasks] 
(
	[status_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[tasks] ([id], [parent_id], [created], [updated], [title], [details], [notifier_id], [assignee_id], [clerk_id], [status_id], [category_id], [deleted]) VALUES (1, 1, CAST(0x00009E5E00107AC0 AS DateTime), NULL, N'Testtöö', N'Vaja testida kõnet', 1, 1, 1, 1, 1, 0)
INSERT [dbo].[tasks] ([id], [parent_id], [created], [updated], [title], [details], [notifier_id], [assignee_id], [clerk_id], [status_id], [category_id], [deleted]) VALUES (2, NULL, CAST(0x00009FA100FA7D00 AS DateTime), NULL, N'Projekt', N'Vaja projekt lõpetada', 4, 1, 1, 1, 1, 0)
/****** Object:  Table [dbo].[tasks_calls]    Script Date: 11/21/2011 11:45:04 ******/
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
CREATE NONCLUSTERED INDEX [IX_tasks_call_id] ON [dbo].[tasks_calls] 
(
	[call_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tasks_calls_task_id] ON [dbo].[tasks_calls] 
(
	[task_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[tasks_calls] ([call_id], [task_id], [id]) VALUES (1, 1, 1)
INSERT [dbo].[tasks_calls] ([call_id], [task_id], [id]) VALUES (2, 2, 2)
/****** Object:  Default [DF_calls_deleted]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[calls] ADD  CONSTRAINT [DF_calls_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_persons_deleted]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[persons] ADD  CONSTRAINT [DF_persons_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_phonebook_deleted]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[phonebook] ADD  CONSTRAINT [DF_phonebook_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_task_categories_deleted]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[task_categories] ADD  CONSTRAINT [DF_task_categories_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_task_statuses_deleted]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[task_statuses] ADD  CONSTRAINT [DF_task_statuses_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_tasks_deleted]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  ForeignKey [FK_calls_clerk_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[calls]  WITH CHECK ADD  CONSTRAINT [FK_calls_clerk_id] FOREIGN KEY([clerk_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[calls] CHECK CONSTRAINT [FK_calls_clerk_id]
GO
/****** Object:  ForeignKey [FK_persons_company_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[persons]  WITH CHECK ADD  CONSTRAINT [FK_persons_company_id] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[persons] CHECK CONSTRAINT [FK_persons_company_id]
GO
/****** Object:  ForeignKey [FK_task_categories_parent_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[task_categories]  WITH CHECK ADD  CONSTRAINT [FK_task_categories_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[task_categories] ([id])
GO
ALTER TABLE [dbo].[task_categories] CHECK CONSTRAINT [FK_task_categories_parent_id]
GO
/****** Object:  ForeignKey [FK_task_statuses_parent_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[task_statuses]  WITH CHECK ADD  CONSTRAINT [FK_task_statuses_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[task_statuses] ([id])
GO
ALTER TABLE [dbo].[task_statuses] CHECK CONSTRAINT [FK_task_statuses_parent_id]
GO
/****** Object:  ForeignKey [FK_assignee_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_assignee_id] FOREIGN KEY([assignee_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_assignee_id]
GO
/****** Object:  ForeignKey [FK_category_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[task_categories] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_category_id]
GO
/****** Object:  ForeignKey [FK_clerk_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_clerk_id] FOREIGN KEY([clerk_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_clerk_id]
GO
/****** Object:  ForeignKey [FK_parent_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[tasks] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_parent_id]
GO
/****** Object:  ForeignKey [FK_status_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_status_id] FOREIGN KEY([status_id])
REFERENCES [dbo].[task_statuses] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_status_id]
GO
/****** Object:  ForeignKey [FK_tasks_calls_call_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[tasks_calls]  WITH CHECK ADD  CONSTRAINT [FK_tasks_calls_call_id] FOREIGN KEY([call_id])
REFERENCES [dbo].[calls] ([id])
GO
ALTER TABLE [dbo].[tasks_calls] CHECK CONSTRAINT [FK_tasks_calls_call_id]
GO
/****** Object:  ForeignKey [FK_tasks_calls_task_id]    Script Date: 11/21/2011 11:45:04 ******/
ALTER TABLE [dbo].[tasks_calls]  WITH CHECK ADD  CONSTRAINT [FK_tasks_calls_task_id] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
GO
ALTER TABLE [dbo].[tasks_calls] CHECK CONSTRAINT [FK_tasks_calls_task_id]
GO
