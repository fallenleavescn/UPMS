USE Master
GO

CREATE DATABASE UPMS
GO

USE UPMS
GO

IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[CardLevels]') AND type IN ('U'))
	DROP TABLE [dbo].[CardLevels]
GO

CREATE TABLE [dbo].[CardLevels] (
  [CL_ID] int  IDENTITY(1,1) NOT NULL,
  [CL_LevelName] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [CL_NeedPoint] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [CL_Point] float(53)  NULL,
  [CL_Percent] float(53)  NULL
)
GO

ALTER TABLE [dbo].[CardLevels] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of CardLevels
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[CardLevels] ON
GO

INSERT INTO [dbo].[CardLevels] ([CL_ID], [CL_LevelName], [CL_NeedPoint], [CL_Point], [CL_Percent]) VALUES (N'1', N'普通会员', N'100', N'10.000000000000000', N'1.000000000000000')
GO

INSERT INTO [dbo].[CardLevels] ([CL_ID], [CL_LevelName], [CL_NeedPoint], [CL_Point], [CL_Percent]) VALUES (N'2', N'银卡会员', N'500', N'8.000000000000000', N'0.900000000000000')
GO

INSERT INTO [dbo].[CardLevels] ([CL_ID], [CL_LevelName], [CL_NeedPoint], [CL_Point], [CL_Percent]) VALUES (N'3', N'金卡会员', N'1000', N'6.000000000000000', N'0.800000000000000')
GO

INSERT INTO [dbo].[CardLevels] ([CL_ID], [CL_LevelName], [CL_NeedPoint], [CL_Point], [CL_Percent]) VALUES (N'4', N'至尊VIP', N'5000', N'5.000000000000000', N'0.700000000000000')
GO

SET IDENTITY_INSERT [dbo].[CardLevels] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for Categories
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type IN ('U'))
	DROP TABLE [dbo].[Categories]
GO

CREATE TABLE [dbo].[Categories] (
  [C_Category] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [C_Illustration] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [C_IsShow] bit  NULL
)
GO

ALTER TABLE [dbo].[Categories] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Categories
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[Categories]  VALUES (N'CO_OrderType', N'订单类型', NULL)
GO

INSERT INTO [dbo].[Categories]  VALUES (N'MC_State', N'卡片状态', NULL)
GO

INSERT INTO [dbo].[Categories]  VALUES (N'S_Category', N'店铺类别', NULL)
GO

INSERT INTO [dbo].[Categories]  VALUES (N'U_Role', N'用户角色', NULL)
GO

COMMIT
GO


-- ----------------------------
-- Table structure for CategoryItems
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryItems]') AND type IN ('U'))
	DROP TABLE [dbo].[CategoryItems]
GO

CREATE TABLE [dbo].[CategoryItems] (
  [CI_KeyID] int  IDENTITY(1,1) NOT NULL,
  [C_Category] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [CI_ID] int  NULL,
  [CI_Name] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[CategoryItems] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of CategoryItems
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[CategoryItems] ON
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'1', N'S_Category', N'1', N'总部')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'2', N'S_Category', N'2', N'加盟店')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'3', N'S_Category', N'3', N'自营店')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'4', N'U_Role', N'1', N'系统管理员')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'5', N'U_Role', N'2', N'店长')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'6', N'U_Role', N'3', N'业务员')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'7', N'MC_State', N'1', N'正常')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'8', N'MC_State', N'2', N'挂失')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'9', N'MC_State', N'3', N'锁定')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'10', N'CO_OrderType', N'1', N'兑换积分')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'11', N'CO_OrderType', N'2', N'积分返现')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'12', N'CO_OrderType', N'3', N'减积分')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'13', N'CO_OrderType', N'4', N'转介绍积分')
GO

INSERT INTO [dbo].[CategoryItems] ([CI_KeyID], [C_Category], [CI_ID], [CI_Name]) VALUES (N'14', N'CO_OrderType', N'5', N'快速消费')
GO

SET IDENTITY_INSERT [dbo].[CategoryItems] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for ConsumeOrders
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ConsumeOrders]') AND type IN ('U'))
	DROP TABLE [dbo].[ConsumeOrders]
GO

CREATE TABLE [dbo].[ConsumeOrders] (
  [CO_ID] int  IDENTITY(1,1) NOT NULL,
  [S_ID] int  NULL,
  [U_ID] int  NULL,
  [CO_OrderCode] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [CO_OrderType] tinyint  NULL,
  [MC_ID] int  NULL,
  [MC_CardID] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [EG_ID] int  NULL,
  [CO_TotalMoney] real  NULL,
  [CO_DiscountMoney] real  NULL,
  [CO_GavePoint] int  NULL,
  [CO_Recash] real  NULL,
  [CO_Remark] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [CO_CreateTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[ConsumeOrders] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ConsumeOrders
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[ConsumeOrders] ON
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'1', N'2', N'1', N'20100607020605', N'5', N'1', N'800000', N'0', N'100.0000000', N'70.0000000', N'20', N'0.0000000', N'快速消费', N'2010-01-07 02:06:05.280')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'2', N'2', N'1', N'20100807020805', N'3', N'1', N'800000', N'0', N'0.0000000', N'0.0000000', N'35', N'0.0000000', N'', N'2010-01-07 02:08:05.687')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'3', N'2', N'1', N'20100207040203', N'2', N'1', N'800000', N'0', N'0.0000000', N'0.0000000', N'10', N'1.0000000', N'', N'2010-01-07 04:02:03.187')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'4', N'2', N'1', N'20102809072800', N'5', N'1', N'800000', N'0', N'200.0000000', N'140.0000000', N'40', N'0.0000000', N'快速消费', N'2010-01-09 07:28:00.640')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'5', N'2', N'1', N'20104109074128', N'5', N'4', N'800003', N'0', N'2000.0000000', N'2000.0000000', N'200', N'0.0000000', N'快速消费', N'2010-01-09 07:41:28.640')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'6', N'2', N'1', N'20105509095527', N'5', N'4', N'800003', N'0', N'100.0000000', N'100.0000000', N'10', N'0.0000000', N'快速消费', N'2010-01-09 09:55:27.623')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'7', N'2', N'1', N'20105509095538', N'5', N'3', N'800002', N'0', N'1000.0000000', N'1000.0000000', N'100', N'0.0000000', N'快速消费', N'2010-01-09 09:55:38.657')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'8', N'2', N'1', N'20105210025258', N'5', N'3', N'800002', N'0', N'100.0000000', N'100.0000000', N'10', N'0.0000000', N'快速消费', N'2010-01-10 02:52:58.750')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'9', N'2', N'1', N'20105310025309', N'5', N'6', N'800005', N'0', N'1000.0000000', N'1000.0000000', N'100', N'0.0000000', N'快速消费', N'2010-01-10 02:53:09.687')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'10', N'2', N'1', N'20105310025319', N'5', N'7', N'800006', N'0', N'500.0000000', N'500.0000000', N'50', N'0.0000000', N'快速消费', N'2010-01-10 02:53:19.907')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'11', N'2', N'1', N'20105310025332', N'5', N'9', N'800008', N'0', N'600.0000000', N'600.0000000', N'60', N'0.0000000', N'快速消费', N'2010-01-10 02:53:32.813')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'12', N'2', N'1', N'20105310025341', N'5', N'8', N'800007', N'0', N'5000.0000000', N'5000.0000000', N'500', N'0.0000000', N'快速消费', N'2010-01-10 02:53:41.750')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'13', N'2', N'1', N'20105310025352', N'5', N'10', N'800009', N'0', N'800.0000000', N'800.0000000', N'80', N'0.0000000', N'快速消费', N'2010-01-10 02:53:52.720')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'14', N'2', N'1', N'20100110070139', N'5', N'1', N'800000', N'0', N'10000.0000000', N'7000.0000000', N'2000', N'0.0000000', N'快速消费', N'2010-01-10 07:01:39.030')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'15', N'2', N'1', N'20105410075411', N'3', N'3', N'800002', N'0', N'0.0000000', N'0.0000000', N'10', N'0.0000000', N'', N'2010-01-10 07:54:11.267')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'16', N'2', N'1', N'20105410075423', N'3', N'4', N'800003', N'0', N'0.0000000', N'0.0000000', N'60', N'0.0000000', N'', N'2010-01-10 07:54:23.953')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'17', N'2', N'1', N'20105410075448', N'3', N'7', N'800006', N'0', N'0.0000000', N'0.0000000', N'20', N'0.0000000', N'', N'2010-01-10 07:54:48.157')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'18', N'2', N'1', N'20105410075455', N'3', N'8', N'800007', N'0', N'0.0000000', N'0.0000000', N'100', N'0.0000000', N'', N'2010-01-10 07:54:55.157')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'19', N'2', N'1', N'20105510075503', N'3', N'10', N'800009', N'0', N'0.0000000', N'0.0000000', N'30', N'0.0000000', N'', N'2010-01-10 07:55:03.983')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'20', N'2', N'1', N'20105510075517', N'3', N'1', N'800000', N'0', N'0.0000000', N'0.0000000', N'10', N'0.0000000', N'', N'2010-01-10 07:55:17.767')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'21', N'2', N'1', N'20105510075523', N'3', N'1', N'800000', N'0', N'0.0000000', N'0.0000000', N'10', N'0.0000000', N'', N'2010-01-10 07:55:23.517')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'22', N'2', N'1', N'20105510075528', N'3', N'1', N'800000', N'0', N'0.0000000', N'0.0000000', N'10', N'0.0000000', N'', N'2010-01-10 07:55:28.610')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'23', N'2', N'1', N'20105510075537', N'3', N'1', N'800000', N'0', N'0.0000000', N'0.0000000', N'10', N'0.0000000', N'', N'2010-01-10 07:55:37.547')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'24', N'2', N'1', N'20105510075548', N'3', N'1', N'800000', N'0', N'0.0000000', N'0.0000000', N'100', N'0.0000000', N'', N'2010-01-10 07:55:48.797')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'25', N'2', N'1', N'20101810081854', N'2', N'1', N'800000', N'0', N'0.0000000', N'0.0000000', N'1000', N'100.0000000', N'', N'2010-01-10 08:18:54.610')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'26', N'2', N'1', N'20101910081950', N'2', N'6', N'800005', N'0', N'0.0000000', N'0.0000000', N'10', N'1.0000000', N'', N'2010-01-10 08:19:50.750')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'27', N'2', N'1', N'20101910081959', N'2', N'4', N'800003', N'0', N'0.0000000', N'0.0000000', N'100', N'10.0000000', N'', N'2010-01-10 08:19:59.313')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'28', N'2', N'1', N'20102010082007', N'2', N'7', N'800006', N'0', N'0.0000000', N'0.0000000', N'10', N'1.0000000', N'', N'2010-01-10 08:20:07.233')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'29', N'2', N'1', N'20102010082014', N'2', N'10', N'800009', N'0', N'0.0000000', N'0.0000000', N'20', N'2.0000000', N'', N'2010-01-10 08:20:14.827')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'30', N'2', N'1', N'20102010082023', N'2', N'9', N'800008', N'0', N'0.0000000', N'0.0000000', N'50', N'5.0000000', N'', N'2010-01-10 08:20:23.157')
GO

INSERT INTO [dbo].[ConsumeOrders] ([CO_ID], [S_ID], [U_ID], [CO_OrderCode], [CO_OrderType], [MC_ID], [MC_CardID], [EG_ID], [CO_TotalMoney], [CO_DiscountMoney], [CO_GavePoint], [CO_Recash], [CO_Remark], [CO_CreateTime]) VALUES (N'31', N'2', N'1', N'20102810082850', N'5', N'2', N'800001', N'0', N'100.0000000', N'100.0000000', N'10', N'0.0000000', N'快速消费', N'2010-01-10 08:28:50.780')
GO

SET IDENTITY_INSERT [dbo].[ConsumeOrders] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for ExchangGifts
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ExchangGifts]') AND type IN ('U'))
	DROP TABLE [dbo].[ExchangGifts]
GO

CREATE TABLE [dbo].[ExchangGifts] (
  [EG_ID] int  IDENTITY(1,1) NOT NULL,
  [S_ID] int  NULL,
  [EG_GiftCode] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [EG_GiftName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [EG_Photo] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [EG_Point] int  NULL,
  [EG_Number] int  NULL,
  [EG_ExchangNum] int  NULL,
  [EG_Remark] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[ExchangGifts] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ExchangGifts
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[ExchangGifts] ON
GO

INSERT INTO [dbo].[ExchangGifts] ([EG_ID], [S_ID], [EG_GiftCode], [EG_GiftName], [EG_Photo], [EG_Point], [EG_Number], [EG_ExchangNum], [EG_Remark]) VALUES (N'1', N'1', N'20150101', N'巧克力', N'', N'100', N'1000', N'605', N'')
GO

INSERT INTO [dbo].[ExchangGifts] ([EG_ID], [S_ID], [EG_GiftCode], [EG_GiftName], [EG_Photo], [EG_Point], [EG_Number], [EG_ExchangNum], [EG_Remark]) VALUES (N'2', N'2', N'20150102', N'棒棒糖', NULL, N'5', N'100', N'5', NULL)
GO

INSERT INTO [dbo].[ExchangGifts] ([EG_ID], [S_ID], [EG_GiftCode], [EG_GiftName], [EG_Photo], [EG_Point], [EG_Number], [EG_ExchangNum], [EG_Remark]) VALUES (N'3', N'2', N'20150103', N'话梅', NULL, N'10', N'200', N'7', NULL)
GO

INSERT INTO [dbo].[ExchangGifts] ([EG_ID], [S_ID], [EG_GiftCode], [EG_GiftName], [EG_Photo], [EG_Point], [EG_Number], [EG_ExchangNum], [EG_Remark]) VALUES (N'4', N'2', N'20150104', N'面包', NULL, N'10', N'1000', N'9', NULL)
GO

SET IDENTITY_INSERT [dbo].[ExchangGifts] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for ExchangLogs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ExchangLogs]') AND type IN ('U'))
	DROP TABLE [dbo].[ExchangLogs]
GO

CREATE TABLE [dbo].[ExchangLogs] (
  [EL_ID] int  IDENTITY(1,1) NOT NULL,
  [S_ID] int  NULL,
  [U_ID] int  NULL,
  [MC_ID] int  NULL,
  [MC_CardID] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [MC_Name] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [EG_ID] int  NULL,
  [EG_GiftCode] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [EG_GiftName] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [EL_Number] int  NULL,
  [EL_Point] int  NULL,
  [EL_CreateTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[ExchangLogs] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ExchangLogs
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[ExchangLogs] ON
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'1', N'2', N'1', N'1', N'8', N'郑安涛', N'1', N'20150101', N'巧克力', N'2', N'200', N'2010-01-03 10:57:40.657')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'2', N'2', N'1', N'1', N'8', N'郑安涛', N'2', N'20150102', N'棒棒糖', N'3', N'15', N'2010-01-03 10:57:40.733')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'3', N'2', N'1', N'1', N'8', N'郑安涛', N'3', N'20150103', N'话梅', N'4', N'40', N'2010-01-03 10:57:40.733')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'4', N'2', N'1', N'1', N'8', N'郑安涛', N'4', N'20150104', N'面包', N'5', N'50', N'2010-01-03 10:57:40.733')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'5', N'2', N'1', N'1', N'8', N'郑安涛', N'1', N'20150101', N'巧克力', N'1', N'100', N'2010-01-03 11:02:29.187')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'6', N'2', N'1', N'1', N'8', N'郑安涛', N'2', N'20150102', N'棒棒糖', N'2', N'10', N'2010-01-03 11:02:29.187')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'7', N'2', N'1', N'1', N'8', N'郑安涛', N'3', N'20150103', N'话梅', N'3', N'30', N'2010-01-03 11:02:29.187')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'8', N'2', N'1', N'1', N'8', N'郑安涛', N'4', N'20150104', N'面包', N'4', N'40', N'2010-01-03 11:02:29.187')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'9', N'2', N'1', N'1', N'8', N'郑安涛', N'1', N'20150101', N'巧克力', N'1', N'100', N'2010-01-07 02:12:32.017')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'10', N'2', N'1', N'1', N'8', N'郑安涛', N'1', N'20150101', N'巧克力', N'1', N'100', N'2010-01-07 02:23:34.640')
GO

INSERT INTO [dbo].[ExchangLogs] ([EL_ID], [S_ID], [U_ID], [MC_ID], [MC_CardID], [MC_Name], [EG_ID], [EG_GiftCode], [EG_GiftName], [EL_Number], [EL_Point], [EL_CreateTime]) VALUES (N'11', N'2', N'1', N'1', N'8', N'郑安涛', N'1', N'20150101', N'巧克力', N'400', N'40000', N'2010-01-07 02:26:00.373')
GO

SET IDENTITY_INSERT [dbo].[ExchangLogs] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for MemCards
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[MemCards]') AND type IN ('U'))
	DROP TABLE [dbo].[MemCards]
GO

CREATE TABLE [dbo].[MemCards] (
  [MC_ID] int  IDENTITY(1,1) NOT NULL,
  [CL_ID] int  NULL,
  [S_ID] int  NULL,
  [MC_CardID] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [MC_Password] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [MC_Name] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [MC_Sex] int  NULL,
  [MC_Mobile] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [MC_Photo] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [MC_Birthday_Month] int  NULL,
  [MC_Birthday_Day] int  NULL,
  [MC_BirthdayType] tinyint  NULL,
  [MC_IsPast] bit  NULL,
  [MC_PastTime] datetime  NULL,
  [MC_Point] int  NULL,
  [MC_Money] real  NULL,
  [MC_TotalMoney] real  NULL,
  [MC_TotalCount] int  NULL,
  [MC_OverCount] int  NULL,
  [MC_State] int  NULL,
  [MC_IsPointAuto] bit  NULL,
  [MC_RefererID] int  NULL,
  [MC_RefererCard] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [MC_RefererName] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [MC_CreateTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[MemCards] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of MemCards
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[MemCards] ON
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'1', N'4', N'2', N'800000', N'123456', N'郑安涛', N'1', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'2000', N'0.0000000', N'7210.0000000', N'3', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'2', N'1', N'2', N'800001', N'123456', N'王雨', N'1', N'18986456888', NULL, N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'10', N'0.0000000', N'100.0000000', N'1', N'0', N'1', N'1', N'0', NULL, NULL, N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'3', N'1', N'1', N'800002', N'123456', N'刘磊', N'1', N'18922222889', NULL, N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'100', N'0.0000000', N'1100.0000000', N'2', N'0', N'1', N'1', N'0', NULL, NULL, N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'4', N'1', N'1', N'800003', N'123456', N'朱锡文', N'1', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'200', N'0.0000000', N'2100.0000000', N'2', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'5', N'1', N'1', N'800004', N'123456', N'胡修飞', N'1', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'0', N'0.0000000', N'0.0000000', N'0', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'6', N'1', N'1', N'800005', N'123456', N'李迪', N'1', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'100', N'0.0000000', N'1000.0000000', N'1', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'7', N'1', N'1', N'800006', N'123456', N'郑路', N'1', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'30', N'0.0000000', N'500.0000000', N'1', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'8', N'1', N'1', N'800007', N'123456', N'陈文俊', N'1', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'400', N'0.0000000', N'5000.0000000', N'1', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'9', N'1', N'1', N'800008', N'123456', N'麻春雨', N'1', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'60', N'0.0000000', N'600.0000000', N'1', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'10', N'1', N'1', N'800009', N'123456', N'谢先斌', N'1', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'50', N'0.0000000', N'800.0000000', N'1', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'11', N'1', N'1', N'800010', N'123456', N'徐弯', N'0', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'0', N'0.0000000', N'0.0000000', N'0', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'12', N'1', N'1', N'800012', N'123456', N'王玉竹', N'0', N'18986456889', N'~/Content/images/none,jpg', N'1', N'1', N'1', N'1', N'2020-01-01 00:00:00.000', N'0', N'0.0000000', N'0.0000000', N'0', N'0', N'1', N'1', N'0', N'', N'', N'2015-04-01 00:00:00.000')
GO

INSERT INTO [dbo].[MemCards] ([MC_ID], [CL_ID], [S_ID], [MC_CardID], [MC_Password], [MC_Name], [MC_Sex], [MC_Mobile], [MC_Photo], [MC_Birthday_Month], [MC_Birthday_Day], [MC_BirthdayType], [MC_IsPast], [MC_PastTime], [MC_Point], [MC_Money], [MC_TotalMoney], [MC_TotalCount], [MC_OverCount], [MC_State], [MC_IsPointAuto], [MC_RefererID], [MC_RefererCard], [MC_RefererName], [MC_CreateTime]) VALUES (N'15', N'1', N'2', N'800013', N'123456', N'王为腾', N'1', N'18659847861', NULL, N'1', N'1', N'0', N'1', N'2016-01-01 00:00:00.000', N'0', N'0.0000000', N'0.0000000', N'0', N'0', N'1', N'1', N'888888', NULL, N'郑安涛', N'2009-12-28 00:00:00.000')
GO

SET IDENTITY_INSERT [dbo].[MemCards] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for Shops
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Shops]') AND type IN ('U'))
	DROP TABLE [dbo].[Shops]
GO

CREATE TABLE [dbo].[Shops] (
  [S_ID] int  IDENTITY(1,1) NOT NULL,
  [S_Name] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [S_Category] int  NULL,
  [S_ContactName] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [S_ContactTel] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [S_Address] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [S_Remark] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [S_IsHasSetAdmin] bit  NULL,
  [S_CreateTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[Shops] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Shops
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[Shops] ON
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'1', N'光谷天地店', N'2', N'李莉', N'13867895638', N'湖北省武汉市洪山区关山大道光谷天地3-186', NULL, N'0', N'2015-01-01 00:00:00.000')
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'2', N'锦绣龙城店', N'2', N'吴秀波', N'13987256459', N'湖北省武汉市洪山区龙城路民族大道龙城大道口', N'', N'1', N'2015-01-01 00:00:00.000')
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'3', N'意大利风情街店', N'3', N'阿祥', N'13878965412', N'意大利风情街D栋103号', NULL, N'1', N'2015-01-01 00:00:00.000')
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'4', N'啊实打实的', N'2', N'12', N'大三散打', N'阿萨德', N'撒的', NULL, NULL)
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'6', N'阿萨德', N'1', N'撒旦', N'阿萨德', N'撒旦', N'的', NULL, NULL)
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'8', N'阿萨德', N'2', N'阿萨德', N'阿萨德', N'阿萨德', N'撒旦', NULL, NULL)
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'9', N'撒旦', N'1', N'阿萨德', N'阿萨德才是打沙袋', N'阿萨德阿萨德asd', N'', NULL, NULL)
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'11', N'ASDXASDX', N'1', N'ASDCQW', N'XFWAXF', N'EXRCGFAWR', N'', NULL, NULL)
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Shops] ([S_ID], [S_Name], [S_Category], [S_ContactName], [S_ContactTel], [S_Address], [S_Remark], [S_IsHasSetAdmin], [S_CreateTime]) VALUES (N'29', N'vgaregvaervgaer', N'2', N'acrgaercgaer', N'cgaercga', N'ervgae', N'vaebg', NULL, N'2018-12-14 13:26:19.127')
GO

SET IDENTITY_INSERT [dbo].[Shops] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for SysLogs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SysLogs]') AND type IN ('U'))
	DROP TABLE [dbo].[SysLogs]
GO

CREATE TABLE [dbo].[SysLogs] (
  [SL_ID] int  IDENTITY(1,1) NOT NULL,
  [U_ID] int  NULL,
  [SL_Module] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [SL_Details] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [SL_CreateTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[SysLogs] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TransferLogs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TransferLogs]') AND type IN ('U'))
	DROP TABLE [dbo].[TransferLogs]
GO

CREATE TABLE [dbo].[TransferLogs] (
  [TL_ID] int  IDENTITY(1,1) NOT NULL,
  [S_ID] int  NULL,
  [U_ID] int  NULL,
  [TL_FromMC_ID] int  NULL,
  [TL_FromMC_CardID] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [TL_ToMC_ID] int  NULL,
  [TL_ToMC_CardID] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [TL_TransferMoney] money  NULL,
  [TL_Remark] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [TL_CreateTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[TransferLogs] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TransferLogs
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[TransferLogs] ON
GO

INSERT INTO [dbo].[TransferLogs] ([TL_ID], [S_ID], [U_ID], [TL_FromMC_ID], [TL_FromMC_CardID], [TL_ToMC_ID], [TL_ToMC_CardID], [TL_TransferMoney], [TL_Remark], [TL_CreateTime]) VALUES (N'5', N'2', N'1', N'4', N'800003', N'1', N'888888', N'50.0000', NULL, N'2010-01-01 07:28:04.920')
GO

INSERT INTO [dbo].[TransferLogs] ([TL_ID], [S_ID], [U_ID], [TL_FromMC_ID], [TL_FromMC_CardID], [TL_ToMC_ID], [TL_ToMC_CardID], [TL_TransferMoney], [TL_Remark], [TL_CreateTime]) VALUES (N'6', N'2', N'1', N'4', N'800003', N'1', N'888888', N'50.0000', NULL, N'2010-01-01 07:28:51.013')
GO

INSERT INTO [dbo].[TransferLogs] ([TL_ID], [S_ID], [U_ID], [TL_FromMC_ID], [TL_FromMC_CardID], [TL_ToMC_ID], [TL_ToMC_CardID], [TL_TransferMoney], [TL_Remark], [TL_CreateTime]) VALUES (N'7', N'2', N'1', N'4', N'800003', N'1', N'888888', N'50.0000', NULL, N'2010-01-01 07:29:59.530')
GO

INSERT INTO [dbo].[TransferLogs] ([TL_ID], [S_ID], [U_ID], [TL_FromMC_ID], [TL_FromMC_CardID], [TL_ToMC_ID], [TL_ToMC_CardID], [TL_TransferMoney], [TL_Remark], [TL_CreateTime]) VALUES (N'8', N'2', N'1', N'4', N'800003', N'2', N'800001', N'10.0000', NULL, N'2010-01-01 07:46:13.233')
GO

INSERT INTO [dbo].[TransferLogs] ([TL_ID], [S_ID], [U_ID], [TL_FromMC_ID], [TL_FromMC_CardID], [TL_ToMC_ID], [TL_ToMC_CardID], [TL_TransferMoney], [TL_Remark], [TL_CreateTime]) VALUES (N'9', N'2', N'1', N'2', N'800001', N'4', N'800003', N'10.0000', NULL, N'2010-01-01 08:13:34.093')
GO

SET IDENTITY_INSERT [dbo].[TransferLogs] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for Users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type IN ('U'))
	DROP TABLE [dbo].[Users]
GO

CREATE TABLE [dbo].[Users] (
  [U_ID] int  IDENTITY(1,1) NOT NULL,
  [S_ID] int  NULL,
  [U_LoginName] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [U_Password] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [U_RealName] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [U_Sex] nvarchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [U_Telephone] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [U_Role] int  NULL,
  [U_CanDelete] bit  NULL,
  [U_isDelete] bit DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[Users] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Users
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[Users] ON
GO

INSERT INTO [dbo].[Users] ([U_ID], [S_ID], [U_LoginName], [U_Password], [U_RealName], [U_Sex], [U_Telephone], [U_Role], [U_CanDelete], [U_isDelete]) VALUES (N'1', NULL, N'zs', N'1', N'张三', N'男', N'13987256459', N'2', N'0', N'0')
GO

INSERT INTO [dbo].[Users] ([U_ID], [S_ID], [U_LoginName], [U_Password], [U_RealName], [U_Sex], [U_Telephone], [U_Role], [U_CanDelete], [U_isDelete]) VALUES (N'4', N'2', N'admin', N'1', N'系统管理员', N'男', N'13589765432', N'1', N'0', N'0')
GO

INSERT INTO [dbo].[Users] ([U_ID], [S_ID], [U_LoginName], [U_Password], [U_RealName], [U_Sex], [U_Telephone], [U_Role], [U_CanDelete], [U_isDelete]) VALUES (N'5', NULL, N'lx', N'1', N'李欣', N'女', N'13149816745', N'3', N'1', N'0')
GO

INSERT INTO [dbo].[Users] ([U_ID], [S_ID], [U_LoginName], [U_Password], [U_RealName], [U_Sex], [U_Telephone], [U_Role], [U_CanDelete], [U_isDelete]) VALUES (N'6', NULL, N'ac', N'1', N'哈哈', N'女', N'12345678910', N'2', N'0', N'0')
GO

INSERT INTO [dbo].[Users] ([U_ID], [S_ID], [U_LoginName], [U_Password], [U_RealName], [U_Sex], [U_Telephone], [U_Role], [U_CanDelete], [U_isDelete]) VALUES (N'8', NULL, N'ls', N'1', NULL, N'女', N'12345698787', N'2', N'0', N'1')
GO

INSERT INTO [dbo].[Users] ([U_ID], [S_ID], [U_LoginName], [U_Password], [U_RealName], [U_Sex], [U_Telephone], [U_Role], [U_CanDelete], [U_isDelete]) VALUES (N'9', NULL, N'as', N'1', NULL, N'女', N'啊实打实大s', N'2', N'1', N'1')
GO

INSERT INTO [dbo].[Users] ([U_ID], [S_ID], [U_LoginName], [U_Password], [U_RealName], [U_Sex], [U_Telephone], [U_Role], [U_CanDelete], [U_isDelete]) VALUES (N'10', N'29', N'asd', N'123456', NULL, NULL, NULL, NULL, NULL, N'0')
GO

SET IDENTITY_INSERT [dbo].[Users] OFF
GO

COMMIT
GO


-- ----------------------------
-- Primary Key structure for table CardLevels
-- ----------------------------
ALTER TABLE [dbo].[CardLevels] ADD CONSTRAINT [PK_CARDLEVELS] PRIMARY KEY CLUSTERED ([CL_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Categories
-- ----------------------------
ALTER TABLE [dbo].[Categories] ADD CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED ([C_Category])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table CategoryItems
-- ----------------------------
ALTER TABLE [dbo].[CategoryItems] ADD CONSTRAINT [PK__Category__95B825C39CCE6624] PRIMARY KEY CLUSTERED ([CI_KeyID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table ConsumeOrders
-- ----------------------------
ALTER TABLE [dbo].[ConsumeOrders] ADD CONSTRAINT [PK_CONSUMEORDERS] PRIMARY KEY CLUSTERED ([CO_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table ExchangGifts
-- ----------------------------
ALTER TABLE [dbo].[ExchangGifts] ADD CONSTRAINT [PK_EXCHANGGIFTS] PRIMARY KEY CLUSTERED ([EG_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table ExchangLogs
-- ----------------------------
ALTER TABLE [dbo].[ExchangLogs] ADD CONSTRAINT [PK_EXCHANGLOGS] PRIMARY KEY CLUSTERED ([EL_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table MemCards
-- ----------------------------
ALTER TABLE [dbo].[MemCards] ADD CONSTRAINT [PK_MEMCARDS] PRIMARY KEY CLUSTERED ([MC_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Shops
-- ----------------------------
ALTER TABLE [dbo].[Shops] ADD CONSTRAINT [PK_SHOPS] PRIMARY KEY CLUSTERED ([S_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SysLogs
-- ----------------------------
ALTER TABLE [dbo].[SysLogs] ADD CONSTRAINT [PK_SYSLOGS] PRIMARY KEY CLUSTERED ([SL_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TransferLogs
-- ----------------------------
ALTER TABLE [dbo].[TransferLogs] ADD CONSTRAINT [PK_TRANSFERLOGS] PRIMARY KEY CLUSTERED ([TL_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Users
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED ([U_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table CategoryItems
-- ----------------------------
ALTER TABLE [dbo].[CategoryItems] ADD CONSTRAINT [FK_CATEGORY_REFERENCE_CATEGORI] FOREIGN KEY ([C_Category]) REFERENCES [dbo].[Categories] ([C_Category]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ConsumeOrders
-- ----------------------------
ALTER TABLE [dbo].[ConsumeOrders] ADD CONSTRAINT [FK_CONSUMEO_REFERENCE_SHOPS] FOREIGN KEY ([S_ID]) REFERENCES [dbo].[Shops] ([S_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[ConsumeOrders] ADD CONSTRAINT [FK_CONSUMEO_REFERENCE_USERS] FOREIGN KEY ([U_ID]) REFERENCES [dbo].[Users] ([U_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ExchangGifts
-- ----------------------------
ALTER TABLE [dbo].[ExchangGifts] ADD CONSTRAINT [FK_EXCHANGG_REFERENCE_SHOPS] FOREIGN KEY ([S_ID]) REFERENCES [dbo].[Shops] ([S_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table ExchangLogs
-- ----------------------------
ALTER TABLE [dbo].[ExchangLogs] ADD CONSTRAINT [FK_EXCHANGL_REFERENCE_SHOPS] FOREIGN KEY ([S_ID]) REFERENCES [dbo].[Shops] ([S_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[ExchangLogs] ADD CONSTRAINT [FK_EXCHANGL_REFERENCE_USERS] FOREIGN KEY ([U_ID]) REFERENCES [dbo].[Users] ([U_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table MemCards
-- ----------------------------
ALTER TABLE [dbo].[MemCards] ADD CONSTRAINT [FK_MEMCARDS_REFERENCE_CARDLEVE] FOREIGN KEY ([CL_ID]) REFERENCES [dbo].[CardLevels] ([CL_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[MemCards] ADD CONSTRAINT [FK_MEMCARDS_REFERENCE_SHOPS] FOREIGN KEY ([S_ID]) REFERENCES [dbo].[Shops] ([S_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table SysLogs
-- ----------------------------
ALTER TABLE [dbo].[SysLogs] ADD CONSTRAINT [FK_SYSLOGS_REFERENCE_USERS] FOREIGN KEY ([U_ID]) REFERENCES [dbo].[Users] ([U_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TransferLogs
-- ----------------------------
ALTER TABLE [dbo].[TransferLogs] ADD CONSTRAINT [FK_TRANSFER_REFERENCE_SHOPS] FOREIGN KEY ([S_ID]) REFERENCES [dbo].[Shops] ([S_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TransferLogs] ADD CONSTRAINT [FK_TRANSFER_REFERENCE_USERS] FOREIGN KEY ([U_ID]) REFERENCES [dbo].[Users] ([U_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Users
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [FK_USERS_REFERENCE_SHOPS] FOREIGN KEY ([S_ID]) REFERENCES [dbo].[Shops] ([S_ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

