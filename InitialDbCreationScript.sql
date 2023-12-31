USE [NPOManagement]
GO
/****** Object:  User [lmladmin]    Script Date: 7/11/2023 12:36:46 AM ******/
CREATE USER [lmladmin] FOR LOGIN [lmladmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [lmladmin]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/11/2023 12:36:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountProgress]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountProgress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
 CONSTRAINT [PK_AccountProgress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountUserInformationConnection]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountUserInformationConnection](
	[AccountId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AccountBeneficiaryConnaction] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[AttachmentData] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donation]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvestorId] [int] NOT NULL,
	[Amount] [numeric](10, 3) NOT NULL,
	[DateOfCharity] [datetime] NOT NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryType]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_AccountManager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvestorInformation]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvestorInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[InvestorTierId] [int] NOT NULL,
 CONSTRAINT [PK_Table2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvestorTierType]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvestorTierType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvestorTier] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InvestorRangeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NotificationTypeId] [int] NOT NULL,
	[MeetingSchedule] [int] NOT NULL,
	[Subject] [varchar](128) NOT NULL,
	[Body] [ntext] NOT NULL,
	[AttachmentId] [int] NOT NULL,
	[Metadata] [ntext] NOT NULL,
	[Reminder] [nvarchar](50) NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification2User]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification2User](
	[NotificationId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AccounManagerRoleConnection] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationBroadcast]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationBroadcast](
	[NotificationId] [int] NOT NULL,
	[NotificationTransportTypeId] [int] NOT NULL,
 CONSTRAINT [PK_NotificationBroadcast] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC,
	[NotificationTransportTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationTransportType]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationTransportType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NotificationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationType]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[URI] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_NotificationType_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserRole] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User2UserType]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User2UserType](
	[UserTypeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_User2UserTypeConnection] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserIdea]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserIdea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IdeaCategory] [nvarchar](256) NULL,
	[IdeaDeskcription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserIdea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[Metadata] [ntext] NULL,
 CONSTRAINT [PK_UserInformation_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInventory]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InventoryTypeId] [int] NOT NULL,
	[UserId] [int] NULL,
	[Date] [datetime] NOT NULL,
	[Metadata] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[Amount] [numeric](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[MeasurmentUnit] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_AMInventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleConnection]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleConnection](
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoleConnection] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 7/11/2023 12:36:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Name], [Description], [Status]) VALUES (3, N'Garush', N'blablabla', N'1')
INSERT [dbo].[Account] ([Id], [Name], [Description], [Status]) VALUES (4, N'Mher', N'string', N'string')
INSERT [dbo].[Account] ([Id], [Name], [Description], [Status]) VALUES (5, N'vahe', N'Hi Mher please review my pr', N'beneficiary')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Donation] ON 

INSERT [dbo].[Donation] ([Id], [InvestorId], [Amount], [DateOfCharity]) VALUES (31, 450, CAST(1000.000 AS Numeric(10, 3)), CAST(N'2022-06-17T18:51:38.243' AS DateTime))
INSERT [dbo].[Donation] ([Id], [InvestorId], [Amount], [DateOfCharity]) VALUES (32, 408, CAST(1000.000 AS Numeric(10, 3)), CAST(N'2022-06-17T18:56:29.093' AS DateTime))
SET IDENTITY_INSERT [dbo].[Donation] OFF
GO
SET IDENTITY_INSERT [dbo].[InvestorInformation] ON 

INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (209, 416, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (210, 417, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (211, 420, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (212, 422, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (213, 422, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (214, 422, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (215, 422, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (216, 422, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (217, 424, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (218, 424, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (219, 424, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (220, 424, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (221, 424, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (222, 424, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (223, 432, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (224, 432, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (225, 432, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (226, 432, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (227, 436, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (228, 432, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (229, 436, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (230, 436, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (231, 432, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (232, 432, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (233, 436, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (234, 436, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (235, 436, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (236, 436, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (237, 436, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (238, 436, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (239, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (240, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (241, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (242, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (243, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (244, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (245, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (246, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (247, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (248, 439, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (249, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (250, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (251, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (252, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (253, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (254, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (255, 440, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (256, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (257, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (258, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (259, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (260, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (261, 440, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (262, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (263, 431, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (264, 431, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (265, 431, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (266, 431, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (267, 431, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (268, 440, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (269, 431, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (270, 431, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (271, 437, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (272, 431, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (273, 431, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (274, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (275, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (276, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (277, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (278, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (279, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (280, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (281, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (282, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (283, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (284, 441, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (285, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (286, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (287, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (288, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (289, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (290, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (291, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (292, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (293, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (294, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (295, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (296, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (297, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (298, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (299, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (300, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (301, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (302, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (303, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (304, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (305, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (306, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (307, 445, 1)
GO
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (308, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (309, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (310, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (311, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (312, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (313, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (314, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (315, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (316, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (317, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (318, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (319, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (320, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (321, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (322, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (323, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (324, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (325, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (326, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (327, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (328, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (329, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (330, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (331, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (332, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (333, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (334, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (335, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (336, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (337, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (338, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (339, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (340, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (341, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (342, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (343, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (344, 446, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (345, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (346, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (347, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (348, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (349, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (350, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (351, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (352, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (353, 443, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (354, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (355, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (356, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (357, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (358, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (359, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (360, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (361, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (362, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (363, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (364, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (365, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (366, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (367, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (368, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (369, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (370, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (371, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (372, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (373, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (374, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (375, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (376, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (377, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (378, 447, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (379, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (380, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (381, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (382, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (383, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (384, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (385, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (386, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (387, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (388, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (389, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (390, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (391, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (392, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (393, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (394, 448, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (395, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (396, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (397, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (398, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (399, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (400, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (401, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (402, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (403, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (404, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (405, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (406, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (407, 445, 1)
GO
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (408, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (409, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (410, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (411, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (412, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (413, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (414, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (415, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (416, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (417, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (418, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (419, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (420, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (421, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (422, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (423, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (424, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (425, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (426, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (427, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (428, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (429, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (430, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (431, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (432, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (433, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (434, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (435, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (436, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (437, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (438, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (439, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (440, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (441, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (442, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (443, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (444, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (445, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (446, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (447, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (448, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (449, 444, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (450, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (451, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (452, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (453, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (454, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (455, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (456, 445, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (457, 457, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (458, 460, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (459, 479, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (460, 480, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (461, 536, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (462, 568, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (463, 571, 1)
INSERT [dbo].[InvestorInformation] ([Id], [UserId], [InvestorTierId]) VALUES (464, 572, 1)
SET IDENTITY_INSERT [dbo].[InvestorInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[InvestorTierType] ON 

INSERT [dbo].[InvestorTierType] ([Id], [InvestorTier]) VALUES (1, N'Basic')
INSERT [dbo].[InvestorTierType] ([Id], [InvestorTier]) VALUES (2, N'Premium')
INSERT [dbo].[InvestorTierType] ([Id], [InvestorTier]) VALUES (3, N'Gold')
SET IDENTITY_INSERT [dbo].[InvestorTierType] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [UserRole]) VALUES (1, N'Intern')
INSERT [dbo].[Role] ([Id], [UserRole]) VALUES (2, N'QA')
INSERT [dbo].[Role] ([Id], [UserRole]) VALUES (3, N'Lider')
INSERT [dbo].[Role] ([Id], [UserRole]) VALUES (4, N'Developer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (416, N'ymeroyan@gmail.com', N'$2b$10$4mjfEJDTlpfltYU7U1hKueYMb6Kfxg95kP8ahfpKlMHeP9zHsvVJS', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (417, N'jivem93486@roxoas.com', N'$2b$10$bJdC7EBJRBhhrjEf4yb0t.PQI9hPwsaz/mjG6kmUj4KBV4NFk8Raa', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (418, N'haykgargaloyan@gmail.com', N'$2b$10$bVYQlwhg5vJBCmfmSbhKoePv554.Ikm7idDiKOC23IAaH3E89V5RS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (419, N'rgargaloyan@gmail.com', N'$2b$10$OUdgSEr2vHLUqbhSMN1wM.3R/5p4vCEn33vmI/z3sYviM6c9MTZse', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (420, N'moneto6955@akapple.com', N'$2b$10$qLsmJTEq8gB/DTkVZEGBReAwJ4w.OL8Asi.VUmMahTNyiE3nAXxhm', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (421, N'gayanevoskanyan@yahoo.com', N'$2b$10$n0jNAKSk8M8Ow1LGhzh8pOlTcmND4v3j.lipDilAsgw6wjAeVCTnK', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (422, N'inga.lala@yahoo.com', N'$2b$10$U7ds4DZlgakY1b5qX8OZ4eI5tzeYnu5BKB.pHtoBqYDio/1gKhU4O', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (423, N'Lika@brutian.com', N'$2b$10$hxeFNqwM0zBjoFB3WZQ.8eJM96t8uIWgrbEmVuNM188tHgm8obKHe', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (424, N'sahakkeshishyan27@gmail.com', N'$2b$10$/P8xx5IJrGVKTbkCudBZDO4wTGv.R0Yn3sGRYaDeeskZpoB.R1Txy', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (425, N'alexander.solakhyan@gmail.com', N'$2b$10$.nWbnDAA1rfNKWNq1n9KAu4glkxU6FGUArXsXs3dP.Tf9oNgsjL6a', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (426, N'cookshuttle@gmail.com', N'$2b$10$s54RG4fQ7miIJibRiV3wc.lzpHNS5ML6btaLlljiF3w6zI963uQe2', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (427, N'lghalechyan@gmail.com', N'$2b$10$drY8G6Ku.JWxDnbptKA3/.oUgxn4wIv43nAw01v29SCKI7VGWIqy6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (428, N'ynazinyan@gmail.com', N'$2b$10$osg2rKvxpqbW/qTT8DcVZOJWdA7Q5xJ9KzQxts6kNeJGaAsJyLdHW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (429, N'armine.karapetyan@gmail.com', N'$2b$10$3peMvJnwrOIw8QJK3xy9AOJEGur.Hrn0u7beUYX1dMu1ekuadU0Kq', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (430, N'mirzakhanian.addeh@gmail.com', N'$2b$10$5xOYYqBK5YzCSvFfWy3muexdy1ecO2HNzvWod8E9R7tK0TJrJmtYy', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (431, N'kaststudio@gmail.com', N'$2b$10$nmQv59wVA0ZjL5P9HxOyAusqsJbgvZO1n5p9ErZnOqan7ds2BjJOS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (432, N'asimona@rambler.ru', N'$2b$10$wJXT0vGBiv7sjE89w3J72ebN0bNk5fX6kBGSWRrPV1ykQ1QxlCeui', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (433, N'zarearakelyan@gmail.com', N'$2b$10$eqbdu0QCYycooytS4EhjceSiaDrmu5jIqVwru3/o/sIRvCeLbMGsG', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (434, N'sonatutunjyan@yahoo.com', N'$2b$10$nKiWtVeNYfz.JIycPzDaMea8lVW.fzVZMQXFCcjceTcNPYFtWs/Jm', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (435, N'abarzita@aol.com', N'$2b$10$3eHf4DrBE6eNV0N2KXwtf.HpMGSDXkeGeWZBpigBlDZNXV/IapBTS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (436, N'karen@cyberdentistry.com', N'$2b$10$ZIo6vkOmf99YVbu3qUojoeS17nfYbi9WyzZEev/gF/JmqZaotXabm', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (437, N'nellyohan@gmail.com', N'$2b$10$c4FYnmvigelw7MkbkkA7h.LUKjOnvMq8w21WOJjly2v//tfiSf3RC', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (438, N'tigran.antonyan@me.com', N'$2b$10$ub5114r3qM/5kFRr7BnYfuemlkdRkTyKugUAsINltl5Lr0RKrEG7G', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (439, N'mikeasatryanr@yahoo.com', N'$2b$10$naNGeQJ3nYVw3mXPL0xkF.KFJZBavH1DN.iIHUiMlKNXwDEf3Ki6y', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (440, N'nick@foodsmo.com', N'$2b$10$sDRyxEyd4AVN7mr5iaCZr.RzthtjQyhZuMkR4vSWAkHcPh.qOdd4K', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (441, N'nellyohan@gmai.com', N'$2b$10$IFQVo9xNQ8CB/jgCuKO9Eu9lXaG0sUiqhbCfeleZ0N50ukMACsKym', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (442, N'mail.hayk@gmail.com', N'$2b$10$emfrEaWv0P/g/ikBt4kLfeWd3oK1NcZH.h2cLs7V1u055IYoptD3C', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (443, N'asolakhyan@gmail.com', N'$2b$10$ATnVeREg9.cCBDBCoIJqXO0UaLlTHoowZU4CtsrzlVnVIs2NwpaNy', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (444, N'safaryanaleksandra@gmail.com', N'$2b$10$3h2VnWdhPN43bzIu1MEQJ.BySiMYqmyf/732wZmhZBjaDSUmq.Y2.', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (445, N'saktermart@gmail.com', N'$2b$10$dYNqIJxO6lCCKEY5p3Rqgeln4g6MBUg/auWsNaNIU.JMX6R2Ykn9O', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (446, N'angtermartirosyan@gmail.com', N'$2b$10$zMt1mgHJqKRy20lMNI.Id.q/vRencEEiqZrtWNpDKo/gswwpfTwDa', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (447, N'ashtermart@gmail.com', N'$2b$10$Gg1hN66lDVOBpqr/9PRDT.YvL3FfvborR.cxAUhD4ZX4H478Lj9aa', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (448, N'Kamciyan@gmail.com', N'$2b$10$jbLgCOJpbE7L0q.hc/jHK.rst8DdQW.H.SYXdOchQkkZjqQBVGLwW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (449, N'anigasp2002@mail.ru', N'$2b$10$6HZXlWB9vZGLOhleBPVbrOsgyqn5TSrXtO.daY62d7on/7Ipm2ni6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (450, N'user@example.com', N'$2b$10$verqqvzyKdMdZN6sR0IQf.mwp8M101klcMhb7AlxpnhBoAGiZL8eq', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (451, N'pebifi1211@akapple.com', N'$2b$10$ah5wzEst1CWRMBWEMr2ghu9qWDevLyx04jHPUJjXWFvpVDXB3tcge', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (452, N'givekop893@akapple.com', N'$2b$10$smKGSEoqs80eiBMNXiDyv.xu.bwxFP0VSyvD1mgm8sbuxQKOqk1EC', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (453, N'pogepo3430@hbehs.com', N'$2b$10$8G7nL5OzuVt7dqmA6GsyEe6Vv8sZJQPuF61ifrtK7KW5jnlAaAQY6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (454, N'pawel63981@roxoas.com', N'$2b$10$7Zd8lj6aduUBo9U5mNcmAer9eytSZ4MJxFnq09rkZLfqmkgnSa4ja', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (455, N'remane1773@hbehs.com', N'$2b$10$QTGArDNbv1r57duYjbNCvOfC5bhCe8PyQufDs3QIpGwNStpzWcO2G', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (456, N'hisaw19890@hbehs.com', N'$2b$10$pDy7lCbPh6QlWupn8h1p.enTc4fHZq14WCTLB3oQ.rHHOakFOXJHm', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (457, N'kexiva7726@hbehs.com', N'$2b$10$sc7QLGSaOsjZvFYnwRrnrORRJ8cMRS4KqZ3UqX08DZw85QPwuBdpW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (458, N'gevedet729@akapple.com', N'$2b$10$wWp8QryEAjziW0dU4JTApuue34ww7v3uRqRn8fs/bGMrEdV71Krv6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (459, N'toverep733@roxoas.com', N'$2b$10$MVpm7NebXVXX54xDxTDPfeZy1u2bCCxGuql1QZ/xJ6boKeUtwYsXe', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (460, N'sojev90677@hbehs.com', N'$2b$10$FiZaMOX/VpisjOvC5TcheulS08f/Z4DY9n2QUzmwPfQZexS/tAXqu', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (461, N'foyete1355@roxoas.com', N'$2b$10$zyksm00F6m8MUh2spE4a3.H7oZXzhsz8iQPWgtM8hAC14KSX7CYG2', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (462, N'mehisi4720@roxoas.com', N'$2b$10$3s9JsCXaaetEUtwTyqegBeSz3lXWIVAp4mT3pby8Yaeh/yqDOPlsS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (463, N'vawiko4466@hbehs.com', N'$2b$10$lJvhr.vvopR2ffXQSvTx6uZuTbAPMhSVTjHh3vPwU8jZ910V2spbu', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (464, N'fewixas904@hbehs.com', N'$2b$10$6a1cujN1Zh1kjrMQ.m.yauW1yfYpwVsE5HK/J3wAw6Tauw8T5F3Xm', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (465, N'jamoyav610@roxoas.com', N'$2b$10$Nb3WGiT7sfkSUSHsHK.By.PwZ42I0leNno5.AZ8sr36wMDvRDCL6W', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (466, N'vexoya8326@roxoas.com', N'$2b$10$eFIa1bundj6oBcS6Tg20w.7DB9GKK2.UcF.EGg2RFRcwQC57UZ0Y.', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (467, N'picefa4159@roxoas.com', N'$2b$10$qlP8bZ/uKRijbdHlbUZkuuHR2Crljjxm.HENN4mzQSEQvgH5RUNfm', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (468, N'mosale3337@hbehs.com', N'$2b$10$GNOphieU9yozkx17SrNFWucDOLlYsTdqYnHozQsfM5wuqW9fTilhO', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (469, N'najetox190@dufeed.com', N'$2b$10$huS8RGRK.7SKQgmgJwco8ufZpPXxoUQTN7zyi7q4ZGdaNDsbfxbDa', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (470, N'foxedoc634@akapple.com', N'$2b$10$K5yy1.xDbjk6xisHXODSEeFSC1xlnlCjnaq7/628tQNOF2XN1VeRW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (471, N'locan57753@roxoas.com', N'$2b$10$xnMYjVrmu5kwFIU1hVq06uuPXdrqaFLZOJ8O0RR4KcUqIxK/XLdue', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (472, N'tomodip425@hbehs.com', N'$2b$10$iZNkvTtoSYMeM6CvnsV9MOvXewU8mrP9ST3Sa1LXvXpEp6Jc.d6pu', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (473, N'xowome2934@roxoas.com', N'$2b$10$n/v2rlNIdaSBQ/YEbavr9.Wz1I2kvQbKqol.x8CkZdeGdWzkpLoPG', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (474, N'digeg15096@akapple.com', N'$2b$10$PjUi508EZZlHA3HMQxHuBOE1iR6MTeF754qlzYIGpJnF1fEMk70Qy', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (475, N'konegeh688@roxoas.com', N'$2b$10$O6djAsfZRs.GDHc/yvBxL.SWTBujwHSepBtyNWPQkK9L7bM71ojsa', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (476, N'bonof38911@akapple.com', N'$2b$10$1JZnK1DtVxu7X8O63NRzpu00Ab3zk01JVJ85cBi2RNGV74uGymId2', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (477, N'pofoto5640@hbehs.com', N'$2b$10$j3mo9tfY1bS6y6rYyJbiM.Uk4fJNZjQiuV4cFxh9GSvak9mY3n.Gi', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (478, N'yiyiw52942@hbehs.com', N'$2b$10$i8PpZ/q42HsbciwMuwD0B.BroBajJvTlRo9ESGi28ZSzvzxQV5rUW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (479, N'pejeh65499@roxoas.com', N'$2b$10$sZX49VHac8NQcoyrdNmaK.JXx7lO3KtreLVEDplE6GCMyp4YbMsXq', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (480, N'simato9424@dufeed.com', N'$2b$10$oU9TnurpHhdjPzyAq1Mou./AbAY2vtJ/QbanqcqanPYAmgl0bO8WO', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (481, N'homoxij302@akapple.com', N'$2b$10$BgGVBbAvLPB1452hUbxKAOAF6G2NNuKpCfpHUy7js0PVrvp.Br7Sq', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (482, N'fiparix216@dufeed.com', N'$2b$10$HVhZkJjV2baiVoPyaKvj2ufhSXB/AUfrcn.PynI0uJ7lC7WKZwyCe', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (483, N'mixapih585@dufeed.com', N'$2b$10$Y5ChNYhwX6LQMAJaAim5jO.y9RMwHV1Mn7.LXx0NXtebrkAM4xFuu', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (484, N'perayih668@roxoas.com', N'$2b$10$W286gqH.f8PzXtK6ifH5NuiGZieI2ERWr5q7aSR3q7huA/meZhOWO', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (485, N'gosaxo8005@hbehs.com', N'$2b$10$C6GxW79x9fIdI6FQICbsHuqNRa8LVo91FCuOE5jtY.uUk9sYtTxAS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (486, N'soyotal259@dufeed.com', N'$2b$10$3QNuLKmieBMk2Az142fqt.vOSzW9dqYr4Yke.zaEiRoZBEETrmET6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (487, N'wavilat204@dufeed.com', N'$2b$10$qhelAy/njoorUjc7jjr1L.aMq64v8l20VkQjNwVbztJg0nsY5P1Tq', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (488, N'bakerad355@dufeed.com', N'$2b$10$gdGpmKtTLAaYzeFxGVOJ..ZQaw3ENaRVAEmeUo/oX890Ad7Bt9boa', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (489, N'rotola3590@akapple.com', N'$2b$10$PYfJkTfZq1rMx7fh/4/1LOu/4.m6SETabSZtKs3gV0Ib9.66pouA.', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (490, N'xovabi8749@hbehs.com', N'$2b$10$9BOYBpyd9ROykGZie3.wFuK6UYRHzs6kY88budi3KPDNelNKGd6La', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (491, N'bayij88782@roxoas.com', N'$2b$10$Gf7nNfRu3VOHLvwl3Xobke2nzmb1YqibgyK21GB26w51v1TqCzTP.', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (492, N'rexawov854@hbehs.com', N'$2b$10$bnm6zPzADEIW2/xoEe8GvOoFF85VJij35nSJ7dmslIl.wjz8jGTYe', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (493, N'yegad85009@dufeed.com', N'$2b$10$ecPJtvvGNMneQysyE7mfIeR9u3T4c9W0XCKP3ji2ZStZfznYV7oUS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (494, N'deyed13934@dufeed.com', N'$2b$10$ONckCCg2dZH5TCR6TYd43.6pjrnT3QXcBFiTlFtsNENUtpKEJuYf6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (495, N'hatoxov880@dufeed.com', N'$2b$10$PWJkDzBAR.FEXTk419fcfO484NSq13b/epgsDD1gUnbYsF1xQtU3e', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (496, N'licel71573@hbehs.com', N'$2b$10$Z5NTepB2ZqXiFzPjrFF47OlW/o2biIUwf6X.hMUH757xE86CP4XgC', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (497, N'worihi9684@roxoas.com', N'$2b$10$fFetfJirJRIT2gt.dPGMUOC1it7VUa40BymafW7KXbuxp1r20x3SG', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (498, N'dejeyom929@hbehs.com', N'$2b$10$tEn5FK3pUth4tLcU6dfNAuGgUQBsg.1phPRNntowDkiaTnCFF5DFS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (499, N'xedej21230@roxoas.com', N'$2b$10$qiQ0hEWxGmSSI99dXC4zm.gmP.b84qPTXN.zW3e1IeK4VX6m8LuCm', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (500, N'vimidob558@akapple.com', N'$2b$10$ah4kgCdvN/N1NE83N77xy.yq9qUM789gGEmgvRjrVvE5SotbzOk0a', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (501, N'vosab66366@hbehs.com', N'$2b$10$rffpALJ.TchYOJt4kSJeFOymIzjOpqnSHNKWFnVbv5OmNgQxNI4hG', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (502, N'tolero7645@dufeed.com', N'$2b$10$k1ijxXiLp2QWXc3isKgPIu.gYGeIPeC08tmL0DoP4qfVb5pnSgPhu', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (503, N'gapexac734@hbehs.com', N'$2b$10$6bVqM7yCTQ7GKB3s8QMpae9whiGI4ptifA5lRdvupmJfWmWUJ7rxW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (504, N'sewil81599@akapple.com', N'$2b$10$rOISBQamS3tMF2X64iB6YuD1rT5BCL5joo/zmpOXIXD8d5XxbnqOm', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (505, N'hahag50237@hbehs.com', N'$2b$10$vm2HX482HY2NAgN6DCI0guphqBp4DtoOA6/8.v2P6G6iq2JNpPSnK', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (506, N'rosev82258@dufeed.com', N'$2b$10$zq5NBOABJRvWhnNPFJxcje2Op6/QQNZ00ohOb0FgvpMg5tj2piMUW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (507, N'biwaw21944@akapple.com', N'$2b$10$OOR9CiUSQsXHm7gmShF6pO2Jbb1t6CSLga6273ws/OUadmy/spVVK', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (508, N'gohexih469@akapple.com', N'$2b$10$97AyYAgpbDS1snvKDnrLt.o6z7YmUl3sJTKTPFJsWhjVwuAIQZfMC', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (509, N'teyib43097@roxoas.com', N'$2b$10$dejTOW.NaUe2eJw1eUs.hOCq2vUSjWawDNO6jWZADcPlrRblL1bOm', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (510, N'cayega3333@roxoas.com', N'$2b$10$YfMNSXEFi0UUG61Sq9oK/.fk8IGuOI.LPitkpi5BXDrww/YJNf62S', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (511, N'posep78647@akapple.com', N'$2b$10$ptwRpywYFgJAoAlQirdqeO/InsK1A1E/Vp9TTNX7EYdluglfwUMy6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (512, N'jokaw54625@hbehs.com', N'$2b$10$HCdb9IE.sXRWSSVGWbPyb.rSmbu2m4kdr5eNmzgfJ1oLg8PVFbZjS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (513, N'kicato4157@dufeed.com', N'$2b$10$yHKuRC39TkwhVK0I3V5XSOO499Pe/C0bg4oCqrGMOITTywk5GphsO', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (514, N'roworok555@hbehs.com', N'$2b$10$BA4pKLk0Pd8NB1vP6nMa8ugtdUROjVCvUyr7MjBN7iMSFlHRa/4WS', N'Pending')
GO
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (515, N'celiwoy462@hbehs.com', N'$2b$10$nL9teObTiSduL3h6Wf2cvOjhmILO1YyBMim/.LE2lmlBK13Q29M22', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (516, N'nohiw52437@akapple.com', N'$2b$10$hPz5LAkuHxi8DeiO1rITo.aYtZWhHMYqTWYll5YFBL99WhNztJ9Ke', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (517, N'xigatej985@roxoas.com', N'$2b$10$H4kJERpu/Jq.D2mpr7iR8uhnthpFKyT807W70I2d80kLONq1.h/8i', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (518, N'dexejel901@hbehs.com', N'$2b$10$wJ4AfOkaIatIsL4xtHb03.D69/kfaz5BhBcNYqWTplZI/uAYqTfxS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (519, N'jaxici5886@dufeed.com', N'$2b$10$g/.ravCCqkkyvCFyF21IvuyjB23yIDPdAITECGn8qMgojByecNzEO', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (520, N'xehabi6391@roxoas.com', N'$2b$10$bMBoxD/fngvq63G2c40Y3uzZhQkNTLsk8x1OyL0rmFjLWrrAh5Ii6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (521, N'honede2487@dufeed.com', N'$2b$10$bH..Xmwk/0jpGtCemP/I5OzIQlFkdMvx8KhDMfRYlJAIc3ZEj/3qm', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (522, N'jagosop437@roxoas.com', N'$2b$10$lvIQiHsAtgtkXIB1MrABHObyR9rPJFXezagG9pVXSWGXkD.LHXHce', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (523, N'cojila7953@dufeed.com', N'$2b$10$scqnNJhG.IWwTSdut4Q8rO/c6sN667Aj2D.LxIrJq0sYyjBblcr5W', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (524, N'faxadid862@hbehs.com', N'$2b$10$ydzlJvERMWP7ziLSUsREheOfPidKmL1PstauaO6Y7CiwY.75AHkEe', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (525, N'saselid530@hbehs.com', N'$2b$10$RR5Nd7trNy8zY7YZ0TXBIuuVzC4kraRYKnFu/XMicyL96N1aOCdxW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (526, N'cilib40624@roxoas.com', N'$2b$10$YAS4lfVTyi6zVwAdYY1ae.ZKMRB5ELBYs41O8O6xIJVpIzUKYm6eK', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (527, N'xahogi3933@hbehs.com', N'$2b$10$H2d.MLNpRoYGQ0bd0DQ5LOBjwIwPQ/jpA9KrP3f/um5ZLi6eFbGv6', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (528, N'bibile1204@akapple.com', N'$2b$10$MGvtGPIAmyCVqxRZ57E8bOoYePWHsZ/ldNdU3jBkj.C3dLzNUnhq.', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (529, N'worehoy136@roxoas.com', N'$2b$10$xNIPoJCVWh/vu7r/TtNkieT1ukuB5xEEqqVAS/4vs0JOg4bOQm2Ui', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (530, N'doweh98185@roxoas.com', N'$2b$10$CDXsR83L1Kj18oCX2eaFo.Wj6frdRa7jnzDi/ADee2Ml.a7IcHhki', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (531, N'gavivoy936@hbehs.com', N'$2b$10$1hfqy5hHw4DB4hJZvOuS4Oq4qpsaVSKKFBwL8/w3rJWo8.Z/03kvi', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (532, N'yekirip716@hbehs.com', N'$2b$10$FOMU8L5mgsWNJ96ODIiynOL1./fGCQNNjFlPnR.4igofY/6KW.Wg6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (533, N'shahinyan13@gmail.com', N'$2b$10$tVDI9iUMMjqeTS2dvhENvepOaqo1B6DPGtDeJz3cDGkLc1By3HKnG', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (534, N'liyilo7663@roxoas.com', N'$2b$10$KY33uPRoZ/HK6ce2Ux.UoO16X6XMfroxLCgPpPaOrWAX6aznbPSme', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (535, N'javenaj291@hbehs.com', N'$2b$10$y8c9NFZcIkkgCM4jV79v7eDsSB8Ls6G88Gsw/v2tVEeSxTc3rnsWO', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (536, N'somename@example.com', N'$2b$10$ZynETC3Jtg1QaiIaNLJd8.9XlVSKYPCGN.Vd0TRZMLQmXR0kPKKiy', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (537, N'dobobi5284@sceath.com', N'$2b$10$p8Mo7Pm7X1mc.HwaoLecfe8Ok/1QC9088Y91/nvXLV2vj60QGP0wu', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (538, N'wogeh71159@sceath.com', N'$2b$10$aXRtyqmVXFbtRik9BoztvuRsTv8aD.dgdZPw9nJyfxn7G6CQIm0O.', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (539, N'rorop52093@steamoh.com', N'$2b$10$ulpm8IGuetyMtx9OOWOZDeWA/7kvGPnLa5hq9z3rAZCdbfVz9kGgy', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (540, N'test@test.test', N'$2b$10$H6/JBCQM1k8ZydlD.hj3POwDKfFXjgmC7XGY0L5m7mUtq0i1XAsqe', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (541, N'test@sometest.am', N'$2b$10$usOqQJd8fAqkI22MG88bxubNjwA3y0XRRSJU5EDJx4wKhrSY6QR3O', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (542, N'test@hb.am', N'$2b$10$DffnWau6Ue4TuVneV/jEU.HkoMxxtp/2Op2PQF/VvPBTxgCrQ4.9i', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (543, N'ketaxa2588@sinyago.com', N'$2b$10$zolhHJgQZGMjWZszuKO9I.RbUByGju.N7vptQFP1q6E1uMXwv16O6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (544, N'davaxa3250@sceath.com', N'$2b$10$rjtViG1/z0A8LQ/LVYpF/ecevpX.kOu4MU6Jf0KgKdO1dCluq0QzG', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (545, N'narisa7092@sceath.com', N'$2b$10$kbW5A6rA1V8Ke0GSkCnGWO1.JXKrOZYNYD1k84EdwKIQ7gb4zovf6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (546, N'tifera5786@sinyago.com', N'$2b$10$a./1heeaR6MZ1T66Jr08u.1c0AQJSDC97IDt4Eco1u7aL5uCwJtpq', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (547, N'cibaf42896@sinyago.com', N'$2b$10$k3ZSecv/9So0RDCACYPEnO/KhFiCkbqb2lBtpHhyKLElf0c5vnpdG', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (548, N'makoj32944@sceath.com', N'$2b$10$vjbMWPDkHq0SqNHiz/7DjeqguvhsrWQ0S4NZ9xjrM4vjM8WU1aTE.', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (549, N'lalazaryan91@inbox.ru', N'$2b$10$suGoeIlRmLZ.RUCDZC.PJ.AbqU4BVIo3mqAREV/OnnwjvL6cgk9ZW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (550, N'gibol14962@sinyago.com', N'$2b$10$f.fwEPu2BSl7ScFwwI5OZ..22jaWwmazCmHD4wj4qFZwx55i2zKKe', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (551, N'meroyoj976@sinyago.com', N'$2b$10$GWbNhsHpGh75onBtdeidIedRzZtpMPfiAJR9OMotwwGtsnrM0yvQ2', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (552, N'dafote9047@steamoh.com', N'$2b$10$MI53GvczrRraCbP5cCekteCGQPbORJKPh0O1kF8/RZ6h9HV/sS842', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (553, N'yinek39161@sinyago.com', N'$2b$10$0f4apn.7qzmeXzgRfycgoOJk.stGsxGnY7/jr82IX1Vqzgh1S3xdW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (554, N'lacedo4940@sceath.com', N'$2b$10$eMWW.nocpLL/xgOXxHLeyeHJPzAh0LF0/kEw6zsF//xdt9Sdz0ziC', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (555, N'lovotaj742@tsclip.com', N'$2b$10$YbKO4YxhPOnZdiuav440buMjz9EpwTktfme364tBRZAmd1Cya7T46', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (556, N'hipexi3888@krunsea.com', N'$2b$10$UUY3Ldd1HLK2jxwDyN2b6ePGzXCyA89M5ibBd/XBdP4vVsCmlJjvi', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (557, N'vosig93531@chokxus.com', N'$2b$10$HtD0Yuz4sTwp1FTsIENtWeMbAthIVCdngDsyVNqx5mEenMZHmy8d6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (558, N'hofilo5315@chokxus.com', N'$2b$10$X6gxAk0wGLJNvK7t/JceTeENalh5ZcrzksbEx01lIdjRSqsNZqcf2', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (559, N'dohimoc305@oceore.com', N'$2b$10$mGNAA20ox4acMgkcEt7/JeOT4T47oSfie3K35stSDIZ9U/cfoRxDW', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (560, N'asdasdasd@adsadas.com', N'$2b$10$qZ2Btg.VXyXp9FRvd9pZIeZl7RYO34Q9VE2PR.laVYVFzqqWLP616', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (561, N'vegara6154@dilanfa.com', N'$2b$10$hDHvAdX4Hj0ME2FTGdoAaefh6PBleUAUlQCpxssq61EOxhzIcKXHG', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (562, N'jamit78189@nzaif.com', N'$2b$10$1H3ckP272BMmORtIeddFNeMmxI6b7vLgAc5Rwu558LoiThIC7Mwai', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (563, N'diana.voskanyan2021@mail.ru', N'$2b$10$Re6UGNhAha/.KurUkrZZiuwEWbGaU86bwh2pmsbQkjIKWT4GnSHm.', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (564, N'vowip17964@dilanfa.com', N'$2b$10$bItv1xjjazrOaKV73i4UiusF3PEOIKqpuysmyEx6PbVuygKYv.npG', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (565, N'nayeco2460@falkyz.com', N'$2b$10$jUiOHQrmOS.YaVxV2kDPQuUypmPMn29j6rPH.QL9r6s0AfK1Oreru', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (566, N'yura.shahinyan@gmail.com', N'$2b$10$L31kfyoxjIjmkmMAMwOBa.MamT.PahrGneBZlapxCxCazhhC9pMy.', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (567, N'besam49737@dilanfa.com', N'$2b$10$vW0gBUCfBo9KI0QmnvB84.IUfEiVdqL0tLcovPiSB/FfWaShmh07a', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (568, N'gavrilalaverdyan@gmail.com', N'$2b$10$.O2Lx9PyEAtLNTbGR2JlPuB9uz/3MePxFmnLv/vlD3nkc1xeE2kMC', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (569, N'larevi2197@tagbert.com', N'$2b$10$az4AsX5CVdV3y46bNcEUZ.P4pCiCY506o..WOx3LedsPX8l5/eaWy', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (570, N'nafav56139@qqhow.com', N'$2b$10$yKgtziiMNeOZ5yFCOFP6ne5gsntG4ipx6n5rgum9lrVCN.XovY5RO', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (571, N'figik53301@tagbert.com', N'$2b$10$9cugkBsP3WW3mv4HGi8HiuQF0dOQJBGFYIiNoB9jMzfpbTCV3QYge', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (572, N'cosam64614@serosin.com', N'$2b$10$mM/N5tRyMsyp14D/Mb2hwu25YhGqjNF1YF1rIsMHAkxaNFwuoqrT6', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (573, N'gevolo@yahoo.com', N'$2b$10$99w47E0iiQ1gsxcqw74OhuUaVlaTMSIEcoA6lnlpOpyIzsoO968mO', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (574, N'alexander.hakobyan@gmail.com', N'$2b$10$U2dsAfqyf/9voDjkJaPyWOqMVgvm66XUXJKvHOEMCaYj9T5F.zgBC', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (575, N'loxohok695@syswift.com', N'$2b$10$o.VN2HGskkQPDCn1cueMrOIJP11Be.spTebxvSjifOyZ7SL5Ikl5C', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (576, N'test@asd.asd', N'$2b$10$0EWxAXpjyXyEyX92wIZ4h.t/F4Bux2r8mtXHwMN.1fKN/X.QrCpC.', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (577, N'asdfasdf@zxc.asd', N'$2b$10$cUGZf9s8f4.0IgrGD37gr.EDxUNv7hhqlRav999E63iete/hqF2D6', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (578, N'asfasdfasdfasf@qweqw.wee', N'$2b$10$vXMibkwWJSZujKf1Ue4sp.lR1qT5hPRGZlVXPHpKNr6jB6.5t.bmS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (579, N'asfasdfasdfasf@qweqw.weew', N'$2b$10$oeoPZGW5bQWXaiwfYQDvSesZGy9oCRIVMPSUuYAZL5.DkB1Wr8Uza', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (580, N'asfasdfasdfasf@qweqws.wee', N'$2b$10$BYZGIqj10WGDCBlZWOZTpOmHf4tL9iNgyMMLA84r08ZIRg8JcfQ8C', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (581, N'adfasdfasdfasdf@qqq.qq', N'$2b$10$FFttvSpOL8kYSFUQjVsrNeQXeyM.or4Iv/5w/g.A5nJJZpv6MdwBi', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (582, N'asdfasdf@zxc.asda', N'$2b$10$yAAACaiNX8OJ.b31Y53C3OC4I7ugN7SDzdUAvPkv.ppe2s7bF1P6a', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (583, N'asdfasdf@zxc.asdan', N'$2b$10$Dp0LGXUuMe3rB/ZLVJDVSu0c7yY.uJTAeXV5l2HJ2wkqpbVMjmCtS', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (584, N'asdfasdf@zxc.asdaaaaa', N'$2b$10$TSlo/SXB/e8c019sU0lD8ecQBXj0I9cMUAQZ1YcYjVoDXFvciHj2G', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (585, N'test@asd.asdaaa', N'$2b$10$CtDeADDqa51eEmnqx0iaduOqeMIGVnsGy7Mx7QB6xmMJat1e7A6X2', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (586, N'test@asd.asdaaaz', N'$2b$10$N1VNbzEBnBKBAqBWDTa.q.Vt6T5oCY38.xKNK9w1HLEl5dvdBZFLu', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (587, N'asdfasdf@zxc.asdpp', N'$2b$10$sj4chVTNvdU1MsZ4fzatw.RZq6UdRyHczb2OxxxwJKROZ1gEfu8Xe', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (588, N'asdfasdf@zxc.asdppa', N'$2b$10$0j8BK6IFVyqVYZ6vC0CTDO8UNxPsEyMR9Pp/p/0EBw4.DjtY3y.jO', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (589, N'teast@asd.asd', N'$2b$10$JIBjuD1Dfr7Lbh8sZWcZjOuY6kXXTSSvU0B47MyysyKMj7k7YRTdm', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (590, N'teast@asd.asdq', N'$2b$10$JRC88uEEKJbw9cgptXCk/O/X2krawhrq/vsEJPiFLpTgkzWZqZvzi', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (591, N'teast@asd.asdqa', N'$2b$10$MIK2Qr4j5ejPKvOl9UjhG.u37zLRxCn3H..jiGm7p3985IfXW2Zy2', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (592, N'test@asd.asdqwe', N'$2b$10$ysxBg5PDjNBeNK/fcmNyG.l5C75dBoQIfa4z1250OTS/f0QIpV11q', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (593, N'test@asd.asdqwem', N'$2b$10$rpHWfoGDPY3PqxcrtUGgCeY98wLTSOMg6jc3YrbwSwN4qHPOdhh72', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (594, N'dejogip336@kahase.com', N'$2b$10$H2VZS0miMjlcg3gQSZhNk.NSnP0TXN/6QIv3io1/3tVoJslwrReOW', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (595, N'bovafe6716@cebaike.com', N'$2b$10$oEZlHybThdIkb0.kmhCDq.zOhVfa3EjiG809pocrvLCjdeME1h5P.', N'Activ')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (596, N'hrantjanoyan1@gmail.com', N'$2b$10$FdUuL9refG09FYSlF4CJm.o8YADCGQTU8h3QAmKOULInH1bMbC1jq', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (597, N'gayaneandonian@gmail.com', N'$2b$10$UP7EZ3Mm82Vf.0u5R041yuLbO0NdYFI9BZ6nChfuLAvA/RIwp6Lre', N'Pending')
INSERT [dbo].[User] ([Id], [Email], [Password], [Status]) VALUES (598, N'rijoyo6540@proexbol.com', N'$2b$10$sFf.HD3O1VXWwhzycY4hk.XCfZUIjNG/fIwQGUIifwH/VOzdaMHpW', N'Pending')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[User2UserType] ([UserTypeId], [UserId]) VALUES (6, 573)
INSERT [dbo].[User2UserType] ([UserTypeId], [UserId]) VALUES (6, 574)
INSERT [dbo].[User2UserType] ([UserTypeId], [UserId]) VALUES (7, 575)
INSERT [dbo].[User2UserType] ([UserTypeId], [UserId]) VALUES (7, 594)
INSERT [dbo].[User2UserType] ([UserTypeId], [UserId]) VALUES (7, 595)
INSERT [dbo].[User2UserType] ([UserTypeId], [UserId]) VALUES (7, 596)
INSERT [dbo].[User2UserType] ([UserTypeId], [UserId]) VALUES (8, 571)
INSERT [dbo].[User2UserType] ([UserTypeId], [UserId]) VALUES (8, 572)
GO
SET IDENTITY_INSERT [dbo].[UserIdea] ON 

INSERT [dbo].[UserIdea] ([Id], [UserId], [IdeaCategory], [IdeaDeskcription]) VALUES (1, 450, N'string', N'string')
INSERT [dbo].[UserIdea] ([Id], [UserId], [IdeaCategory], [IdeaDeskcription]) VALUES (2, 455, N'string', N'menq 11')
INSERT [dbo].[UserIdea] ([Id], [UserId], [IdeaCategory], [IdeaDeskcription]) VALUES (3, 450, N'string', N'string')
INSERT [dbo].[UserIdea] ([Id], [UserId], [IdeaCategory], [IdeaDeskcription]) VALUES (4, 451, N'string', N'string')
SET IDENTITY_INSERT [dbo].[UserIdea] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInformation] ON 

INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (638, 416, N'Lena', N'Meroyan', N'', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-14T22:21:27.610' AS DateTime), CAST(N'2022-05-14T22:21:27.610' AS DateTime), N'1111111111', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (639, 417, N'skjhdhsk', N'nekljrg', N',mnvlkdrng', CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-14T22:23:20.113' AS DateTime), CAST(N'2022-05-14T22:23:20.113' AS DateTime), N'5435165', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (640, 418, N'Rouben', N'Gargaloyan', N'V', CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:07:43.363' AS DateTime), CAST(N'2022-05-15T00:07:43.363' AS DateTime), N'818323555', 3, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (641, 418, N'Rouben', N'Gargaloyan', N'V', CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:07:49.427' AS DateTime), CAST(N'2022-05-15T00:07:49.427' AS DateTime), N'818323555', 3, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (642, 418, N'Rouben', N'Gargaloyan', N'V', CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:08:03.527' AS DateTime), CAST(N'2022-05-15T00:08:03.527' AS DateTime), N'818323555', 3, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (643, 418, N'Rouben', N'Gargaloyan', N'V', CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:08:08.330' AS DateTime), CAST(N'2022-05-15T00:08:08.330' AS DateTime), N'818323555', 3, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (644, 419, N'Rouben ', N'Gargolyan ', N'V', CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:12:37.657' AS DateTime), CAST(N'2022-05-15T00:12:37.657' AS DateTime), N'11234555', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (645, 420, N'skjdhkd', N'sdvdfdf', N'fvsed', CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:28:21.453' AS DateTime), CAST(N'2022-05-15T00:28:21.453' AS DateTime), N'24231321', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (646, 422, N'Inga', N'Astsaturyan', N'', CAST(N'1996-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:27:23.507' AS DateTime), CAST(N'2022-05-15T02:27:23.507' AS DateTime), N'3104889515', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (647, 422, N'Inga', N'Astsaturyan', N'', CAST(N'1996-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:27:40.023' AS DateTime), CAST(N'2022-05-15T02:27:40.023' AS DateTime), N'3104889515', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (648, 422, N'Inga', N'Astsaturyan', N'', CAST(N'1996-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:27:40.943' AS DateTime), CAST(N'2022-05-15T02:27:40.943' AS DateTime), N'3104889515', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (649, 422, N'Inga', N'Astsaturyan', N'', CAST(N'1996-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:27:42.053' AS DateTime), CAST(N'2022-05-15T02:27:42.053' AS DateTime), N'3104889515', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (650, 422, N'Inga', N'Astsaturyan', N'', CAST(N'1996-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:27:42.250' AS DateTime), CAST(N'2022-05-15T02:27:42.250' AS DateTime), N'3104889515', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (651, 424, N'Sahak', N'Keshishyan', N'', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:28:18.950' AS DateTime), CAST(N'2022-05-15T02:28:18.950' AS DateTime), N'8183347060', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (652, 424, N'Sahak', N'Keshishyan', N'', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:28:29.910' AS DateTime), CAST(N'2022-05-15T02:28:29.910' AS DateTime), N'8183347060', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (653, 424, N'Sahak', N'Keshishyan', N'', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:28:34.267' AS DateTime), CAST(N'2022-05-15T02:28:34.267' AS DateTime), N'8183347060', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (654, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:28:34.683' AS DateTime), CAST(N'2022-05-15T02:28:34.683' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (655, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:28:35.760' AS DateTime), CAST(N'2022-05-15T02:28:35.760' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (656, 424, N'Sahak', N'Keshishyan', N'', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:28:36.497' AS DateTime), CAST(N'2022-05-15T02:28:36.497' AS DateTime), N'8183347060', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (657, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:28:37.320' AS DateTime), CAST(N'2022-05-15T02:28:37.320' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (658, 425, N'Alexander', N'Solakhyan', N'David', CAST(N'2003-10-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:29:03.557' AS DateTime), CAST(N'2022-05-15T02:29:03.557' AS DateTime), N'4154194020', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (659, 425, N'Alexander', N'Solakhyan', N'David', CAST(N'2003-10-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:29:13.587' AS DateTime), CAST(N'2022-05-15T02:29:13.587' AS DateTime), N'4154194020', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (660, 425, N'Alexander', N'Solakhyan', N'David', CAST(N'2003-10-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:29:13.813' AS DateTime), CAST(N'2022-05-15T02:29:13.813' AS DateTime), N'4154194020', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (661, 425, N'Alexander', N'Solakhyan', N'David', CAST(N'2003-10-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:29:14.633' AS DateTime), CAST(N'2022-05-15T02:29:14.633' AS DateTime), N'4154194020', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (662, 425, N'Alexander', N'Solakhyan', N'David', CAST(N'2003-10-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:29:15.173' AS DateTime), CAST(N'2022-05-15T02:29:15.173' AS DateTime), N'4154194020', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (663, 424, N'Sahak', N'Keshishyan', N'', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:29:15.520' AS DateTime), CAST(N'2022-05-15T02:29:15.520' AS DateTime), N'8183347060', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (664, 425, N'Alexander', N'Solakhyan', N'David', CAST(N'2003-10-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:29:15.773' AS DateTime), CAST(N'2022-05-15T02:29:15.773' AS DateTime), N'4154194020', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (665, 424, N'Sahak', N'Keshishyan', N'', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:29:16.273' AS DateTime), CAST(N'2022-05-15T02:29:16.273' AS DateTime), N'8183347060', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (666, 425, N'Alexander', N'Solakhyan', N'David', CAST(N'2003-10-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:29:16.273' AS DateTime), CAST(N'2022-05-15T02:29:16.273' AS DateTime), N'4154194020', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (667, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:36:31.977' AS DateTime), CAST(N'2022-05-15T02:36:31.977' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (668, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:36:32.663' AS DateTime), CAST(N'2022-05-15T02:36:32.663' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (669, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2009-01-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:37:21.823' AS DateTime), CAST(N'2022-05-15T02:37:21.823' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (670, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2009-01-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:37:25.097' AS DateTime), CAST(N'2022-05-15T02:37:25.097' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (671, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2009-01-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:37:26.000' AS DateTime), CAST(N'2022-05-15T02:37:26.000' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (672, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2009-01-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:37:26.043' AS DateTime), CAST(N'2022-05-15T02:37:26.043' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (673, 421, N'Gayane', N'Voskanyan', N'', CAST(N'2009-01-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T02:37:26.770' AS DateTime), CAST(N'2022-05-15T02:37:26.770' AS DateTime), N'8184142940', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (674, 430, N'Adeh', N'Mirzakhanian', N'', CAST(N'1988-04-06T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:09:40.970' AS DateTime), CAST(N'2022-05-15T04:09:40.970' AS DateTime), N'8182336604', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (675, 433, N'Zare', N'Arakelyan', N'', CAST(N'2004-10-21T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:01.680' AS DateTime), CAST(N'2022-05-15T04:10:01.680' AS DateTime), N'8184239703', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (676, 433, N'Zare', N'Arakelyan', N'', CAST(N'2004-10-21T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:03.113' AS DateTime), CAST(N'2022-05-15T04:10:03.113' AS DateTime), N'8184239703', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (677, 433, N'Zare', N'Arakelyan', N'', CAST(N'2004-10-21T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:06.747' AS DateTime), CAST(N'2022-05-15T04:10:06.747' AS DateTime), N'8184239703', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (678, 433, N'Zare', N'Arakelyan', N'', CAST(N'2004-10-21T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:24.003' AS DateTime), CAST(N'2022-05-15T04:10:24.003' AS DateTime), N'8184239703', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (679, 432, N'Angela', N'Harutyunyan ', N'', CAST(N'1974-07-25T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:29.753' AS DateTime), CAST(N'2022-05-15T04:10:29.753' AS DateTime), N'8187453359', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (680, 432, N'Angela', N'Harutyunyan ', N'', CAST(N'1974-07-25T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:31.923' AS DateTime), CAST(N'2022-05-15T04:10:31.923' AS DateTime), N'8187453359', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (681, 432, N'Angela', N'Harutyunyan ', N'', CAST(N'1974-07-25T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:41.057' AS DateTime), CAST(N'2022-05-15T04:10:41.057' AS DateTime), N'8187453359', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (682, 432, N'Angela', N'Harutyunyan ', N'', CAST(N'1974-07-25T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:54.900' AS DateTime), CAST(N'2022-05-15T04:10:54.900' AS DateTime), N'8187453359', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (683, 436, N'Karen', N'Baghdasaryan ', N'', CAST(N'1972-10-18T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:56.240' AS DateTime), CAST(N'2022-05-15T04:10:56.240' AS DateTime), N'8185174494', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (684, 432, N'Angela', N'Harutyunyan ', N'', CAST(N'1974-07-25T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:10:58.683' AS DateTime), CAST(N'2022-05-15T04:10:58.683' AS DateTime), N'8187453359', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (685, 436, N'Karen', N'Baghdasaryan ', N'', CAST(N'1972-10-18T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:05.063' AS DateTime), CAST(N'2022-05-15T04:11:05.063' AS DateTime), N'8185174494', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (686, 436, N'Karen', N'Baghdasaryan ', N'', CAST(N'1972-10-18T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:06.050' AS DateTime), CAST(N'2022-05-15T04:11:06.050' AS DateTime), N'8185174494', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (687, 432, N'Angela', N'Harutyunyan ', N'A', CAST(N'1974-07-25T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:11.893' AS DateTime), CAST(N'2022-05-15T04:11:11.893' AS DateTime), N'8187453359', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (688, 432, N'Angela', N'Harutyunyan ', N'A', CAST(N'1974-07-25T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:13.677' AS DateTime), CAST(N'2022-05-15T04:11:13.677' AS DateTime), N'8187453359', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (689, 436, N'Karen', N'Baghdasaryan ', N'', CAST(N'1972-10-18T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:21.170' AS DateTime), CAST(N'2022-05-15T04:11:21.170' AS DateTime), N'8185174494', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (690, 436, N'Karen', N'Baghdasaryan ', N'', CAST(N'1972-10-18T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:21.467' AS DateTime), CAST(N'2022-05-15T04:11:21.467' AS DateTime), N'8185174494', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (691, 436, N'Karen', N'Baghdasaryan ', N'', CAST(N'1972-10-18T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:22.083' AS DateTime), CAST(N'2022-05-15T04:11:22.083' AS DateTime), N'8185174494', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (692, 436, N'Karen', N'Baghdasaryan ', N'', CAST(N'1972-10-18T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:22.413' AS DateTime), CAST(N'2022-05-15T04:11:22.413' AS DateTime), N'8185174494', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (693, 436, N'Karen', N'Baghdasaryan ', N'', CAST(N'1972-10-18T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:22.457' AS DateTime), CAST(N'2022-05-15T04:11:22.457' AS DateTime), N'8185174494', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (694, 436, N'Karen', N'Baghdasaryan ', N'', CAST(N'1972-10-18T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:22.933' AS DateTime), CAST(N'2022-05-15T04:11:22.933' AS DateTime), N'8185174494', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (695, 435, N'Anayis', N'Barzegar', N'Ani', CAST(N'1990-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:32.147' AS DateTime), CAST(N'2022-05-15T04:11:32.147' AS DateTime), N'8183218858', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (696, 435, N'Anayis', N'Barzegar', N'Ani', CAST(N'1990-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:36.883' AS DateTime), CAST(N'2022-05-15T04:11:36.883' AS DateTime), N'8183218858', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (697, 435, N'Anayis', N'Barzegar', N'Ani', CAST(N'1990-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:48.397' AS DateTime), CAST(N'2022-05-15T04:11:48.397' AS DateTime), N'8183218858', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (698, 435, N'Anayis', N'Barzegar', N'Ani', CAST(N'1990-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:11:58.323' AS DateTime), CAST(N'2022-05-15T04:11:58.323' AS DateTime), N'8183218858', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (699, 435, N'Anayis', N'Barzegar', N'Ani', CAST(N'1990-09-07T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:12:05.663' AS DateTime), CAST(N'2022-05-15T04:12:05.663' AS DateTime), N'8183218858', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (700, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:14:07.213' AS DateTime), CAST(N'2022-05-15T04:14:07.213' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (701, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:14:08.347' AS DateTime), CAST(N'2022-05-15T04:14:08.347' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (702, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:14:12.987' AS DateTime), CAST(N'2022-05-15T04:14:12.987' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (703, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:14:13.967' AS DateTime), CAST(N'2022-05-15T04:14:13.967' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (704, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:14:19.787' AS DateTime), CAST(N'2022-05-15T04:14:19.787' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (705, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:14:23.070' AS DateTime), CAST(N'2022-05-15T04:14:23.070' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (706, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:14:23.660' AS DateTime), CAST(N'2022-05-15T04:14:23.660' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (707, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:14:45.477' AS DateTime), CAST(N'2022-05-15T04:14:45.477' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (708, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:15:02.737' AS DateTime), CAST(N'2022-05-15T04:15:02.737' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (709, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:15:03.443' AS DateTime), CAST(N'2022-05-15T04:15:03.443' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (710, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:15:11.197' AS DateTime), CAST(N'2022-05-15T04:15:11.197' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (711, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:15:12.463' AS DateTime), CAST(N'2022-05-15T04:15:12.463' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (712, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:15:23.057' AS DateTime), CAST(N'2022-05-15T04:15:23.057' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (713, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:15:27.237' AS DateTime), CAST(N'2022-05-15T04:15:27.237' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (714, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:15:30.117' AS DateTime), CAST(N'2022-05-15T04:15:30.117' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (715, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:15:31.173' AS DateTime), CAST(N'2022-05-15T04:15:31.173' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (716, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:15:41.783' AS DateTime), CAST(N'2022-05-15T04:15:41.783' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (717, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:16:06.457' AS DateTime), CAST(N'2022-05-15T04:16:06.457' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (718, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:16:11.343' AS DateTime), CAST(N'2022-05-15T04:16:11.343' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (719, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:16:20.540' AS DateTime), CAST(N'2022-05-15T04:16:20.540' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (720, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:16:21.480' AS DateTime), CAST(N'2022-05-15T04:16:21.480' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (721, 439, N'Mher', N'Asatryan ', N'', CAST(N'1979-01-02T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:16:41.300' AS DateTime), CAST(N'2022-05-15T04:16:41.300' AS DateTime), N'8182121100', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (722, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:17:49.193' AS DateTime), CAST(N'2022-05-15T04:17:49.193' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (723, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:17:50.663' AS DateTime), CAST(N'2022-05-15T04:17:50.663' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (724, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:17:53.250' AS DateTime), CAST(N'2022-05-15T04:17:53.250' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (725, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:17:59.350' AS DateTime), CAST(N'2022-05-15T04:17:59.350' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (726, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:17:59.967' AS DateTime), CAST(N'2022-05-15T04:17:59.967' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (727, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:00.540' AS DateTime), CAST(N'2022-05-15T04:18:00.540' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (728, 440, N'Nick', N'Garibian', N'', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:12.977' AS DateTime), CAST(N'2022-05-15T04:18:12.977' AS DateTime), N'4086771793', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (729, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:16.933' AS DateTime), CAST(N'2022-05-15T04:18:16.933' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (730, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:17.240' AS DateTime), CAST(N'2022-05-15T04:18:17.240' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (731, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:17.563' AS DateTime), CAST(N'2022-05-15T04:18:17.563' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (732, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:17.893' AS DateTime), CAST(N'2022-05-15T04:18:17.893' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (733, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:17.893' AS DateTime), CAST(N'2022-05-15T04:18:17.893' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (734, 440, N'Nick', N'Garibian', N'', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:18.923' AS DateTime), CAST(N'2022-05-15T04:18:18.923' AS DateTime), N'4086771793', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (735, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:25.273' AS DateTime), CAST(N'2022-05-15T04:18:25.273' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (736, 431, N'Narine ', N'Marsoubian', N'', CAST(N'1970-01-04T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:28.577' AS DateTime), CAST(N'2022-05-15T04:18:28.577' AS DateTime), N'8188235630', 2, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (737, 431, N'Narine ', N'Marsoubian', N'', CAST(N'1970-01-04T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:28.680' AS DateTime), CAST(N'2022-05-15T04:18:28.680' AS DateTime), N'8188235630', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (738, 431, N'Narine ', N'Marsoubian', N'', CAST(N'1970-01-04T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:30.767' AS DateTime), CAST(N'2022-05-15T04:18:30.767' AS DateTime), N'8188235630', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (739, 431, N'Narine ', N'Marsoubian', N'', CAST(N'1970-01-04T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:38.153' AS DateTime), CAST(N'2022-05-15T04:18:38.153' AS DateTime), N'8188235630', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (740, 431, N'Narine ', N'Marsoubian', N'', CAST(N'1970-01-04T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:38.837' AS DateTime), CAST(N'2022-05-15T04:18:38.837' AS DateTime), N'8188235630', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (741, 440, N'Nick', N'Garibian', N'', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:44.573' AS DateTime), CAST(N'2022-05-15T04:18:44.573' AS DateTime), N'4086771793', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (742, 431, N'Narine ', N'Marsoubian', N'', CAST(N'1970-01-04T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:56.730' AS DateTime), CAST(N'2022-05-15T04:18:56.730' AS DateTime), N'8188235630', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (743, 431, N'Narine ', N'Marsoubian', N'', CAST(N'1970-01-04T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:18:57.440' AS DateTime), CAST(N'2022-05-15T04:18:57.440' AS DateTime), N'8188235630', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (744, 437, N'Nelly', N'Ohanyan', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:19:00.670' AS DateTime), CAST(N'2022-05-15T04:19:00.670' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (745, 431, N'Narine ', N'Marsoubian', N'', CAST(N'1970-01-04T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:19:08.123' AS DateTime), CAST(N'2022-05-15T04:19:08.123' AS DateTime), N'8188235630', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (746, 431, N'Narine ', N'Marsoubian', N'', CAST(N'1970-01-04T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:19:10.207' AS DateTime), CAST(N'2022-05-15T04:19:10.207' AS DateTime), N'8188235630', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (747, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:22:34.840' AS DateTime), CAST(N'2022-05-15T04:22:34.840' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (748, 438, N'Tigran', N'Antonyan', N'', CAST(N'1980-08-01T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:22:35.440' AS DateTime), CAST(N'2022-05-15T04:22:35.440' AS DateTime), N'5619852666', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (749, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:39:23.797' AS DateTime), CAST(N'2022-05-15T04:39:23.797' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (750, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:39:30.060' AS DateTime), CAST(N'2022-05-15T04:39:30.060' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (751, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:39:44.537' AS DateTime), CAST(N'2022-05-15T04:39:44.537' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (752, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:39:47.200' AS DateTime), CAST(N'2022-05-15T04:39:47.200' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (753, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:40:20.800' AS DateTime), CAST(N'2022-05-15T04:40:20.800' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (754, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:43:19.437' AS DateTime), CAST(N'2022-05-15T04:43:19.437' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (755, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:43:20.257' AS DateTime), CAST(N'2022-05-15T04:43:20.257' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (756, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:48:50.407' AS DateTime), CAST(N'2022-05-15T04:48:50.407' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (757, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:48:50.470' AS DateTime), CAST(N'2022-05-15T04:48:50.470' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (758, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:53:00.240' AS DateTime), CAST(N'2022-05-15T04:53:00.240' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (759, 441, N'Nelly', N'Ohanyan ', N'', CAST(N'1968-11-12T00:00:00.000' AS DateTime), CAST(N'2022-05-15T04:53:00.527' AS DateTime), CAST(N'2022-05-15T04:53:00.527' AS DateTime), N'8184345404', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (760, 442, N'Hayk', N'Saryan', N'', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T05:47:27.977' AS DateTime), CAST(N'2022-05-15T05:47:27.977' AS DateTime), N'8185124203', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (761, 442, N'Hayk', N'Saryan', N'', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T05:47:30.593' AS DateTime), CAST(N'2022-05-15T05:47:30.593' AS DateTime), N'8185124203', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (762, 442, N'Hayk', N'Saryan', N'', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T05:47:32.603' AS DateTime), CAST(N'2022-05-15T05:47:32.603' AS DateTime), N'8185124203', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (763, 442, N'Hayk', N'Saryan', N'', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T05:47:35.290' AS DateTime), CAST(N'2022-05-15T05:47:35.290' AS DateTime), N'8185124203', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (764, 442, N'Hayk', N'Saryan', N'', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T05:47:36.597' AS DateTime), CAST(N'2022-05-15T05:47:36.597' AS DateTime), N'8185124203', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (765, 442, N'Hayk', N'Saryan', N'', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T05:47:37.467' AS DateTime), CAST(N'2022-05-15T05:47:37.467' AS DateTime), N'8185124203', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (766, 442, N'Hayk', N'Saryan', N'', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T05:47:47.640' AS DateTime), CAST(N'2022-05-15T05:47:47.640' AS DateTime), N'8185124203', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (767, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:09.237' AS DateTime), CAST(N'2022-05-15T06:56:09.237' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (768, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:09.580' AS DateTime), CAST(N'2022-05-15T06:56:09.580' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (769, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:09.870' AS DateTime), CAST(N'2022-05-15T06:56:09.870' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (770, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:10.077' AS DateTime), CAST(N'2022-05-15T06:56:10.077' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (771, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:10.893' AS DateTime), CAST(N'2022-05-15T06:56:10.893' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (772, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:10.893' AS DateTime), CAST(N'2022-05-15T06:56:10.893' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (773, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:11.540' AS DateTime), CAST(N'2022-05-15T06:56:11.540' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (774, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:11.783' AS DateTime), CAST(N'2022-05-15T06:56:11.783' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (775, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:12.033' AS DateTime), CAST(N'2022-05-15T06:56:12.033' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (776, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:12.860' AS DateTime), CAST(N'2022-05-15T06:56:12.860' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (777, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:13.077' AS DateTime), CAST(N'2022-05-15T06:56:13.077' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (778, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:13.840' AS DateTime), CAST(N'2022-05-15T06:56:13.840' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (779, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:15.983' AS DateTime), CAST(N'2022-05-15T06:56:15.983' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (780, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:15.983' AS DateTime), CAST(N'2022-05-15T06:56:15.983' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (781, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:16.390' AS DateTime), CAST(N'2022-05-15T06:56:16.390' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (782, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:16.417' AS DateTime), CAST(N'2022-05-15T06:56:16.417' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (783, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:16.420' AS DateTime), CAST(N'2022-05-15T06:56:16.420' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (784, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:16.877' AS DateTime), CAST(N'2022-05-15T06:56:16.877' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (785, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:16.877' AS DateTime), CAST(N'2022-05-15T06:56:16.877' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (786, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:17.147' AS DateTime), CAST(N'2022-05-15T06:56:17.147' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (787, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:17.373' AS DateTime), CAST(N'2022-05-15T06:56:17.373' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (788, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:17.427' AS DateTime), CAST(N'2022-05-15T06:56:17.427' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (789, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:18.770' AS DateTime), CAST(N'2022-05-15T06:56:18.770' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (790, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:18.797' AS DateTime), CAST(N'2022-05-15T06:56:18.797' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (791, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:19.173' AS DateTime), CAST(N'2022-05-15T06:56:19.173' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (792, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:19.543' AS DateTime), CAST(N'2022-05-15T06:56:19.543' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (793, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:19.510' AS DateTime), CAST(N'2022-05-15T06:56:19.510' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (794, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:19.497' AS DateTime), CAST(N'2022-05-15T06:56:19.497' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (795, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:19.690' AS DateTime), CAST(N'2022-05-15T06:56:19.690' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (796, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:20.270' AS DateTime), CAST(N'2022-05-15T06:56:20.270' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (797, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:20.270' AS DateTime), CAST(N'2022-05-15T06:56:20.270' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (798, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:20.773' AS DateTime), CAST(N'2022-05-15T06:56:20.773' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (799, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:20.773' AS DateTime), CAST(N'2022-05-15T06:56:20.773' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (800, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:21.553' AS DateTime), CAST(N'2022-05-15T06:56:21.553' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (801, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:21.553' AS DateTime), CAST(N'2022-05-15T06:56:21.553' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (802, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:21.557' AS DateTime), CAST(N'2022-05-15T06:56:21.557' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (803, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:21.843' AS DateTime), CAST(N'2022-05-15T06:56:21.843' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (804, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:22.400' AS DateTime), CAST(N'2022-05-15T06:56:22.400' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (805, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:22.400' AS DateTime), CAST(N'2022-05-15T06:56:22.400' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (806, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:22.887' AS DateTime), CAST(N'2022-05-15T06:56:22.887' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (807, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:22.903' AS DateTime), CAST(N'2022-05-15T06:56:22.903' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (808, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:22.923' AS DateTime), CAST(N'2022-05-15T06:56:22.923' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (809, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:22.930' AS DateTime), CAST(N'2022-05-15T06:56:22.930' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (810, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:23.153' AS DateTime), CAST(N'2022-05-15T06:56:23.153' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (811, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:23.157' AS DateTime), CAST(N'2022-05-15T06:56:23.157' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (812, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:23.987' AS DateTime), CAST(N'2022-05-15T06:56:23.987' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (813, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:23.987' AS DateTime), CAST(N'2022-05-15T06:56:23.987' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (814, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:24.403' AS DateTime), CAST(N'2022-05-15T06:56:24.403' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (815, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:26.673' AS DateTime), CAST(N'2022-05-15T06:56:26.673' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (816, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:26.677' AS DateTime), CAST(N'2022-05-15T06:56:26.677' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (817, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:26.987' AS DateTime), CAST(N'2022-05-15T06:56:26.987' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (818, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:27.060' AS DateTime), CAST(N'2022-05-15T06:56:27.060' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (819, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:27.773' AS DateTime), CAST(N'2022-05-15T06:56:27.773' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (820, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:28.080' AS DateTime), CAST(N'2022-05-15T06:56:28.080' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (821, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:28.083' AS DateTime), CAST(N'2022-05-15T06:56:28.083' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (822, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:28.323' AS DateTime), CAST(N'2022-05-15T06:56:28.323' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (823, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:28.327' AS DateTime), CAST(N'2022-05-15T06:56:28.327' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (824, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:29.217' AS DateTime), CAST(N'2022-05-15T06:56:29.217' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (825, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:29.217' AS DateTime), CAST(N'2022-05-15T06:56:29.217' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (826, 446, N'Angela', N'Ter-Martirosyan', N'Elvina', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:29.453' AS DateTime), CAST(N'2022-05-15T06:56:29.453' AS DateTime), N'8188009008', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (827, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:30.897' AS DateTime), CAST(N'2022-05-15T06:56:30.897' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (828, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:31.247' AS DateTime), CAST(N'2022-05-15T06:56:31.247' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (829, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:35.303' AS DateTime), CAST(N'2022-05-15T06:56:35.303' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (830, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:35.330' AS DateTime), CAST(N'2022-05-15T06:56:35.330' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (831, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:35.347' AS DateTime), CAST(N'2022-05-15T06:56:35.347' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (832, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:35.637' AS DateTime), CAST(N'2022-05-15T06:56:35.637' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (833, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:35.710' AS DateTime), CAST(N'2022-05-15T06:56:35.710' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (834, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:35.990' AS DateTime), CAST(N'2022-05-15T06:56:35.990' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (835, 443, N'Armen ', N'Solakhyan', N'', CAST(N'1973-06-14T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:45.290' AS DateTime), CAST(N'2022-05-15T06:56:45.290' AS DateTime), N'6173359866', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (836, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:52.967' AS DateTime), CAST(N'2022-05-15T06:56:52.967' AS DateTime), N'8183945534', 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (837, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:57.050' AS DateTime), CAST(N'2022-05-15T06:56:57.050' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (838, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:57.883' AS DateTime), CAST(N'2022-05-15T06:56:57.883' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (839, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:56:58.973' AS DateTime), CAST(N'2022-05-15T06:56:58.973' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (840, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:02.230' AS DateTime), CAST(N'2022-05-15T06:57:02.230' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (841, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:03.440' AS DateTime), CAST(N'2022-05-15T06:57:03.440' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (842, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:04.797' AS DateTime), CAST(N'2022-05-15T06:57:04.797' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (843, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:11.130' AS DateTime), CAST(N'2022-05-15T06:57:11.130' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (844, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:14.643' AS DateTime), CAST(N'2022-05-15T06:57:14.643' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (845, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:21.707' AS DateTime), CAST(N'2022-05-15T06:57:21.707' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (846, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:22.057' AS DateTime), CAST(N'2022-05-15T06:57:22.057' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (847, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:22.920' AS DateTime), CAST(N'2022-05-15T06:57:22.920' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (848, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:23.140' AS DateTime), CAST(N'2022-05-15T06:57:23.140' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (849, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:23.370' AS DateTime), CAST(N'2022-05-15T06:57:23.370' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (850, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:31.243' AS DateTime), CAST(N'2022-05-15T06:57:31.243' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (851, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:34.853' AS DateTime), CAST(N'2022-05-15T06:57:34.853' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (852, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:35.473' AS DateTime), CAST(N'2022-05-15T06:57:35.473' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (853, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:35.473' AS DateTime), CAST(N'2022-05-15T06:57:35.473' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (854, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:36.080' AS DateTime), CAST(N'2022-05-15T06:57:36.080' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (855, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:36.483' AS DateTime), CAST(N'2022-05-15T06:57:36.483' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (856, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:36.483' AS DateTime), CAST(N'2022-05-15T06:57:36.483' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (857, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:37.200' AS DateTime), CAST(N'2022-05-15T06:57:37.200' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (858, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:40.197' AS DateTime), CAST(N'2022-05-15T06:57:40.197' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (859, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:43.960' AS DateTime), CAST(N'2022-05-15T06:57:43.960' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (860, 447, N'Ashot', N'Ter-Martirosyan', N'Robert', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:44.530' AS DateTime), CAST(N'2022-05-15T06:57:44.530' AS DateTime), N'8183945534', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (861, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:44.843' AS DateTime), CAST(N'2022-05-15T06:57:44.843' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (862, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:46.567' AS DateTime), CAST(N'2022-05-15T06:57:46.567' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (863, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:46.863' AS DateTime), CAST(N'2022-05-15T06:57:46.863' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (864, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:47.100' AS DateTime), CAST(N'2022-05-15T06:57:47.100' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (865, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:47.370' AS DateTime), CAST(N'2022-05-15T06:57:47.370' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (866, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:47.647' AS DateTime), CAST(N'2022-05-15T06:57:47.647' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (867, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:48.543' AS DateTime), CAST(N'2022-05-15T06:57:48.543' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (868, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:48.543' AS DateTime), CAST(N'2022-05-15T06:57:48.543' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (869, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:49.050' AS DateTime), CAST(N'2022-05-15T06:57:49.050' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (870, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:53.133' AS DateTime), CAST(N'2022-05-15T06:57:53.133' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (871, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:53.393' AS DateTime), CAST(N'2022-05-15T06:57:53.393' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (872, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:54.920' AS DateTime), CAST(N'2022-05-15T06:57:54.920' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (873, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:55.950' AS DateTime), CAST(N'2022-05-15T06:57:55.950' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (874, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:57:56.180' AS DateTime), CAST(N'2022-05-15T06:57:56.180' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (875, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:03.990' AS DateTime), CAST(N'2022-05-15T06:58:03.990' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (876, 448, N'Karmen', N'Kamciyan', N'', CAST(N'1966-10-29T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:03.993' AS DateTime), CAST(N'2022-05-15T06:58:03.993' AS DateTime), N'8183889101', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (877, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:11.593' AS DateTime), CAST(N'2022-05-15T06:58:11.593' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (878, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:11.947' AS DateTime), CAST(N'2022-05-15T06:58:11.947' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (879, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:12.483' AS DateTime), CAST(N'2022-05-15T06:58:12.483' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (880, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:12.970' AS DateTime), CAST(N'2022-05-15T06:58:12.970' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (881, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:13.217' AS DateTime), CAST(N'2022-05-15T06:58:13.217' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (882, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:13.260' AS DateTime), CAST(N'2022-05-15T06:58:13.260' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (883, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:13.753' AS DateTime), CAST(N'2022-05-15T06:58:13.753' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (884, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:14.107' AS DateTime), CAST(N'2022-05-15T06:58:14.107' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (885, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:14.600' AS DateTime), CAST(N'2022-05-15T06:58:14.600' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (886, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:15.093' AS DateTime), CAST(N'2022-05-15T06:58:15.093' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (887, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:15.093' AS DateTime), CAST(N'2022-05-15T06:58:15.093' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (888, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:15.850' AS DateTime), CAST(N'2022-05-15T06:58:15.850' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (889, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:16.233' AS DateTime), CAST(N'2022-05-15T06:58:16.233' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (890, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:18.873' AS DateTime), CAST(N'2022-05-15T06:58:18.873' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (891, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:18.893' AS DateTime), CAST(N'2022-05-15T06:58:18.893' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (892, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:18.920' AS DateTime), CAST(N'2022-05-15T06:58:18.920' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (893, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:19.107' AS DateTime), CAST(N'2022-05-15T06:58:19.107' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (894, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:19.383' AS DateTime), CAST(N'2022-05-15T06:58:19.383' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (895, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:19.643' AS DateTime), CAST(N'2022-05-15T06:58:19.643' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (896, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:19.657' AS DateTime), CAST(N'2022-05-15T06:58:19.657' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (897, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:19.883' AS DateTime), CAST(N'2022-05-15T06:58:19.883' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (898, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:20.127' AS DateTime), CAST(N'2022-05-15T06:58:20.127' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (899, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:20.667' AS DateTime), CAST(N'2022-05-15T06:58:20.667' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (900, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:20.667' AS DateTime), CAST(N'2022-05-15T06:58:20.667' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (901, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:20.950' AS DateTime), CAST(N'2022-05-15T06:58:20.950' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (902, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:21.183' AS DateTime), CAST(N'2022-05-15T06:58:21.183' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (903, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:21.433' AS DateTime), CAST(N'2022-05-15T06:58:21.433' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (904, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:21.653' AS DateTime), CAST(N'2022-05-15T06:58:21.653' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (905, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:22.400' AS DateTime), CAST(N'2022-05-15T06:58:22.400' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (906, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:22.670' AS DateTime), CAST(N'2022-05-15T06:58:22.670' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (907, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:22.683' AS DateTime), CAST(N'2022-05-15T06:58:22.683' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (908, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:22.910' AS DateTime), CAST(N'2022-05-15T06:58:22.910' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (909, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:23.410' AS DateTime), CAST(N'2022-05-15T06:58:23.410' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (910, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:23.467' AS DateTime), CAST(N'2022-05-15T06:58:23.467' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (911, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:23.493' AS DateTime), CAST(N'2022-05-15T06:58:23.493' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (912, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:23.993' AS DateTime), CAST(N'2022-05-15T06:58:23.993' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (913, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:24.203' AS DateTime), CAST(N'2022-05-15T06:58:24.203' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (914, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:24.390' AS DateTime), CAST(N'2022-05-15T06:58:24.390' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (915, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:24.797' AS DateTime), CAST(N'2022-05-15T06:58:24.797' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (916, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:25.027' AS DateTime), CAST(N'2022-05-15T06:58:25.027' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (917, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:25.047' AS DateTime), CAST(N'2022-05-15T06:58:25.047' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (918, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:25.750' AS DateTime), CAST(N'2022-05-15T06:58:25.750' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (919, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:25.873' AS DateTime), CAST(N'2022-05-15T06:58:25.873' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (920, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:32.757' AS DateTime), CAST(N'2022-05-15T06:58:32.757' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (921, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:33.357' AS DateTime), CAST(N'2022-05-15T06:58:33.357' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (922, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:33.360' AS DateTime), CAST(N'2022-05-15T06:58:33.360' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (923, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:33.607' AS DateTime), CAST(N'2022-05-15T06:58:33.607' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (924, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:34.160' AS DateTime), CAST(N'2022-05-15T06:58:34.160' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (925, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:35.740' AS DateTime), CAST(N'2022-05-15T06:58:35.740' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (926, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:36.777' AS DateTime), CAST(N'2022-05-15T06:58:36.777' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (927, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:36.847' AS DateTime), CAST(N'2022-05-15T06:58:36.847' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (928, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:36.973' AS DateTime), CAST(N'2022-05-15T06:58:36.973' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (929, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:37.237' AS DateTime), CAST(N'2022-05-15T06:58:37.237' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (930, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:37.237' AS DateTime), CAST(N'2022-05-15T06:58:37.237' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (931, 444, N'Aleksandra ', N'Safaryan', N'', CAST(N'2005-07-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:37.917' AS DateTime), CAST(N'2022-05-15T06:58:37.917' AS DateTime), N'8188188600', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (932, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:51.770' AS DateTime), CAST(N'2022-05-15T06:58:51.770' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (933, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:55.723' AS DateTime), CAST(N'2022-05-15T06:58:55.723' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (934, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:56.057' AS DateTime), CAST(N'2022-05-15T06:58:56.057' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (935, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:56.067' AS DateTime), CAST(N'2022-05-15T06:58:56.067' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (936, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:56.347' AS DateTime), CAST(N'2022-05-15T06:58:56.347' AS DateTime), N'8183945535', 1, NULL)
GO
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (937, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:56.353' AS DateTime), CAST(N'2022-05-15T06:58:56.353' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (938, 445, N'Sarkis', N'Ter-Martirosyan', N'David', CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2022-05-15T06:58:56.870' AS DateTime), CAST(N'2022-05-15T06:58:56.870' AS DateTime), N'8183945535', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (939, 449, N'Ani', N'Gasparyan', N'Ani', CAST(N'2002-08-23T00:00:00.000' AS DateTime), CAST(N'2022-05-15T10:10:18.740' AS DateTime), CAST(N'2022-05-15T10:10:18.740' AS DateTime), N'094575573', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (940, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:20.130' AS DateTime), CAST(N'2022-05-17T16:25:20.130' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (941, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:24.057' AS DateTime), CAST(N'2022-05-17T16:25:24.057' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (942, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:24.420' AS DateTime), CAST(N'2022-05-17T16:25:24.420' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (943, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:24.750' AS DateTime), CAST(N'2022-05-17T16:25:24.750' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (944, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:32.600' AS DateTime), CAST(N'2022-05-17T16:25:32.600' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (945, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:32.653' AS DateTime), CAST(N'2022-05-17T16:25:32.653' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (946, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:32.843' AS DateTime), CAST(N'2022-05-17T16:25:32.843' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (947, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:33.257' AS DateTime), CAST(N'2022-05-17T16:25:33.257' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (948, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:33.443' AS DateTime), CAST(N'2022-05-17T16:25:33.443' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (949, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:33.803' AS DateTime), CAST(N'2022-05-17T16:25:33.803' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (950, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:33.860' AS DateTime), CAST(N'2022-05-17T16:25:33.860' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (951, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:40.837' AS DateTime), CAST(N'2022-05-17T16:25:40.837' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (952, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:41.257' AS DateTime), CAST(N'2022-05-17T16:25:41.257' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (953, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:41.647' AS DateTime), CAST(N'2022-05-17T16:25:41.647' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (954, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:41.647' AS DateTime), CAST(N'2022-05-17T16:25:41.647' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (955, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:41.963' AS DateTime), CAST(N'2022-05-17T16:25:41.963' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (956, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:41.997' AS DateTime), CAST(N'2022-05-17T16:25:41.997' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (957, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:25:42.380' AS DateTime), CAST(N'2022-05-17T16:25:42.380' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (958, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:04.667' AS DateTime), CAST(N'2022-05-17T16:26:04.667' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (959, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:05.153' AS DateTime), CAST(N'2022-05-17T16:26:05.153' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (960, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:05.610' AS DateTime), CAST(N'2022-05-17T16:26:05.610' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (961, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:06.003' AS DateTime), CAST(N'2022-05-17T16:26:06.003' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (962, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:06.270' AS DateTime), CAST(N'2022-05-17T16:26:06.270' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (963, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:06.847' AS DateTime), CAST(N'2022-05-17T16:26:06.847' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (964, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:06.853' AS DateTime), CAST(N'2022-05-17T16:26:06.853' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (965, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:06.863' AS DateTime), CAST(N'2022-05-17T16:26:06.863' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (966, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:06.910' AS DateTime), CAST(N'2022-05-17T16:26:06.910' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (967, 450, N'Vahe', N'Mkrtchyan', N'', CAST(N'1995-08-22T00:00:00.000' AS DateTime), CAST(N'2022-05-17T16:26:06.953' AS DateTime), CAST(N'2022-05-17T16:26:06.953' AS DateTime), N'37444545045', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (968, 451, N'fdbfdv', N'Lalazaryan', N'', CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-18T10:25:39.890' AS DateTime), CAST(N'2022-05-18T10:25:39.890' AS DateTime), N'6545454', 1, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (969, 452, N'Mher', N'Lalazaryan', N'', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:02:25.627' AS DateTime), CAST(N'2022-05-18T14:02:25.627' AS DateTime), N'454545452', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (970, 452, N'Mher', N'Lalazaryan', N'', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:05:40.290' AS DateTime), CAST(N'2022-05-18T14:05:40.290' AS DateTime), N'454545452', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (971, 452, N'Mher', N'Lalazaryan', N'', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:07:31.917' AS DateTime), CAST(N'2022-05-18T14:07:31.917' AS DateTime), N'454545452', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (972, 452, N'Mher', N'Lalazaryan', N'', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:07:37.517' AS DateTime), CAST(N'2022-05-18T14:07:37.517' AS DateTime), N'454545452', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (973, 452, N'Mher', N'Lalazaryan', N'', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:07:37.873' AS DateTime), CAST(N'2022-05-18T14:07:37.873' AS DateTime), N'454545452', 2, NULL)
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (974, 453, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:47:15.807' AS DateTime), CAST(N'2022-05-18T14:47:15.807' AS DateTime), N'8544', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (975, 453, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:48:43.753' AS DateTime), CAST(N'2022-05-18T14:48:43.753' AS DateTime), N'8544', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (976, 453, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:48:45.110' AS DateTime), CAST(N'2022-05-18T14:48:45.110' AS DateTime), N'8544', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (977, 453, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:48:46.007' AS DateTime), CAST(N'2022-05-18T14:48:46.007' AS DateTime), N'8544', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (978, 453, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T14:48:46.983' AS DateTime), CAST(N'2022-05-18T14:48:46.983' AS DateTime), N'8544', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (979, 454, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T16:32:22.390' AS DateTime), CAST(N'2022-05-18T16:32:22.390' AS DateTime), N'7777776', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (980, 455, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T16:52:53.427' AS DateTime), CAST(N'2022-05-18T16:52:53.427' AS DateTime), N'656', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (981, 456, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T16:59:28.243' AS DateTime), CAST(N'2022-05-18T16:59:28.243' AS DateTime), N'555555554', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (982, 457, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T17:44:53.603' AS DateTime), CAST(N'2022-05-18T17:44:53.603' AS DateTime), N'545545', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (983, 458, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T17:51:34.390' AS DateTime), CAST(N'2022-05-18T17:51:34.390' AS DateTime), N'56455', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (984, 458, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T17:52:38.753' AS DateTime), CAST(N'2022-05-18T17:52:38.753' AS DateTime), N'56455', 1, N'dvasdsdfsa')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (985, 458, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:04:43.457' AS DateTime), CAST(N'2022-05-18T18:04:43.457' AS DateTime), N'965453', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (986, 459, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:12:02.077' AS DateTime), CAST(N'2022-05-18T18:12:02.077' AS DateTime), N'444545', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (987, 459, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:16:09.277' AS DateTime), CAST(N'2022-05-18T18:16:09.277' AS DateTime), N'444545', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (988, 460, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:20:50.957' AS DateTime), CAST(N'2022-05-18T18:20:50.957' AS DateTime), N'6546465', 1, N'eihsehfjdskhfkasgdfhjajfhasjkgfuskadjhfiuew
fsahfdsjfhkadshfjhasdkfhdsjafoiewiufh
jdsfhjsadhjkfhdsjkafadskljf')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (989, 460, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:23:28.043' AS DateTime), CAST(N'2022-05-18T18:23:28.043' AS DateTime), N'455', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (990, 461, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:24:22.810' AS DateTime), CAST(N'2022-05-18T18:24:22.810' AS DateTime), N'5445645', 1, N'wewrtfklwhfjkdfshbjdsbmnfbdsmfvbdshbn')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (991, 462, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:31:57.483' AS DateTime), CAST(N'2022-05-18T18:31:57.483' AS DateTime), N'54544', 1, N'efsdafgdsgfdsg')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (992, 462, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:32:25.923' AS DateTime), CAST(N'2022-05-18T18:32:25.923' AS DateTime), N'54454543', 1, N'4454ksjhdjsadn')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (993, 463, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:52:54.973' AS DateTime), CAST(N'2022-05-18T18:52:54.973' AS DateTime), N'545454545', 1, N'jhdfjshjfhdsjhfjdsj')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (994, 463, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T18:57:16.650' AS DateTime), CAST(N'2022-05-18T18:57:16.650' AS DateTime), N'545453', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (995, 463, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T19:04:55.383' AS DateTime), CAST(N'2022-05-18T19:04:55.383' AS DateTime), N'545453', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (996, 463, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T19:06:04.700' AS DateTime), CAST(N'2022-05-18T19:06:04.700' AS DateTime), N'5445454', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (997, 464, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T19:10:40.943' AS DateTime), CAST(N'2022-05-18T19:10:40.943' AS DateTime), N'6556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (998, 464, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T19:11:16.933' AS DateTime), CAST(N'2022-05-18T19:11:16.933' AS DateTime), N'6556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (999, 465, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T19:31:30.947' AS DateTime), CAST(N'2022-05-18T19:31:30.947' AS DateTime), N'64515464', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1000, 465, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T19:32:20.803' AS DateTime), CAST(N'2022-05-18T19:32:20.803' AS DateTime), N'45452', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1001, 465, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T19:37:38.410' AS DateTime), CAST(N'2022-05-18T19:37:38.410' AS DateTime), N'545453', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1002, 466, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T19:51:24.560' AS DateTime), CAST(N'2022-05-18T19:51:24.560' AS DateTime), N'5454554', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1003, 466, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T19:53:51.887' AS DateTime), CAST(N'2022-05-18T19:53:51.887' AS DateTime), N'6556454', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1004, 467, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T20:14:33.843' AS DateTime), CAST(N'2022-05-18T20:14:33.843' AS DateTime), N'545454', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1005, 467, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T20:15:03.580' AS DateTime), CAST(N'2022-05-18T20:15:03.580' AS DateTime), N'545454', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1006, 467, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T20:18:24.817' AS DateTime), CAST(N'2022-05-18T20:18:24.817' AS DateTime), N'545454', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1007, 467, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T20:25:12.163' AS DateTime), CAST(N'2022-05-18T20:25:12.163' AS DateTime), N'221212', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1008, 467, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T20:28:21.300' AS DateTime), CAST(N'2022-05-18T20:28:21.300' AS DateTime), N'221212', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1009, 467, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T20:28:32.057' AS DateTime), CAST(N'2022-05-18T20:28:32.057' AS DateTime), N'221212', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1010, 467, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T20:47:20.987' AS DateTime), CAST(N'2022-05-18T20:47:20.987' AS DateTime), N'563544', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1011, 472, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-18T21:59:45.427' AS DateTime), CAST(N'2022-05-18T21:59:45.427' AS DateTime), N'5454545', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1012, 473, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-18T22:08:01.973' AS DateTime), CAST(N'2022-05-18T22:08:01.973' AS DateTime), N'654545464', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1013, 474, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-19T12:21:05.313' AS DateTime), CAST(N'2022-05-19T12:21:05.313' AS DateTime), N'655654546465', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1014, 475, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-19T12:34:58.210' AS DateTime), CAST(N'2022-05-19T12:34:58.210' AS DateTime), N'56454545', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1015, 476, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-19T12:46:50.817' AS DateTime), CAST(N'2022-05-19T12:46:50.817' AS DateTime), N'45445454', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1016, 477, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-19T12:59:28.133' AS DateTime), CAST(N'2022-05-19T12:59:28.133' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1017, 478, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-19T13:17:41.587' AS DateTime), CAST(N'2022-05-19T13:17:41.587' AS DateTime), N'88888888888', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1018, 478, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-19T13:18:01.500' AS DateTime), CAST(N'2022-05-19T13:18:01.500' AS DateTime), N'88888888888', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1019, 479, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-19T13:29:12.127' AS DateTime), CAST(N'2022-05-19T13:29:12.127' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1020, 479, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-19T13:32:30.823' AS DateTime), CAST(N'2022-05-19T13:32:30.823' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1021, 480, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-19T13:38:12.837' AS DateTime), CAST(N'2022-05-19T13:38:12.837' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1022, 480, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-19T13:46:37.467' AS DateTime), CAST(N'2022-05-19T13:46:37.467' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1023, 481, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-20T09:47:35.280' AS DateTime), CAST(N'2022-05-20T09:47:35.280' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1024, 482, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T10:18:25.413' AS DateTime), CAST(N'2022-05-20T10:18:25.413' AS DateTime), N'777777777', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1025, 483, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T10:21:47.317' AS DateTime), CAST(N'2022-05-20T10:21:47.317' AS DateTime), N'222222', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1026, 484, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T10:32:38.353' AS DateTime), CAST(N'2022-05-20T10:32:38.353' AS DateTime), N'5445454', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1027, 485, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T10:40:58.643' AS DateTime), CAST(N'2022-05-20T10:40:58.643' AS DateTime), N'454544543', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1028, 485, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T10:47:52.753' AS DateTime), CAST(N'2022-05-20T10:47:52.753' AS DateTime), N'454544543', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1029, 486, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T11:17:05.830' AS DateTime), CAST(N'2022-05-20T11:17:05.830' AS DateTime), N'2222221', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1030, 487, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T11:53:22.313' AS DateTime), CAST(N'2022-05-20T11:53:22.313' AS DateTime), N'999998', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1031, 481, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-20T11:57:00.053' AS DateTime), CAST(N'2022-05-20T11:57:00.053' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1032, 488, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T12:09:07.540' AS DateTime), CAST(N'2022-05-20T12:09:07.540' AS DateTime), N'454545', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1033, 489, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T13:28:41.990' AS DateTime), CAST(N'2022-05-20T13:28:41.990' AS DateTime), N'45544554', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1034, 490, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T13:43:48.673' AS DateTime), CAST(N'2022-05-20T13:43:48.673' AS DateTime), N'545454544554', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1035, 490, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T13:45:40.100' AS DateTime), CAST(N'2022-05-20T13:45:40.100' AS DateTime), N'545454544554', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1036, 492, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T14:02:16.150' AS DateTime), CAST(N'2022-05-20T14:02:16.150' AS DateTime), N'54445545454544554', 2, N'')
GO
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1037, 481, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-20T14:04:18.823' AS DateTime), CAST(N'2022-05-20T14:04:18.823' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1038, 492, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T14:25:57.273' AS DateTime), CAST(N'2022-05-20T14:25:57.273' AS DateTime), N'54445545454544554', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1039, 493, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T14:27:52.110' AS DateTime), CAST(N'2022-05-20T14:27:52.110' AS DateTime), N'564545', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1040, 494, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T14:44:07.770' AS DateTime), CAST(N'2022-05-20T14:44:07.770' AS DateTime), N'454454455454', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1041, 495, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T14:56:12.443' AS DateTime), CAST(N'2022-05-20T14:56:12.443' AS DateTime), N'444554455445', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1042, 496, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T15:09:17.233' AS DateTime), CAST(N'2022-05-20T15:09:17.233' AS DateTime), N'5453', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1043, 497, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T15:22:15.910' AS DateTime), CAST(N'2022-05-20T15:22:15.910' AS DateTime), N'5454454552', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1044, 498, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T15:36:29.723' AS DateTime), CAST(N'2022-05-20T15:36:29.723' AS DateTime), N'555555', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1045, 499, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T16:08:06.510' AS DateTime), CAST(N'2022-05-20T16:08:06.510' AS DateTime), N'4444444444', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1046, 500, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T16:18:42.530' AS DateTime), CAST(N'2022-05-20T16:18:42.530' AS DateTime), N'55555555', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1047, 501, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T18:34:23.950' AS DateTime), CAST(N'2022-05-20T18:34:23.950' AS DateTime), N'5555554', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1048, 501, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T18:43:43.083' AS DateTime), CAST(N'2022-05-20T18:43:43.083' AS DateTime), N'5555554', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1049, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-20T20:12:34.767' AS DateTime), CAST(N'2022-05-20T20:12:34.767' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1050, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-20T20:15:55.843' AS DateTime), CAST(N'2022-05-20T20:15:55.843' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1051, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-20T20:17:08.817' AS DateTime), CAST(N'2022-05-20T20:17:08.817' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1052, 503, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-20T20:29:46.137' AS DateTime), CAST(N'2022-05-20T20:29:46.137' AS DateTime), N'7777776', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1053, 504, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T14:40:59.883' AS DateTime), CAST(N'2022-05-21T14:40:59.883' AS DateTime), N'5555555', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1054, 504, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T14:41:58.613' AS DateTime), CAST(N'2022-05-21T14:41:58.613' AS DateTime), N'5555555', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1055, 505, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T14:43:17.247' AS DateTime), CAST(N'2022-05-21T14:43:17.247' AS DateTime), N'6666664', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1056, 506, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T14:45:16.543' AS DateTime), CAST(N'2022-05-21T14:45:16.543' AS DateTime), N'666665', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1057, 507, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T14:55:38.707' AS DateTime), CAST(N'2022-05-21T14:55:38.707' AS DateTime), N'1111110', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1058, 508, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T15:04:15.613' AS DateTime), CAST(N'2022-05-21T15:04:15.613' AS DateTime), N'1111109', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1059, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T15:18:14.680' AS DateTime), CAST(N'2022-05-21T15:18:14.680' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1060, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T15:23:03.537' AS DateTime), CAST(N'2022-05-21T15:23:03.537' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1061, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T15:26:55.543' AS DateTime), CAST(N'2022-05-21T15:26:55.543' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1062, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T15:28:27.577' AS DateTime), CAST(N'2022-05-21T15:28:27.577' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1063, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T15:36:18.913' AS DateTime), CAST(N'2022-05-21T15:36:18.913' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1064, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T15:40:12.683' AS DateTime), CAST(N'2022-05-21T15:40:12.683' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1065, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T15:41:48.867' AS DateTime), CAST(N'2022-05-21T15:41:48.867' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1066, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T15:42:42.723' AS DateTime), CAST(N'2022-05-21T15:42:42.723' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1067, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T15:43:25.297' AS DateTime), CAST(N'2022-05-21T15:43:25.297' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1068, 509, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T15:51:31.337' AS DateTime), CAST(N'2022-05-21T15:51:31.337' AS DateTime), N'666666', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1069, 510, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T16:01:54.057' AS DateTime), CAST(N'2022-05-21T16:01:54.057' AS DateTime), N'55555555', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1070, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T16:17:13.470' AS DateTime), CAST(N'2022-05-21T16:17:13.470' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1071, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T16:18:44.587' AS DateTime), CAST(N'2022-05-21T16:18:44.587' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1072, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T16:20:07.727' AS DateTime), CAST(N'2022-05-21T16:20:07.727' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1073, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T16:20:45.653' AS DateTime), CAST(N'2022-05-21T16:20:45.653' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1074, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T16:21:21.553' AS DateTime), CAST(N'2022-05-21T16:21:21.553' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1075, 511, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T16:31:20.497' AS DateTime), CAST(N'2022-05-21T16:31:20.497' AS DateTime), N'666665', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1076, 512, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T16:44:52.003' AS DateTime), CAST(N'2022-05-21T16:44:52.003' AS DateTime), N'66666', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1077, 513, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T16:59:04.017' AS DateTime), CAST(N'2022-05-21T16:59:04.017' AS DateTime), N'66666', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1078, 514, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T17:12:01.133' AS DateTime), CAST(N'2022-05-21T17:12:01.133' AS DateTime), N'666665', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1079, 515, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T17:29:18.647' AS DateTime), CAST(N'2022-05-21T17:29:18.647' AS DateTime), N'77777', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1080, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T18:53:08.507' AS DateTime), CAST(N'2022-05-21T18:53:08.507' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1081, 516, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T19:06:22.340' AS DateTime), CAST(N'2022-05-21T19:06:22.340' AS DateTime), N'7777776', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1082, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T19:21:48.303' AS DateTime), CAST(N'2022-05-21T19:21:48.303' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1083, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T19:29:27.743' AS DateTime), CAST(N'2022-05-21T19:29:27.743' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1084, 517, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T19:45:51.857' AS DateTime), CAST(N'2022-05-21T19:45:51.857' AS DateTime), N'999999999', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1085, 517, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-21T19:47:25.240' AS DateTime), CAST(N'2022-05-21T19:47:25.240' AS DateTime), N'2222222', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1086, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T19:49:44.457' AS DateTime), CAST(N'2022-05-21T19:49:44.460' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1087, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T20:07:40.340' AS DateTime), CAST(N'2022-05-21T20:07:40.343' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1088, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T20:11:03.153' AS DateTime), CAST(N'2022-05-21T20:11:03.153' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1089, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T20:11:53.670' AS DateTime), CAST(N'2022-05-21T20:11:53.670' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1090, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T20:11:59.323' AS DateTime), CAST(N'2022-05-21T20:11:59.323' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1091, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-21T20:12:34.280' AS DateTime), CAST(N'2022-05-21T20:12:34.280' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1092, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T11:46:00.777' AS DateTime), CAST(N'2022-05-22T11:46:00.777' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1093, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T11:49:33.467' AS DateTime), CAST(N'2022-05-22T11:49:33.467' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1094, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T11:51:14.890' AS DateTime), CAST(N'2022-05-22T11:51:14.890' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1095, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T11:52:45.333' AS DateTime), CAST(N'2022-05-22T11:52:45.333' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1096, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T11:55:37.353' AS DateTime), CAST(N'2022-05-22T11:55:37.353' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1097, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T12:01:45.770' AS DateTime), CAST(N'2022-05-22T12:01:45.770' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1098, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T12:03:21.813' AS DateTime), CAST(N'2022-05-22T12:03:21.813' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1099, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T12:05:26.773' AS DateTime), CAST(N'2022-05-22T12:05:26.773' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1100, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T12:19:21.977' AS DateTime), CAST(N'2022-05-22T12:19:21.977' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1101, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T12:20:14.453' AS DateTime), CAST(N'2022-05-22T12:20:14.453' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1102, 518, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-22T12:27:38.390' AS DateTime), CAST(N'2022-05-22T12:27:38.390' AS DateTime), N'9999998', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1103, 519, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-22T12:37:19.863' AS DateTime), CAST(N'2022-05-22T12:37:19.863' AS DateTime), N'999999', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1104, 520, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-22T18:34:18.060' AS DateTime), CAST(N'2022-05-22T18:34:18.060' AS DateTime), N'4444444', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1105, 520, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-22T18:35:56.130' AS DateTime), CAST(N'2022-05-22T18:35:56.130' AS DateTime), N'4444444', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1106, 520, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-22T18:44:09.197' AS DateTime), CAST(N'2022-05-22T18:44:09.197' AS DateTime), N'4444444', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1107, 521, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-22T20:11:09.860' AS DateTime), CAST(N'2022-05-22T20:11:09.860' AS DateTime), N'33333332', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1108, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T20:20:19.440' AS DateTime), CAST(N'2022-05-22T20:20:19.440' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1109, 522, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-22T20:35:51.150' AS DateTime), CAST(N'2022-05-22T20:35:51.150' AS DateTime), N'1111111', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1110, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T20:50:45.273' AS DateTime), CAST(N'2022-05-22T20:50:45.273' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1111, 523, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-22T21:02:12.463' AS DateTime), CAST(N'2022-05-22T21:02:12.463' AS DateTime), N'11111110', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1112, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-22T21:14:57.023' AS DateTime), CAST(N'2022-05-22T21:14:57.023' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1113, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-23T16:16:01.147' AS DateTime), CAST(N'2022-05-23T16:16:01.147' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1114, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-23T16:16:05.503' AS DateTime), CAST(N'2022-05-23T16:16:05.503' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1115, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-23T16:16:23.400' AS DateTime), CAST(N'2022-05-23T16:16:23.400' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1116, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-23T16:16:24.843' AS DateTime), CAST(N'2022-05-23T16:16:24.843' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1117, 524, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-23T16:35:35.073' AS DateTime), CAST(N'2022-05-23T16:35:35.073' AS DateTime), N'333333332', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1118, 525, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-23T17:25:49.140' AS DateTime), CAST(N'2022-05-23T17:25:49.140' AS DateTime), N'111111111109', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1119, 526, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-23T17:50:31.167' AS DateTime), CAST(N'2022-05-23T17:50:31.167' AS DateTime), N'2222220', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1120, 526, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-23T17:53:47.753' AS DateTime), CAST(N'2022-05-23T17:53:47.753' AS DateTime), N'2222220', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1121, 527, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-23T19:20:36.840' AS DateTime), CAST(N'2022-05-23T19:20:36.840' AS DateTime), N'333333331', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1122, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-23T19:22:52.293' AS DateTime), CAST(N'2022-05-23T19:22:52.293' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1123, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-23T19:30:05.223' AS DateTime), CAST(N'2022-05-23T19:30:05.223' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1124, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-23T19:31:12.783' AS DateTime), CAST(N'2022-05-23T19:31:12.783' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1125, 528, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-23T19:55:09.543' AS DateTime), CAST(N'2022-05-23T19:55:09.543' AS DateTime), N'111111109', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1126, 502, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-23T19:56:26.327' AS DateTime), CAST(N'2022-05-23T19:56:26.327' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1127, 528, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-24T15:06:04.767' AS DateTime), CAST(N'2022-05-24T15:06:04.767' AS DateTime), N'111111109', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1128, 527, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-24T15:06:33.057' AS DateTime), CAST(N'2022-05-24T15:06:33.057' AS DateTime), N'333333331', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1129, 529, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-24T16:22:49.507' AS DateTime), CAST(N'2022-05-24T16:22:49.507' AS DateTime), N'77777777', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1130, 529, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-24T16:24:33.553' AS DateTime), CAST(N'2022-05-24T16:24:33.553' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1131, 530, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-24T16:42:16.957' AS DateTime), CAST(N'2022-05-24T16:42:16.957' AS DateTime), N'11111110', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1132, 530, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-24T16:43:04.847' AS DateTime), CAST(N'2022-05-24T16:43:04.847' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1133, 530, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-24T16:54:10.577' AS DateTime), CAST(N'2022-05-24T16:54:10.577' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1134, 531, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-24T16:56:27.900' AS DateTime), CAST(N'2022-05-24T16:56:27.900' AS DateTime), N'11111111111110', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1135, 530, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-24T17:26:05.507' AS DateTime), CAST(N'2022-05-24T17:26:05.507' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1136, 532, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-24T17:54:34.787' AS DateTime), CAST(N'2022-05-24T17:54:34.787' AS DateTime), N'55555555', 1, N'')
GO
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1137, 533, N'Yura', N'Shahinyan', NULL, CAST(N'2000-02-24T00:00:00.000' AS DateTime), CAST(N'2022-05-24T18:03:37.357' AS DateTime), CAST(N'2022-05-24T18:03:37.357' AS DateTime), N'123456789', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1138, 534, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-24T18:09:07.873' AS DateTime), CAST(N'2022-05-24T18:09:07.873' AS DateTime), N'11111111108', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1139, 534, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-24T18:10:33.963' AS DateTime), CAST(N'2022-05-24T18:10:33.963' AS DateTime), N'11111111108', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1140, 535, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-24T19:01:00.773' AS DateTime), CAST(N'2022-05-24T19:01:00.773' AS DateTime), N'111111111111111', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1141, 530, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-24T19:01:34.800' AS DateTime), CAST(N'2022-05-24T19:01:34.800' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1142, 535, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-24T19:05:20.227' AS DateTime), CAST(N'2022-05-24T19:05:20.227' AS DateTime), N'111111111111111', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1143, 536, N'Name', N'Surename', NULL, CAST(N'2035-10-25T00:00:00.000' AS DateTime), CAST(N'2022-05-25T14:01:16.823' AS DateTime), CAST(N'2022-05-25T14:01:16.823' AS DateTime), N'4444444444', 3, N'Test')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1144, 535, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-25T15:38:47.480' AS DateTime), CAST(N'2022-05-25T15:38:47.480' AS DateTime), N'22222222220', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1145, 530, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T15:39:42.370' AS DateTime), CAST(N'2022-05-25T15:39:42.370' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1146, 530, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T15:41:21.100' AS DateTime), CAST(N'2022-05-25T15:41:21.100' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1147, 537, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T15:43:31.363' AS DateTime), CAST(N'2022-05-25T15:43:31.363' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1148, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T15:46:23.853' AS DateTime), CAST(N'2022-05-25T15:46:23.853' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1149, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T15:51:25.577' AS DateTime), CAST(N'2022-05-25T15:51:25.577' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1150, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T16:08:29.807' AS DateTime), CAST(N'2022-05-25T16:08:29.807' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1151, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T16:44:11.750' AS DateTime), CAST(N'2022-05-25T16:44:11.750' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1152, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T16:47:22.547' AS DateTime), CAST(N'2022-05-25T16:47:22.547' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1153, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T17:05:28.777' AS DateTime), CAST(N'2022-05-25T17:05:28.777' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1154, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T17:11:51.437' AS DateTime), CAST(N'2022-05-25T17:11:51.437' AS DateTime), N'4556565', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1155, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T17:25:38.567' AS DateTime), CAST(N'2022-05-25T17:25:38.567' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1156, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T17:54:15.973' AS DateTime), CAST(N'2022-05-25T17:54:15.973' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1157, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T18:31:05.487' AS DateTime), CAST(N'2022-05-25T18:31:05.487' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1158, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T18:43:32.857' AS DateTime), CAST(N'2022-05-25T18:43:32.857' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1159, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T18:52:13.947' AS DateTime), CAST(N'2022-05-25T18:52:13.947' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1160, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-25T18:53:26.627' AS DateTime), CAST(N'2022-05-25T18:53:26.627' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1161, 539, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-25T18:55:13.420' AS DateTime), CAST(N'2022-05-25T18:55:13.420' AS DateTime), N'1111111111', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1162, 538, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T10:04:07.633' AS DateTime), CAST(N'2022-05-26T10:04:07.633' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1163, 543, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-26T17:34:00.120' AS DateTime), CAST(N'2022-05-26T17:34:00.120' AS DateTime), N'1111110', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1164, 543, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-26T17:45:22.287' AS DateTime), CAST(N'2022-05-26T17:45:22.287' AS DateTime), N'1111110', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1165, 544, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-26T18:04:07.510' AS DateTime), CAST(N'2022-05-26T18:04:07.510' AS DateTime), N'2222222', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1166, 545, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-26T18:30:00.320' AS DateTime), CAST(N'2022-05-26T18:30:00.320' AS DateTime), N'2222222220', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1167, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T18:46:17.480' AS DateTime), CAST(N'2022-05-26T18:46:17.480' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1168, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T19:06:41.273' AS DateTime), CAST(N'2022-05-26T19:06:41.273' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1169, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T19:20:45.800' AS DateTime), CAST(N'2022-05-26T19:20:45.800' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1170, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T19:51:37.443' AS DateTime), CAST(N'2022-05-26T19:51:37.443' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1171, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T20:01:04.050' AS DateTime), CAST(N'2022-05-26T20:01:04.050' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1172, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T20:07:16.123' AS DateTime), CAST(N'2022-05-26T20:07:16.123' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1173, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T20:12:16.043' AS DateTime), CAST(N'2022-05-26T20:12:16.043' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1174, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T20:28:31.827' AS DateTime), CAST(N'2022-05-26T20:28:31.827' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1175, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-26T20:37:43.443' AS DateTime), CAST(N'2022-05-26T20:37:43.443' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1176, 546, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-27T10:07:23.403' AS DateTime), CAST(N'2022-05-27T10:07:23.403' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1177, 547, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-27T10:12:16.627' AS DateTime), CAST(N'2022-05-27T10:12:16.627' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1178, 548, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-27T10:25:59.617' AS DateTime), CAST(N'2022-05-27T10:25:59.620' AS DateTime), N'1111111111108', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1179, 548, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-27T10:39:10.610' AS DateTime), CAST(N'2022-05-27T10:39:10.610' AS DateTime), N'1111111111108', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1180, 547, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-27T11:13:57.940' AS DateTime), CAST(N'2022-05-27T11:13:57.940' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1181, 548, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-27T11:48:47.293' AS DateTime), CAST(N'2022-05-27T11:48:47.293' AS DateTime), N'1111111111108', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1182, 547, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-27T11:49:47.827' AS DateTime), CAST(N'2022-05-27T11:49:47.827' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1183, 549, N'Mher', N'Lalazaryan ', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-31T16:18:55.810' AS DateTime), CAST(N'2022-05-31T16:18:55.810' AS DateTime), N'77733651', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1184, 549, N'Mher', N'Lalazaryan ', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-31T16:19:30.097' AS DateTime), CAST(N'2022-05-31T16:19:30.097' AS DateTime), N'77733651', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1185, 550, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-31T16:57:57.170' AS DateTime), CAST(N'2022-05-31T16:57:57.170' AS DateTime), N'5555550', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1186, 551, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-31T17:36:48.200' AS DateTime), CAST(N'2022-05-31T17:36:48.200' AS DateTime), N'77777775', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1187, 552, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-31T19:57:17.467' AS DateTime), CAST(N'2022-05-31T19:57:17.467' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1188, 553, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-31T20:05:16.920' AS DateTime), CAST(N'2022-05-31T20:05:16.920' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1189, 553, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-31T20:11:04.190' AS DateTime), CAST(N'2022-05-31T20:11:04.190' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1190, 553, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-31T20:13:42.717' AS DateTime), CAST(N'2022-05-31T20:13:42.717' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1191, 554, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-31T20:15:25.933' AS DateTime), CAST(N'2022-05-31T20:15:25.933' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1192, 554, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-31T20:22:02.647' AS DateTime), CAST(N'2022-05-31T20:22:02.647' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1193, 554, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-31T20:29:07.950' AS DateTime), CAST(N'2022-05-31T20:29:07.950' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1194, 554, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-05-31T20:40:05.993' AS DateTime), CAST(N'2022-05-31T20:40:05.993' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1195, 554, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-01T12:01:30.200' AS DateTime), CAST(N'2022-06-01T12:01:30.200' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1196, 554, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-01T15:34:26.617' AS DateTime), CAST(N'2022-06-01T15:34:26.617' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1197, 554, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-01T15:37:01.510' AS DateTime), CAST(N'2022-06-01T15:37:01.510' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1198, 554, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-01T16:06:19.833' AS DateTime), CAST(N'2022-06-01T16:06:19.833' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1199, 555, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-01T16:12:00.473' AS DateTime), CAST(N'2022-06-01T16:12:00.473' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1200, 555, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-02T14:22:06.207' AS DateTime), CAST(N'2022-06-02T14:22:06.207' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1201, 555, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-02T19:58:37.307' AS DateTime), CAST(N'2022-06-02T19:58:37.307' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1202, 557, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'2022-06-03T12:57:26.957' AS DateTime), CAST(N'2022-06-03T12:57:26.957' AS DateTime), N'5454', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1203, 558, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-06-03T00:00:00.000' AS DateTime), CAST(N'2022-06-03T13:15:05.323' AS DateTime), CAST(N'2022-06-03T13:15:05.323' AS DateTime), N'44444', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1204, 559, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-04T19:30:30.680' AS DateTime), CAST(N'2022-06-04T19:30:30.680' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1205, 561, N'Poxosyan', N'poxodg', NULL, CAST(N'2022-06-02T00:00:00.000' AS DateTime), CAST(N'2022-06-06T04:51:32.433' AS DateTime), CAST(N'2022-06-06T04:51:32.433' AS DateTime), N'534534', 1, N'xbffgncvsd')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1206, 562, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-06-05T00:00:00.000' AS DateTime), CAST(N'2022-06-06T12:37:51.693' AS DateTime), CAST(N'2022-06-06T12:37:51.693' AS DateTime), N'1111111111', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1207, 563, N'Diana', N'Voskanyan', NULL, CAST(N'2000-04-02T00:00:00.000' AS DateTime), CAST(N'2022-06-06T12:57:50.400' AS DateTime), CAST(N'2022-06-06T12:57:50.400' AS DateTime), N'37495545040', 2, N'Apreq txerq jan')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1208, 563, N'Diana', N'Voskanyan', NULL, CAST(N'2000-04-02T00:00:00.000' AS DateTime), CAST(N'2022-06-06T12:57:51.287' AS DateTime), CAST(N'2022-06-06T12:57:51.287' AS DateTime), N'37495545040', 2, N'Apreq txerq jan')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1209, 563, N'Diana', N'Voskanyan', NULL, CAST(N'2000-04-02T00:00:00.000' AS DateTime), CAST(N'2022-06-06T12:57:56.730' AS DateTime), CAST(N'2022-06-06T12:57:56.730' AS DateTime), N'37495545040', 2, N'Apreq txerq jan')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1210, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:19:11.627' AS DateTime), CAST(N'2022-06-06T18:19:11.627' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1211, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:19:40.210' AS DateTime), CAST(N'2022-06-06T18:19:40.210' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1212, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:19:58.167' AS DateTime), CAST(N'2022-06-06T18:19:58.167' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1213, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:19:58.843' AS DateTime), CAST(N'2022-06-06T18:19:58.843' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1214, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:19:58.850' AS DateTime), CAST(N'2022-06-06T18:19:58.850' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1215, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:19:59.400' AS DateTime), CAST(N'2022-06-06T18:19:59.400' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1216, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:20:15.080' AS DateTime), CAST(N'2022-06-06T18:20:15.080' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1217, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:20:15.790' AS DateTime), CAST(N'2022-06-06T18:20:15.790' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1218, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:21:07.407' AS DateTime), CAST(N'2022-06-06T18:21:07.407' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1219, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:21:09.587' AS DateTime), CAST(N'2022-06-06T18:21:09.587' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1220, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:42.553' AS DateTime), CAST(N'2022-06-06T18:22:42.553' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1221, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:44.830' AS DateTime), CAST(N'2022-06-06T18:22:44.830' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1222, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:46.553' AS DateTime), CAST(N'2022-06-06T18:22:46.553' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1223, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:47.503' AS DateTime), CAST(N'2022-06-06T18:22:47.503' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1224, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:47.760' AS DateTime), CAST(N'2022-06-06T18:22:47.760' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1225, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:48.027' AS DateTime), CAST(N'2022-06-06T18:22:48.027' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1226, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:48.367' AS DateTime), CAST(N'2022-06-06T18:22:48.367' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1227, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:48.447' AS DateTime), CAST(N'2022-06-06T18:22:48.447' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1228, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:53.437' AS DateTime), CAST(N'2022-06-06T18:22:53.437' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1229, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:57.607' AS DateTime), CAST(N'2022-06-06T18:22:57.607' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1230, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:58.443' AS DateTime), CAST(N'2022-06-06T18:22:58.443' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1231, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:58.470' AS DateTime), CAST(N'2022-06-06T18:22:58.470' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1232, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:22:59.017' AS DateTime), CAST(N'2022-06-06T18:22:59.017' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1233, 564, N'Gavril', N'Alaverdyan', NULL, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:23:11.080' AS DateTime), CAST(N'2022-06-06T18:23:11.080' AS DateTime), N'077108751', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1234, 565, N'Petros', N'Vardanyan', NULL, CAST(N'2022-06-05T00:00:00.000' AS DateTime), CAST(N'2022-06-06T18:26:58.177' AS DateTime), CAST(N'2022-06-06T18:26:58.177' AS DateTime), N'077204253', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1235, 567, N'Hakop', N'Sargsyan', NULL, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-06-08T18:24:13.177' AS DateTime), CAST(N'2022-06-08T18:24:13.177' AS DateTime), N'077203040', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1236, 568, N'Inga ', N'Arshakyan', NULL, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'2022-06-11T15:00:25.060' AS DateTime), CAST(N'2022-06-11T15:00:25.060' AS DateTime), N'043108752', 2, N'')
GO
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1237, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T12:58:57.860' AS DateTime), CAST(N'2022-06-15T12:58:57.860' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1238, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T13:02:05.150' AS DateTime), CAST(N'2022-06-15T13:02:05.150' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1239, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T13:22:44.457' AS DateTime), CAST(N'2022-06-15T13:22:44.457' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1240, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T14:03:10.000' AS DateTime), CAST(N'2022-06-15T14:03:10.000' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1241, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T14:16:16.273' AS DateTime), CAST(N'2022-06-15T14:16:16.273' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1242, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T14:30:31.490' AS DateTime), CAST(N'2022-06-15T14:30:31.490' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1243, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T14:36:42.240' AS DateTime), CAST(N'2022-06-15T14:36:42.240' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1244, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T14:38:44.253' AS DateTime), CAST(N'2022-06-15T14:38:44.253' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1245, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T14:40:46.197' AS DateTime), CAST(N'2022-06-15T14:40:46.197' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1246, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T17:39:08.827' AS DateTime), CAST(N'2022-06-15T17:39:08.827' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1247, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T17:43:57.880' AS DateTime), CAST(N'2022-06-15T17:43:57.880' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1248, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T17:47:03.113' AS DateTime), CAST(N'2022-06-15T17:47:03.113' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1249, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T17:49:37.300' AS DateTime), CAST(N'2022-06-15T17:49:37.300' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1250, 569, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-15T18:14:24.557' AS DateTime), CAST(N'2022-06-15T18:14:24.557' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1251, 570, N'Vahe', N'Mkrtchyan', NULL, CAST(N'2022-06-02T00:00:00.000' AS DateTime), CAST(N'2022-06-16T20:33:28.510' AS DateTime), CAST(N'2022-06-16T20:33:28.510' AS DateTime), N'37444545046', 1, N'dfsdczdfsdcdsfsdc')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1252, 570, N'Vahe', N'Mkrtchyan', NULL, CAST(N'2022-06-02T00:00:00.000' AS DateTime), CAST(N'2022-06-16T20:33:39.403' AS DateTime), CAST(N'2022-06-16T20:33:39.403' AS DateTime), N'37444545046', 1, N'dfsdczdfsdcdsfsdc')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1253, 571, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-03-20T20:00:12.110' AS DateTime), CAST(N'2022-06-17T18:22:02.830' AS DateTime), CAST(N'2022-06-17T18:22:02.830' AS DateTime), N'4556565', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1254, 572, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'2022-06-18T05:36:13.410' AS DateTime), CAST(N'2022-06-18T05:36:13.410' AS DateTime), N'4444444440', 2, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1255, 573, N'Gevog', N'Sargsyan', NULL, CAST(N'1972-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-18T22:42:31.520' AS DateTime), CAST(N'2022-06-18T22:42:31.520' AS DateTime), N'3238558276', 1, N'Magadan')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1256, 573, N'Gevog', N'Sargsyan', NULL, CAST(N'1972-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-18T22:42:37.407' AS DateTime), CAST(N'2022-06-18T22:42:37.407' AS DateTime), N'3238558276', 1, N'Magadan')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1257, 573, N'Gevog', N'Sargsyan', NULL, CAST(N'1972-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-18T22:42:48.430' AS DateTime), CAST(N'2022-06-18T22:42:48.430' AS DateTime), N'3238558276', 1, N'Magadan')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1258, 573, N'Gevog', N'Sargsyan', NULL, CAST(N'1972-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-18T22:42:48.893' AS DateTime), CAST(N'2022-06-18T22:42:48.893' AS DateTime), N'3238558276', 1, N'Magadan')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1259, 573, N'Gevog', N'Sargsyan', NULL, CAST(N'1972-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-18T22:43:18.083' AS DateTime), CAST(N'2022-06-18T22:43:18.083' AS DateTime), N'3238558276', 1, N'Magadan')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1260, 573, N'Gevog', N'Sargsyan', NULL, CAST(N'1972-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-18T22:43:18.837' AS DateTime), CAST(N'2022-06-18T22:43:18.837' AS DateTime), N'3238558276', 1, N'Magadan')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1261, 574, N'Alexander', N'Hakobyan', NULL, CAST(N'1998-05-24T00:00:00.000' AS DateTime), CAST(N'2022-06-22T09:06:11.680' AS DateTime), CAST(N'2022-06-22T09:06:11.680' AS DateTime), N'37441278304', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1262, 574, N'Alexander', N'Hakobyan', NULL, CAST(N'1998-05-24T00:00:00.000' AS DateTime), CAST(N'2022-06-22T09:06:13.253' AS DateTime), CAST(N'2022-06-22T09:06:13.253' AS DateTime), N'37441278304', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1263, 575, N'Mher', N'Lalazaryan', NULL, CAST(N'2022-06-05T00:00:00.000' AS DateTime), CAST(N'2022-06-24T16:34:04.513' AS DateTime), CAST(N'2022-06-24T16:34:04.513' AS DateTime), N'545455645', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1264, 594, N'Vahe', N'Mkrtchyan', NULL, CAST(N'2022-07-06T00:00:00.000' AS DateTime), CAST(N'2022-06-30T20:01:13.800' AS DateTime), CAST(N'2022-06-30T20:01:13.800' AS DateTime), N'044545045', 1, N'Hi Mher please review my PR.
')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1265, 595, N'Rouben', N'Gargaloyan', NULL, CAST(N'1970-02-02T00:00:00.000' AS DateTime), CAST(N'2022-10-01T19:15:05.920' AS DateTime), CAST(N'2022-10-01T19:15:05.920' AS DateTime), N'8184340947', 1, N'Test student registration')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1266, 595, N'Rouben', N'Gargaloyan', NULL, CAST(N'1970-02-02T00:00:00.000' AS DateTime), CAST(N'2022-10-01T19:15:12.433' AS DateTime), CAST(N'2022-10-01T19:15:12.433' AS DateTime), N'8184340947', 1, N'Test student registration')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1267, 595, N'Rouben', N'Gargaloyan', NULL, CAST(N'1970-02-02T00:00:00.000' AS DateTime), CAST(N'2022-10-01T19:15:27.523' AS DateTime), CAST(N'2022-10-01T19:15:27.523' AS DateTime), N'8184340947', 1, N'Test student registration')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1268, 595, N'Rouben', N'Gargaloyan', NULL, CAST(N'1970-02-02T00:00:00.000' AS DateTime), CAST(N'2022-10-01T19:15:34.553' AS DateTime), CAST(N'2022-10-01T19:15:34.553' AS DateTime), N'8184340947', 1, N'Test student registration')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1269, 595, N'Rouben', N'Gargaloyan', NULL, CAST(N'1970-02-02T00:00:00.000' AS DateTime), CAST(N'2022-10-01T19:15:40.400' AS DateTime), CAST(N'2022-10-01T19:15:40.400' AS DateTime), N'8184340947', 1, N'Test student registration')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1270, 596, N'Hrant', N'Janoyan', NULL, CAST(N'1998-04-11T00:00:00.000' AS DateTime), CAST(N'2022-11-03T06:43:53.333' AS DateTime), CAST(N'2022-11-03T06:43:53.333' AS DateTime), N'077112241', 1, N'')
INSERT [dbo].[UserInformation] ([Id], [UserId], [FirstName], [LastName], [MiddleName], [DateOfBirth], [CreateDate], [UpdateDate], [PhoneNumber], [Gender], [Metadata]) VALUES (1271, 596, N'Hrant', N'Janoyan', NULL, CAST(N'1998-04-11T00:00:00.000' AS DateTime), CAST(N'2022-11-03T06:43:59.660' AS DateTime), CAST(N'2022-11-03T06:43:59.660' AS DateTime), N'077112241', 1, N'')
SET IDENTITY_INSERT [dbo].[UserInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([Id], [Description]) VALUES (5, N'Admin')
INSERT [dbo].[UserType] ([Id], [Description]) VALUES (6, N'AccountManager')
INSERT [dbo].[UserType] ([Id], [Description]) VALUES (7, N'Beneficiary')
INSERT [dbo].[UserType] ([Id], [Description]) VALUES (8, N'Investor')
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
ALTER TABLE [dbo].[AccountProgress]  WITH CHECK ADD  CONSTRAINT [FK_AccountProgress_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[AccountProgress] CHECK CONSTRAINT [FK_AccountProgress_Account]
GO
ALTER TABLE [dbo].[AccountUserInformationConnection]  WITH CHECK ADD  CONSTRAINT [FK_AccountUserInformationConnection_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[AccountUserInformationConnection] CHECK CONSTRAINT [FK_AccountUserInformationConnection_Account]
GO
ALTER TABLE [dbo].[AccountUserInformationConnection]  WITH CHECK ADD  CONSTRAINT [FK_AccountUserInformationConnection_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AccountUserInformationConnection] CHECK CONSTRAINT [FK_AccountUserInformationConnection_User]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_InvestorInformation] FOREIGN KEY([InvestorId])
REFERENCES [dbo].[InvestorInformation] ([Id])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_InvestorInformation]
GO
ALTER TABLE [dbo].[InvestorInformation]  WITH CHECK ADD  CONSTRAINT [FK_InvestorInformation_InvestorTierType] FOREIGN KEY([InvestorTierId])
REFERENCES [dbo].[InvestorTierType] ([Id])
GO
ALTER TABLE [dbo].[InvestorInformation] CHECK CONSTRAINT [FK_InvestorInformation_InvestorTierType]
GO
ALTER TABLE [dbo].[InvestorInformation]  WITH CHECK ADD  CONSTRAINT [FK_InvestorInformation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[InvestorInformation] CHECK CONSTRAINT [FK_InvestorInformation_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Attachment] FOREIGN KEY([AttachmentId])
REFERENCES [dbo].[Attachment] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Attachment]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_NotificationType] FOREIGN KEY([NotificationTypeId])
REFERENCES [dbo].[NotificationType] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_NotificationType]
GO
ALTER TABLE [dbo].[Notification2User]  WITH CHECK ADD  CONSTRAINT [FK_Notification2User_Notification] FOREIGN KEY([NotificationId])
REFERENCES [dbo].[Notification] ([Id])
GO
ALTER TABLE [dbo].[Notification2User] CHECK CONSTRAINT [FK_Notification2User_Notification]
GO
ALTER TABLE [dbo].[Notification2User]  WITH CHECK ADD  CONSTRAINT [FK_Notification2User_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Notification2User] CHECK CONSTRAINT [FK_Notification2User_User]
GO
ALTER TABLE [dbo].[NotificationBroadcast]  WITH CHECK ADD  CONSTRAINT [FK_NotificationBroadcast_Notification] FOREIGN KEY([NotificationId])
REFERENCES [dbo].[Notification] ([Id])
GO
ALTER TABLE [dbo].[NotificationBroadcast] CHECK CONSTRAINT [FK_NotificationBroadcast_Notification]
GO
ALTER TABLE [dbo].[NotificationBroadcast]  WITH CHECK ADD  CONSTRAINT [FK_NotificationBroadcast_NotificationType] FOREIGN KEY([NotificationTransportTypeId])
REFERENCES [dbo].[NotificationTransportType] ([Id])
GO
ALTER TABLE [dbo].[NotificationBroadcast] CHECK CONSTRAINT [FK_NotificationBroadcast_NotificationType]
GO
ALTER TABLE [dbo].[User2UserType]  WITH CHECK ADD  CONSTRAINT [FK_User2UserType_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User2UserType] CHECK CONSTRAINT [FK_User2UserType_User1]
GO
ALTER TABLE [dbo].[User2UserType]  WITH CHECK ADD  CONSTRAINT [FK_User2UserType_UserType1] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserType] ([Id])
GO
ALTER TABLE [dbo].[User2UserType] CHECK CONSTRAINT [FK_User2UserType_UserType1]
GO
ALTER TABLE [dbo].[UserIdea]  WITH CHECK ADD  CONSTRAINT [FK_UserIdea_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserIdea] CHECK CONSTRAINT [FK_UserIdea_User]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_User]
GO
ALTER TABLE [dbo].[UserInventory]  WITH CHECK ADD  CONSTRAINT [FK_AccountManagerInventory_InventoryType] FOREIGN KEY([InventoryTypeId])
REFERENCES [dbo].[InventoryType] ([Id])
GO
ALTER TABLE [dbo].[UserInventory] CHECK CONSTRAINT [FK_AccountManagerInventory_InventoryType]
GO
ALTER TABLE [dbo].[UserInventory]  WITH CHECK ADD  CONSTRAINT [FK_UserInventory_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserInventory] CHECK CONSTRAINT [FK_UserInventory_User]
GO
ALTER TABLE [dbo].[UserRoleConnection]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleConnection_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRoleConnection] CHECK CONSTRAINT [FK_UserRoleConnection_Role]
GO
ALTER TABLE [dbo].[UserRoleConnection]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleConnection_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRoleConnection] CHECK CONSTRAINT [FK_UserRoleConnection_User]
GO
/****** Object:  StoredProcedure [dbo].[CreateInvestor]    Script Date: 7/11/2023 12:37:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateInvestor] 
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50), 
	@LastName nvarchar(50), 
	@PhoneNumber int,
	@Email nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF (EXISTS(SELECT *
		       FROM [dbo].[Investor]
			   WHERE [Name] = @FirstName and [LastName] = @LastName) )
    BEGIN 
		UPDATE [dbo].[Investor]
			SET 
				[PhoneNumber] = @PhoneNumber
			   ,[Email] = @Email
		WHERE [Name] = @FirstName and [LastName] = @LastName

	END
	ELSE BEGIN
		INSERT INTO [dbo].[Investor]
	    SELECT @FirstName, @LastName, @PhoneNumber, @Email
	END
    -- Insert statements for procedure here	   

						
END
GO
/****** Object:  StoredProcedure [dbo].[GetDonationEmail]    Script Date: 7/11/2023 12:37:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDonationEmail] 
	-- Add the parameters for the stored procedure here
	@Year INT = 0, 
	@EmailBody VARCHAR(512) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @DefaultEmailBody VARCHAR(512)
	IF (@EmailBody is null)
	BEGIN
		SET @EmailBody = 'Dear @NAME, Thank you for your generous donation in the amount of @AMOUNT. Best regards, Learning Mission team.'
	END
	IF(@Year = 0) 
	BEGIN 
		SET @Year =  DATEPART(year, GETUTCDATE()) 
	END
    -- Insert statements for procedure here
    SELECT REPLACE(REPLACE(@EmailBody, '@NAME', Investor.Name + ' ' + Investor.LastName), '@AMOUNT', AllCount)
    FROM Investor
    INNER JOIN
		(SELECT Donation.NameId
			,SUM(Donation.Amount) AS AllCount
		FROM   Donation
		INNER JOIN Investor 
	 ON Donation.NameId = Investor.Id
		WHERE  DATEPART(year, Donation.DateOfCharity) = @Year
		GROUP BY Donation.NameId) AS DonationSumarry
		ON Investor.Id = DonationSumarry.NameId
	END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'From Progress in account' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountProgress', @level2type=N'COLUMN',@level2name=N'Id'
GO
