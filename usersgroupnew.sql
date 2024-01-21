USE [NPOManagement]
GO
/****** Object:  Table [dbo].[UserGroupMembership]    Script Date: 21.01.2024 23:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserGroupMembership]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserGroupMembership](
	[UserId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UsersGroup]    Script Date: 21.01.2024 23:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatorId] [int] NOT NULL,
	[GroupName] [nvarchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK__UsersGro__3214EC0700A942C1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__UsersGrou__Creat__160F4887]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UsersGroup] ADD  CONSTRAINT [DF__UsersGrou__Creat__160F4887]  DEFAULT (getdate()) FOR [DateCreated]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UsersGroup_DateModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UsersGroup] ADD  CONSTRAINT [DF_UsersGroup_DateModified]  DEFAULT (getdate()) FOR [DateModified]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UserGroup__Group__19DFD96B]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserGroupMembership]'))
ALTER TABLE [dbo].[UserGroupMembership]  WITH CHECK ADD  CONSTRAINT [FK__UserGroup__Group__19DFD96B] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UsersGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UserGroup__Group__19DFD96B]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserGroupMembership]'))
ALTER TABLE [dbo].[UserGroupMembership] CHECK CONSTRAINT [FK__UserGroup__Group__19DFD96B]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UserGroup__UserI__18EBB532]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserGroupMembership]'))
ALTER TABLE [dbo].[UserGroupMembership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroup_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroup]'))
ALTER TABLE [dbo].[UsersGroup]  WITH CHECK ADD  CONSTRAINT [FK_UsersGroup_User] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersGroup_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersGroup]'))
ALTER TABLE [dbo].[UsersGroup] CHECK CONSTRAINT [FK_UsersGroup_User]
GO
