USE [master]
GO
/****** Object:  Database [quanLyduan]    Script Date: 01/01/2022 17:13:11 ******/
CREATE DATABASE [quanLyduan]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanLyduan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanLyduan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanLyduan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanLyduan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanLyduan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanLyduan] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanLyduan] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [quanLyduan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanLyduan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanLyduan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanLyduan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanLyduan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanLyduan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanLyduan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanLyduan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanLyduan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quanLyduan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanLyduan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanLyduan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanLyduan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanLyduan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanLyduan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanLyduan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanLyduan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quanLyduan] SET  MULTI_USER 
GO
ALTER DATABASE [quanLyduan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanLyduan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanLyduan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanLyduan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [quanLyduan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quanLyduan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [quanLyduan] SET QUERY_STORE = OFF
GO
USE [quanLyduan]
GO
/****** Object:  Table [dbo].[tblKhoa]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhoa](
	[sMakhoa] [nvarchar](10) NOT NULL,
	[sTenkhoa] [nvarchar](30) NOT NULL,
	[sDienthoai] [nvarchar](10) NULL,
	[sDiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_khoa] PRIMARY KEY CLUSTERED 
(
	[sMakhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSinhVien](
	[sMaSV] [nvarchar](10) NOT NULL,
	[sHoten] [nvarchar](30) NULL,
	[sMakhoa] [nvarchar](10) NULL,
	[dNgaysinh] [datetime] NULL,
	[sGioitinh] [nvarchar](3) NULL,
	[sQuequan] [nvarchar](100) NULL,
 CONSTRAINT [PK_sinhvien] PRIMARY KEY CLUSTERED 
(
	[sMaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_hienAllSinhVien]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_hienAllSinhVien]
AS
select sMaSV as [Mã sinh viên], sHoten as [Họ tên], sTenkhoa as [Tên khoa], dNgaysinh as [Ngày sinh], 
sGioitinh as [Giới tính], sQuequan as [Quê quán], DATEDIFF(DAY,dNgaysinh,getdate())/365 as [Tuổi]
from tblSinhVien inner join tblKhoa 
on tblSinhVien.sMakhoa = tblKhoa.sMakhoa
GO
/****** Object:  View [dbo].[vw_hienAllKhoa]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_hienAllKhoa]
as
select sMakhoa as [Mã khoa], sTenkhoa as [Tên khoa], sDienthoai as [Điện thoại], sDiachi as [Địa chỉ] from tblkhoa
GO
/****** Object:  Table [dbo].[tblDeTai]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDeTai](
	[sMadt] [nvarchar](10) NOT NULL,
	[sTendt] [nvarchar](30) NULL,
 CONSTRAINT [PK_detai] PRIMARY KEY CLUSTERED 
(
	[sMadt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_hienDetai]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_hienDetai]
as
select sMadt as [Mã đề tài], sTendt as [Tên đề tài] from tblDetai
GO
/****** Object:  Table [dbo].[tblGiangVien]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGiangVien](
	[sMaGV] [nvarchar](10) NOT NULL,
	[sMakhoa] [nvarchar](10) NOT NULL,
	[sTenGV] [nvarchar](30) NOT NULL,
	[sGT] [nvarchar](3) NULL,
	[sSoDT] [nvarchar](10) NULL,
	[taikhoan] [nvarchar](50) NULL,
	[matkhau] [nvarchar](100) NULL,
 CONSTRAINT [PK_giangvien] PRIMARY KEY CLUSTERED 
(
	[sMaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_hienGiangvien]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_hienGiangvien]
as
select sMaGV as [Mã giảng viên],sTenkhoa as [Tên khoa], sTenGV as [Họ tên],sGT as [Giới tính],sSoDT as [Số điện thoại], taikhoan as [Tài khoản],matkhau as [Mật khẩu] 
from tblGiangVien inner join tblKhoa 
on tblGiangVien.sMakhoa = tblKhoa.sMakhoa
GO
/****** Object:  Table [dbo].[tblHuongDan]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHuongDan](
	[sMasv] [nvarchar](10) NOT NULL,
	[sMadt] [nvarchar](10) NOT NULL,
	[sMagv] [nvarchar](10) NOT NULL,
	[dNgayBD] [datetime] NULL,
	[dNgayBaoCao] [datetime] NULL,
	[sKetqua] [nvarchar](100) NULL,
 CONSTRAINT [PK_huongdan] PRIMARY KEY CLUSTERED 
(
	[sMasv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_hienHuongDan]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_hienHuongDan]
as
select hd.sMaSV as [Mã sinh viên], sv.sHoten as [Họ tên], k.sTenkhoa as [Tên khoa],sTendt as [Tên đề tài], gv.sTenGV as [GV hướng dẫn],  hd.dNgayBD as [Ngày bắt đầu], hd.dNgayBaoCao as [Ngày báo cáo],hd.sKetqua as [Kết quả]
from ((tblHuongDan hd left join 
							(tblSinhVien sv join tblKhoa k on sv.sMakhoa = k.sMakhoa) on hd.sMasv = sv.sMaSV)
							join tblGiangVien gv on hd.sMagv = gv.sMaGV)
							join tblDeTai dt on hd.sMadt = dt.sMadt
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Alias] [nvarchar](50) NULL,
	[ParentID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Order] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Alias] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
	[Images] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Price] [decimal](18, 0) NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taikhoan]    Script Date: 01/01/2022 17:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taikhoan](
	[tenTK] [nvarchar](50) NOT NULL,
	[matkhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.taikhoan] PRIMARY KEY CLUSTERED 
(
	[tenTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Alias], [ParentID], [CreatedDate], [Order], [Status]) VALUES (1, N'Đồng hồ 1', N'Vàng', 123, CAST(N'2021-04-11T18:21:44.480' AS DateTime), 100000, 1)
INSERT [dbo].[Category] ([ID], [Name], [Alias], [ParentID], [CreatedDate], [Order], [Status]) VALUES (2, N'Đồng hồ 2', N'Bạc', 234, CAST(N'2021-04-11T18:21:50.240' AS DateTime), 200000, 0)
INSERT [dbo].[Category] ([ID], [Name], [Alias], [ParentID], [CreatedDate], [Order], [Status]) VALUES (3, N'đồng hồ 3', N'kim cương', 234, CAST(N'2021-04-11T22:24:44.650' AS DateTime), 3, 1)
INSERT [dbo].[Category] ([ID], [Name], [Alias], [ParentID], [CreatedDate], [Order], [Status]) VALUES (4, N'đồng hồ 4', N'rubi', 345, CAST(N'2021-04-11T22:28:18.783' AS DateTime), 4, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[taikhoan] ([tenTK], [matkhau]) VALUES (N'duc1', N'111111')
INSERT [dbo].[taikhoan] ([tenTK], [matkhau]) VALUES (N'duc2', N'222222')
INSERT [dbo].[taikhoan] ([tenTK], [matkhau]) VALUES (N'nguyenduc', N'duc2000')
GO
INSERT [dbo].[tblDeTai] ([sMadt], [sTendt]) VALUES (N'dt01', N'Thiết kế website bán đồng hồ')
INSERT [dbo].[tblDeTai] ([sMadt], [sTendt]) VALUES (N'dt02', N'Tạo ứng dụng NCOVI')
INSERT [dbo].[tblDeTai] ([sMadt], [sTendt]) VALUES (N'dt03', N'Tạo ứng dụng báo thức')
INSERT [dbo].[tblDeTai] ([sMadt], [sTendt]) VALUES (N'dt04', N'Lập trình website bán quần áo')
INSERT [dbo].[tblDeTai] ([sMadt], [sTendt]) VALUES (N'dt05', N'Tạo trò chơi bắn bóng')
GO
INSERT [dbo].[tblGiangVien] ([sMaGV], [sMakhoa], [sTenGV], [sGT], [sSoDT], [taikhoan], [matkhau]) VALUES (N'gv01', N'dulich', N'Hoàng Văn Huy', N'Nam', N'0857289182', N'huyhoang', N'123456')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sMakhoa], [sTenGV], [sGT], [sSoDT], [taikhoan], [matkhau]) VALUES (N'gv02', N'luat', N'Nguyễn Thị Dung', N'Nữ', N'0948274821', N'nguyendung', N'dung')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sMakhoa], [sTenGV], [sGT], [sSoDT], [taikhoan], [matkhau]) VALUES (N'gv03', N'tiengtrung', N'Nguyễn Công Huy', N'Nam', N'0898726584', N'conghuy', N'huy')
GO
INSERT [dbo].[tblHuongDan] ([sMasv], [sMadt], [sMagv], [dNgayBD], [dNgayBaoCao], [sKetqua]) VALUES (N'sv01', N'dt02', N'gv02', CAST(N'2020-08-02T15:37:00.000' AS DateTime), CAST(N'2021-04-15T15:37:00.000' AS DateTime), N'Không đạt')
INSERT [dbo].[tblHuongDan] ([sMasv], [sMadt], [sMagv], [dNgayBD], [dNgayBaoCao], [sKetqua]) VALUES (N'sv02', N'dt04', N'gv01', CAST(N'2020-11-10T00:00:00.000' AS DateTime), CAST(N'2021-03-10T00:00:00.000' AS DateTime), N'Không đạt')
INSERT [dbo].[tblHuongDan] ([sMasv], [sMadt], [sMagv], [dNgayBD], [dNgayBaoCao], [sKetqua]) VALUES (N'sv03', N'dt01', N'gv02', CAST(N'2021-04-02T14:51:14.000' AS DateTime), CAST(N'2021-04-02T14:51:14.000' AS DateTime), N'Thông qua')
INSERT [dbo].[tblHuongDan] ([sMasv], [sMadt], [sMagv], [dNgayBD], [dNgayBaoCao], [sKetqua]) VALUES (N'sv04', N'dt02', N'gv02', CAST(N'2021-04-04T08:33:49.000' AS DateTime), CAST(N'2021-04-04T08:33:49.000' AS DateTime), N'Thông qua')
INSERT [dbo].[tblHuongDan] ([sMasv], [sMadt], [sMagv], [dNgayBD], [dNgayBaoCao], [sKetqua]) VALUES (N'sv05', N'dt05', N'gv03', CAST(N'2021-02-07T14:08:12.000' AS DateTime), CAST(N'2021-06-07T14:08:12.000' AS DateTime), N'Chưa xác định')
INSERT [dbo].[tblHuongDan] ([sMasv], [sMadt], [sMagv], [dNgayBD], [dNgayBaoCao], [sKetqua]) VALUES (N'sv06', N'dt02', N'gv02', CAST(N'2022-01-01T16:48:38.000' AS DateTime), CAST(N'2022-01-01T16:48:37.000' AS DateTime), N'Chưa xác định')
INSERT [dbo].[tblHuongDan] ([sMasv], [sMadt], [sMagv], [dNgayBD], [dNgayBaoCao], [sKetqua]) VALUES (N'sv08', N'dt03', N'gv01', CAST(N'2020-12-10T00:00:00.000' AS DateTime), CAST(N'2021-04-10T00:00:00.000' AS DateTime), N'Thông qua')
GO
INSERT [dbo].[tblKhoa] ([sMakhoa], [sTenkhoa], [sDienthoai], [sDiaChi]) VALUES (N'cntt', N'Công nghệ thông tin', N'0243999878', N'96 Định Công')
INSERT [dbo].[tblKhoa] ([sMakhoa], [sTenkhoa], [sDienthoai], [sDiaChi]) VALUES (N'dulich', N'Du lịch', N'0243868362', N'301 Nguyễn Trãi')
INSERT [dbo].[tblKhoa] ([sMakhoa], [sTenkhoa], [sDienthoai], [sDiaChi]) VALUES (N'kinhte', N'Kinh tế', N'0242885080', N'193 Vĩnh Hưng')
INSERT [dbo].[tblKhoa] ([sMakhoa], [sTenkhoa], [sDienthoai], [sDiaChi]) VALUES (N'luat', N'Khoa Luật', N'0243230434', N'193 Vĩnh Hưng')
INSERT [dbo].[tblKhoa] ([sMakhoa], [sTenkhoa], [sDienthoai], [sDiaChi]) VALUES (N'tienganh', N'Tiếng Anh', N'0243869157', N'301 Nguyễn Trãi')
INSERT [dbo].[tblKhoa] ([sMakhoa], [sTenkhoa], [sDienthoai], [sDiaChi]) VALUES (N'tiengtrung', N'Tiếng Trung Quốc', N'0248193712', N'193 Vĩnh Hưng')
GO
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv01', N'Đỗ Văn Hùng', N'cntt', CAST(N'1999-01-20T00:00:00.000' AS DateTime), N'Nam', N'Phú Thọ')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv02', N'Hoàng Thị Hà', N'dulich', CAST(N'2000-02-12T00:00:00.000' AS DateTime), N'Nữ', N'Hà Nội')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv03', N'Đỗ Văn Phúc', N'dulich', CAST(N'2000-10-08T00:00:00.000' AS DateTime), N'Nam', N'Hải Dương')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv04', N'Nguyễn Thu Hoa', N'luat', CAST(N'2000-12-06T00:00:00.000' AS DateTime), N'Nữ', N'Nam Định')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv05', N'Trịnh Đình Hoàng', N'tienganh', CAST(N'2001-06-11T00:00:00.000' AS DateTime), N'Nam', N'Nam Định')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv06', N'Phạm Tiến Đạt', N'cntt', CAST(N'2001-08-11T00:00:00.000' AS DateTime), N'Nam', N'Hải Phòng')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv07', N'Phạm Trọng Minh', N'luat', CAST(N'1999-02-06T00:00:00.000' AS DateTime), N'Nam', N'Hà Giang')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv08', N'Ngô Mạnh Cường', N'kinhte', CAST(N'2002-01-30T00:00:00.000' AS DateTime), N'Nam', N'Hà Nam')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv09', N'Nguyễn Ngọc Hường', N'tienganh', CAST(N'2002-06-12T00:00:00.000' AS DateTime), N'Nữ', N'Phú Thọ')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv10', N'Phạm Tiến Anh', N'cntt', CAST(N'2001-08-20T00:00:00.000' AS DateTime), N'Nam', N'Nam Định')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv11', N'Nguyễn Thu Hương', N'cntt', CAST(N'2000-12-05T00:00:00.000' AS DateTime), N'Nữ', N'Ninh Bình')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sHoten], [sMakhoa], [dNgaysinh], [sGioitinh], [sQuequan]) VALUES (N'sv12', N'Nguyễn Thu Hải', N'tiengtrung', CAST(N'2000-09-12T00:00:00.000' AS DateTime), N'Nữ', N'Thái Bình')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [taikhoan_unique]    Script Date: 01/01/2022 17:13:13 ******/
ALTER TABLE [dbo].[tblGiangVien] ADD  CONSTRAINT [taikhoan_unique] UNIQUE NONCLUSTERED 
(
	[taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblGiang__FE7B8730DC5DB65D]    Script Date: 01/01/2022 17:13:13 ******/
ALTER TABLE [dbo].[tblGiangVien] ADD UNIQUE NONCLUSTERED 
(
	[taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblGiangVien]  WITH CHECK ADD  CONSTRAINT [FK_giangvien_khoa] FOREIGN KEY([sMakhoa])
REFERENCES [dbo].[tblKhoa] ([sMakhoa])
GO
ALTER TABLE [dbo].[tblGiangVien] CHECK CONSTRAINT [FK_giangvien_khoa]
GO
ALTER TABLE [dbo].[tblHuongDan]  WITH CHECK ADD  CONSTRAINT [FK_huongdan_detai] FOREIGN KEY([sMadt])
REFERENCES [dbo].[tblDeTai] ([sMadt])
GO
ALTER TABLE [dbo].[tblHuongDan] CHECK CONSTRAINT [FK_huongdan_detai]
GO
ALTER TABLE [dbo].[tblHuongDan]  WITH CHECK ADD  CONSTRAINT [FK_huongdan_giangvien] FOREIGN KEY([sMagv])
REFERENCES [dbo].[tblGiangVien] ([sMaGV])
GO
ALTER TABLE [dbo].[tblHuongDan] CHECK CONSTRAINT [FK_huongdan_giangvien]
GO
ALTER TABLE [dbo].[tblHuongDan]  WITH CHECK ADD  CONSTRAINT [FK_huongdan_sinhvien] FOREIGN KEY([sMasv])
REFERENCES [dbo].[tblSinhVien] ([sMaSV])
GO
ALTER TABLE [dbo].[tblHuongDan] CHECK CONSTRAINT [FK_huongdan_sinhvien]
GO
ALTER TABLE [dbo].[tblSinhVien]  WITH CHECK ADD  CONSTRAINT [FK_sinhvien_khoa] FOREIGN KEY([sMakhoa])
REFERENCES [dbo].[tblKhoa] ([sMakhoa])
GO
ALTER TABLE [dbo].[tblSinhVien] CHECK CONSTRAINT [FK_sinhvien_khoa]
GO
/****** Object:  StoredProcedure [dbo].[Account_Login]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Account_Login]
@tenTK nvarchar(50),
@matkhau nvarchar(50)
as
begin 
	declare @count int
	declare @res bit
	select @count = count(*) from taikhoan where tenTK = @tenTK and matkhau = @matkhau
	if @count > 0
		set @res = 1
	else 
		set @res = 0
	select @res
end
GO
/****** Object:  StoredProcedure [dbo].[dangNhap]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dangNhap]
@taikhoan nvarchar(50),
@matkhau nvarchar(100)
as
Select * from tblGiangvien where taikhoan=@taikhoan and matkhau =@matkhau
GO
/****** Object:  StoredProcedure [dbo].[hienAllSinhVien]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hienAllSinhVien]
as
select sMaSV as [Mã sinh viên], sHoten as [Họ tên], sTenkhoa as [Tên khoa], dNgaysinh as [Ngày sinh], sGioitinh as [Giới tính],
sQuequan as [Quê quán] from tblSinhVien inner join tblKhoa 
on tblSinhVien.sMakhoa = tblKhoa.sMakhoa
GO
/****** Object:  StoredProcedure [dbo].[hienDangNhap]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hienDangNhap]
@magv nvarchar(10)
as
select * from vw_hienGiangVien
where [Mã giảng viên] = @magv
GO
/****** Object:  StoredProcedure [dbo].[hienTenkhoa]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hienTenkhoa]
@sMasv nvarchar(10)
as
select sTenkhoa
from tblSinhVien inner join tblKhoa on tblSinhVien.sMakhoa = tblKhoa.sMakhoa
where sMaSV = @sMasv
GO
/****** Object:  StoredProcedure [dbo].[khoa_Insert]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_Insert]
@sMakhoa NVARCHAR(10),
@sTenkhoa NVARCHAR(30),
@sDienthoai NVARCHAR(10),
@sDiaChi NVARCHAR(50)
AS
Insert into tblKhoa(sMakhoa, sTenkhoa, sDienthoai, sDiaChi)
Values(@sMakhoa, @sTenkhoa, @sDienthoai, @sDiaChi)
GO
/****** Object:  StoredProcedure [dbo].[Sp_Category_Insert]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Category_Insert]
@Name nvarchar(50),
@Alias nvarchar(50),
@ParentID int,
@Order int,
@Status bit
as
insert into Category(Name,Alias,ParentID,CreatedDate,[Order],[Status])
values(@Name,@Alias,@ParentID,GETDATE(),@Order,@Status)
GO
/****** Object:  StoredProcedure [dbo].[Sp_Category_ListAll]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Category_ListAll]
as
select * from Category
order by ID  
GO
/****** Object:  StoredProcedure [dbo].[suaDetai]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suaDetai]
@sMadt nvarchar(10),
@sTendt nvarchar(30)
as
update tblDetai 
set sTendt=@sTendt 
where sMadt=@sMadt
GO
/****** Object:  StoredProcedure [dbo].[suaGiangVien]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suaGiangVien]
@sMaGV NVARCHAR(10),
@sMakhoa NVARCHAR(10),
@sTenGV NVARCHAR(30),
@sGT NVARCHAR(3),
@sSoDT NVARCHAR(10),
@taikhoan nvarchar(50),
@matkhau nvarchar(100)
as
update tblGiangVien 
set sMakhoa=@sMakhoa, sTenGV=@sTenGV,sGT=@sGT,sSoDT=@sSoDT,taikhoan=@taikhoan,matkhau=@matkhau 
where sMaGV=@sMaGV
GO
/****** Object:  StoredProcedure [dbo].[suaHuongDan]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suaHuongDan]
@sMasv NVARCHAR(10),
@sMadt NVARCHAR(10),
@sMagv NVARCHAR(10),
@dNgayBD DATETIME,
@dNgayBaoCao DATETIME,
@sKetqua NVARCHAR(100)
as
update tblHuongDan
set sMadt=@sMadt,sMagv=@sMagv,dNgayBD=@dNgayBD,dNgayBaoCao=@dNgayBaoCao,sKetqua=@sKetqua
where sMasv = @sMasv
GO
/****** Object:  StoredProcedure [dbo].[suaKhoa]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suaKhoa]
@sMakhoa NVARCHAR(10),
@sTenkhoa NVARCHAR(30),
@sDienthoai NVARCHAR(10),
@sDiaChi NVARCHAR(50)
as
update tblKhoa 
set sTenkhoa = @sTenkhoa, sDienthoai = @sDienthoai, sDiaChi = @sDiachi 
where sMakhoa = @sMakhoa
GO
/****** Object:  StoredProcedure [dbo].[suaSV]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suaSV]
@sMaSV nvarchar(10),
@sHoten nvarchar(30),
@sMakhoa nvarchar(10),
@dNgaysinh date,
@sGioitinh nvarchar(3),
@sQuequan nvarchar(100)
as
update tblSinhVien
set sHoten=@sHoten,sMakhoa=@sMakhoa,dNgaysinh=@dNgaysinh,sGioitinh=@sGioitinh,sQuequan=@sQuequan
where sMaSV = @sMaSV
GO
/****** Object:  StoredProcedure [dbo].[themDetai]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themDetai]
@sMadt nvarchar(10),
@sTendt nvarchar(30)
as
Insert into tblDetai(sMadt,sTendt) 
values(@sMadt,@sTendt)
GO
/****** Object:  StoredProcedure [dbo].[themGiangVien]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themGiangVien]
@sMaGV NVARCHAR(10),
@sMakhoa NVARCHAR(10),
@sTenGV NVARCHAR(30),
@sGT NVARCHAR(3),
@sSoDT NVARCHAR(10),
@taikhoan nvarchar(50),
@matkhau nvarchar(100)
as
Insert into tblGiangVien(sMaGV,sMakhoa,sTenGV,sGT,sSoDt,taikhoan,matkhau) 
values(@sMaGV,@sMakhoa,@sTenGV,@sGT,@sSoDt,@taikhoan,@matkhau)
GO
/****** Object:  StoredProcedure [dbo].[themHuongDan]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themHuongDan]
@sMasv NVARCHAR(10),
@sMadt NVARCHAR(10),
@sMagv NVARCHAR(10),
@dNgayBD DATETIME,
@dNgayBaoCao DATETIME,
@sKetqua NVARCHAR(100)
as
Insert into tblHuongDan(sMasv,sMadt,sMagv,dNgayBD,dNgayBaoCao,sKetqua)
values(@sMasv,@sMadt,@sMagv,@dNgayBD,@dNgayBaoCao,@sKetqua)
GO
/****** Object:  StoredProcedure [dbo].[themKhoa]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themKhoa]
@sMakhoa NVARCHAR(10),
@sTenkhoa NVARCHAR(30),
@sDienthoai NVARCHAR(10),
@sDiaChi NVARCHAR(50)
as
insert into tblKhoa(sMakhoa,sTenkhoa,sDienthoai,sDiachi) 
values(@sMakhoa, @sTenkhoa, @sDienthoai, @sDiachi)
GO
/****** Object:  StoredProcedure [dbo].[themSinhVien]    Script Date: 01/01/2022 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themSinhVien]
@sMaSV NVARCHAR(10),
@sHoten NVARCHAR(30),
@sMakhoa NVARCHAR(10),
@dNgaysinh DATETIME,
@sGioitinh nvarchar(3),
@sQuequan NVARCHAR(100)
as
Insert into tblSinhVien(sMaSV,sHoten,sMakhoa,dNgaysinh,sGioitinh,sQuequan) 
values(@sMaSV,@sHoten,@sMakhoa,@dNgaysinh,@sGioitinh,@sQuequan)
GO
USE [master]
GO
ALTER DATABASE [quanLyduan] SET  READ_WRITE 
GO
