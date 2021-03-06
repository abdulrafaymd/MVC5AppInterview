USE [MVC5App]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 4/10/2018 10:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[Complaint_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Complaint] PRIMARY KEY CLUSTERED 
(
	[Complaint_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/10/2018 10:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Department_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Department_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 4/10/2018 10:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Doctor_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Doctor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 4/10/2018 10:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](50) NULL,
	[Mname] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[age] [int] NULL,
	[Department_Id] [int] NULL,
	[Doctor_Id] [int] NULL,
	[Reg_Date] [datetime] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientComplaint]    Script Date: 4/10/2018 10:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientComplaint](
	[PatientComplaint_Id] [int] IDENTITY(1,1) NOT NULL,
	[Patient_Id] [int] NULL,
	[Complaint_Id] [int] NULL,
 CONSTRAINT [PK_PatientComplaint] PRIMARY KEY CLUSTERED 
(
	[PatientComplaint_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Complaint] ON 

INSERT [dbo].[Complaint] ([Complaint_Id], [Name]) VALUES (1, N'Insurance ')
INSERT [dbo].[Complaint] ([Complaint_Id], [Name]) VALUES (2, N'Medical ')
SET IDENTITY_INSERT [dbo].[Complaint] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Department_Id], [Name]) VALUES (1, N'Surgeon')
INSERT [dbo].[Department] ([Department_Id], [Name]) VALUES (2, N'Opthomology')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Doctor_Id], [Name]) VALUES (1, N'Dr. Rahul')
INSERT [dbo].[Doctor] ([Doctor_Id], [Name]) VALUES (2, N'Dr. Sameer')
INSERT [dbo].[Doctor] ([Doctor_Id], [Name]) VALUES (3, N'Dr. Abdul Lateef')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([Patient_Id], [Fname], [Mname], [Lname], [age], [Department_Id], [Doctor_Id], [Reg_Date]) VALUES (6, N'pfname', N'pmname', N'plname', 24, 1, 1, CAST(N'2018-04-10T22:23:00.000' AS DateTime))
INSERT [dbo].[Patient] ([Patient_Id], [Fname], [Mname], [Lname], [age], [Department_Id], [Doctor_Id], [Reg_Date]) VALUES (7, N'first name', N'mid name', N'last name', 26, 1, 1, CAST(N'2018-04-10T22:27:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Patient] OFF
SET IDENTITY_INSERT [dbo].[PatientComplaint] ON 

INSERT [dbo].[PatientComplaint] ([PatientComplaint_Id], [Patient_Id], [Complaint_Id]) VALUES (4, 6, 2)
INSERT [dbo].[PatientComplaint] ([PatientComplaint_Id], [Patient_Id], [Complaint_Id]) VALUES (5, 6, 1)
INSERT [dbo].[PatientComplaint] ([PatientComplaint_Id], [Patient_Id], [Complaint_Id]) VALUES (6, 7, 1)
SET IDENTITY_INSERT [dbo].[PatientComplaint] OFF
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Department_Id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Department]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Doctor] FOREIGN KEY([Doctor_Id])
REFERENCES [dbo].[Doctor] ([Doctor_Id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Doctor]
GO
ALTER TABLE [dbo].[PatientComplaint]  WITH CHECK ADD  CONSTRAINT [FK_PatientComplaint_Complaint] FOREIGN KEY([Complaint_Id])
REFERENCES [dbo].[Complaint] ([Complaint_Id])
GO
ALTER TABLE [dbo].[PatientComplaint] CHECK CONSTRAINT [FK_PatientComplaint_Complaint]
GO
ALTER TABLE [dbo].[PatientComplaint]  WITH CHECK ADD  CONSTRAINT [FK_PatientComplaint_Patient] FOREIGN KEY([Patient_Id])
REFERENCES [dbo].[Patient] ([Patient_Id])
GO
ALTER TABLE [dbo].[PatientComplaint] CHECK CONSTRAINT [FK_PatientComplaint_Patient]
GO
