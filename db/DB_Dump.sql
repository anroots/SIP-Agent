USE [sip-agent]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 12/09/2011 13:05:05 ******/
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
	[deleted] [bit] NOT NULL,
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
INSERT [dbo].[companies] ([id], [name], [created], [address], [deleted]) VALUES (3, N'IT Kolledž', CAST(0x00009E8800FA7E2C AS DateTime), N'Raja 4c', 0)
INSERT [dbo].[companies] ([id], [name], [created], [address], [deleted]) VALUES (4, N'Testfirma', CAST(0x00009E5E00FA7D00 AS DateTime), N'Kustutajate tee 3', 1)
INSERT [dbo].[companies] ([id], [name], [created], [address], [deleted]) VALUES (5, N'Muu', CAST(0x00009E5E00CBE5A8 AS DateTime), N'Teadmata', 0)
/****** Object:  Table [dbo].[task_statuses]    Script Date: 12/09/2011 13:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_statuses](
	[id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
	[deleted] [bit] NULL,
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
/****** Object:  Table [dbo].[task_categories]    Script Date: 12/09/2011 13:05:05 ******/
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
	[deleted] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[phonebook]    Script Date: 12/09/2011 13:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phonebook](
	[id] [int] NOT NULL,
	[phone] [nchar](20) NULL,
	[email] [nchar](40) NULL,
	[person_id] [int] NULL,
	[deleted] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[persons]    Script Date: 12/09/2011 13:05:05 ******/
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
	[deleted] [bit] NOT NULL,
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
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (1, N'Anonymous                                                       ', N'User                                                            ', N'Anonymous                       ', N'admin                           ', CAST(0x00009E5E00B85894 AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (2, N'Tõnis                                                           ', N'Umbsaar                                                         ', N'tonis                           ', N'tonis                           ', CAST(0x00009E5E00B89200 AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (3, N'Sander                                                          ', N'Sülla                                                           ', N'sander                          ', N'sander                          ', CAST(0x00009E4A00000000 AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (4, N'Jana                                                            ', N'Mrots                                                           ', N'jana                            ', N'jana                            ', CAST(0x00009D1100C8DF0C AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (5, N'Test                                                            ', NULL, NULL, NULL, CAST(0x00009D1100C8DF0C AS DateTime), 2, 1)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (6, N'Ando                                                            ', N'Roots                                                           ', N'ando                            ', N'ando                            ', CAST(0x00009FAB00CBE47C AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[persons] OFF
/****** Object:  Table [dbo].[logs]    Script Date: 12/09/2011 13:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NOT NULL,
	[person_id] [int] NULL,
	[text] [ntext] NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_logs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_logs] ON [dbo].[logs] 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[logs] ON
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (1, CAST(0x00009FAE00A8A9F0 AS DateTime), NULL, N'System online.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (2, CAST(0x00009FAE00A8DC89 AS DateTime), 1, N'Logged in.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (3, CAST(0x00009FAE00A8E1EB AS DateTime), 2, N'Logged out.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (4, CAST(0x00009FAE00A8EF85 AS DateTime), 1, N'Logged in.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (5, CAST(0x00009FAE00A8F4C9 AS DateTime), 1, N'Logged out.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (6, CAST(0x00009FAE00A8FB0A AS DateTime), 3, N'Logged in.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (7, CAST(0x00009FAE00A90BBA AS DateTime), 3, N'View call #2.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (8, CAST(0x00009FAE00A91352 AS DateTime), 3, N'Logout.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (11, CAST(0x00009FAE00ADB742 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (12, CAST(0x00009FAE00BAC187 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (13, CAST(0x00009FAE00BDBDC7 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (14, CAST(0x00009FAE00BE3572 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (15, CAST(0x00009FAE00BF2E48 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (16, CAST(0x00009FAE00C03615 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (17, CAST(0x00009FAE00C061BD AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (18, CAST(0x00009FAE00C08776 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (19, CAST(0x00009FAE00C198A8 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (20, CAST(0x00009FAE00C22B02 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (21, CAST(0x00009FAE00C2B0A6 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (22, CAST(0x00009FAE00C4569E AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (23, CAST(0x00009FAE00C48A99 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (24, CAST(0x00009FAE00C545D4 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (25, CAST(0x00009FAE00C9C716 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (26, CAST(0x00009FAE00CB3CD2 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (27, CAST(0x00009FAE00CC1BFE AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (28, CAST(0x00009FAE00CC3673 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (29, CAST(0x00009FAE00CC7AEA AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (30, CAST(0x00009FAE00CCD076 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (31, CAST(0x00009FAE00CD0CB2 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (32, CAST(0x00009FAE00CDB722 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (33, CAST(0x00009FAE00CF5637 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (34, CAST(0x00009FAE00D095C2 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (35, CAST(0x00009FB000E962D6 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (36, CAST(0x00009FB000EA914C AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (37, CAST(0x00009FB000EB3CE8 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (38, CAST(0x00009FB000EC5D1B AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (39, CAST(0x00009FB000ECF8FC AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (40, CAST(0x00009FB000F0FF5B AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (41, CAST(0x00009FB000F2C679 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (42, CAST(0x00009FB000F405B9 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (43, CAST(0x00009FB000F518CE AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (44, CAST(0x00009FB000F6872A AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (45, CAST(0x00009FB000F6C2EA AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (46, CAST(0x00009FB000F7191D AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (47, CAST(0x00009FB000F8E593 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (48, CAST(0x00009FB000FAF152 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (49, CAST(0x00009FB000FE2857 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (50, CAST(0x00009FB001035442 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (51, CAST(0x00009FB001040029 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (52, CAST(0x00009FB0010C7DFC AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (53, CAST(0x00009FB0010FD811 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (54, CAST(0x00009FB0011427D5 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (55, CAST(0x00009FB001148726 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (56, CAST(0x00009FB001154DC1 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (57, CAST(0x00009FB001157A80 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (58, CAST(0x00009FB001163F5B AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (59, CAST(0x00009FB00116EC60 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (60, CAST(0x00009FB00117F17F AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (61, CAST(0x00009FB0011843A8 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (62, CAST(0x00009FB0011947D9 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (63, CAST(0x00009FB00119CBB5 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (64, CAST(0x00009FB0011B3DAB AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (65, CAST(0x00009FB0011B8552 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (66, CAST(0x00009FB0011E23A8 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (67, CAST(0x00009FB0011FCF6D AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (68, CAST(0x00009FB001207F08 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (69, CAST(0x00009FB00120E66E AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (70, CAST(0x00009FB00121266C AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (71, CAST(0x00009FB3000F8DCC AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (72, CAST(0x00009FB40026659C AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (73, CAST(0x00009FB40026EB97 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (74, CAST(0x00009FB40027257F AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (75, CAST(0x00009FB4002755BD AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (76, CAST(0x00009FB4002CDE89 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (77, CAST(0x00009FB4002F67E0 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (78, CAST(0x00009FB4003004DC AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (79, CAST(0x00009FB400307754 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (80, CAST(0x00009FB40030C4CD AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (81, CAST(0x00009FB40030E276 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (82, CAST(0x00009FB4003179EB AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (83, CAST(0x00009FB40031E266 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (84, CAST(0x00009FB400322119 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (85, CAST(0x00009FB400325665 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (86, CAST(0x00009FB4003299C5 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (87, CAST(0x00009FB40032D164 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (88, CAST(0x00009FB400330677 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (89, CAST(0x00009FB4003376E9 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (90, CAST(0x00009FB40033B6FB AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (91, CAST(0x00009FB4003432B7 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (92, CAST(0x00009FB400349549 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (93, CAST(0x00009FB40034B691 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (94, CAST(0x00009FB40034EE7D AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (95, CAST(0x00009FB40035119E AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (96, CAST(0x00009FB400354188 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (97, CAST(0x00009FB400355B76 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (98, CAST(0x00009FB4003577DD AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (99, CAST(0x00009FB40035AED9 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (100, CAST(0x00009FB40035CC4B AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (101, CAST(0x00009FB400364608 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (102, CAST(0x00009FB400367100 AS DateTime), 1, N'Initialized.', 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (103, CAST(0x00009FB40036A271 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (104, CAST(0x00009FB4003785B2 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (105, CAST(0x00009FB40037B0D8 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (106, CAST(0x00009FB40037FD1D AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (107, CAST(0x00009FB4003859AE AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (108, CAST(0x00009FB400395E41 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (109, CAST(0x00009FB400397879 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (110, CAST(0x00009FB40039C8BA AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (111, CAST(0x00009FB4003B481C AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (112, CAST(0x00009FB4003C05CD AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (113, CAST(0x00009FB4003C8525 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (114, CAST(0x00009FB4003D332D AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (115, CAST(0x00009FB4003D79D4 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (116, CAST(0x00009FB4003E30C4 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (117, CAST(0x00009FB4003E5BB3 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (118, CAST(0x00009FB4003E9CB0 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (119, CAST(0x00009FB4003EF367 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (120, CAST(0x00009FB4003F5307 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (121, CAST(0x00009FB400403BE6 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (122, CAST(0x00009FB40040B49D AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (123, CAST(0x00009FB400417B4E AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (124, CAST(0x00009FB40041DF1D AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (125, CAST(0x00009FB4004221B3 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (126, CAST(0x00009FB4004294F1 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (127, CAST(0x00009FB40044B637 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (128, CAST(0x00009FB40044D1EE AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (129, CAST(0x00009FB400457F0E AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (130, CAST(0x00009FB40045DB40 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (131, CAST(0x00009FB4004960AD AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (132, CAST(0x00009FB4004A7692 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (133, CAST(0x00009FB4004AC140 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (134, CAST(0x00009FB40052A6A5 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (135, CAST(0x00009FB400545649 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (136, CAST(0x00009FB400559A24 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (137, CAST(0x00009FB4005801CA AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (138, CAST(0x00009FB400585E57 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (139, CAST(0x00009FB400593802 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (140, CAST(0x00009FB4005A5C33 AS DateTime), 1, N'Initialized.', 0)
SET IDENTITY_INSERT [dbo].[logs] OFF
/****** Object:  Table [dbo].[calls]    Script Date: 12/09/2011 13:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calls](
	[id] [int] IDENTITY(4,1) NOT NULL,
	[summary] [text] NULL,
	[caller_id] [int] NULL,
	[clerk_id] [int] NULL,
	[start] [datetime] NULL,
	[received] [datetime] NOT NULL,
	[finished] [datetime] NULL,
	[deleted] [bit] NOT NULL,
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
SET IDENTITY_INSERT [dbo].[calls] ON
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (0, NULL, 3, 1, CAST(0x00009FAE009ED236 AS DateTime), CAST(0x00009FAE009ED236 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (1, N'sbox traw', 1, 1, CAST(0x00009EDA00C5C100 AS DateTime), CAST(0x00009EDA00C5C100 AS DateTime), CAST(0x00009EDA00D5F570 AS DateTime), 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (2, N'Küsiti projekti tähtaja kohta, aga vastust ei olnud', 4, 1, CAST(0x00009FA10128AD38 AS DateTime), CAST(0x00009FA10128A180 AS DateTime), CAST(0x00009FA1012B6C58 AS DateTime), 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (3, NULL, NULL, NULL, NULL, CAST(0x00009EDB00C5C100 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (5, NULL, 2, 1, CAST(0x00009FAE00A312C6 AS DateTime), CAST(0x00009FAE00A312C6 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (6, NULL, 3, 1, CAST(0x00009FAE00A3AC51 AS DateTime), CAST(0x00009FAE00A3AC51 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (7, NULL, 3, 1, CAST(0x00009FAE00A43910 AS DateTime), CAST(0x00009FAE00A43910 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (18, NULL, 4, 6, CAST(0x00009FB4002CE880 AS DateTime), CAST(0x00009FB4002CE880 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (19, NULL, NULL, NULL, NULL, CAST(0x00009FB400364D76 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (20, NULL, NULL, NULL, NULL, CAST(0x00009FB400367614 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (21, NULL, NULL, NULL, NULL, CAST(0x00009FB40036A844 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (22, NULL, NULL, NULL, NULL, CAST(0x00009FB400378B14 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (23, NULL, NULL, NULL, NULL, CAST(0x00009FB400380214 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (24, NULL, NULL, NULL, NULL, CAST(0x00009FB400385F91 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (25, NULL, NULL, NULL, NULL, CAST(0x00009FB4003965E0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (26, NULL, NULL, NULL, NULL, CAST(0x00009FB4003995FC AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (27, NULL, NULL, NULL, NULL, CAST(0x00009FB40039D132 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (28, NULL, 2, NULL, NULL, CAST(0x00009FB40039D143 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (29, NULL, NULL, NULL, NULL, CAST(0x00009FB4003B4DFC AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (30, NULL, 2, NULL, NULL, CAST(0x00009FB4003B4E09 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (31, NULL, NULL, NULL, NULL, CAST(0x00009FB4003C0BA9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (32, NULL, 2, NULL, NULL, CAST(0x00009FB4003C0BB2 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (33, NULL, NULL, NULL, NULL, CAST(0x00009FB4003C8A47 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (34, NULL, 2, NULL, NULL, CAST(0x00009FB4003C8A5F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (35, NULL, NULL, NULL, NULL, CAST(0x00009FB4003D390F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (36, NULL, 1, NULL, NULL, CAST(0x00009FB4003D3922 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (37, NULL, NULL, NULL, NULL, CAST(0x00009FB4003D7FBA AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (38, NULL, 2, NULL, NULL, CAST(0x00009FB4003D7FD9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (39, NULL, NULL, NULL, NULL, CAST(0x00009FB4003E363A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (40, NULL, 2, NULL, NULL, CAST(0x00009FB4003E3653 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (41, NULL, NULL, NULL, NULL, CAST(0x00009FB4003E609C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (42, NULL, 2, NULL, NULL, CAST(0x00009FB4003E60B6 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (43, NULL, NULL, NULL, NULL, CAST(0x00009FB4003EA2BE AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (44, NULL, 2, NULL, NULL, CAST(0x00009FB4003EA2D2 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (45, NULL, NULL, NULL, NULL, CAST(0x00009FB4003EF82B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (46, NULL, 2, NULL, NULL, CAST(0x00009FB4003EF844 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (47, NULL, NULL, NULL, NULL, CAST(0x00009FB4003F581A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (48, NULL, NULL, NULL, NULL, CAST(0x00009FB40040433C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (49, NULL, 3, NULL, NULL, CAST(0x00009FB400404356 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (50, NULL, NULL, NULL, NULL, CAST(0x00009FB40040BC5F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (51, NULL, 2, NULL, NULL, CAST(0x00009FB40040BC74 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (52, NULL, NULL, NULL, NULL, CAST(0x00009FB4004180A7 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (53, NULL, 1, NULL, NULL, CAST(0x00009FB4004180BB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (54, NULL, NULL, NULL, NULL, CAST(0x00009FB40041E480 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (55, NULL, 3, NULL, NULL, CAST(0x00009FB40041E49A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (56, NULL, NULL, NULL, NULL, CAST(0x00009FB4004226E5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (57, NULL, 2, NULL, NULL, CAST(0x00009FB4004226FD AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (58, NULL, NULL, NULL, NULL, CAST(0x00009FB400429D53 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (59, NULL, 3, NULL, NULL, CAST(0x00009FB400429D6C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (60, NULL, NULL, NULL, NULL, CAST(0x00009FB40044BE27 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (61, NULL, 3, NULL, NULL, CAST(0x00009FB40044BE42 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (62, NULL, NULL, NULL, NULL, CAST(0x00009FB40044D72A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (63, NULL, NULL, NULL, NULL, CAST(0x00009FB4004592EE AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (64, N'Test12345', 4, NULL, NULL, CAST(0x00009FB400459308 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (65, NULL, NULL, NULL, NULL, CAST(0x00009FB4004998A1 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (66, N'test', 3, NULL, NULL, CAST(0x00009FB4004998B9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (67, NULL, NULL, NULL, NULL, CAST(0x00009FB4004A7C43 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (68, N'dfgtyi', 1, NULL, NULL, CAST(0x00009FB4004A7C56 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (69, NULL, NULL, NULL, NULL, CAST(0x00009FB4004AC6EF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (70, N'', 3, NULL, NULL, CAST(0x00009FB4004AC708 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (71, NULL, NULL, NULL, NULL, CAST(0x00009FB40052ADFB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (72, N'fg', 3, NULL, NULL, CAST(0x00009FB40052AE1E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (73, NULL, NULL, NULL, NULL, CAST(0x00009FB400545DA1 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (74, N'', 2, NULL, NULL, CAST(0x00009FB400545DB4 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (75, NULL, NULL, NULL, NULL, CAST(0x00009FB40055A1CD AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (76, N'', 3, NULL, NULL, CAST(0x00009FB40055A1E3 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (77, NULL, NULL, NULL, NULL, CAST(0x00009FB400580AF7 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (78, N'ser', 3, NULL, NULL, CAST(0x00009FB400580B12 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (79, NULL, NULL, NULL, NULL, CAST(0x00009FB4005864D5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (80, N'dad', 1, NULL, NULL, CAST(0x00009FB4005864F0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (81, NULL, NULL, NULL, NULL, CAST(0x00009FB400593E70 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (82, N'', 2, NULL, NULL, CAST(0x00009FB400593E84 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (83, NULL, NULL, NULL, NULL, CAST(0x00009FB4005A6439 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (84, N'', 3, NULL, NULL, CAST(0x00009FB4005A6452 AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[calls] OFF
/****** Object:  Table [dbo].[tasks]    Script Date: 12/09/2011 13:05:05 ******/
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
	[deleted] [bit] NOT NULL,
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
INSERT [dbo].[tasks] ([id], [parent_id], [created], [updated], [title], [details], [notifier_id], [assignee_id], [clerk_id], [status_id], [category_id], [deleted]) VALUES (1, 1, CAST(0x00009E5E00107AC0 AS DateTime), NULL, N'Testimine on tähtis. 2', N'Vaja testida kõnet, sest kõne on tähtis. DNA', 1, 1, 1, 1, 1, 0)
INSERT [dbo].[tasks] ([id], [parent_id], [created], [updated], [title], [details], [notifier_id], [assignee_id], [clerk_id], [status_id], [category_id], [deleted]) VALUES (2, NULL, CAST(0x00009FA100FA7D00 AS DateTime), NULL, N'Projekt', N'Vaja projekt lõpetada', 4, 1, 1, 1, 1, 0)
/****** Object:  Table [dbo].[tasks_calls]    Script Date: 12/09/2011 13:05:05 ******/
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
/****** Object:  Default [DF_calls_deleted]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[calls] ADD  CONSTRAINT [DF_calls_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_logs_created]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[logs] ADD  CONSTRAINT [DF_logs_created]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  Default [DF_logs_person_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[logs] ADD  CONSTRAINT [DF_logs_person_id]  DEFAULT (NULL) FOR [person_id]
GO
/****** Object:  Default [DF_logs_deleted]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[logs] ADD  CONSTRAINT [DF_logs_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_persons_deleted]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[persons] ADD  CONSTRAINT [DF_persons_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_phonebook_deleted]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[phonebook] ADD  CONSTRAINT [DF_phonebook_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_task_categories_deleted]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[task_categories] ADD  CONSTRAINT [DF_task_categories_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_task_statuses_deleted]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[task_statuses] ADD  CONSTRAINT [DF_task_statuses_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_tasks_deleted]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  ForeignKey [FK_calls_clerk_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[calls]  WITH CHECK ADD  CONSTRAINT [FK_calls_clerk_id] FOREIGN KEY([clerk_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[calls] CHECK CONSTRAINT [FK_calls_clerk_id]
GO
/****** Object:  ForeignKey [FK_logs_logs_persons]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[logs]  WITH CHECK ADD  CONSTRAINT [FK_logs_logs_persons] FOREIGN KEY([person_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[logs] CHECK CONSTRAINT [FK_logs_logs_persons]
GO
/****** Object:  ForeignKey [FK_persons_company_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[persons]  WITH CHECK ADD  CONSTRAINT [FK_persons_company_id] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[persons] CHECK CONSTRAINT [FK_persons_company_id]
GO
/****** Object:  ForeignKey [FK_task_categories_parent_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[task_categories]  WITH CHECK ADD  CONSTRAINT [FK_task_categories_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[task_categories] ([id])
GO
ALTER TABLE [dbo].[task_categories] CHECK CONSTRAINT [FK_task_categories_parent_id]
GO
/****** Object:  ForeignKey [FK_task_statuses_parent_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[task_statuses]  WITH CHECK ADD  CONSTRAINT [FK_task_statuses_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[task_statuses] ([id])
GO
ALTER TABLE [dbo].[task_statuses] CHECK CONSTRAINT [FK_task_statuses_parent_id]
GO
/****** Object:  ForeignKey [FK_assignee_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_assignee_id] FOREIGN KEY([assignee_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_assignee_id]
GO
/****** Object:  ForeignKey [FK_category_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[task_categories] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_category_id]
GO
/****** Object:  ForeignKey [FK_clerk_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_clerk_id] FOREIGN KEY([clerk_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_clerk_id]
GO
/****** Object:  ForeignKey [FK_parent_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[tasks] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_parent_id]
GO
/****** Object:  ForeignKey [FK_status_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_status_id] FOREIGN KEY([status_id])
REFERENCES [dbo].[task_statuses] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_status_id]
GO
/****** Object:  ForeignKey [FK_tasks_calls_call_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[tasks_calls]  WITH CHECK ADD  CONSTRAINT [FK_tasks_calls_call_id] FOREIGN KEY([call_id])
REFERENCES [dbo].[calls] ([id])
GO
ALTER TABLE [dbo].[tasks_calls] CHECK CONSTRAINT [FK_tasks_calls_call_id]
GO
/****** Object:  ForeignKey [FK_tasks_calls_task_id]    Script Date: 12/09/2011 13:05:05 ******/
ALTER TABLE [dbo].[tasks_calls]  WITH CHECK ADD  CONSTRAINT [FK_tasks_calls_task_id] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
GO
ALTER TABLE [dbo].[tasks_calls] CHECK CONSTRAINT [FK_tasks_calls_task_id]
GO
