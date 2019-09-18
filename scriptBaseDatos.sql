USE [master]
GO
/****** Object:  Database [InsidentesBD]    Script Date: 18/9/2019 09:26:54 ******/
CREATE DATABASE [InsidentesBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InsidentesBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.LENOVO2\MSSQL\DATA\InsidentesBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InsidentesBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.LENOVO2\MSSQL\DATA\InsidentesBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [InsidentesBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InsidentesBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InsidentesBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InsidentesBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InsidentesBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InsidentesBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InsidentesBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [InsidentesBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InsidentesBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InsidentesBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InsidentesBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InsidentesBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InsidentesBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InsidentesBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InsidentesBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InsidentesBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InsidentesBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InsidentesBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InsidentesBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InsidentesBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InsidentesBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InsidentesBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InsidentesBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InsidentesBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InsidentesBD] SET RECOVERY FULL 
GO
ALTER DATABASE [InsidentesBD] SET  MULTI_USER 
GO
ALTER DATABASE [InsidentesBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InsidentesBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InsidentesBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InsidentesBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InsidentesBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'InsidentesBD', N'ON'
GO
ALTER DATABASE [InsidentesBD] SET QUERY_STORE = OFF
GO
USE [InsidentesBD]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 18/9/2019 09:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[esSoporteTecnico] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresaDepartamento]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresaDepartamento](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NULL,
	[descripcion] [varchar](200) NULL,
	[estado] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insidente]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insidente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaSolicitud] [datetime] NULL,
	[fechaTomado] [datetime] NULL,
	[fechaCierre] [datetime] NULL,
	[breveDescripcion] [varchar](50) NULL,
	[descripcion] [varchar](max) NULL,
	[estado] [varchar](25) NULL,
	[problemaResuelto] [bit] NULL,
	[idPriorizacion] [int] NULL,
	[idCategoria] [int] NULL,
	[idDepartamento] [int] NULL,
	[idUsuarioCreoInsidente] [nvarchar](128) NULL,
	[idUsuarioResolvioInsidente] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insidenteCategoria]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insidenteCategoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NULL,
	[descripcion] [varchar](200) NULL,
	[estado] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insidentePriorizacion]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insidentePriorizacion](
	[idPriorizacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NULL,
	[descripcion] [varchar](200) NULL,
	[estado] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPriorizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insidenteRespuesta]    Script Date: 18/9/2019 09:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insidenteRespuesta](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[fechaRespuesta] [datetime] NULL,
	[resolvioProblema] [bit] NULL,
	[respuestaDeSoporte] [bit] NULL,
	[comentario] [varchar](250) NULL,
	[idInsidente] [int] NULL,
	[idUsuarioRespuesta] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201908311734043_InitialCreate', N'SmartAdminMvc.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDD6EE3B815BE2FD0771074D516592B713683D9C0DE45D649DAA0931F8C338BDE0D688976889128AD44651314FB64BDE823F5157A2851B2C41FFDD88AED2C1658C4E2E1C7C3C38FE4E1E1E1FCEF3FFF9DFCF412F8D6338E1312D2A97D323AB62D4CDDD0237435B553B6FCEEA3FDD38F7FFED3E4CA0B5EAC5F0AB9532E07356932B59F188BCE1D27719F7080925140DC384CC2251BB961E0202F74C6C7C73F3827270E06081BB02C6BF239A58C0438FB013F67217571C452E4DF861EF613F11D4AE619AA7587029C44C8C5537B1EA0985D7801A1B7CFEE2897B7AD0B9F20D0658EFDA56D214A438618687AFE25C173168774358FE003F21F5F230C724BE42758F4E07C2DDEB533C763DE19675DB18072D38485414FC09353611D47AEBE918DEDD27A60BF2BB0337BE5BDCE6C38B56F3C9C7DFA1CFA6000B9C1F3991F73E1A97D5B3671914477988D8A8AA31CF23A06B8DFC2F8DBA88A786475AE7754B2693C3AE6FF1D59B3D467698CA714A72C46FE91F5902E7CE2FE13BF3E86DF309D9E9E2C96A71FCF3E20EFF4C3F7F8F4ACDA53E82BC8D53EC0A787388C700CBAE165D97FDB72EAF51CB96259AD5227B70A700926866DDDA2974F98AED8134C99F147DBBA262FD82BBE08727DA104E6115462710A3FEF52DF470B1F97E54E639BFCFF0DAD8ECF3E0CD2EA1D7A26AB6CE8A5F661E2C430AF3E633F2B4D9E48944FAFDA787F1562D77118F0DF757EE5A55FE7611ABBBC33A151E411C52BCCEADA4D9C35793B519A430D4FEB02F5F0A9CD3555E9AD15E51DDA6426144DEC7A3614FABE6DBB9D19771145307819B5B8459A08A7DBAE4652FD23AB26B5A6CFC9E80CE8333E3EFBE1FB760A51E8DA1F7945BC0A10F10758123BB402FEC892C4012E7BF973080444B4B7CE0F28496045F0FE8192A706D5E1CF01549F63378D81A8738682E8CD5B7B780A29BE4B8305E7FFEEDA1A6C681E7F0BAF91CBC2F88AF25A5BE37D0ADD6F61CAAEA8778918FEC2DC0290FF7C2441778041D4B9705D9C24D74066ECCD4270B70BC01BCA4EC7BDE1F832B56F9764E62312E87D126941FD5A88AEFD12BD84E29B18C474FE4993AA9FC215A1DD542D44CDAAE612ADAA0AB1BEAA72B06E9A0A49B3A29940AB9EB9D4601E5F3642C3BB7C19ECE1FB7CDB6DDEA6B5A062C639AC90F8EF98E2189631EF01318663BA1E812EEBC63E9C856CF878A36FBE37652DFD82FC74E8A6369A0DD92230FC6CC8600F7F36646AC2E767E271AFA4C341A81006F84EF2FA3356FB9C9334DBF574A87573D78DEF660D304D978B24095D92CD024D084C0430EAFA830F67B54733F2DEC81111E818109DF02D0FBE40DF6C9954F7F412FB9861EBC2CD43843394B8C853CD081DF27A2856ECA81AC5D69191BA727F53DA04A6E3985742FC1094C04C2594A9D382509744C86FB59254B3E316C6FB5EB621975CE20853DE60AB25BA34AE0F847005CA76A44169B3D0C4A930AE998806AFD534E66D2EEC7ADC95F8C44E38D9E23B1B7829FCB7372166B3C57640CE66937451C018D4DB0741C559A52B01E483CBA111543A3119082A5CAA9D10B46EB13D10B46E927747D0FC88DA75FCA5F3EAA1D1B37E50DEFDB6DE68AE3D70B3668F03A366EE7B421D063570ACD2F372C10BF10BD31CCE404F713E4B84AB2B538483CF31AB876CD6FEAED60F759A4164123501AE89D6022AAE0315206542F550AE88E5356A27BC881EB045DCAD1156ACFD126C85032A76F55AB42268BE3C95C9D9E9F451F6AC648342F24E87850A8E8610F2E255EF7807A398E2B2AA61BAF8C27DBCE14AC7C4603418A8C5733518A9E8CCE0562AA8D96E259D43D6C725DBCA4A92FB64B052D199C1AD2438DA6E248D53D0C32DD8CA44F52D7CA0C956443ACADDA62C9B3879BE94F830710C8955935B144584AE2A8956E28B35CFB3AC66DFCDFB271F053986E3269A1CA452DBB22516C66885A552681A34BD2671C22E11430BC4E33C332F50C4B47BAB61F92F9AAC6E9FEA2016FB4021CDFF1637ABBA4BFCDA6EABBA2302E51AFA18709F260BA46B18A0AF6EF1D437E4A35813BB9F857E1A50B38B65AE9DDFE055EBE75F54848923E9AFB8508ABD1447B76EFC4E43A34E8BC186A9F461361F2A3384C9E085075A35B9C92B35A31441AA2A8A2970B5B7A13339333D874BF614FB8F562BC2DBCC2D919E5205109F7A6254321C14B04A5977D47A124A15B35ED21D51CA34A9424A453DB4ACE693D494AC166C8467B0A85EA27B0B6A0649155D2DED8EACC925A9426B8A37C0D6E82C977547D5A49B548135C5DDB1D7B927F2327AC0BB97F1FCB2C5F6951F72B7DBBF0C186FB3260EB3FD55EEF2AB4095CF3DB1C46DBD0226BE1F249F8C27BD2DF8944737B6E39301C3BCFAD4EEC1EB8B4FE3E5BD19B376B95D5BE09B2EF7CD78FD58FBA6DC508E7AB248D97A79E4938E761371CC6A7F58A39CBB7211DB2ACC088C7A4D180E465C6034FFD59FF904F3A5BC10B845942C71C2F2840E7B7C7C32965EE61CCE2B1927493C5F734C353D95A98FD90E72B3E8338ADD2714AB99125BBC2459832A41E81BEAE197A9FDEFACD67916CFE07F659F8FAC9BE40B25BFA650F018A7D8FA5DCDFC1C26B3BEC35B8E52D1DFDFC52389EE26BFF9D7D7BCEA91751FC3743AB78E25436F32FCF5A713BDB4C9AB6EA1CDC60F2ADEEF6CABBD52D0A24AB365F347090BC20679905068F99700BDFCB5AF6ADA47075B216A1E160C853788094D0F0736C1323E1AF0E027CB1E0DF4EBACFE11C126AA191F1010DA1F4C7E3ED07D192A6AEE711FD21C9976B12465766E4DBFDE2A1773DF7B9392A5BDD5445733B17BC00D9A6DBD9D8BF2CEB29807DB3A3549CA8361EF93F76F9E997C28C9C86BA77DBF39C8BB4C3B6EB856FA43651B1F407E9C26DF67FF39C5BBE69A29067CE08999FD32870F8C6C629BDF7F7EF0AEC9660A101F38D97A65011F18D7F6B57FEE99699DB7D0BDE7F4AAE94986BB1C5D14B92D67370FB9C3F17F110209728F327F6AA94F126B4A706D69702D626ED49C9D2637AC4C1CA55D45A2B9D97E7D151B7E6367854C73B3869CCEA6B6C5FADFD8B690696EDB9029B98F6C636DAEA22E03BC651D6B4AA27A4FD9C5B59EB424B3B7F9AC8D17F3EF29997810A3D4668FE176F9FDE40E0F629221A74E8F5C61F5A218F6CECABFD308FB7742566B08FEAF3652ECD676CD52E6862EC362F396342A44A408CD2D66C8832DF5226664895C06C53C009DBD15CF827AFC1A6481BD1B7A9FB22865D0651C2CFC5AC08B3B014DED6709D1759D27F711FF950CD1055093F0C0FD3DFD3925BE57EA7DAD89091920B87721C2BD7C2C190FFBAE5E4BA4BB90760412E62B9DA2471C443E8025F7748E9EF126BA01FD3EE115725FD711401348FB40D4CD3EB9246815A3201118EBFAF01338EC052F3FFE1F4E977148AE540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'001', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'002', N'SuperAdmin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0c122c64-a110-4cca-a90d-a01329ce31f9', N'001')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b7c2bb42-6d64-4181-9882-ec6788ff24bb', N'002')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [esSoporteTecnico]) VALUES (N'0c122c64-a110-4cca-a90d-a01329ce31f9', N'admin@gmail.com', 0, N'AF0/d5YzXNQPX+5czFSLBQQARPQ6o3U/NNLyngxEd2yckG0r6l4YBk3g5tylB0y3BQ==', N'fd98f79f-0696-4acf-a5b4-2a730d5240c9', NULL, 0, 0, NULL, 1, 0, N'admin@gmail.com', 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [esSoporteTecnico]) VALUES (N'728fbbd2-f911-4347-9e00-02dae2c2d19a', N'darlinng5@gmail.com', 0, N'ALVihPo56b8L79mhr0aU18HWxAQEVbe01b/x9E8xsOc8sEmJMVlnYhz85UkFDFeTkQ==', N'2c34f8de-dba3-45c7-8293-a60a2303a29d', NULL, 0, 0, NULL, 1, 0, N'darlinng5@gmail.com', 0)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [esSoporteTecnico]) VALUES (N'b7c2bb42-6d64-4181-9882-ec6788ff24bb', N'superadmin@gmail.com', 0, N'AHwOWrFPnrMNqgGeJ8ZjUrkTUi7vcvp+jlJMB1cInodajwNaYNw/4+pfCi1aIjwFAA==', N'8970a4d9-9683-4598-83cd-c40985df9a05', NULL, 0, 0, NULL, 1, 0, N'superadmin@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[empresaDepartamento] ON 

INSERT [dbo].[empresaDepartamento] ([idDepartamento], [nombre], [descripcion], [estado]) VALUES (1, N'Contabilidad', N'Departamento de contabilidad de la empresa', N'Activa')
INSERT [dbo].[empresaDepartamento] ([idDepartamento], [nombre], [descripcion], [estado]) VALUES (2, N'Compras', N'Departamento de compras', N'Activa')
SET IDENTITY_INSERT [dbo].[empresaDepartamento] OFF
SET IDENTITY_INSERT [dbo].[insidente] ON 

INSERT [dbo].[insidente] ([id], [fechaSolicitud], [fechaTomado], [fechaCierre], [breveDescripcion], [descripcion], [estado], [problemaResuelto], [idPriorizacion], [idCategoria], [idDepartamento], [idUsuarioCreoInsidente], [idUsuarioResolvioInsidente]) VALUES (1, CAST(N'2019-08-31T00:00:00.000' AS DateTime), CAST(N'2019-09-15T17:36:44.697' AS DateTime), NULL, N'La computadora no enciende', N'La computadora no enciende', N'Asignado', 1, 1, 1, 1, N'728fbbd2-f911-4347-9e00-02dae2c2d19a', N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidente] ([id], [fechaSolicitud], [fechaTomado], [fechaCierre], [breveDescripcion], [descripcion], [estado], [problemaResuelto], [idPriorizacion], [idCategoria], [idDepartamento], [idUsuarioCreoInsidente], [idUsuarioResolvioInsidente]) VALUES (2, CAST(N'2019-08-31T13:08:32.040' AS DateTime), CAST(N'2019-09-16T09:54:01.740' AS DateTime), NULL, N'Computadora lenta', N'La Computadora esta lenta se tarda al cargar todo', N'Asignado', 0, 1, 1, 1, N'728fbbd2-f911-4347-9e00-02dae2c2d19a', N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidente] ([id], [fechaSolicitud], [fechaTomado], [fechaCierre], [breveDescripcion], [descripcion], [estado], [problemaResuelto], [idPriorizacion], [idCategoria], [idDepartamento], [idUsuarioCreoInsidente], [idUsuarioResolvioInsidente]) VALUES (3, CAST(N'2019-09-01T08:06:24.167' AS DateTime), CAST(N'2019-09-15T16:35:53.327' AS DateTime), NULL, N'computadora mala', N'la computadora esta mala', N'Cerrado', 1, 1, 1, 2, N'728fbbd2-f911-4347-9e00-02dae2c2d19a', N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidente] ([id], [fechaSolicitud], [fechaTomado], [fechaCierre], [breveDescripcion], [descripcion], [estado], [problemaResuelto], [idPriorizacion], [idCategoria], [idDepartamento], [idUsuarioCreoInsidente], [idUsuarioResolvioInsidente]) VALUES (5, CAST(N'2019-09-15T17:46:00.653' AS DateTime), CAST(N'2019-09-15T17:46:23.263' AS DateTime), NULL, N'Insidente de prueba', N'Insidente de prueba', N'Escalonado', 0, 4, 1, 1, N'728fbbd2-f911-4347-9e00-02dae2c2d19a', N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidente] ([id], [fechaSolicitud], [fechaTomado], [fechaCierre], [breveDescripcion], [descripcion], [estado], [problemaResuelto], [idPriorizacion], [idCategoria], [idDepartamento], [idUsuarioCreoInsidente], [idUsuarioResolvioInsidente]) VALUES (6, CAST(N'2019-09-17T20:16:19.240' AS DateTime), CAST(N'2019-09-17T22:47:12.147' AS DateTime), NULL, N'El teclado no funciona', N'Desde hace dos dias que el teclado de la computadora no funciona', N'Asignado', 0, 2, 1, 1, N'728fbbd2-f911-4347-9e00-02dae2c2d19a', N'0c122c64-a110-4cca-a90d-a01329ce31f9')
SET IDENTITY_INSERT [dbo].[insidente] OFF
SET IDENTITY_INSERT [dbo].[insidenteCategoria] ON 

INSERT [dbo].[insidenteCategoria] ([idCategoria], [nombre], [descripcion], [estado]) VALUES (1, N'Computadora', N'Problemas comunes con la computadora, no enciende, no funciona un dispositivo', N'Activa')
SET IDENTITY_INSERT [dbo].[insidenteCategoria] OFF
SET IDENTITY_INSERT [dbo].[insidentePriorizacion] ON 

INSERT [dbo].[insidentePriorizacion] ([idPriorizacion], [nombre], [descripcion], [estado]) VALUES (1, N'Baja', N'Descripcion baja cuando no afeca mucho su productividad', N'Activa')
INSERT [dbo].[insidentePriorizacion] ([idPriorizacion], [nombre], [descripcion], [estado]) VALUES (2, N'Media', N'Problemas medios', N'Activa')
INSERT [dbo].[insidentePriorizacion] ([idPriorizacion], [nombre], [descripcion], [estado]) VALUES (3, N'Alta', N'Un problema que afecata tu productividad', N'Activa')
INSERT [dbo].[insidentePriorizacion] ([idPriorizacion], [nombre], [descripcion], [estado]) VALUES (4, N'Urgente ', N'Un problema que requiere rapidamente tu atencion ', N'Activa')
SET IDENTITY_INSERT [dbo].[insidentePriorizacion] OFF
SET IDENTITY_INSERT [dbo].[insidenteRespuesta] ON 

INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1, CAST(N'2019-09-04T00:00:00.000' AS DateTime), 0, 1, N'No se puede resolver porque esta malo', 1, N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (2, CAST(N'2019-09-04T00:00:00.000' AS DateTime), 0, 0, N'Porque no se puede', 1, N'728fbbd2-f911-4347-9e00-02dae2c2d19a')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (3, CAST(N'2019-09-05T00:00:00.000' AS DateTime), 1, 1, N'El problema que esta reportando no es el correcto', 1, N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1002, CAST(N'2019-09-14T12:56:47.973' AS DateTime), 0, 0, N'Datos de test', 1, N'728fbbd2-f911-4347-9e00-02dae2c2d19a')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1003, CAST(N'2019-09-14T13:02:11.370' AS DateTime), 0, 0, N'Datos de test 2', 1, N'728fbbd2-f911-4347-9e00-02dae2c2d19a')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1004, CAST(N'2019-09-14T13:34:07.403' AS DateTime), 0, 0, N'No me han resuelto aun', 3, N'728fbbd2-f911-4347-9e00-02dae2c2d19a')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1005, CAST(N'2019-09-14T13:43:52.863' AS DateTime), 0, 0, N'TestRespueesta', 2, N'728fbbd2-f911-4347-9e00-02dae2c2d19a')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1006, CAST(N'2019-09-14T13:44:21.650' AS DateTime), 0, 0, N'Otra respuesta de test', 2, N'728fbbd2-f911-4347-9e00-02dae2c2d19a')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1007, CAST(N'2019-09-14T14:03:04.123' AS DateTime), 0, 0, N'Que pasa que no me han resuelto', 3, N'728fbbd2-f911-4347-9e00-02dae2c2d19a')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1008, CAST(N'2019-09-15T17:33:19.730' AS DateTime), 0, 1, N'Usted ha marcado  la consulta como prioridad baja. ', 3, N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1009, CAST(N'2019-09-15T17:35:49.393' AS DateTime), 0, 1, N'Usted puede cambiar la prioridad del insidente', 3, N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1010, CAST(N'2019-09-15T17:43:15.647' AS DateTime), 0, 0, N'La respuesta recibida no era la esperada', 3, N'728fbbd2-f911-4347-9e00-02dae2c2d19a')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1011, CAST(N'2019-09-15T17:43:38.343' AS DateTime), 1, 1, N'Comentario de soporte de prueba', 3, N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1012, CAST(N'2019-09-16T10:16:03.533' AS DateTime), 0, 1, N'puede intentar apagando la computadora', 2, N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1013, CAST(N'2019-09-16T10:30:55.400' AS DateTime), 0, 1, N'Otra respuesta', 2, N'0c122c64-a110-4cca-a90d-a01329ce31f9')
INSERT [dbo].[insidenteRespuesta] ([idRespuesta], [fechaRespuesta], [resolvioProblema], [respuestaDeSoporte], [comentario], [idInsidente], [idUsuarioRespuesta]) VALUES (1014, CAST(N'2019-09-17T18:58:29.230' AS DateTime), NULL, 1, N'Debido a la complejidad del insidente se ha escalonado a nivel superior. Muy pronto un agente se pondra en contacto con usted.', 5, N'0c122c64-a110-4cca-a90d-a01329ce31f9')
SET IDENTITY_INSERT [dbo].[insidenteRespuesta] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 18/9/2019 09:26:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 18/9/2019 09:26:57 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 18/9/2019 09:26:57 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 18/9/2019 09:26:57 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 18/9/2019 09:26:57 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 18/9/2019 09:26:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[insidente]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[insidenteCategoria] ([idCategoria])
GO
ALTER TABLE [dbo].[insidente]  WITH CHECK ADD FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[empresaDepartamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[insidente]  WITH CHECK ADD FOREIGN KEY([idPriorizacion])
REFERENCES [dbo].[insidentePriorizacion] ([idPriorizacion])
GO
ALTER TABLE [dbo].[insidente]  WITH CHECK ADD FOREIGN KEY([idUsuarioCreoInsidente])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[insidente]  WITH CHECK ADD FOREIGN KEY([idUsuarioResolvioInsidente])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[insidenteRespuesta]  WITH CHECK ADD FOREIGN KEY([idInsidente])
REFERENCES [dbo].[insidente] ([id])
GO
ALTER TABLE [dbo].[insidenteRespuesta]  WITH CHECK ADD FOREIGN KEY([idUsuarioRespuesta])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
USE [master]
GO
ALTER DATABASE [InsidentesBD] SET  READ_WRITE 
GO
