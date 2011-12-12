USE [sip-agent]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 12/11/2011 21:57:07 ******/
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
/****** Object:  Table [dbo].[task_statuses]    Script Date: 12/11/2011 21:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_statuses](
	[id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
	[deleted] [bit] NOT NULL,
	[parent_id] [int] NULL,
 CONSTRAINT [PK_task_statuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (1, N'New       ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (2, N'Planned   ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (3, N'Active    ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (4, N'Archived  ', 1, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (5, N'Resolved  ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (6, N'Feedback  ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (7, N'Closed    ', 0, NULL)
INSERT [dbo].[task_statuses] ([id], [name], [deleted], [parent_id]) VALUES (8, N'Deleted   ', 0, NULL)
/****** Object:  Table [dbo].[task_categories]    Script Date: 12/11/2011 21:57:07 ******/
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
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (1, N'Hardware', 1, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (2, N'Software', NULL, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (3, N'Consultation', NULL, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (4, N'Installation', 1, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (5, N'Installation', 2, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (6, N'Repair', 1, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (7, N'Repair', 2, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (8, N'Default', NULL, 0)
INSERT [dbo].[task_categories] ([id], [name], [parent_id], [deleted]) VALUES (9, N'Catering', NULL, 1)
/****** Object:  Table [dbo].[phonebook]    Script Date: 12/11/2011 21:57:07 ******/
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
INSERT [dbo].[phonebook] ([id], [phone], [email], [person_id], [deleted]) VALUES (1, N'+372581314512       ', N'ando@roots.ee                           ', 6, 0)
INSERT [dbo].[phonebook] ([id], [phone], [email], [person_id], [deleted]) VALUES (2, N'+3726654124         ', NULL, 4, 0)
INSERT [dbo].[phonebook] ([id], [phone], [email], [person_id], [deleted]) VALUES (3, N'+66211521582        ', N'janne.olgren@riasg.lt                   ', 3, 0)
INSERT [dbo].[phonebook] ([id], [phone], [email], [person_id], [deleted]) VALUES (4, N'+37254124121        ', N'tonis@tonis.ee                          ', 2, 0)
INSERT [dbo].[phonebook] ([id], [phone], [email], [person_id], [deleted]) VALUES (5, N'+772514125          ', NULL, 5, 0)
/****** Object:  Table [dbo].[persons]    Script Date: 12/11/2011 21:57:07 ******/
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
	[created] [datetime] NOT NULL,
	[company_id] [int] NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_persons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[persons] ON
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (1, N'Anonymous                                                       ', N'User                                                            ', N'Anonymous                       ', N'admin                           ', CAST(0x00009E5E00B85894 AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (2, N'Tõnis                                                           ', N'Umbsaar                                                         ', N'tonis                           ', N'tonis                           ', CAST(0x00009E5E00B89200 AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (3, N'Sander                                                          ', N'Sülla                                                           ', N'sander                          ', N'sander                          ', CAST(0x00009E4A00000000 AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (4, N'Jana                                                            ', N'Mrots                                                           ', N'jana                            ', N'jana                            ', CAST(0x00009D1100C8DF0C AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (5, N'Test                                                            ', NULL, NULL, NULL, CAST(0x00009D1100C8DF0C AS DateTime), 2, 1)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (6, N'Ando                                                            ', N'Roots                                                           ', N'ando                            ', N'ando                            ', CAST(0x00009FAB00CBE47C AS DateTime), 1, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (7, N'Jaak                                                            ', N'Jalakas                                                         ', N'Jaak                            ', N'jaak                            ', CAST(0x00009FB400F7182C AS DateTime), NULL, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (8, NULL, NULL, NULL, NULL, CAST(0x00009FB400F87AE7 AS DateTime), NULL, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (9, NULL, NULL, NULL, NULL, CAST(0x00009FB6012A2C9B AS DateTime), NULL, 0)
INSERT [dbo].[persons] ([id], [first_name], [last_name], [username], [password], [created], [company_id], [deleted]) VALUES (10, NULL, NULL, NULL, NULL, CAST(0x00009FB601532758 AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[persons] OFF
/****** Object:  Table [dbo].[logs]    Script Date: 12/11/2011 21:57:07 ******/
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
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (141, CAST(0x00009FB400D83392 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (142, CAST(0x00009FB400D8511F AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (143, CAST(0x00009FB400DA16D4 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (144, CAST(0x00009FB400DA1E2B AS DateTime), NULL, NULL, 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (145, CAST(0x00009FB400DA7C3F AS DateTime), 1, NULL, 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (146, CAST(0x00009FB400DAA289 AS DateTime), 6, NULL, 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (147, CAST(0x00009FB400DB4278 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (148, CAST(0x00009FB400DB4783 AS DateTime), 6, N'text', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (149, CAST(0x00009FB400DBDB0C AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (150, CAST(0x00009FB400DBDE69 AS DateTime), 6, N'text', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (151, CAST(0x00009FB400E0B0B7 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (152, CAST(0x00009FB400E11645 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (153, CAST(0x00009FB400E62589 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (154, CAST(0x00009FB400E8A151 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (155, CAST(0x00009FB400EA27EA AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (156, CAST(0x00009FB400EA773D AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (157, CAST(0x00009FB400EB2100 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (158, CAST(0x00009FB400ED3783 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (159, CAST(0x00009FB400EEBD9B AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (160, CAST(0x00009FB400EEDFA0 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (161, CAST(0x00009FB400EF0F08 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (162, CAST(0x00009FB400EF13B2 AS DateTime), 1, N'Initialized.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (163, CAST(0x00009FB400EF462D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (164, CAST(0x00009FB400EF4CAF AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (165, CAST(0x00009FB400EF5173 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (166, CAST(0x00009FB400F46FE2 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (167, CAST(0x00009FB400F4EAC4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (168, CAST(0x00009FB400F4FEA9 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (169, CAST(0x00009FB400F50580 AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (170, CAST(0x00009FB400F67D23 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (171, CAST(0x00009FB400F6811C AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (172, CAST(0x00009FB400F68A21 AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (173, CAST(0x00009FB400F68EE2 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (174, CAST(0x00009FB400F6C518 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (175, CAST(0x00009FB400F6C88D AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (176, CAST(0x00009FB400F82A00 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (177, CAST(0x00009FB400F8312B AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (178, CAST(0x00009FB400F871FA AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (179, CAST(0x00009FB400F87560 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (180, CAST(0x00009FB400F892E2 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (181, CAST(0x00009FB400F89650 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (182, CAST(0x00009FB400F8D26E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (183, CAST(0x00009FB400F8D6A1 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (184, CAST(0x00009FB400FA71ED AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (185, CAST(0x00009FB400FA75CB AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (186, CAST(0x00009FB400FF9B53 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (187, CAST(0x00009FB401001DCB AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (188, CAST(0x00009FB401019788 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (189, CAST(0x00009FB401025821 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (190, CAST(0x00009FB40102D039 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (191, CAST(0x00009FB40102EEF2 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (192, CAST(0x00009FB401042B4F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (193, CAST(0x00009FB401077C29 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (194, CAST(0x00009FB40107AC2F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (195, CAST(0x00009FB401087D4D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (196, CAST(0x00009FB4010984C3 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (197, CAST(0x00009FB40109DD6A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (198, CAST(0x00009FB4010CB959 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (199, CAST(0x00009FB4010CE43B AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (200, CAST(0x00009FB4010D68B0 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (201, CAST(0x00009FB4010D87DF AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (202, CAST(0x00009FB4010DAF1E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (203, CAST(0x00009FB4010DF5A5 AS DateTime), 1, N'Initialized login screen.', 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (204, CAST(0x00009FB4010EB2BA AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (205, CAST(0x00009FB4010FC560 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (206, CAST(0x00009FB4010FDC86 AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (207, CAST(0x00009FB4010FEF36 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (208, CAST(0x00009FB4010FF12A AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (209, CAST(0x00009FB4010FF449 AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (210, CAST(0x00009FB401102245 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (211, CAST(0x00009FB40110249D AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (212, CAST(0x00009FB401102D6A AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (213, CAST(0x00009FB40110338E AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (214, CAST(0x00009FB4011040E3 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (215, CAST(0x00009FB40110B1C0 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (216, CAST(0x00009FB40110B504 AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (217, CAST(0x00009FB40110B99D AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (218, CAST(0x00009FB40110BBA2 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (219, CAST(0x00009FB40110BD6C AS DateTime), 1, N'Failed authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (220, CAST(0x00009FB40110C12B AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (221, CAST(0x00009FB40110C788 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (222, CAST(0x00009FB401117B34 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (223, CAST(0x00009FB401117F44 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (224, CAST(0x00009FB40111C512 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (225, CAST(0x00009FB40111CEF7 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (226, CAST(0x00009FB4011211AD AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (227, CAST(0x00009FB40112539A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (228, CAST(0x00009FB4011258ED AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (229, CAST(0x00009FB40112C628 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (230, CAST(0x00009FB40112CA62 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (231, CAST(0x00009FB40113A758 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (232, CAST(0x00009FB40113AC32 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (233, CAST(0x00009FB401142B78 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (234, CAST(0x00009FB5000CB3A8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (235, CAST(0x00009FB5000CB973 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (236, CAST(0x00009FB5000EDE74 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (237, CAST(0x00009FB5000F46B9 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (238, CAST(0x00009FB5000F4C45 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (239, CAST(0x00009FB5000F8392 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (240, CAST(0x00009FB5000F8767 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (241, CAST(0x00009FB50012A82D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (242, CAST(0x00009FB50012AC36 AS DateTime), 6, N'Successful authentication for user ando', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (243, CAST(0x00009FB50013DDFD AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (244, CAST(0x00009FB500140A99 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (245, CAST(0x00009FB50015CED7 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (246, CAST(0x00009FB50016ED6E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (247, CAST(0x00009FB500178501 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (248, CAST(0x00009FB50017C412 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (249, CAST(0x00009FB500183A8E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (250, CAST(0x00009FB5001AB617 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (251, CAST(0x00009FB5001C41D3 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (252, CAST(0x00009FB5001CD2BB AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (253, CAST(0x00009FB5001CE895 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (254, CAST(0x00009FB5001D5297 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (255, CAST(0x00009FB5001DABDD AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (256, CAST(0x00009FB500207181 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (257, CAST(0x00009FB50021C5DB AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (258, CAST(0x00009FB500221597 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (259, CAST(0x00009FB500BE05B8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (260, CAST(0x00009FB500BF9FAC AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (261, CAST(0x00009FB500C092AA AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (262, CAST(0x00009FB500C14EFF AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (263, CAST(0x00009FB500C1D3E9 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (264, CAST(0x00009FB500C20359 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (265, CAST(0x00009FB500C3F7FC AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (266, CAST(0x00009FB500C47354 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (267, CAST(0x00009FB500C4E911 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (268, CAST(0x00009FB500C562C0 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (269, CAST(0x00009FB500C5B033 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (270, CAST(0x00009FB500C5C461 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (271, CAST(0x00009FB500C5D6D0 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (272, CAST(0x00009FB500C605C3 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (273, CAST(0x00009FB500C796CA AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (274, CAST(0x00009FB500C7D711 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (275, CAST(0x00009FB500C8028D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (276, CAST(0x00009FB500C82FB5 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (277, CAST(0x00009FB500C84CC1 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (278, CAST(0x00009FB500C88611 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (279, CAST(0x00009FB600AEE60A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (280, CAST(0x00009FB600AF0F26 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (281, CAST(0x00009FB600D1A8E5 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (282, CAST(0x00009FB600D1FEB3 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (283, CAST(0x00009FB600D2117F AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (284, CAST(0x00009FB600D21389 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (285, CAST(0x00009FB600D2283F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (286, CAST(0x00009FB600D234B6 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (287, CAST(0x00009FB600D2B6AA AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (288, CAST(0x00009FB600D347B5 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (289, CAST(0x00009FB600D37433 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (290, CAST(0x00009FB600D488C7 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (291, CAST(0x00009FB600D531B4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (292, CAST(0x00009FB600D56432 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (293, CAST(0x00009FB600D5922A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (294, CAST(0x00009FB600D5D402 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (295, CAST(0x00009FB600D6BFB9 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (296, CAST(0x00009FB600D74991 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (297, CAST(0x00009FB600D7B7E1 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (298, CAST(0x00009FB600D818A7 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (299, CAST(0x00009FB600D95D30 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (300, CAST(0x00009FB600D9DFD9 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (301, CAST(0x00009FB600DA46F4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (302, CAST(0x00009FB600DA74A9 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (303, CAST(0x00009FB600DC4D3B AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (304, CAST(0x00009FB600DC84F9 AS DateTime), 1, N'Initialized login screen.', 0)
GO
print 'Processed 300 total records'
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (305, CAST(0x00009FB600DCD922 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (306, CAST(0x00009FB600DD07B8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (307, CAST(0x00009FB600DDC705 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (308, CAST(0x00009FB600DFC241 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (309, CAST(0x00009FB600DFF6BC AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (310, CAST(0x00009FB600E1D094 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (311, CAST(0x00009FB600E29482 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (312, CAST(0x00009FB600E3415B AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (313, CAST(0x00009FB600E3CA18 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (314, CAST(0x00009FB600E3CEFD AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (315, CAST(0x00009FB600E7FDB8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (316, CAST(0x00009FB600E874A3 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (317, CAST(0x00009FB600E89F11 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (318, CAST(0x00009FB600E8CBCA AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (319, CAST(0x00009FB600E90768 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (320, CAST(0x00009FB600E9A6AD AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (321, CAST(0x00009FB600E9DE81 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (322, CAST(0x00009FB600E9FEBE AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (323, CAST(0x00009FB600ECEF02 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (324, CAST(0x00009FB600ED8160 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (325, CAST(0x00009FB600ED98A8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (326, CAST(0x00009FB600EE0F85 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (327, CAST(0x00009FB600EE57A6 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (328, CAST(0x00009FB600EE81A7 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (329, CAST(0x00009FB600EED70C AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (330, CAST(0x00009FB600EF5870 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (331, CAST(0x00009FB600EF9D4D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (332, CAST(0x00009FB600EFD9D3 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (333, CAST(0x00009FB600EFFD66 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (334, CAST(0x00009FB600F02756 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (335, CAST(0x00009FB600F0C40B AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (336, CAST(0x00009FB600F113C8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (337, CAST(0x00009FB600F1832B AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (338, CAST(0x00009FB600F19873 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (339, CAST(0x00009FB600F1B1C4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (340, CAST(0x00009FB600F1CD39 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (341, CAST(0x00009FB600F26C06 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (342, CAST(0x00009FB600F282A4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (343, CAST(0x00009FB600F2E53E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (344, CAST(0x00009FB600F374CC AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (345, CAST(0x00009FB600F3B629 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (346, CAST(0x00009FB600F3E6FB AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (347, CAST(0x00009FB600F44284 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (348, CAST(0x00009FB600F46B78 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (349, CAST(0x00009FB600F59BB0 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (350, CAST(0x00009FB600F66E76 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (351, CAST(0x00009FB600F6AA31 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (352, CAST(0x00009FB600F73050 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (353, CAST(0x00009FB600F78FB4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (354, CAST(0x00009FB600F824A8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (355, CAST(0x00009FB600F95442 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (356, CAST(0x00009FB600F9A7BE AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (357, CAST(0x00009FB600FA1060 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (358, CAST(0x00009FB600FAB32A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (359, CAST(0x00009FB600FAE6E3 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (360, CAST(0x00009FB600FB1335 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (361, CAST(0x00009FB600FB3CBF AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (362, CAST(0x00009FB600FB4A26 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (363, CAST(0x00009FB600FB4B55 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (364, CAST(0x00009FB600FB7DFF AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (365, CAST(0x00009FB600FB8139 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (366, CAST(0x00009FB600FD297A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (367, CAST(0x00009FB600FD2DCD AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (368, CAST(0x00009FB600FD3058 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (369, CAST(0x00009FB600FDE14F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (370, CAST(0x00009FB600FDE6F6 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (371, CAST(0x00009FB600FE6F6C AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (372, CAST(0x00009FB600FE71E1 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (373, CAST(0x00009FB600FE74C5 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (374, CAST(0x00009FB600FEEA50 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (375, CAST(0x00009FB600FEEE31 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (376, CAST(0x00009FB600FF6F74 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (377, CAST(0x00009FB600FF7316 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (378, CAST(0x00009FB601004BDD AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (379, CAST(0x00009FB601009387 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (380, CAST(0x00009FB60100AC41 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (381, CAST(0x00009FB60100C26D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (382, CAST(0x00009FB601011248 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (383, CAST(0x00009FB601011975 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (384, CAST(0x00009FB601011C1C AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (385, CAST(0x00009FB6010179B2 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (386, CAST(0x00009FB601022DB4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (387, CAST(0x00009FB6010231B5 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (388, CAST(0x00009FB601023335 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (389, CAST(0x00009FB601023827 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (390, CAST(0x00009FB601023960 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (391, CAST(0x00009FB60102D823 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (392, CAST(0x00009FB60102DD07 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (393, CAST(0x00009FB60102DE51 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (394, CAST(0x00009FB60102E002 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (395, CAST(0x00009FB60102E24A AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (396, CAST(0x00009FB60102E425 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (397, CAST(0x00009FB601038AE1 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (398, CAST(0x00009FB601040724 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (399, CAST(0x00009FB601042F94 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (400, CAST(0x00009FB601043349 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (401, CAST(0x00009FB6010434C5 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (402, CAST(0x00009FB60104638D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (403, CAST(0x00009FB60104674F AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (404, CAST(0x00009FB601046B7F AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (405, CAST(0x00009FB601046D42 AS DateTime), 6, N'Initialized system standby view.', 0)
GO
print 'Processed 400 total records'
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (406, CAST(0x00009FB6010474AD AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (407, CAST(0x00009FB601047DB3 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (408, CAST(0x00009FB601048048 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (409, CAST(0x00009FB601048286 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (410, CAST(0x00009FB601048613 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (411, CAST(0x00009FB6010487CE AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (412, CAST(0x00009FB6010488DF AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (413, CAST(0x00009FB60104AF24 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (414, CAST(0x00009FB60104B1E2 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (415, CAST(0x00009FB60104B32D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (416, CAST(0x00009FB60104B4EE AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (417, CAST(0x00009FB60104B5CD AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (418, CAST(0x00009FB601058C5F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (419, CAST(0x00009FB601058FFE AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (420, CAST(0x00009FB601059126 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (421, CAST(0x00009FB60106FE3E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (422, CAST(0x00009FB601070324 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (423, CAST(0x00009FB601070456 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (424, CAST(0x00009FB601070641 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (425, CAST(0x00009FB60107070F AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (426, CAST(0x00009FB60107080A AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (427, CAST(0x00009FB601070904 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (428, CAST(0x00009FB601098F42 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (429, CAST(0x00009FB60109CA8E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (430, CAST(0x00009FB6010B773E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (431, CAST(0x00009FB6010C1682 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (432, CAST(0x00009FB6010C815C AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (433, CAST(0x00009FB6010CD251 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (434, CAST(0x00009FB6010D4E2A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (435, CAST(0x00009FB6010DB731 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (436, CAST(0x00009FB601102FAB AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (437, CAST(0x00009FB60112C7C8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (438, CAST(0x00009FB601130A5F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (439, CAST(0x00009FB6011334B4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (440, CAST(0x00009FB601135F8F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (441, CAST(0x00009FB601138BA8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (442, CAST(0x00009FB60114397A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (443, CAST(0x00009FB601152235 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (444, CAST(0x00009FB60117485D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (445, CAST(0x00009FB601176192 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (446, CAST(0x00009FB60117992C AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (447, CAST(0x00009FB6011839D4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (448, CAST(0x00009FB6011860C6 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (449, CAST(0x00009FB60118AE38 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (450, CAST(0x00009FB60118D74E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (451, CAST(0x00009FB6011A6D9F AS DateTime), 1, N'App started', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (452, CAST(0x00009FB6011A6E38 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (453, CAST(0x00009FB6011AF1BA AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (454, CAST(0x00009FB6011AF241 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (455, CAST(0x00009FB6011AF5C5 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (456, CAST(0x00009FB6011B019B AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (457, CAST(0x00009FB6011C2E0D AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (458, CAST(0x00009FB6011C2EA3 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (459, CAST(0x00009FB6011C6548 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (460, CAST(0x00009FB6011C6611 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (461, CAST(0x00009FB6011C8EDB AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (462, CAST(0x00009FB6011C8F8C AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (463, CAST(0x00009FB6011CF32A AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (464, CAST(0x00009FB6011CF3CD AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (465, CAST(0x00009FB6011D5F80 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (466, CAST(0x00009FB6011D6019 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (467, CAST(0x00009FB60121B9CF AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (468, CAST(0x00009FB60121BA57 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (469, CAST(0x00009FB60121BD20 AS DateTime), 6, N'Initialized open task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (470, CAST(0x00009FB60121F582 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (471, CAST(0x00009FB60121F5FB AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (472, CAST(0x00009FB6012275BC AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (473, CAST(0x00009FB601227632 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (474, CAST(0x00009FB60122DDF5 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (475, CAST(0x00009FB60122DE85 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (476, CAST(0x00009FB601233A02 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (477, CAST(0x00009FB601233A77 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (478, CAST(0x00009FB601248378 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (479, CAST(0x00009FB60124840A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (480, CAST(0x00009FB601271312 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (481, CAST(0x00009FB6012713AA AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (482, CAST(0x00009FB60128CE24 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (483, CAST(0x00009FB60128CEA6 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (484, CAST(0x00009FB60128D6BA AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (485, CAST(0x00009FB6012A0FE6 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (486, CAST(0x00009FB6012A107B AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (487, CAST(0x00009FB6012A2C8F AS DateTime), 6, N'Initialized change person information.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (488, CAST(0x00009FB6012A3DD4 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (489, CAST(0x00009FB6012A3E60 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (490, CAST(0x00009FB6012A6731 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (491, CAST(0x00009FB6012A6860 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (492, CAST(0x00009FB6012A6F70 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (493, CAST(0x00009FB6012A709A AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (494, CAST(0x00009FB6012AB3BC AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (495, CAST(0x00009FB6012AB44E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (496, CAST(0x00009FB6012ABD05 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (497, CAST(0x00009FB6012ABE08 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (498, CAST(0x00009FB6013A3407 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (499, CAST(0x00009FB6013A3490 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (500, CAST(0x00009FB6013A7423 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (501, CAST(0x00009FB6013A74B1 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (502, CAST(0x00009FB6013ACC5F AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (503, CAST(0x00009FB6013ACE05 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (504, CAST(0x00009FB6013ADC1D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (505, CAST(0x00009FB6013B6151 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (506, CAST(0x00009FB6013B61E3 AS DateTime), 1, N'Initialized login screen.', 0)
GO
print 'Processed 500 total records'
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (507, CAST(0x00009FB6013B6CC2 AS DateTime), 6, N'Initialized make new call.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (508, CAST(0x00009FB6013C254C AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (509, CAST(0x00009FB6013C25F1 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (510, CAST(0x00009FB6013C2A77 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (511, CAST(0x00009FB6013C3805 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (512, CAST(0x00009FB6013C39CA AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (513, CAST(0x00009FB6013C3C14 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (514, CAST(0x00009FB6013C3DE0 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (515, CAST(0x00009FB6013C402A AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (516, CAST(0x00009FB6013C435F AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (517, CAST(0x00009FB6013C4623 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (518, CAST(0x00009FB6013C4967 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (519, CAST(0x00009FB6013CE2FC AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (520, CAST(0x00009FB6013CE3DF AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (521, CAST(0x00009FB6013CE6EB AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (522, CAST(0x00009FB6013CE890 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (523, CAST(0x00009FB6013CE9DA AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (524, CAST(0x00009FB6013CEC30 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (525, CAST(0x00009FB6013CEDAC AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (526, CAST(0x00009FB6013DEE13 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (527, CAST(0x00009FB6013DEEFF AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (528, CAST(0x00009FB6013DF1E0 AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (529, CAST(0x00009FB6013DF3DA AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (530, CAST(0x00009FB6013DF4B3 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (531, CAST(0x00009FB6013DF794 AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (532, CAST(0x00009FB6013DF8AE AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (533, CAST(0x00009FB6013DFFD8 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (534, CAST(0x00009FB6013E0200 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (535, CAST(0x00009FB6013E0391 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (536, CAST(0x00009FB6013E0673 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (537, CAST(0x00009FB6013E0826 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (538, CAST(0x00009FB6013E0C68 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (539, CAST(0x00009FB6013E0E0A AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (540, CAST(0x00009FB6013E6299 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (541, CAST(0x00009FB6013E631C AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (542, CAST(0x00009FB6013E65FC AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (543, CAST(0x00009FB6013E6A75 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (544, CAST(0x00009FB6013E6C94 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (545, CAST(0x00009FB6013E7361 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (546, CAST(0x00009FB6013E7453 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (547, CAST(0x00009FB6013EB6AF AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (548, CAST(0x00009FB6013EB754 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (549, CAST(0x00009FB6013EC079 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (550, CAST(0x00009FB6013EC63D AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (551, CAST(0x00009FB6013EC77C AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (552, CAST(0x00009FB6013ECB46 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (553, CAST(0x00009FB6013ED17A AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (554, CAST(0x00009FB6013ED258 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (555, CAST(0x00009FB6013ED879 AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (556, CAST(0x00009FB6013EDCA7 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (557, CAST(0x00009FB6013EDDD9 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (558, CAST(0x00009FB6013EDFA0 AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (559, CAST(0x00009FB6013F4C51 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (560, CAST(0x00009FB6013F4D38 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (561, CAST(0x00009FB6013F5E9C AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (562, CAST(0x00009FB6013F5F2C AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (563, CAST(0x00009FB6013F62E9 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (564, CAST(0x00009FB6013F7778 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (565, CAST(0x00009FB6013F782F AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (566, CAST(0x00009FB6013F7B16 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (567, CAST(0x00009FB6013F7DA3 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (568, CAST(0x00009FB6013F7F3C AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (569, CAST(0x00009FB6013F82B0 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (570, CAST(0x00009FB6013F83C2 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (571, CAST(0x00009FB6013F8582 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (572, CAST(0x00009FB6013F8B83 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (573, CAST(0x00009FB6013F8D28 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (574, CAST(0x00009FB6013F93EE AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (575, CAST(0x00009FB6013F9490 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (576, CAST(0x00009FB6013F9649 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (577, CAST(0x00009FB6013F9A66 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (578, CAST(0x00009FB6013F9BBE AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (579, CAST(0x00009FB6013F9DB2 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (580, CAST(0x00009FB6013FA007 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (581, CAST(0x00009FB6013FA204 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (582, CAST(0x00009FB6013FA543 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (583, CAST(0x00009FB6013FA5FE AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (584, CAST(0x00009FB6013FA791 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (585, CAST(0x00009FB6013FAB85 AS DateTime), 6, N'Successfully saved task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (586, CAST(0x00009FB6013FAC81 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (587, CAST(0x00009FB6013FAE32 AS DateTime), 6, N'Opened task 1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (588, CAST(0x00009FB6013FD7A8 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (589, CAST(0x00009FB6013FD83B AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (590, CAST(0x00009FB601428B9A AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (591, CAST(0x00009FB601428C3B AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (592, CAST(0x00009FB6014315BD AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (593, CAST(0x00009FB60143164D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (594, CAST(0x00009FB601431B27 AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (595, CAST(0x00009FB601431CFE AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (596, CAST(0x00009FB601431EA5 AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (597, CAST(0x00009FB6014326E9 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (598, CAST(0x00009FB601432CFD AS DateTime), 6, N'Initialized call view for call #7', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (599, CAST(0x00009FB6014396A6 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (600, CAST(0x00009FB60143978A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (601, CAST(0x00009FB601439C3D AS DateTime), 6, N'Initialized call view for call #1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (602, CAST(0x00009FB60143E067 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (603, CAST(0x00009FB60143E895 AS DateTime), 6, N'Initialized call view for call #98', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (604, CAST(0x00009FB6014453CD AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (605, CAST(0x00009FB6014454AF AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (606, CAST(0x00009FB601445E1F AS DateTime), 6, N'Initialized call view for call #98', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (607, CAST(0x00009FB601453F2D AS DateTime), 1, N'App started.', 0)
GO
print 'Processed 600 total records'
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (608, CAST(0x00009FB601453FD5 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (609, CAST(0x00009FB60145447F AS DateTime), 6, N'Initialized call view for call #18', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (610, CAST(0x00009FB601464680 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (611, CAST(0x00009FB601464717 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (612, CAST(0x00009FB601464B92 AS DateTime), 6, N'Initialized call view for call #40', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (613, CAST(0x00009FB60146903F AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (614, CAST(0x00009FB601469115 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (615, CAST(0x00009FB6014695BF AS DateTime), 6, N'Initialized call view for call #46', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (616, CAST(0x00009FB60149A208 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (617, CAST(0x00009FB60149A32B AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (618, CAST(0x00009FB60149B1AF AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (619, CAST(0x00009FB6014A091C AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (620, CAST(0x00009FB6014A09AD AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (621, CAST(0x00009FB6014A0D13 AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (622, CAST(0x00009FB6014A1030 AS DateTime), 6, N'Initialized call view for call #2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (623, CAST(0x00009FB6014A6FB2 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (624, CAST(0x00009FB6014A70B4 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (625, CAST(0x00009FB6014A774E AS DateTime), 6, N'Initialized call view for call #2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (626, CAST(0x00009FB6014A7F66 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (627, CAST(0x00009FB6014A8454 AS DateTime), 6, N'Initialized call view for call #1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (628, CAST(0x00009FB6014DFB78 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (629, CAST(0x00009FB6014DFF40 AS DateTime), 6, N'Initialized call view for call #1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (630, CAST(0x00009FB6014E0A61 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (631, CAST(0x00009FB6014E374E AS DateTime), 6, N'Initialized call view for call #1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (632, CAST(0x00009FB60150AD7A AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (633, CAST(0x00009FB60150AE1D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (634, CAST(0x00009FB60150B431 AS DateTime), 6, N'Initialized call view for call #36', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (635, CAST(0x00009FB60150BC1E AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (636, CAST(0x00009FB60150C3F5 AS DateTime), 6, N'Initialized call view for call #1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (637, CAST(0x00009FB601526B87 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (638, CAST(0x00009FB601526C3A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (639, CAST(0x00009FB601526C91 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (640, CAST(0x00009FB601527945 AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (641, CAST(0x00009FB601527DBA AS DateTime), 6, N'Initialized call view for call #2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (642, CAST(0x00009FB601528D4E AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (643, CAST(0x00009FB60152918E AS DateTime), 6, N'Initialized call view for call #2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (644, CAST(0x00009FB60152FDD4 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (645, CAST(0x00009FB60152FE6A AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (646, CAST(0x00009FB60152FEB0 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (647, CAST(0x00009FB60153274A AS DateTime), 6, N'Initialized change person information.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (648, CAST(0x00009FB601563CCE AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (649, CAST(0x00009FB601563D64 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (650, CAST(0x00009FB601563DA4 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (651, CAST(0x00009FB601564088 AS DateTime), 6, N'Opened task 2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (652, CAST(0x00009FB6015645A7 AS DateTime), 6, N'Initialized call view for call #2', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (653, CAST(0x00009FB601564E19 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (654, CAST(0x00009FB601565511 AS DateTime), 6, N'Initialized call view for call #32', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (655, CAST(0x00009FB60156892F AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (656, CAST(0x00009FB601568DC1 AS DateTime), 6, N'Initialized call view for call #28', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (657, CAST(0x00009FB60156B498 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (658, CAST(0x00009FB60156B526 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (659, CAST(0x00009FB60156B56D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (660, CAST(0x00009FB60156BBB5 AS DateTime), 6, N'Initialized call view for call #5', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (661, CAST(0x00009FB601570AED AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (662, CAST(0x00009FB601570B7F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (663, CAST(0x00009FB601570BC8 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (664, CAST(0x00009FB6015710C3 AS DateTime), 6, N'Initialized call view for call #6', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (665, CAST(0x00009FB601572F19 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (666, CAST(0x00009FB601572FB0 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (667, CAST(0x00009FB601573002 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (668, CAST(0x00009FB601573533 AS DateTime), 6, N'Initialized call view for call #5', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (669, CAST(0x00009FB601575B95 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (670, CAST(0x00009FB601575C81 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (671, CAST(0x00009FB601575CDA AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (672, CAST(0x00009FB6015761A2 AS DateTime), 6, N'Initialized call view for call #5', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (673, CAST(0x00009FB601578968 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (674, CAST(0x00009FB6015789F8 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (675, CAST(0x00009FB601578A3B AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (676, CAST(0x00009FB601578F05 AS DateTime), 6, N'Initialized call view for call #5', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (677, CAST(0x00009FB601579520 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (678, CAST(0x00009FB6015797F4 AS DateTime), 6, N'Initialized call view for call #1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (679, CAST(0x00009FB60157D0C0 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (680, CAST(0x00009FB60157D16F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (681, CAST(0x00009FB60157D1D1 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (682, CAST(0x00009FB6015A53C3 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (683, CAST(0x00009FB6015A5510 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (684, CAST(0x00009FB6015A555E AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (685, CAST(0x00009FB6015A5E80 AS DateTime), 6, N'Opened task 0', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (686, CAST(0x00009FB6015AB730 AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (687, CAST(0x00009FB6015AB7BB AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (688, CAST(0x00009FB6015AB7FB AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (689, CAST(0x00009FB6015ABAF8 AS DateTime), 6, N'Opened task 0', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (690, CAST(0x00009FB6015B891E AS DateTime), 1, N'App started.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (691, CAST(0x00009FB6015B8A5F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (692, CAST(0x00009FB6015B8A9B AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (693, CAST(0x00009FB6015B908F AS DateTime), 6, N'Opened task 0', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (694, CAST(0x00009FB6015B92FC AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (695, CAST(0x00009FB6015B930D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (696, CAST(0x00009FB6015E28C6 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (697, CAST(0x00009FB6015E2A42 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (698, CAST(0x00009FB6015E2A7E AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (699, CAST(0x00009FB6015E75B3 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (700, CAST(0x00009FB6015E7642 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (701, CAST(0x00009FB6015E7687 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (702, CAST(0x00009FB6015E7A45 AS DateTime), 6, N'Töö 2 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (703, CAST(0x00009FB6015E7D43 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (704, CAST(0x00009FB6015E7D4F AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (705, CAST(0x00009FB6015EA3A7 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (706, CAST(0x00009FB6015EA42F AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (707, CAST(0x00009FB6015EA46F AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (708, CAST(0x00009FB6015FE570 AS DateTime), 1, N'Rakendus käivitatud', 0)
GO
print 'Processed 700 total records'
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (709, CAST(0x00009FB6015FE60C AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (710, CAST(0x00009FB6015FE655 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (711, CAST(0x00009FB6015FE988 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (712, CAST(0x00009FB6015FF2A3 AS DateTime), 6, N'Failed to save task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (713, CAST(0x00009FB6015FF62B AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (714, CAST(0x00009FB6015FF63D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (715, CAST(0x00009FB601603226 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (716, CAST(0x00009FB6016032BB AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (717, CAST(0x00009FB601603302 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (718, CAST(0x00009FB6016035EB AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (719, CAST(0x00009FB601609BE4 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (720, CAST(0x00009FB601609C78 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (721, CAST(0x00009FB601609CBE AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (722, CAST(0x00009FB60160A256 AS DateTime), 6, N'Initialized call view for call #5', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (723, CAST(0x00009FB60160AF20 AS DateTime), 6, N'Successfully saved call #5 data.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (724, CAST(0x00009FB60160B0F2 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (725, CAST(0x00009FB60160D152 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (726, CAST(0x00009FB60160D1D9 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (727, CAST(0x00009FB60160D21A AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (728, CAST(0x00009FB60160D403 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (729, CAST(0x00009FB60160DDCF AS DateTime), 6, N'Failed to save task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (730, CAST(0x00009FB60160DF7D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (731, CAST(0x00009FB60160DF8D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (732, CAST(0x00009FB60161418C AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (733, CAST(0x00009FB601614213 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (734, CAST(0x00009FB601614253 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (735, CAST(0x00009FB60161458A AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (736, CAST(0x00009FB601614E1D AS DateTime), 6, N'Failed to save task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (737, CAST(0x00009FB601614F7D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (738, CAST(0x00009FB601614F98 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (739, CAST(0x00009FB601616890 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (740, CAST(0x00009FB60161690E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (741, CAST(0x00009FB60161694B AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (742, CAST(0x00009FB601616B6F AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (743, CAST(0x00009FB601616E5A AS DateTime), 6, N'Failed to save task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (744, CAST(0x00009FB60161D0DD AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (745, CAST(0x00009FB60161D199 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (746, CAST(0x00009FB60161D206 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (747, CAST(0x00009FB60161DECB AS DateTime), 6, N'Initialized call view for call #-1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (748, CAST(0x00009FB60162C248 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (749, CAST(0x00009FB60162C2DF AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (750, CAST(0x00009FB60162C31F AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (751, CAST(0x00009FB60162C817 AS DateTime), 6, N'Initialized call view for call #-1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (752, CAST(0x00009FB60162F7B0 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (753, CAST(0x00009FB60162F833 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (754, CAST(0x00009FB60162F874 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (755, CAST(0x00009FB60162FDAA AS DateTime), 6, N'Initialized call view for call #-1', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (756, CAST(0x00009FB601631D80 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (757, CAST(0x00009FB601631E09 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (758, CAST(0x00009FB601631E4D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (759, CAST(0x00009FB6016320D4 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (760, CAST(0x00009FB601632EB0 AS DateTime), 6, N'Failed to save task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (761, CAST(0x00009FB60163B788 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (762, CAST(0x00009FB60163B805 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (763, CAST(0x00009FB60163B842 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (764, CAST(0x00009FB60163BF3E AS DateTime), 6, N'Initialized call view for call #381', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (765, CAST(0x00009FB60163C449 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (766, CAST(0x00009FB60163C724 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (767, CAST(0x00009FB60163CCF1 AS DateTime), 6, N'Failed to save task informationSIP_Agent.Model.Task', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (768, CAST(0x00009FB60163CE0D AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (769, CAST(0x00009FB60163CE24 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (770, CAST(0x00009FB60164019A AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (771, CAST(0x00009FB60164021E AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (772, CAST(0x00009FB60164025E AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (773, CAST(0x00009FB601640590 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (774, CAST(0x00009FB601646FF0 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (775, CAST(0x00009FB60164707D AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (776, CAST(0x00009FB6016470BB AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (777, CAST(0x00009FB60164798B AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (778, CAST(0x00009FB60164BFA0 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (779, CAST(0x00009FB60164C026 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (780, CAST(0x00009FB60164C072 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (781, CAST(0x00009FB60164C2FD AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (782, CAST(0x00009FB6016558D5 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (783, CAST(0x00009FB601655978 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (784, CAST(0x00009FB6016559DF AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (785, CAST(0x00009FB601655D42 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (786, CAST(0x00009FB601657D8F AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (787, CAST(0x00009FB601657E13 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (788, CAST(0x00009FB601657E54 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (789, CAST(0x00009FB601658473 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (790, CAST(0x00009FB60165E006 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (791, CAST(0x00009FB60165E090 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (792, CAST(0x00009FB60165E0CB AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (793, CAST(0x00009FB60165E319 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (794, CAST(0x00009FB601668059 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (795, CAST(0x00009FB6016680F1 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (796, CAST(0x00009FB601668138 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (797, CAST(0x00009FB6016683D4 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (798, CAST(0x00009FB60166A245 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (799, CAST(0x00009FB60166A2D1 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (800, CAST(0x00009FB60166A316 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (801, CAST(0x00009FB60166A584 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (802, CAST(0x00009FB601677DB1 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (803, CAST(0x00009FB601677E66 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (804, CAST(0x00009FB601677EC9 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (805, CAST(0x00009FB6016781DD AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (806, CAST(0x00009FB601684105 AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (807, CAST(0x00009FB6016841A0 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (808, CAST(0x00009FB6016841E6 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (809, CAST(0x00009FB60168462E AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
GO
print 'Processed 800 total records'
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (810, CAST(0x00009FB601687D6B AS DateTime), 1, N'Rakendus käivitatud', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (811, CAST(0x00009FB601687DE7 AS DateTime), 1, N'Initialized login screen.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (812, CAST(0x00009FB601687E26 AS DateTime), 6, N'Initialized system standby view.', 0)
INSERT [dbo].[logs] ([id], [created], [person_id], [text], [deleted]) VALUES (813, CAST(0x00009FB6016880E5 AS DateTime), 6, N'Töö #0 vaade avatud.', 0)
SET IDENTITY_INSERT [dbo].[logs] OFF
/****** Object:  Table [dbo].[calls]    Script Date: 12/11/2011 21:57:07 ******/
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
SET IDENTITY_INSERT [dbo].[calls] ON
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (1, N'sbox traw', 1, 1, CAST(0x00009EDA00C5C100 AS DateTime), CAST(0x00009EDA00C5C100 AS DateTime), CAST(0x00009EDA00D5F570 AS DateTime), 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (2, N'Küsiti projekti tähtaja kohta, aga vastust ei olnud', 1, 1, CAST(0x00009E340128AD38 AS DateTime), CAST(0x00009E340128A180 AS DateTime), CAST(0x00009E34012B6C58 AS DateTime), 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (3, NULL, NULL, NULL, NULL, CAST(0x00009EDB00C5C100 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (5, N'Kiire on', 2, 1, CAST(0x00009FAE00A312C6 AS DateTime), CAST(0x00009FAE00A312C6 AS DateTime), NULL, 0)
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
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (85, NULL, NULL, NULL, NULL, CAST(0x00009FB400D858C1 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (86, N'test', 2, NULL, NULL, CAST(0x00009FB400D858CC AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (87, NULL, NULL, NULL, NULL, CAST(0x00009FB400E11C27 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (88, NULL, 2, NULL, NULL, CAST(0x00009FB400E11C36 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (89, NULL, NULL, NULL, NULL, CAST(0x00009FB400E62CFE AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (90, NULL, 2, NULL, NULL, CAST(0x00009FB400E62D0A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (91, NULL, NULL, NULL, NULL, CAST(0x00009FB400E8A749 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (92, NULL, 2, NULL, NULL, CAST(0x00009FB400E8A75B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (93, NULL, NULL, NULL, NULL, CAST(0x00009FB400EA2E54 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (94, NULL, 2, NULL, NULL, CAST(0x00009FB400EA2E64 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (95, NULL, NULL, NULL, NULL, CAST(0x00009FB400EA7E34 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (96, NULL, 3, NULL, NULL, CAST(0x00009FB400EA7E41 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (97, NULL, NULL, NULL, NULL, CAST(0x00009FB400EB7D7F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (98, NULL, 5, NULL, NULL, CAST(0x00009FB400EB7D89 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (99, NULL, NULL, NULL, NULL, CAST(0x00009FB400ED4200 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (100, NULL, 2, NULL, NULL, CAST(0x00009FB400ED420F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (101, NULL, NULL, NULL, NULL, CAST(0x00009FB400FA7A30 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (102, NULL, 2, NULL, NULL, CAST(0x00009FB400FA7A3D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (103, NULL, NULL, NULL, NULL, CAST(0x00009FB500C47415 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (104, NULL, NULL, NULL, NULL, CAST(0x00009FB500C4E9F5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (105, NULL, NULL, NULL, NULL, CAST(0x00009FB600D1FF54 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (106, NULL, NULL, NULL, NULL, CAST(0x00009FB600D211F2 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (107, NULL, NULL, NULL, NULL, CAST(0x00009FB600D213C2 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (108, NULL, NULL, NULL, NULL, CAST(0x00009FB600D228E5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (109, NULL, NULL, NULL, NULL, CAST(0x00009FB600D23531 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (110, NULL, NULL, NULL, NULL, CAST(0x00009FB600D2B799 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (111, NULL, NULL, NULL, NULL, CAST(0x00009FB600D34861 AS DateTime), NULL, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (112, NULL, NULL, NULL, NULL, CAST(0x00009FB600D37508 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (113, NULL, NULL, NULL, NULL, CAST(0x00009FB600D489A5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (114, NULL, NULL, NULL, NULL, CAST(0x00009FB600D5329F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (115, NULL, NULL, NULL, NULL, CAST(0x00009FB600D564CB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (116, NULL, NULL, NULL, NULL, CAST(0x00009FB600D59302 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (117, NULL, NULL, NULL, NULL, CAST(0x00009FB600D5D49E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (118, NULL, NULL, NULL, NULL, CAST(0x00009FB600D6C0A5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (119, NULL, NULL, NULL, NULL, CAST(0x00009FB600D74A5E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (120, NULL, NULL, NULL, NULL, CAST(0x00009FB600D7B87F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (121, NULL, NULL, NULL, NULL, CAST(0x00009FB600D81954 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (122, NULL, NULL, NULL, NULL, CAST(0x00009FB600D95E41 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (123, NULL, NULL, NULL, NULL, CAST(0x00009FB600D9E094 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (124, NULL, NULL, NULL, NULL, CAST(0x00009FB600DA47B3 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (125, NULL, NULL, NULL, NULL, CAST(0x00009FB600DA757F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (126, NULL, NULL, NULL, NULL, CAST(0x00009FB600DC4DFE AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (127, NULL, NULL, NULL, NULL, CAST(0x00009FB600DD087E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (128, NULL, NULL, NULL, NULL, CAST(0x00009FB600DDC7E1 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (129, NULL, NULL, NULL, NULL, CAST(0x00009FB600DFC340 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (130, NULL, NULL, NULL, NULL, CAST(0x00009FB600DFF78A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (131, NULL, NULL, NULL, NULL, CAST(0x00009FB600E1D159 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (132, NULL, NULL, NULL, NULL, CAST(0x00009FB600E2952A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (133, NULL, NULL, NULL, NULL, CAST(0x00009FB600E34202 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (134, NULL, NULL, NULL, NULL, CAST(0x00009FB600E3CADC AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (135, NULL, NULL, NULL, NULL, CAST(0x00009FB600E3CF34 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (136, NULL, NULL, NULL, NULL, CAST(0x00009FB600E7FE85 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (137, NULL, NULL, NULL, NULL, CAST(0x00009FB600E8758B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (138, NULL, NULL, NULL, NULL, CAST(0x00009FB600E89FAE AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (139, NULL, NULL, NULL, NULL, CAST(0x00009FB600E8CCAA AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (140, NULL, NULL, NULL, NULL, CAST(0x00009FB600E90809 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (141, NULL, NULL, NULL, NULL, CAST(0x00009FB600E9A76D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (142, NULL, NULL, NULL, NULL, CAST(0x00009FB600E9DF6E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (143, NULL, NULL, NULL, NULL, CAST(0x00009FB600E9FF73 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (144, NULL, NULL, NULL, NULL, CAST(0x00009FB600ECEFAE AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (145, NULL, NULL, NULL, NULL, CAST(0x00009FB600ED8206 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (146, NULL, NULL, NULL, NULL, CAST(0x00009FB600ED9962 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (147, NULL, NULL, NULL, NULL, CAST(0x00009FB600EE102B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (148, NULL, NULL, NULL, NULL, CAST(0x00009FB600EE58A4 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (149, NULL, NULL, NULL, NULL, CAST(0x00009FB600EE825A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (150, NULL, NULL, NULL, NULL, CAST(0x00009FB600EED7AD AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (151, NULL, NULL, NULL, NULL, CAST(0x00009FB600EF5911 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (152, NULL, NULL, NULL, NULL, CAST(0x00009FB600EF9E37 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (153, NULL, NULL, NULL, NULL, CAST(0x00009FB600EFDAAB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (154, NULL, NULL, NULL, NULL, CAST(0x00009FB600EFFE42 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (155, NULL, NULL, NULL, NULL, CAST(0x00009FB600F027EB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (156, NULL, NULL, NULL, NULL, CAST(0x00009FB600F0C4CB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (157, NULL, NULL, NULL, NULL, CAST(0x00009FB600F114C7 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (158, NULL, NULL, NULL, NULL, CAST(0x00009FB600F18411 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (159, NULL, NULL, NULL, NULL, CAST(0x00009FB600F1992A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (160, NULL, NULL, NULL, NULL, CAST(0x00009FB600F1B2AB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (161, NULL, NULL, NULL, NULL, CAST(0x00009FB600F1CE41 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (162, NULL, NULL, NULL, NULL, CAST(0x00009FB600F26C92 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (163, NULL, NULL, NULL, NULL, CAST(0x00009FB600F2835E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (164, NULL, NULL, NULL, NULL, CAST(0x00009FB600F2E62B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (165, NULL, NULL, NULL, NULL, CAST(0x00009FB600F375D0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (166, NULL, NULL, NULL, NULL, CAST(0x00009FB600F3B6FC AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (167, NULL, NULL, NULL, NULL, CAST(0x00009FB600F3E7C7 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (168, NULL, NULL, NULL, NULL, CAST(0x00009FB600F44377 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (169, NULL, NULL, NULL, NULL, CAST(0x00009FB600F46C08 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (170, NULL, NULL, NULL, NULL, CAST(0x00009FB600F59C4A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (171, NULL, NULL, NULL, NULL, CAST(0x00009FB600F66F27 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (172, NULL, NULL, NULL, NULL, CAST(0x00009FB600F6AAE3 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (173, NULL, NULL, NULL, NULL, CAST(0x00009FB600F730F2 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (174, NULL, NULL, NULL, NULL, CAST(0x00009FB600F79056 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (175, NULL, NULL, NULL, NULL, CAST(0x00009FB600F82596 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (176, NULL, NULL, NULL, NULL, CAST(0x00009FB600F95510 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (177, NULL, NULL, NULL, NULL, CAST(0x00009FB600F9A855 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (178, NULL, NULL, NULL, NULL, CAST(0x00009FB600FA1125 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (179, NULL, NULL, NULL, NULL, CAST(0x00009FB600FAB42B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (180, NULL, NULL, NULL, NULL, CAST(0x00009FB600FAE7C0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (181, NULL, NULL, NULL, NULL, CAST(0x00009FB600FB141A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (182, NULL, NULL, NULL, NULL, CAST(0x00009FB600FB3D8E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (183, NULL, NULL, NULL, NULL, CAST(0x00009FB600FB4B74 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (184, NULL, NULL, NULL, NULL, CAST(0x00009FB600FB7E96 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (185, NULL, NULL, NULL, NULL, CAST(0x00009FB600FD2A83 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (186, NULL, NULL, NULL, NULL, CAST(0x00009FB600FDE1F0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (187, NULL, NULL, NULL, NULL, CAST(0x00009FB600FE700D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (188, NULL, NULL, NULL, NULL, CAST(0x00009FB600FE750B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (189, NULL, NULL, NULL, NULL, CAST(0x00009FB600FEEAE4 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (190, NULL, NULL, NULL, NULL, CAST(0x00009FB600FF7010 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (191, NULL, NULL, NULL, NULL, CAST(0x00009FB601004CE9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (192, NULL, NULL, NULL, NULL, CAST(0x00009FB601009472 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (193, NULL, NULL, NULL, NULL, CAST(0x00009FB60100ACDF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (194, NULL, NULL, NULL, NULL, CAST(0x00009FB60100C368 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (195, NULL, NULL, NULL, NULL, CAST(0x00009FB6010112F1 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (196, NULL, NULL, NULL, NULL, CAST(0x00009FB601011C5B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (197, NULL, NULL, NULL, NULL, CAST(0x00009FB601017AAF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (198, NULL, NULL, NULL, NULL, CAST(0x00009FB601022E5E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (199, NULL, NULL, NULL, NULL, CAST(0x00009FB601023371 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (200, NULL, NULL, NULL, NULL, CAST(0x00009FB6010239A5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (201, NULL, NULL, NULL, NULL, CAST(0x00009FB60102D8DF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (202, NULL, NULL, NULL, NULL, CAST(0x00009FB60102DE8E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (203, NULL, NULL, NULL, NULL, CAST(0x00009FB60102E284 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (204, NULL, NULL, NULL, NULL, CAST(0x00009FB601038BB2 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (205, NULL, NULL, NULL, NULL, CAST(0x00009FB601040818 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (206, NULL, NULL, NULL, NULL, CAST(0x00009FB601043039 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (207, NULL, NULL, NULL, NULL, CAST(0x00009FB6010464C3 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (208, NULL, NULL, NULL, NULL, CAST(0x00009FB601046D87 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (209, NULL, NULL, NULL, NULL, CAST(0x00009FB601047DFB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (210, NULL, NULL, NULL, NULL, CAST(0x00009FB60104864B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (211, NULL, NULL, NULL, NULL, CAST(0x00009FB601048918 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (212, NULL, NULL, NULL, NULL, CAST(0x00009FB60104AFC3 AS DateTime), NULL, 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (213, NULL, NULL, NULL, NULL, CAST(0x00009FB60104B376 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (214, NULL, NULL, NULL, NULL, CAST(0x00009FB60104B611 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (215, NULL, NULL, NULL, NULL, CAST(0x00009FB601058D11 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (216, NULL, NULL, NULL, NULL, CAST(0x00009FB601059151 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (217, NULL, NULL, NULL, NULL, CAST(0x00009FB60106FF43 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (218, NULL, NULL, NULL, NULL, CAST(0x00009FB601070490 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (219, NULL, NULL, NULL, NULL, CAST(0x00009FB60107073C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (220, NULL, NULL, NULL, NULL, CAST(0x00009FB60107093B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (221, NULL, NULL, NULL, NULL, CAST(0x00009FB601098FFD AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (222, NULL, NULL, NULL, NULL, CAST(0x00009FB60109CB29 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (223, NULL, NULL, NULL, NULL, CAST(0x00009FB6010B77D9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (224, NULL, NULL, NULL, NULL, CAST(0x00009FB6010C171D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (225, NULL, NULL, NULL, NULL, CAST(0x00009FB6010C8237 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (226, NULL, NULL, NULL, NULL, CAST(0x00009FB6010CD2FA AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (227, NULL, NULL, NULL, NULL, CAST(0x00009FB6010D4EC7 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (228, NULL, NULL, NULL, NULL, CAST(0x00009FB6010DB7F4 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (229, NULL, NULL, NULL, NULL, CAST(0x00009FB601103042 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (230, NULL, NULL, NULL, NULL, CAST(0x00009FB60112C8A2 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (231, NULL, NULL, NULL, NULL, CAST(0x00009FB601130B6F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (232, NULL, NULL, NULL, NULL, CAST(0x00009FB60113356A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (233, NULL, NULL, NULL, NULL, CAST(0x00009FB601136029 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (234, NULL, NULL, NULL, NULL, CAST(0x00009FB601138C4F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (235, NULL, NULL, NULL, NULL, CAST(0x00009FB601143A1A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (236, NULL, NULL, NULL, NULL, CAST(0x00009FB6011522F4 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (237, NULL, NULL, NULL, NULL, CAST(0x00009FB60117492A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (238, NULL, NULL, NULL, NULL, CAST(0x00009FB60117626C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (239, NULL, NULL, NULL, NULL, CAST(0x00009FB601183A84 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (240, NULL, NULL, NULL, NULL, CAST(0x00009FB60118D816 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (241, NULL, NULL, NULL, NULL, CAST(0x00009FB6011A6ED0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (242, NULL, NULL, NULL, NULL, CAST(0x00009FB6011AF2C3 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (243, NULL, NULL, NULL, NULL, CAST(0x00009FB6011B01D0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (244, NULL, NULL, NULL, NULL, CAST(0x00009FB6011C2F31 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (245, NULL, NULL, NULL, NULL, CAST(0x00009FB6011C66E9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (246, NULL, NULL, NULL, NULL, CAST(0x00009FB6011C9024 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (247, NULL, NULL, NULL, NULL, CAST(0x00009FB6011CF471 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (248, NULL, NULL, NULL, NULL, CAST(0x00009FB6011D60BE AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (249, NULL, NULL, NULL, NULL, CAST(0x00009FB60121BAE3 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (250, NULL, NULL, NULL, NULL, CAST(0x00009FB60121F676 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (251, NULL, NULL, NULL, NULL, CAST(0x00009FB6012276AB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (252, NULL, NULL, NULL, NULL, CAST(0x00009FB60122DF5D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (253, NULL, NULL, NULL, NULL, CAST(0x00009FB601233B0B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (254, NULL, NULL, NULL, NULL, CAST(0x00009FB60124849A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (255, NULL, NULL, NULL, NULL, CAST(0x00009FB60127147A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (256, NULL, NULL, NULL, NULL, CAST(0x00009FB60128CF95 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (257, NULL, NULL, NULL, NULL, CAST(0x00009FB60128D2AD AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (258, NULL, NULL, NULL, NULL, CAST(0x00009FB60128D723 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (259, NULL, NULL, NULL, NULL, CAST(0x00009FB60128D88D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (260, NULL, NULL, NULL, NULL, CAST(0x00009FB6012A1154 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (261, NULL, NULL, NULL, NULL, CAST(0x00009FB6012A3EDD AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (262, NULL, NULL, NULL, NULL, CAST(0x00009FB6012A6058 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (263, NULL, NULL, NULL, NULL, CAST(0x00009FB6012A68A5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (264, NULL, NULL, NULL, NULL, CAST(0x00009FB6012A6A4D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (265, NULL, NULL, NULL, NULL, CAST(0x00009FB6012A70D3 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (266, NULL, NULL, NULL, NULL, CAST(0x00009FB6012A729D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (267, NULL, NULL, NULL, NULL, CAST(0x00009FB6012AB4DA AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (268, NULL, NULL, NULL, NULL, CAST(0x00009FB6012AB77A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (269, NULL, NULL, NULL, NULL, CAST(0x00009FB6013A357A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (270, NULL, NULL, NULL, NULL, CAST(0x00009FB6013A758A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (271, NULL, NULL, NULL, NULL, CAST(0x00009FB6013A9CAF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (272, NULL, NULL, NULL, NULL, CAST(0x00009FB6013ACE5C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (273, NULL, NULL, NULL, NULL, CAST(0x00009FB6013AD04D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (274, NULL, NULL, NULL, NULL, CAST(0x00009FB6013B6274 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (275, NULL, NULL, NULL, NULL, CAST(0x00009FB6013C26BF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (276, NULL, NULL, NULL, NULL, CAST(0x00009FB6013C2A9D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (277, NULL, NULL, NULL, NULL, CAST(0x00009FB6013C382A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (278, NULL, NULL, NULL, NULL, CAST(0x00009FB6013C39DF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (279, NULL, NULL, NULL, NULL, CAST(0x00009FB6013C3C33 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (280, NULL, NULL, NULL, NULL, CAST(0x00009FB6013C3DF2 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (281, NULL, NULL, NULL, NULL, CAST(0x00009FB6013C4045 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (282, NULL, NULL, NULL, NULL, CAST(0x00009FB6013C4370 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (283, NULL, NULL, NULL, NULL, CAST(0x00009FB6013CE4BC AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (284, NULL, NULL, NULL, NULL, CAST(0x00009FB6013CE72D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (285, NULL, NULL, NULL, NULL, CAST(0x00009FB6013CE8C2 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (286, NULL, NULL, NULL, NULL, CAST(0x00009FB6013CEA0C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (287, NULL, NULL, NULL, NULL, CAST(0x00009FB6013DEFC9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (288, NULL, NULL, NULL, NULL, CAST(0x00009FB6013DF21F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (289, NULL, NULL, NULL, NULL, CAST(0x00009FB6013DF4FB AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (290, NULL, NULL, NULL, NULL, CAST(0x00009FB6013DF7B8 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (291, NULL, NULL, NULL, NULL, CAST(0x00009FB6013E0014 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (292, NULL, NULL, NULL, NULL, CAST(0x00009FB6013E0226 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (293, NULL, NULL, NULL, NULL, CAST(0x00009FB6013E06A4 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (294, NULL, NULL, NULL, NULL, CAST(0x00009FB6013E084D AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (295, NULL, NULL, NULL, NULL, CAST(0x00009FB6013E6395 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (296, NULL, NULL, NULL, NULL, CAST(0x00009FB6013E6636 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (297, NULL, NULL, NULL, NULL, CAST(0x00009FB6013E6AB5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (298, NULL, NULL, NULL, NULL, CAST(0x00009FB6013E6CBA AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (299, NULL, NULL, NULL, NULL, CAST(0x00009FB6013E748E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (300, NULL, NULL, NULL, NULL, CAST(0x00009FB6013EB7F5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (301, NULL, NULL, NULL, NULL, CAST(0x00009FB6013EC0B1 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (302, NULL, NULL, NULL, NULL, CAST(0x00009FB6013EC7C1 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (303, NULL, NULL, NULL, NULL, CAST(0x00009FB6013ECB6C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (304, NULL, NULL, NULL, NULL, CAST(0x00009FB6013ED28B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (305, NULL, NULL, NULL, NULL, CAST(0x00009FB6013ED8A0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (306, NULL, NULL, NULL, NULL, CAST(0x00009FB6013EDE09 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (307, NULL, NULL, NULL, NULL, CAST(0x00009FB6013EDFC8 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (308, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F4E20 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (309, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F5FDF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (310, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F6324 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (311, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F7874 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (312, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F7B3E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (313, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F7DE3 AS DateTime), NULL, 0)
GO
print 'Processed 300 total records'
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (314, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F7F6A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (315, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F83F4 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (316, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F85A8 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (317, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F8BB6 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (318, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F8D4F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (319, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F94CD AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (320, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F9670 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (321, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F9BFA AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (322, NULL, NULL, NULL, NULL, CAST(0x00009FB6013F9DD6 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (323, NULL, NULL, NULL, NULL, CAST(0x00009FB6013FA042 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (324, NULL, NULL, NULL, NULL, CAST(0x00009FB6013FA230 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (325, NULL, NULL, NULL, NULL, CAST(0x00009FB6013FA63B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (326, NULL, NULL, NULL, NULL, CAST(0x00009FB6013FA7B9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (327, NULL, NULL, NULL, NULL, CAST(0x00009FB6013FACAA AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (328, NULL, NULL, NULL, NULL, CAST(0x00009FB6013FAE57 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (329, NULL, NULL, NULL, NULL, CAST(0x00009FB6013FD8D1 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (330, NULL, NULL, NULL, NULL, CAST(0x00009FB601428CD7 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (331, NULL, NULL, NULL, NULL, CAST(0x00009FB6014316ED AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (332, NULL, NULL, NULL, NULL, CAST(0x00009FB601431B6A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (333, NULL, NULL, NULL, NULL, CAST(0x00009FB601431D42 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (334, NULL, NULL, NULL, NULL, CAST(0x00009FB601431EBE AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (335, NULL, NULL, NULL, NULL, CAST(0x00009FB60143270E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (336, NULL, NULL, NULL, NULL, CAST(0x00009FB601439842 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (337, NULL, NULL, NULL, NULL, CAST(0x00009FB60143E0AC AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (338, NULL, NULL, NULL, NULL, CAST(0x00009FB60144558E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (339, NULL, NULL, NULL, NULL, CAST(0x00009FB601454050 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (340, NULL, NULL, NULL, NULL, CAST(0x00009FB6014647A5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (341, NULL, NULL, NULL, NULL, CAST(0x00009FB6014691A6 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (342, NULL, NULL, NULL, NULL, CAST(0x00009FB60149A3E8 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (343, NULL, NULL, NULL, NULL, CAST(0x00009FB60149B1F6 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (344, NULL, NULL, NULL, NULL, CAST(0x00009FB6014A0A37 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (345, NULL, NULL, NULL, NULL, CAST(0x00009FB6014A0D3B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (346, NULL, NULL, NULL, NULL, CAST(0x00009FB6014A711E AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (347, NULL, NULL, NULL, NULL, CAST(0x00009FB6014A7FAC AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (348, NULL, NULL, NULL, NULL, CAST(0x00009FB6014DFBB9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (349, NULL, NULL, NULL, NULL, CAST(0x00009FB6014E0A9F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (350, NULL, NULL, NULL, NULL, CAST(0x00009FB60150AEBD AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (351, NULL, NULL, NULL, NULL, CAST(0x00009FB60150BC62 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (352, NULL, NULL, NULL, NULL, CAST(0x00009FB601526D06 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (353, NULL, NULL, NULL, NULL, CAST(0x00009FB601527993 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (354, NULL, NULL, NULL, NULL, CAST(0x00009FB601528D65 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (355, NULL, NULL, NULL, NULL, CAST(0x00009FB60152FF0F AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (356, NULL, NULL, NULL, NULL, CAST(0x00009FB601563E1C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (357, NULL, NULL, NULL, NULL, CAST(0x00009FB6015640C7 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (358, NULL, NULL, NULL, NULL, CAST(0x00009FB601564E6B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (359, NULL, NULL, NULL, NULL, CAST(0x00009FB601568989 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (360, NULL, NULL, NULL, NULL, CAST(0x00009FB60156B5E0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (361, NULL, NULL, NULL, NULL, CAST(0x00009FB601570C24 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (362, NULL, NULL, NULL, NULL, CAST(0x00009FB601573079 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (363, NULL, NULL, NULL, NULL, CAST(0x00009FB601575D71 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (364, NULL, NULL, NULL, NULL, CAST(0x00009FB601578B27 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (365, NULL, NULL, NULL, NULL, CAST(0x00009FB60157954A AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (366, NULL, NULL, NULL, NULL, CAST(0x00009FB60157D253 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (367, NULL, NULL, NULL, NULL, CAST(0x00009FB6015A55E9 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (368, NULL, NULL, NULL, NULL, CAST(0x00009FB6015AB854 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (369, NULL, NULL, NULL, NULL, CAST(0x00009FB6015B8B04 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (370, NULL, NULL, NULL, NULL, CAST(0x00009FB6015B9343 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (371, NULL, NULL, NULL, NULL, CAST(0x00009FB6015E2ACC AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (372, NULL, NULL, NULL, NULL, CAST(0x00009FB6015E76DF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (373, NULL, NULL, NULL, NULL, CAST(0x00009FB6015E7AEF AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (374, NULL, NULL, NULL, NULL, CAST(0x00009FB6015E7D81 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (375, NULL, NULL, NULL, NULL, CAST(0x00009FB6015EA4E1 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (376, NULL, NULL, NULL, NULL, CAST(0x00009FB6015FE6B5 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (377, NULL, NULL, NULL, NULL, CAST(0x00009FB6015FF678 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (378, NULL, NULL, NULL, NULL, CAST(0x00009FB601603366 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (379, NULL, NULL, NULL, NULL, CAST(0x00009FB60163B891 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (380, NULL, NULL, NULL, NULL, CAST(0x00009FB60163BF1B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (381, NULL, 3, NULL, NULL, CAST(0x00009FB60163BF22 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (382, NULL, NULL, NULL, NULL, CAST(0x00009FB60163C493 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (383, NULL, NULL, NULL, NULL, CAST(0x00009FB60163CE5B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (384, NULL, NULL, NULL, NULL, CAST(0x00009FB601640314 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (385, NULL, NULL, NULL, NULL, CAST(0x00009FB601647110 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (386, NULL, NULL, NULL, NULL, CAST(0x00009FB60164C0C0 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (387, NULL, NULL, NULL, NULL, CAST(0x00009FB601655A6B AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (388, NULL, NULL, NULL, NULL, CAST(0x00009FB601657EAD AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (389, NULL, NULL, NULL, NULL, CAST(0x00009FB60165E11C AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (390, NULL, NULL, NULL, NULL, CAST(0x00009FB6016681A3 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (391, NULL, NULL, NULL, NULL, CAST(0x00009FB60166A375 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (392, NULL, NULL, NULL, NULL, CAST(0x00009FB601677F36 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (393, NULL, NULL, NULL, NULL, CAST(0x00009FB601684244 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (394, NULL, NULL, NULL, NULL, CAST(0x00009FB601687E75 AS DateTime), NULL, 0)
INSERT [dbo].[calls] ([id], [summary], [caller_id], [clerk_id], [start], [received], [finished], [deleted]) VALUES (395, NULL, NULL, NULL, NULL, CAST(0x00009FB601688111 AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[calls] OFF
/****** Object:  Table [dbo].[tasks]    Script Date: 12/11/2011 21:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tasks](
	[id] [int] IDENTITY(3,1) NOT NULL,
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
SET IDENTITY_INSERT [dbo].[tasks] ON
INSERT [dbo].[tasks] ([id], [parent_id], [created], [updated], [title], [details], [notifier_id], [assignee_id], [clerk_id], [status_id], [category_id], [deleted]) VALUES (1, 1, CAST(0x00009E5E00107AC0 AS DateTime), NULL, N'Testimine on tähtis. 2', N'Vaja testida kõnet, sest kõne on tähtis. DNA2', 1, 4, 1, 7, 1, 0)
INSERT [dbo].[tasks] ([id], [parent_id], [created], [updated], [title], [details], [notifier_id], [assignee_id], [clerk_id], [status_id], [category_id], [deleted]) VALUES (2, NULL, CAST(0x00009FA100FA7D00 AS DateTime), NULL, N'Projekt', N'Vaja projekt lõpetada', 4, 6, 1, 1, 1, 0)
INSERT [dbo].[tasks] ([id], [parent_id], [created], [updated], [title], [details], [notifier_id], [assignee_id], [clerk_id], [status_id], [category_id], [deleted]) VALUES (4, NULL, CAST(0x00009FB601652696 AS DateTime), NULL, N'InsertFromMSSQL', NULL, NULL, NULL, 1, 1, 1, 0)
INSERT [dbo].[tasks] ([id], [parent_id], [created], [updated], [title], [details], [notifier_id], [assignee_id], [clerk_id], [status_id], [category_id], [deleted]) VALUES (11, NULL, CAST(0x00009FB6016880F1 AS DateTime), NULL, N'Pealkirjata', NULL, NULL, 1, 1, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[tasks] OFF
/****** Object:  Table [dbo].[tasks_calls]    Script Date: 12/11/2011 21:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tasks_calls](
	[call_id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[id] [int] IDENTITY(4,1) NOT NULL,
 CONSTRAINT [PK_tasks_calls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tasks_calls] ON
INSERT [dbo].[tasks_calls] ([call_id], [task_id], [id]) VALUES (2, 1, 0)
INSERT [dbo].[tasks_calls] ([call_id], [task_id], [id]) VALUES (1, 1, 1)
INSERT [dbo].[tasks_calls] ([call_id], [task_id], [id]) VALUES (2, 2, 2)
INSERT [dbo].[tasks_calls] ([call_id], [task_id], [id]) VALUES (1, 2, 5)
INSERT [dbo].[tasks_calls] ([call_id], [task_id], [id]) VALUES (5, 1, 6)
SET IDENTITY_INSERT [dbo].[tasks_calls] OFF
/****** Object:  Default [DF_calls_deleted]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[calls] ADD  CONSTRAINT [DF_calls_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_companies_created]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[companies] ADD  CONSTRAINT [DF_companies_created]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  Default [DF_logs_created]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[logs] ADD  CONSTRAINT [DF_logs_created]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  Default [DF_logs_person_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[logs] ADD  CONSTRAINT [DF_logs_person_id]  DEFAULT (NULL) FOR [person_id]
GO
/****** Object:  Default [DF_logs_deleted]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[logs] ADD  CONSTRAINT [DF_logs_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_persons_created]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[persons] ADD  CONSTRAINT [DF_persons_created]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  Default [DF_persons_deleted]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[persons] ADD  CONSTRAINT [DF_persons_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_phonebook_deleted]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[phonebook] ADD  CONSTRAINT [DF_phonebook_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_task_categories_deleted]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[task_categories] ADD  CONSTRAINT [DF_task_categories_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_task_statuses_deleted]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[task_statuses] ADD  CONSTRAINT [DF_task_statuses_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [DF_tasks_parent_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_parent_id]  DEFAULT (NULL) FOR [parent_id]
GO
/****** Object:  Default [DF_tasks_created]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_created]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  Default [DF_tasks_updated]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_updated]  DEFAULT (NULL) FOR [updated]
GO
/****** Object:  Default [DF_tasks_details]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_details]  DEFAULT (NULL) FOR [details]
GO
/****** Object:  Default [DF_tasks_notifier_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_notifier_id]  DEFAULT (NULL) FOR [notifier_id]
GO
/****** Object:  Default [DF_tasks_assignee_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_assignee_id]  DEFAULT (NULL) FOR [assignee_id]
GO
/****** Object:  Default [DF_tasks_clerk_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_clerk_id]  DEFAULT ((1)) FOR [clerk_id]
GO
/****** Object:  Default [DF_tasks_status_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_status_id]  DEFAULT ((1)) FOR [status_id]
GO
/****** Object:  Default [DF_tasks_category_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_category_id]  DEFAULT ((1)) FOR [category_id]
GO
/****** Object:  Default [DF_tasks_deleted]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks] ADD  CONSTRAINT [DF_tasks_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  ForeignKey [FK_calls_caller_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[calls]  WITH CHECK ADD  CONSTRAINT [FK_calls_caller_id] FOREIGN KEY([caller_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[calls] CHECK CONSTRAINT [FK_calls_caller_id]
GO
/****** Object:  ForeignKey [FK_calls_clerk_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[calls]  WITH CHECK ADD  CONSTRAINT [FK_calls_clerk_id] FOREIGN KEY([clerk_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[calls] CHECK CONSTRAINT [FK_calls_clerk_id]
GO
/****** Object:  ForeignKey [FK_logs_logs_persons]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[logs]  WITH CHECK ADD  CONSTRAINT [FK_logs_logs_persons] FOREIGN KEY([person_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[logs] CHECK CONSTRAINT [FK_logs_logs_persons]
GO
/****** Object:  ForeignKey [FK_persons_company_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[persons]  WITH CHECK ADD  CONSTRAINT [FK_persons_company_id] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[persons] CHECK CONSTRAINT [FK_persons_company_id]
GO
/****** Object:  ForeignKey [FK_task_categories_parent_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[task_categories]  WITH CHECK ADD  CONSTRAINT [FK_task_categories_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[task_categories] ([id])
GO
ALTER TABLE [dbo].[task_categories] CHECK CONSTRAINT [FK_task_categories_parent_id]
GO
/****** Object:  ForeignKey [FK_task_statuses_parent_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[task_statuses]  WITH CHECK ADD  CONSTRAINT [FK_task_statuses_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[task_statuses] ([id])
GO
ALTER TABLE [dbo].[task_statuses] CHECK CONSTRAINT [FK_task_statuses_parent_id]
GO
/****** Object:  ForeignKey [FK_assignee_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_assignee_id] FOREIGN KEY([assignee_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_assignee_id]
GO
/****** Object:  ForeignKey [FK_category_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[task_categories] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_category_id]
GO
/****** Object:  ForeignKey [FK_clerk_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_clerk_id] FOREIGN KEY([clerk_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_clerk_id]
GO
/****** Object:  ForeignKey [FK_parent_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[tasks] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_parent_id]
GO
/****** Object:  ForeignKey [FK_status_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_status_id] FOREIGN KEY([status_id])
REFERENCES [dbo].[task_statuses] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_status_id]
GO
/****** Object:  ForeignKey [FK_tasks_notifier]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_tasks_notifier] FOREIGN KEY([notifier_id])
REFERENCES [dbo].[persons] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_tasks_notifier]
GO
/****** Object:  ForeignKey [FK_tasks_calls_call_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks_calls]  WITH CHECK ADD  CONSTRAINT [FK_tasks_calls_call_id] FOREIGN KEY([call_id])
REFERENCES [dbo].[calls] ([id])
GO
ALTER TABLE [dbo].[tasks_calls] CHECK CONSTRAINT [FK_tasks_calls_call_id]
GO
/****** Object:  ForeignKey [FK_tasks_calls_task_id]    Script Date: 12/11/2011 21:57:07 ******/
ALTER TABLE [dbo].[tasks_calls]  WITH CHECK ADD  CONSTRAINT [FK_tasks_calls_task_id] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
GO
ALTER TABLE [dbo].[tasks_calls] CHECK CONSTRAINT [FK_tasks_calls_task_id]
GO
