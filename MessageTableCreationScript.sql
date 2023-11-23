USE [NPOManagement]
GO

/****** Object:  Table [dbo].[Message]    Script Date: 11/24/2023 12:59:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[RecipientId] [int] NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[Message] [text] NOT NULL,
	[Secret] [bit] NOT NULL,
	[Opened] [bit] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Table_1_isSecure]  DEFAULT ((0)) FOR [Secret]
GO

ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_Opened]  DEFAULT ((0)) FOR [Opened]
GO


USE [NPOManagement]
GO

/****** Object:  Table [dbo].[MessageKey]    Script Date: 11/24/2023 12:59:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MessageKey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MessageId] [int] NOT NULL,
	[PrivateKey] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MessageKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


