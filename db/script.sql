USE [master]
GO
/****** Object:  Database [DuLich]    Script Date: 6/25/2017 8:18:17 AM ******/
CREATE DATABASE [DuLich]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DuLich', FILENAME = N'D:\EPU\asp\DuLich\db\DuLich.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DuLich_log', FILENAME = N'D:\EPU\asp\DuLich\db\DuLich_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DuLich] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DuLich].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DuLich] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DuLich] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DuLich] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DuLich] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DuLich] SET ARITHABORT OFF 
GO
ALTER DATABASE [DuLich] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DuLich] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DuLich] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DuLich] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DuLich] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DuLich] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DuLich] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DuLich] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DuLich] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DuLich] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DuLich] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DuLich] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DuLich] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DuLich] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DuLich] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DuLich] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DuLich] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DuLich] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DuLich] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DuLich] SET  MULTI_USER 
GO
ALTER DATABASE [DuLich] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DuLich] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DuLich] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DuLich] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DuLich]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Admin_Delete]
	@ID int
AS
	BEGIN
		DELETE FROM Admin WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Admin_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' * FROM [Admin] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Admin_Insert]
	@HoTen nvarchar(50),
	@TenDangNhap varchar(50),
	@MatKhau varchar(50)
AS
	BEGIN
		INSERT INTO [dbo].[Admin] VALUES (@HoTen,@TenDangNhap,@MatKhau)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Login]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Admin_Login]
@TenDangNhap	varchar(50),
@MatKhau	varchar(50)
AS
	Select count(*) from Admin where TenDangNhap = @TenDangNhap and MatKhau = @MatKhau


GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Admin_Update]
	@ID int,
	@HoTen nvarchar(50),
	@TenDangNhap varchar(50),
	@MatKhau varchar(50)
AS
	BEGIN
		UPDATE Admin SET
		HoTen = @HoTen,
		TenDangNhap = @TenDangNhap,
		MatKhau = @MatKhau
	WHERE ID=@ID
	END

--


GO
/****** Object:  StoredProcedure [dbo].[sp_DatTour_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatTour_Delete]
	@ID bigint
AS
	BEGIN
		DELETE FROM DatTour WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_DatTour_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatTour_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' * FROM [DatTour] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_DatTour_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatTour_Insert]
	@IDTour bigint = null,
	@IDKhachHang bigint = null,
	@HoTen nvarchar(50) = null,
	@DienThoai varchar(50) = null,
	@Email varchar(50) = null,
	@SoNL int = null,
	@SoTE int = null,
	@ThanhTien decimal(18,0) = null
AS
	BEGIN
		INSERT INTO [dbo].[DatTour] VALUES (@IDTour,@IDKhachHang,@HoTen,@DienThoai,@Email,@SoNL,@SoTE,@ThanhTien)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_DatTour_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatTour_Update]
	@ID bigint,
	@IDTour bigint,
	@IDKhachHang bigint,
	@HoTen nvarchar(50),
	@DienThoai varchar(50),
	@Email varchar(50),
	@SoNL int,
	@SoTE int,
	@ThanhTien decimal(18,0)
AS
	BEGIN
		UPDATE DatTour SET
		IDTour = @IDTour,
		IDKhachHang = @IDKhachHang,
		HoTen = @HoTen,
		DienThoai = @DienThoai,
		Email = @Email,
		SoNL = @SoNL,
		SoTE = @SoTE,
		ThanhTien = @ThanhTien
	WHERE ID=@ID
	END

--


GO
/****** Object:  StoredProcedure [dbo].[sp_DiaDanh_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DiaDanh_Delete]
	@ID bigint
AS
	BEGIN
		DELETE FROM DiaDanh WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_DiaDanh_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DiaDanh_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' * FROM [DiaDanh] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_DiaDanh_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DiaDanh_Insert]
	@TenDiaDanh nvarchar(500),
	@MoTa ntext
AS
	BEGIN
		INSERT INTO [dbo].[DiaDanh] VALUES (@TenDiaDanh,@MoTa)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_DiaDanh_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DiaDanh_Update]
	@ID bigint,
	@TenDiaDanh nvarchar(500),
	@MoTa ntext
AS
	BEGIN
	UPDATE DiaDanh SET
		TenDiaDanh = @TenDiaDanh,
		MoTa = @MoTa
	WHERE ID=@ID
	END

--


GO
/****** Object:  StoredProcedure [dbo].[sp_DichVuTour_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DichVuTour_Delete]
	@ID bigint
AS
	BEGIN
		DELETE FROM DichVuTour WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_DichVuTour_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DichVuTour_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' * FROM [DichVuTour] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_DichVuTour_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DichVuTour_Insert]
	@IDTour bigint,
	@TenDV nvarchar(500),
	@MoTaDV ntext,
	@InTour bit,
	@DonGia decimal(18,0),
	@NgayTao datetime
AS
	BEGIN
		INSERT INTO [dbo].[DichVuTour] VALUES (@IDTour,@TenDV,@MoTaDV,@InTour,@DonGia,@NgayTao)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_DichVuTour_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DichVuTour_Update]
	@ID bigint,
	@IDTour bigint,
	@TenDV nvarchar(500),
	@MoTaDV ntext,
	@InTour bit,
	@DonGia decimal(18,0),
	@NgayTao datetime
AS
	BEGIN
	UPDATE DichVuTour SET
		IDTour = @IDTour,
		TenDV = @TenDV,
		MoTaDV = @MoTaDV,
		InTour = @InTour,
		DonGia = @DonGia,
		NgayTao = @NgayTao
	WHERE ID=@ID
	END

--


GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_Delete]
	@ID bigint
AS
	BEGIN
		DELETE FROM KhachHang WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' * FROM [KhachHang] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_Insert]
	@HoTen nvarchar(50) = null,
	@TenDangNhap varchar(50) = null,
	@MatKhau varchar(50) = null,
	@DiaChi nvarchar(500) = null,
	@DienThoai varchar(50) = null,
	@Email varchar(50) = null,
	@NgayDangKy datetime = null
AS
	BEGIN
		INSERT INTO [dbo].[KhachHang] VALUES (@HoTen,@TenDangNhap,@MatKhau,@DiaChi,@DienThoai,@Email,@NgayDangKy)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Login]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_KhachHang_Login]
@TenDangNhap	varchar(50),
@MatKhau	varchar(50)
AS
	Select count(*) from KhachHang where TenDangNhap = @TenDangNhap and MatKhau = @MatKhau


GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_Update]
	@ID bigint = null,
	@HoTen nvarchar(50) = null,
	@TenDangNhap varchar(50) = null,
	@MatKhau varchar(50) = null,
	@DiaChi nvarchar(500) = null,
	@DienThoai varchar(50) = null,
	@Email varchar(50) = null
AS
	BEGIN
	UPDATE KhachHang SET
		HoTen = @HoTen,
		TenDangNhap = @TenDangNhap,
		MatKhau = @MatKhau,
		DiaChi = @DiaChi,
		DienThoai = @DienThoai,
		Email = @Email
	WHERE ID=@ID
	END

--


GO
/****** Object:  StoredProcedure [dbo].[sp_LienHe_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LienHe_Delete]
	@ID bigint
AS
	BEGIN
		DELETE FROM LienHe WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_LienHe_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LienHe_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' * FROM [LienHe] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_LienHe_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LienHe_Insert]
	@IDKhachHang bigint = null,
	@HoTen nvarchar(50) = null,
	@DiaChi nvarchar(500)= null,
	@DienThoai varchar(50)= null,
	@Email varchar(50)= null,
	@NgayLH datetime = null,
	@TieuDe nvarchar(500)= null,
	@NoiDung ntext= null,
	@PhanHoi ntext= null,
	@NguoiPH int= null
AS
	BEGIN
		INSERT INTO [dbo].[LienHe] VALUES (@IDKhachHang,@HoTen,@DiaChi,@DienThoai,@Email,@NgayLH,@TieuDe,@NoiDung,@PhanHoi,@NguoiPH)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_LienHe_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LienHe_Update]
	@ID bigint,
	@IDKhachHang bigint,
	@HoTen nvarchar(50),
	@DiaChi nvarchar(500),
	@DienThoai varchar(50),
	@Email varchar(50),
	@NgayLH datetime,
	@TieuDe nvarchar(500),
	@NoiDung ntext,
	@PhanHoi ntext,
	@NguoiPH int
AS
	BEGIN
	UPDATE LienHe SET
		IDKhachHang = @IDKhachHang,
		HoTen = @HoTen,
		DiaChi = @DiaChi,
		DienThoai = @DienThoai,
		Email = @Email,
		NgayLH = @NgayLH,
		TieuDe = @TieuDe,
		NoiDung = @NoiDung,
		PhanHoi = @PhanHoi,
		NguoiPH = @NguoiPH
	WHERE ID=@ID
	END

--


GO
/****** Object:  StoredProcedure [dbo].[sp_Page_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Page_Delete]
	@ID int
AS
	BEGIN
		DELETE FROM Page WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_Page_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Page_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' * FROM [Page] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_Page_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Page_Insert]
	@NoiDung ntext
AS
	BEGIN
		INSERT INTO [dbo].[Page] VALUES (@NoiDung)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_Page_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Page_Update]
	@ID int,
	@NoiDung ntext
AS
	BEGIN
	UPDATE Page SET
		NoiDung = @NoiDung
	WHERE ID=@ID
	END

--


GO
/****** Object:  StoredProcedure [dbo].[sp_QuangCao_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuangCao_Delete]
	@ID bigint
AS
	BEGIN
		DELETE FROM QuangCao WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_QuangCao_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuangCao_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' * FROM [QuangCao] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_QuangCao_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuangCao_Insert]
	@Image varchar(500) =null,
	@Width int =null,
	@Height int =null,
	@Url varchar(500) =null,
	@Target varchar(50) =null,
	@TimeBD time(7) =null,
	@TimeKT time(7) =null,
	@LuotClick int =null,
	@IsActive bit =null
AS
	BEGIN
		INSERT INTO [dbo].[QuangCao] VALUES (@Image,@Width,@Height,@Url,@Target,@TimeBD,@TimeKT,@LuotClick,@IsActive)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_QuangCao_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuangCao_Update]
	@ID bigint,
	@Image varchar(500),
	@Width int,
	@Height int,
	@Url varchar(500),
	@Target varchar(50),
	@TimeBD time(7),
	@TimeKT time(7),
	@LuotClick int,
	@IsActive bit
AS
	BEGIN
	UPDATE QuangCao SET
		Image = @Image,
		Width = @Width,
		Height = @Height,
		Url = @Url,
		Target = @Target,
		TimeBD = @TimeBD,
		TimeKT = @TimeKT,
		LuotClick = @LuotClick,
		IsActive = @IsActive
	WHERE ID=@ID
	END

--


GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_Delete]
	@ID bigint
AS
	BEGIN
		DELETE FROM TinTuc WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' TinTuc.* ,
	(select HoTen from Admin where Admin.ID = TinTuc.NguoiTao) as ''HoTen''
	FROM [TinTuc] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_Insert]
	@TieuDe ntext = null,
	@MoTa ntext = null,
	@NoiDung ntext = null,
	@AnhDaiDien varchar(500) = null,
	@NgayTao datetime = null,
	@NguoiTao int = null
AS
	BEGIN
		INSERT INTO [dbo].[TinTuc] VALUES (@TieuDe,@MoTa,@NoiDung,@AnhDaiDien,@NgayTao,@NguoiTao)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_Update]
	@ID bigint,
	@TieuDe ntext,
	@MoTa ntext,
	@NoiDung ntext,
	@AnhDaiDien varchar(500)
AS
	BEGIN
	UPDATE TinTuc SET
		TieuDe = @TieuDe,
		MoTa = @MoTa,
		NoiDung = @NoiDung,
		AnhDaiDien = @AnhDaiDien
	WHERE ID=@ID
	END

--


GO
/****** Object:  StoredProcedure [dbo].[sp_Tour_Delete]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Tour_Delete]
	@ID bigint
AS
	BEGIN
		DELETE FROM Tour WHERE ID=@ID
	END




GO
/****** Object:  StoredProcedure [dbo].[sp_Tour_getByTop]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Tour_getByTop]
@Top nvarchar(10),
@Where nvarchar(MAX),
@Order nvarchar(200)
AS
	Declare @SQL as nvarchar(MAX)
	Declare @strTop as nvarchar(100)
	Select @strTop=' ('+ @Top +') '
	if len(@Top)=0
		BEGIN
			Select @strTop=' 100 percent '
		END
	Select @SQL= 'SELECT top '+ @strTop +' * FROM [Tour] '
	if len(@Where)>0
		BEGIN
			Select @SQL= @SQL + ' Where ' + @Where
		END
	if len(@Order)>0
		BEGIN
			Select @SQL=@SQL +' Order by '+@Order
		END
	EXEC(@SQL)
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_Tour_Insert]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Tour_Insert]
	@TieuDe ntext,
	@DiaDiemXuatPhat nvarchar(500),
	@DiaDiemKetThuc nvarchar(500),
	@SoLuongTE int,
	@SoLuongNL int,
	@MoTaTour ntext,
	@MoTaPhuongTien ntext,
	@GiaTourTE decimal(18,0),
	@GiaTourNL decimal(18,0),
	@NgayKhoiHanh datetime,
	@NgayKetThuc datetime,
	@AnhMoTa text,
	@DSDiaDanh varchar(500)

AS
	BEGIN
		INSERT INTO [dbo].[Tour] VALUES (@TieuDe,@DiaDiemXuatPhat,@DiaDiemKetThuc,@SoLuongTE,@SoLuongNL,@MoTaTour,@MoTaPhuongTien,@GiaTourTE,@GiaTourNL,@NgayKhoiHanh,@NgayKetThuc,@AnhMoTa,@DSDiaDanh)
	END
	
--


GO
/****** Object:  StoredProcedure [dbo].[sp_Tour_Update]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Tour_Update]
	@ID bigint,
	@TieuDe ntext,
	@DiaDiemXuatPhat nvarchar(500),
	@DiaDiemKetThuc nvarchar(500),
	@SoLuongTE int,
	@SoLuongNL int,
	@MoTaTour ntext,
	@MoTaPhuongTien ntext,
	@GiaTourTE decimal(18,0),
	@GiaTourNL decimal(18,0),
	@NgayKhoiHanh datetime,
	@NgayKetThuc datetime,
	@AnhMoTa text,
	@DSDiaDanh varchar(500)
AS
	BEGIN
	UPDATE Tour SET
		TieuDe =  @TieuDe,
		DiaDiemXuatPhat = @DiaDiemXuatPhat,
		DiaDiemKetThuc = @DiaDiemKetThuc,
		SoLuongTE = @SoLuongTE,
		SoLuongNL = @SoLuongNL,
		MoTaTour = @MoTaTour,
		MoTaPhuongTien = @MoTaPhuongTien,
		GiaTourTE = @GiaTourTE,
		GiaTourNL = @GiaTourNL,
		NgayKhoiHanh = @NgayKhoiHanh,
		NgayKetThuc = @NgayKetThuc,
		AnhMoTa = @AnhMoTa,
		DSDiaDanh = @DSDiaDanh
	WHERE ID=@ID
	END

--


GO
/****** Object:  Table [dbo].[Admin]    Script Date: 6/25/2017 8:18:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TenDangNhap] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatTour]    Script Date: 6/25/2017 8:18:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatTour](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDTour] [bigint] NULL,
	[IDKhachHang] [bigint] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DienThoai] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[SoNL] [int] NULL,
	[SoTE] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DatTour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiaDanh]    Script Date: 6/25/2017 8:18:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaDanh](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenDiaDanh] [nvarchar](500) NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_DiaDanh] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVuTour]    Script Date: 6/25/2017 8:18:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVuTour](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDTour] [bigint] NULL,
	[TenDV] [nvarchar](500) NULL,
	[MoTaDV] [ntext] NULL,
	[InTour] [bit] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_DichVuTour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/25/2017 8:18:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TenDangNhap] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[DienThoai] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[NgayDangKy] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 6/25/2017 8:18:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LienHe](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDKhachHang] [bigint] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[DienThoai] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[NgayLH] [datetime] NULL,
	[TieuDe] [nvarchar](500) NULL,
	[NoiDung] [ntext] NULL,
	[PhanHoi] [ntext] NULL,
	[NguoiPH] [int] NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Page]    Script Date: 6/25/2017 8:18:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuangCao]    Script Date: 6/25/2017 8:18:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuangCao](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Image] [varchar](500) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Url] [varchar](500) NULL,
	[Target] [varchar](50) NULL,
	[TimeBD] [time](7) NULL,
	[TimeKT] [time](7) NULL,
	[LuotClick] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_QuangCao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 6/25/2017 8:18:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TinTuc](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TieuDe] [ntext] NULL,
	[MoTa] [ntext] NULL,
	[NoiDung] [ntext] NULL,
	[AnhDaiDien] [varchar](500) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [int] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 6/25/2017 8:18:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TieuDe] [ntext] NULL,
	[DiaDiemXuatPhat] [nvarchar](500) NULL,
	[DiaDiemKetThuc] [nvarchar](500) NULL,
	[SoLuongTE] [int] NULL,
	[SoLuongNL] [int] NULL,
	[MoTaTour] [ntext] NULL,
	[MoTaPhuongTien] [ntext] NULL,
	[GiaTourTE] [decimal](18, 0) NULL,
	[GiaTourNL] [decimal](18, 0) NULL,
	[NgayKhoiHanh] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[AnhMoTa] [text] NULL,
	[DSDiaDanh] [nvarchar](500) NULL,
	[ConNL] [int] NULL,
	[ConTE] [int] NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [HoTen], [TenDangNhap], [MatKhau]) VALUES (1, N'Vũ Xuân Chiều', N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[DatTour] ON 

INSERT [dbo].[DatTour] ([ID], [IDTour], [IDKhachHang], [HoTen], [DienThoai], [Email], [SoNL], [SoTE], [ThanhTien]) VALUES (4, 3, NULL, N'Vũ Xuân Chiều', N'099999999999', N'dvkmxcv@gmail.com', 1, 0, CAST(290000 AS Decimal(18, 0)))
INSERT [dbo].[DatTour] ([ID], [IDTour], [IDKhachHang], [HoTen], [DienThoai], [Email], [SoNL], [SoTE], [ThanhTien]) VALUES (5, 1, NULL, N'Vũ Xuân Chiều', N'099999999999', N'dvkmxcv@gmail.com', 1, 1, CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[DatTour] ([ID], [IDTour], [IDKhachHang], [HoTen], [DienThoai], [Email], [SoNL], [SoTE], [ThanhTien]) VALUES (6, 3, NULL, N'Vũ Xuân Chiều', N'099999999999', N'dvkmxcv@gmail.com', 1, 1, CAST(490000 AS Decimal(18, 0)))
INSERT [dbo].[DatTour] ([ID], [IDTour], [IDKhachHang], [HoTen], [DienThoai], [Email], [SoNL], [SoTE], [ThanhTien]) VALUES (7, 1, 1, NULL, NULL, NULL, 1, 0, CAST(1900000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DatTour] OFF
SET IDENTITY_INSERT [dbo].[DiaDanh] ON 

INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (1, N'Vịnh Hạ Long', N'Vịnh Hạ Long')
INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (2, N'Mù Cang Chải', N'Mù Cang Chải')
INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (3, N'Châu Đốc - An Giang', N'Châu Đốc - An Giang')
INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (4, N'Đà Lạt', N'Đà Lạt')
INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (5, N'Văn Miếu Quốc Tử Giám', N'Văn Miếu Quốc Tử Giám')
INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (6, N'Phố cổ Hội An', N'Phố cổ Hội An')
INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (7, N'Cố đô Huế', N'Cố đô Huế')
INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (8, N'Cao nguyên Mộc Châu', N'Cao nguyên Mộc Châu')
INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (9, N'Sapa', N'Sapa')
INSERT [dbo].[DiaDanh] ([ID], [TenDiaDanh], [MoTa]) VALUES (10, N'Nha Trang', N'Nha Trang')
SET IDENTITY_INSERT [dbo].[DiaDanh] OFF
SET IDENTITY_INSERT [dbo].[DichVuTour] ON 

INSERT [dbo].[DichVuTour] ([ID], [IDTour], [TenDV], [MoTaDV], [InTour], [DonGia], [NgayTao]) VALUES (1, 1, N'Khách sạn ABC', N'Khách sạn ABC', 1, NULL, CAST(0x0000A78C00091DC0 AS DateTime))
INSERT [dbo].[DichVuTour] ([ID], [IDTour], [TenDV], [MoTaDV], [InTour], [DonGia], [NgayTao]) VALUES (2, 2, N'Xe ô tô 20 chỗ', N'Xe ô tô 20 chỗ', 1, NULL, CAST(0x0000A78C00091DC0 AS DateTime))
INSERT [dbo].[DichVuTour] ([ID], [IDTour], [TenDV], [MoTaDV], [InTour], [DonGia], [NgayTao]) VALUES (3, 1, N'Xe ô tô 16 chỗ', N'Xe ô tô 16 chỗ', 1, NULL, CAST(0x0000A78C00093B16 AS DateTime))
INSERT [dbo].[DichVuTour] ([ID], [IDTour], [TenDV], [MoTaDV], [InTour], [DonGia], [NgayTao]) VALUES (4, 2, N'Khách sạn AAA', N'Khách sạn AAA', 1, NULL, CAST(0x0000A78C0009405F AS DateTime))
SET IDENTITY_INSERT [dbo].[DichVuTour] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([ID], [HoTen], [TenDangNhap], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKy]) VALUES (1, N'Nguyễn Văn An', N'an', N'an', N'Hà Nội', N'4444444444444', N'&nbsp;', CAST(0x0000A78900F9E82C AS DateTime))
INSERT [dbo].[KhachHang] ([ID], [HoTen], [TenDangNhap], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKy]) VALUES (2, N'Nguyễn Thị Bình', N'binh', N'binh', NULL, NULL, NULL, CAST(0x0000A78900F9FB59 AS DateTime))
INSERT [dbo].[KhachHang] ([ID], [HoTen], [TenDangNhap], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKy]) VALUES (7, N'Vũ Xuân Chiều', N'chieu', N'chieu', N'Hà Nội', N'099999999999', N'&nbsp@vff', CAST(0x0000A78C018337BC AS DateTime))
INSERT [dbo].[KhachHang] ([ID], [HoTen], [TenDangNhap], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKy]) VALUES (8, NULL, N'Hoa', N'hoa', NULL, NULL, N'hoa@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([ID], [IDKhachHang], [HoTen], [DiaChi], [DienThoai], [Email], [NgayLH], [TieuDe], [NoiDung], [PhanHoi], [NguoiPH]) VALUES (1, NULL, N'Vũ Xuân Chiều', N'Hà Nội', N'099999999999', N'dvkmxcv@gmail.com', CAST(0x0000A78D001A54A0 AS DateTime), N'jksdln', N'sdgggggggggggggggggggggggggggggggggggggggg', NULL, NULL)
INSERT [dbo].[LienHe] ([ID], [IDKhachHang], [HoTen], [DiaChi], [DienThoai], [Email], [NgayLH], [TieuDe], [NoiDung], [PhanHoi], [NguoiPH]) VALUES (2, NULL, N'Nguyễn Văn An', N'Hà Nội', N'099999999999', N'dsfgsdfghdf@gmail.com', CAST(0x0000A78D001B402C AS DateTime), N'jksdln', N'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', NULL, NULL)
INSERT [dbo].[LienHe] ([ID], [IDKhachHang], [HoTen], [DiaChi], [DienThoai], [Email], [NgayLH], [TieuDe], [NoiDung], [PhanHoi], [NguoiPH]) VALUES (3, 1, NULL, NULL, NULL, NULL, CAST(0x0000A78D001C0C14 AS DateTime), N'd', N'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', NULL, NULL)
SET IDENTITY_INSERT [dbo].[LienHe] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([ID], [TieuDe], [NoiDung]) VALUES (1, N'About', N'<!-- about -->
	<div class="welcome about">
		<div class="container">  
			<h3 class="agileits-title">About Us</h3>
			<div class="about-grids"> 
				<div class="col-md-5 welcome-w3right">
					<img src="Template/images/img4.jpg" class="img-responsive" alt="" />
				</div>
				<div class="col-md-7 welcome-w3left">
					<h4>Temporibus autem quibusdam</h4>
					<p>Voluptas assumenda est, omnis dolor repellendus. 
						Temporibus autem quibusdam et aut officiis debitis aut 
						rerum necessitatibus saepe.Nam libero tempore, cum soluta nobis est eligendi optio cumque 
						nihil impedit quo minus id quod maxime placeat facere possimus, 
						omnis voluptas assumenda est, omnis dolor repellendus.</p> <br> <br>
					<h4>Nam libero tempore cum soluta</h4>
					<p> Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe  possimus, 
						omnis voluptas assumenda est.</p> 
				</div> 
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //about -->
	<!-- statistics -->
	<div class="container">
		<div class="stats welcome"> 
			<div class="col-xs-4 col-md-4 agileinfo_stats_grid">
				<h4 class="counter">5654</h4>
				<h5>Tours Conducted</h5>
			</div>
			<div class="col-xs-4 col-md-4 agileinfo_stats_grid">
				<h4 class="counter">432</h4>
				<h5>Branches</h5>
			</div>
			<div class="col-xs-4 col-md-4 agileinfo_stats_grid">
				<h4 class="counter">25</h4>
				<h5>Available Countries</h5>
			</div> 
			<div class="clearfix"> </div> 
			<!-- Stats-Number-Scroller-Animation-JavaScript -->
			<script src="js/waypoints.min.js"></script> 
			<script src="js/counterup.min.js"></script> 
			<script>
                jQuery(document).ready(function ($) {
                    $(''.counter'').counterUp({
                        delay: 10,
                        time: 1000
                    });
                });
			</script>
			<!-- //Stats-Number-Scroller-Animation-JavaScript --> 
		</div>
	</div>
	<!-- //statistics -->
	<!-- about-features -->
	<div class="slid about-slid">
		<div class="container">
			<h3>Fusce sed vulputate dui, non consectetur felis, Etiam id enim sem Suspendisse commodo tempor magna </h3>
		</div>
	</div>
	<!-- //about-features -->
	<!-- team -->
	<div class="welcome team">
		<div class="container">
			<h3 class="agileits-title">Meet Our Team</h3> 
			<div class="team-grids"> 
				<ul class="ch-grid">
					<li class="ch-grid-item">
						<div class="ch-item ch-img-1">
							<div class="ch-info">
								<h3>Consultant</h3>
								<p>by Daniel Nyari</p>
								<ul class="social-icons">
									<li><a href="#" class="fa fa-facebook icon icon-border facebook"> </a></li>
									<li><a href="#" class="fa fa-twitter icon icon-border twitter"> </a></li>
									<li><a href="#" class="fa fa-google-plus icon icon-border googleplus"> </a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="ch-grid-item">
						<div class="ch-item ch-img-2">
							<div class="ch-info">
								<h3>Travel Agent</h3>
								<p>by Johnathen</p>
								<ul class="social-icons">
									<li><a href="#" class="fa fa-facebook icon icon-border facebook"> </a></li>
									<li><a href="#" class="fa fa-twitter icon icon-border twitter"> </a></li>
									<li><a href="#" class="fa fa-google-plus icon icon-border googleplus"> </a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="ch-grid-item">
						<div class="ch-item ch-img-3">
							<div class="ch-info">
								<h3>Co-Founder</h3>
								<p>by Fedrick Paul</p>
								<ul class="social-icons">
									<li><a href="#" class="fa fa-facebook icon icon-border facebook"> </a></li>
									<li><a href="#" class="fa fa-twitter icon icon-border twitter"> </a></li>
									<li><a href="#" class="fa fa-google-plus icon icon-border googleplus"> </a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="ch-grid-item">
						<div class="ch-item ch-img-4">
							<div class="ch-info">
								<h3>Master Agent</h3>
								<p>by Stellawil vari</p>
								<ul class="social-icons">
									<li><a href="#" class="fa fa-facebook icon icon-border facebook"> </a></li>
									<li><a href="#" class="fa fa-twitter icon icon-border twitter"> </a></li>
									<li><a href="#" class="fa fa-google-plus icon icon-border googleplus"> </a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
				<div class="clearfix"> </div>  
			</div>
		</div>
	</div>
	<!-- //team -->  
	<!-- slid -->
	<div class="slid">
		<div class="container">
			<h4>Today Special</h4> 
			<p>In malesuada accumsan felis, a imperdiet arcu blandit sed. Ut id faucibus eros. Fusce sed vulputate dui, non consectetur felis. Etiam id enim sem. Suspendisse commodo tempor magna </p>
		</div> 
	</div>
	<!-- //slid -->
	<!-- newsletter -->
	<div class="newsletter">
		<div class="container">
			<h3 class="agileits-title">Newsletter</h3>
			<p>Mauris est odio laoreet laoreet sapien non, sollicitudin bibendum nulla amet purus sodales blandit.</p>
			<form action="#" method="post"> 
				<input type="text" name="email" placeholder="Enter your Email..." required="">
				<input type="submit" value="Subscribe">
				<div class="clearfix"> </div> 
			</form> 
		</div> 
	</div>
	<!-- //newsletter -->')
INSERT [dbo].[Page] ([ID], [TieuDe], [NoiDung]) VALUES (2, N'Contact', N'<h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>')
SET IDENTITY_INSERT [dbo].[Page] OFF
SET IDENTITY_INSERT [dbo].[QuangCao] ON 

INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (1, N'Ads/1.gif', 250, 250, N'https://google.com', N'_blank', CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), 1, 1)
INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (2, N'Ads/2.gif', 250, 250, N'https://google.com', N'_blank', NULL, NULL, NULL, 1)
INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (3, N'Ads/3.gif', 250, 250, N'https://google.com', N'_blank', NULL, NULL, NULL, 1)
INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (4, N'Ads/4.gif', 250, 250, N'https://google.com', N'_blank', NULL, NULL, NULL, 1)
INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (5, N'Ads/5.jpg', 250, 250, N'https://google.com', N'_blank', NULL, NULL, NULL, 1)
INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (6, N'Ads/6.gif', 250, 250, N'https://google.com', N'_blank', NULL, NULL, NULL, 1)
INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (7, N'Ads/7.jpg', 250, 250, N'https://google.com', N'_blank', NULL, NULL, NULL, 1)
INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (8, N'Ads/8.jpg', 250, 250, N'https://google.com', N'_blank', NULL, NULL, NULL, 1)
INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (9, N'Ads/9.jpg', 250, 250, N'https://google.com', N'_blank', NULL, NULL, NULL, 1)
INSERT [dbo].[QuangCao] ([ID], [Image], [Width], [Height], [Url], [Target], [TimeBD], [TimeKT], [LuotClick], [IsActive]) VALUES (10, N'Ads/10.gif', 250, 250, N'https://google.com', N'_blank', CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), 0, 1)
SET IDENTITY_INSERT [dbo].[QuangCao] OFF
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (1, N'Du khách đu zipline từ tháp Eiffel với tốc độ 90 km/h', N'Từ 5/6 đến 11/6 du khách đến Paris có cơ hội thử thách bản thân với trò đu zipline mạo hiểm từ tháp Eiffel tới công trình L''École Militaire. ', N'<p>Du khách có cơ hội đu zipline từ tháp Eiffel và ngắm Paris từ một góc nhìn mới từ ngày 5/6 tới hết 11/6. Đây là một trong những hoạt động khởi đầu cho kế hoạch mùa hè của Paris. Ngoài zipline, thành phố còn tổ chức lễ hội nhạc Jazz, chiếu phim trên bãi biển, mở cửa nhiều triển lãm tại các bảo tàng... </p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (2, N'5 món ăn đêm hút khách ở Sài Gòn bất kể đông hè', N'Người Sài Gòn có thói quen ăn đêm bằng những món ăn khá "chắc bụng" như cơm tấm, xôi mặn, hủ tiếu... bất kể mùa đông hay hè.', N'<p>Nhiều du khách đến Sài Gòn khá bất ngờ khi người ở đây ăn cơm tấm vào sáng sớm, và cả đêm khuya. Các hàng cơm tấm đêm có ở khắp nơi, đặc biệt ở các khu chợ, gần nhà ga, bến xe, bệnh viện... Cơm tấm sườn nướng đơn giản, đến cơm tấm ốp la, sườn bì chả, nem nướng... đa dạng cho thực khách chọn. Bạn có thể ăn cơm tấm đêm vỉa hè giá 18.000 đồng, cơm tấm trong tiệm nổi tiếng giá 60.000 đồng.</p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (3, N'Gợi ý lịch trình 4 ngày trốn nắng ở Chiang Mai', N'Vùng đất nhiều cây rừng và những quán cà phê xanh mướt sẽ là điểm trốn nắng lý tưởng khi bạn đến vùng Bắc Thái Lan, Chiang Mai.', N'<p>Chiang Mai đang là điểm đến hot của Thái Lan với các du khách Việt. Do nằm ở phía bắc Thái Lan, địa hình cao, núi đồi bao quanh nên khí hậu ở Chiang Mai mát hơn hẳn so với các vùng khác của đất nước. Từ Việt Nam chưa có đường bay thẳng đến đây, bạn có thể bay nối chuyến ở Bangkok. Các hãng hàng không giá rẻ có đường bay Bangkok - Chiang Mai như Air Asia, Thai Lion, Thai Smile... Tổng thời gian bay 2 chặng là 3 tiếng (chưa kể thời gian quá cảnh).</p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (4, N'Hơn 3 triệu vé 0 đồng tung ra tháng 6', N'Vietjet và AirAsia đồng loạt tung vé 0 đồng cho các đường bay giúp khách tiết kiệm chi phí cho chuyến du lịch.', N'<p>Từ nay đến ngày 9/6, Vietnam Airlines triển khai chương trình “Bay cùng hoa sen 5 ngày vàng tháng 6" với các chặng quốc tế. Vé khứ hồi giá từ 99 USD đã bao gồm thuế, phí, trừ hành trình khởi hành từ Đông Nam Á.</p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (5, N'Bên trong khu nghỉ dưỡng hàng đầu châu Á', N'Khu nghỉ dưỡng 5 sao Naman Retreat gây ấn tượng cho du khách với lối kiến trúc độc đáo, mang đậm dấu ấn làng quê Việt.', N'<p>Nằm trải dài hàng trăm mét trên bãi biển Đà Nẵng - một trong 6 bãi biển đẹp nhất hành tinh do tạp chí Forbes (Mỹ) bình chọn, khu nghỉ dưỡng Naman Retreat thuộc Tập đoàn Empire sở hữu 242 biệt thự và phòng khách sạn tiêu chuẩn 5 sao với lối kiến trúc độc đáo, ấn tượng.</p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (6, N'10 điểm du lịch Đà Lạt cho bạn thỏa sức khám phá hè này', N'Thứ hai, 5/6/2017 | 07:37 GMT+7|
10 điểm du lịch Đà Lạt cho bạn thỏa sức khám phá hè này
Đến đồi Thiên Phúc Đức, Ma Rừng Lữ Quán, thác Pongour du khách có thể cắm trại, tận hưởng mùa hè dưới tán thông xanh, ngắm thác, làm tiệc nướng...', N'<p>Đồi nằm đối diện với Langbiang, cách trung tâm thành phố Đà Lạt gần 10 km nhưng vì chưa được khai thác du lịch nhiều nên đoạn đường lên đồi không thuận lợi như những nơi khác. Tuy nhiên, không vì thế mà nhiều du khách bỏ cuộc bởi chỉ mất chừng 20 phút đã đến ngay đỉnh đồi và có thể tận hưởng một không gian huyền ảo của Đà Lạt. Đồi Thiên Phúc Đức là một địa điểm thu hút nhiều tay máy chuyên nghiệp lẫn nghiệp dư đến "săn" những khoảnh khắc đẹp nhất như sương sớm, biển mây bồng bềnh... </p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (7, N'Vùng biển biến mất hai lần một ngày
', N'Du khách có thể đi bộ chân trần trên biển Wadden khi nước rút làm lộ ra những thềm bùn thoai thoải và vùng đất lầy rộng lớn. ', N'<p>Bờ phía đông nam của biển Bắc (North Sea), giáp Đan Mạch và Hà Lan, là một vành đai bùn và đảo. Bình thường nơi này bị ngập nước biển nhưng mỗi ngày có hai lần thủy triều rút làm lộ ra 15 km thềm bùn rộng lớn. Khu vực này nổi tiếng với tên biển Wadden và được mô tả là "một trong những hệ sinh thái gian triều (vùng đất thủy triều lên, xuống) cuối cùng trên thế giới". </p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (8, N'Nơi vịt cưỡi trên lưng cả nghìn con cá chép', N'Hàng nghìn con cá chen chúc trong đập tràn Linesville, trên lưng chúng là những con vịt đi lại tranh cướp đống bánh mì du khách ném xuống.', N'<p>Đập tràn Linesville (nằm trên hồ điều hòa Pymatuning) trở thành điểm du lịch đông khách thứ hai tại bang Pennsylvania, Mỹ do là nơi cư ngụ của chục nghìn con cá chép. Nơi đây mỗi năm đón nửa triệu lượt khách, xếp sau mỗi Liberty Bell (chuông Tự Do).</p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (9, N'Tháng trải nghiệm ẩm thực ba miền tại khách sạn Hà Nội', N'Chương trình Tháng ẩm thực Việt diễn ra trong suốt tháng 6 tại Hà Nội tạo cơ hội cho thực khách thưởng thức 40 món khác nhau.', N'<p>Ngoài các món ăn Việt nổi tiếng như phở cuốn, phở Hà Nội, bún bò Huế, hủ tiếu Nam Vang..., khách sạn Daewoo Hà Nội phục vụ các món ăn Âu - Á thượng hạng với thực đơn buffet hấp dẫn. Bên cạnh không gian ăn uống sang trọng, khách sạn còn dành riêng một khu vực cho trẻ nhỏ với nhiều hoạt động hấp dẫn như tạo hình bóng nghệ thuật, vẽ tranh, làm kẹo bông… Đặc biệt, trẻ sẽ được tận mắt xem nghệ nhân làm tò he vào các buổi tối từ thứ 6 đến chủ nhật.</p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
INSERT [dbo].[TinTuc] ([ID], [TieuDe], [MoTa], [NoiDung], [AnhDaiDien], [NgayTao], [NguoiTao]) VALUES (10, N'Những điểm nóng du lịch trước và trong nghỉ lễ', N'Các bãi biển ở Sầm Sơn, Nha Trang trở thành "biển người". Đường đến Tam Đảo, Mẫu Sơn, Cúc Phương thường xuyên ùn tắc do lượng xe cộ lớn đổ về.', N'<p>Dịp nghỉ lễ trùng với mùa sinh sản của bướm rừng nên Cúc Phương thu hút rất nhiều du khách. Lượng xe và người tăng đột biến khiến nhiều đoạn đường dẫn vào vườn quốc gia bị tắc cứng. Các xe máy nhỏ len lên trước trong khi hàng loạt ôtô chỉ có thể nhích từng chút một. Tại khu vực mua vé xảy ra tình trạng chen lấn, một số du khách chờ đợi quá lâu dưới thời tiết nắng nóng nên quyết định ra về.</p>', N'Template/images/img1.jpg', CAST(0x0000A78C00F7E363 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([ID], [TieuDe], [DiaDiemXuatPhat], [DiaDiemKetThuc], [SoLuongTE], [SoLuongNL], [MoTaTour], [MoTaPhuongTien], [GiaTourTE], [GiaTourNL], [NgayKhoiHanh], [NgayKetThuc], [AnhMoTa], [DSDiaDanh], [ConNL], [ConTE]) VALUES (1, N'Tour Hà Nội – Quan Lạn – Hà Nội 3N2Đ, Đi Tàu Cao Tốc - Cho 01 Người', N'Hà Nội', N'Hà Nội', 5, 5, N'Tour Hà Nội – Quan Lạn – Hà Nội 3N2Đ, Đi Tàu Cao Tốc - Cho 01 Người. Voucher 2,890,000 VNĐ, Còn 1,950,000 VNĐ, Giảm 33%. Chỉ Có Tại Hotdeal.vn!', N' Xe ô tô đời mới vận chuyển theo lịch trình', CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(0x0000A79D00000000 AS DateTime), CAST(0x0000A79F00000000 AS DateTime), N'Template/images/img1.jpg', N'Hà Nội;Quan Lợn;Hà Nội', 3, 4)
INSERT [dbo].[Tour] ([ID], [TieuDe], [DiaDiemXuatPhat], [DiaDiemKetThuc], [SoLuongTE], [SoLuongNL], [MoTaTour], [MoTaPhuongTien], [GiaTourTE], [GiaTourNL], [NgayKhoiHanh], [NgayKetThuc], [AnhMoTa], [DSDiaDanh], [ConNL], [ConTE]) VALUES (2, N'Đà Nẵng - Ngũ Hành Sơn - Hội An - Bà Nà Hill - Huế - Phong nha 5N4Đ + Khách Sạn 3* - Dành Cho 01 Người', N'Đà Nẵng', N'Phong Nha', 0, 1, N'Đà Nẵng - Ngũ Hành Sơn - Hội An - Bà Nà Hill - Huế - Phong nha 5N4Đ + Khách Sạn 3* - Dành Cho 01 Người. Voucher 5,250,000 VNĐ, Còn 3,580,000 VNĐ, Giảm 32%. Chỉ Có Tại Hotdeal.vn!', N'Xe ô tô riêng đón sân bay Đà Nẵng đưa về khách sạn và tiễn sân bay Huế', CAST(0 AS Decimal(18, 0)), CAST(3580000 AS Decimal(18, 0)), CAST(0x0000A79D00000000 AS DateTime), CAST(0x0000A79F00000000 AS DateTime), N'Template/images/img2.jpg', N'Đà Nẵng;Ngũ Hành Sơn;Hội An;Bà Nà Hill;Huế;Phong nha', 1, 0)
INSERT [dbo].[Tour] ([ID], [TieuDe], [DiaDiemXuatPhat], [DiaDiemKetThuc], [SoLuongTE], [SoLuongNL], [MoTaTour], [MoTaPhuongTien], [GiaTourTE], [GiaTourNL], [NgayKhoiHanh], [NgayKetThuc], [AnhMoTa], [DSDiaDanh], [ConNL], [ConTE]) VALUES (3, N'Tour 01 Ngày Khám Phá Ngũ Hành Sơn - Làng Đá Non Nước - Đô Thị Cổ Hội An, Tự Do Ăn tối - Dành Cho 01 Khách', N'Ngũ Hành Sơn', N'Hội An', 2, 2, N'Tour 01 Ngày Khám Phá Ngũ Hành Sơn - Làng Đá Non Nước - Đô Thị Cổ Hội An, Tự Do Ăn tối - Dành Cho 01 Khách. Voucher 400,000 VNĐ, Còn 290,000 VNĐ, Giảm 28%. Chỉ Có Tại Hotdeal.vn!', N'Xe du lịch đời mới, lái xe vui vẻ nhiều kinh nghiệm', CAST(200000 AS Decimal(18, 0)), CAST(290000 AS Decimal(18, 0)), CAST(0x0000A79D00000000 AS DateTime), CAST(0x0000A79E00000000 AS DateTime), N'Template/images/img3.jpg', N'Ngũ Hành Sơn;Làng Đá Non Nước;Đô Thị Cổ Hội An', 0, 1)
INSERT [dbo].[Tour] ([ID], [TieuDe], [DiaDiemXuatPhat], [DiaDiemKetThuc], [SoLuongTE], [SoLuongNL], [MoTaTour], [MoTaPhuongTien], [GiaTourTE], [GiaTourNL], [NgayKhoiHanh], [NgayKetThuc], [AnhMoTa], [DSDiaDanh], [ConNL], [ConTE]) VALUES (4, N'Tour Khám Phá, Nghỉ Dưỡng Cuối Tuần Tại Tam Đảo - Thị Trấn Mờ Sương, Cho 01 Người
', N'Tam Đảo', N'Thị Trấn Mờ Sương', 0, 1, N'Tour Khám Phá, Nghỉ Dưỡng Cuối Tuần Tại Tam Đảo - Thị Trấn Mờ Sương, Cho 01 Người. Voucher 1,500,000 VNĐ, Còn 920,000 VNĐ, Giảm 39%. Chỉ Có Tại Hotdeal.vn!', N'Tour du dịch đảm bảo cung cấp cho bạn những điều kiện chu đáo (xe ô tô đưa đón đời mới, các bữa ăn đầy đủ, thơm ngon theo ẩm thực vùng miền, khách sạn tiện nghi…bảo hiểm du lịch).', CAST(0 AS Decimal(18, 0)), CAST(950000 AS Decimal(18, 0)), CAST(0x0000A79D00000000 AS DateTime), CAST(0x0000A79F00000000 AS DateTime), N'Template/images/img4.jpg', N'Tam Đảo;Thị Trấn Mờ Sương', 1, 0)
INSERT [dbo].[Tour] ([ID], [TieuDe], [DiaDiemXuatPhat], [DiaDiemKetThuc], [SoLuongTE], [SoLuongNL], [MoTaTour], [MoTaPhuongTien], [GiaTourTE], [GiaTourNL], [NgayKhoiHanh], [NgayKetThuc], [AnhMoTa], [DSDiaDanh], [ConNL], [ConTE]) VALUES (5, N'Khám Phá Thung Nai - Đền Chúa Thác Bờ - Động Thác Bờ 01 Ngày - Dành Cho 01 Người', N'Thung Nai', N'Động Thác Bờ', 0, 1, N'Khám Phá Thung Nai - Đền Chúa Thác Bờ - Động Thác Bờ 01 Ngày - Dành Cho 01 Người. Voucher 750,000 VNĐ, Còn 530,000 VNĐ, Giảm 29%. Chỉ Có Tại Hotdeal.vn!', N' Xe ô tô đời mới vận chuyển theo lịch trình', CAST(0 AS Decimal(18, 0)), CAST(530000 AS Decimal(18, 0)), CAST(0x0000A79D00000000 AS DateTime), CAST(0x0000A7A100000000 AS DateTime), N'Template/images/img1.jpg', N' Thung Nai;Đền Chúa Thác Bờ;Động Thác Bờ', 1, 0)
SET IDENTITY_INSERT [dbo].[Tour] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Admin]    Script Date: 6/25/2017 8:18:18 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Admin] ON [dbo].[Admin]
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_KhachHang]    Script Date: 6/25/2017 8:18:18 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KhachHang] ON [dbo].[KhachHang]
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_KhachHang_NgayDangKy]  DEFAULT (getdate()) FOR [NgayDangKy]
GO
ALTER TABLE [dbo].[DatTour]  WITH CHECK ADD  CONSTRAINT [FK_DatTour_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[DatTour] CHECK CONSTRAINT [FK_DatTour_KhachHang]
GO
ALTER TABLE [dbo].[DatTour]  WITH CHECK ADD  CONSTRAINT [FK_DatTour_Tour] FOREIGN KEY([IDTour])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[DatTour] CHECK CONSTRAINT [FK_DatTour_Tour]
GO
ALTER TABLE [dbo].[DichVuTour]  WITH CHECK ADD  CONSTRAINT [FK_DichVuTour_Tour1] FOREIGN KEY([IDTour])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[DichVuTour] CHECK CONSTRAINT [FK_DichVuTour_Tour1]
GO
ALTER TABLE [dbo].[LienHe]  WITH CHECK ADD  CONSTRAINT [FK_LienHe_Admin] FOREIGN KEY([NguoiPH])
REFERENCES [dbo].[Admin] ([ID])
GO
ALTER TABLE [dbo].[LienHe] CHECK CONSTRAINT [FK_LienHe_Admin]
GO
ALTER TABLE [dbo].[LienHe]  WITH CHECK ADD  CONSTRAINT [FK_LienHe_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[LienHe] CHECK CONSTRAINT [FK_LienHe_KhachHang]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_Admin] FOREIGN KEY([NguoiTao])
REFERENCES [dbo].[Admin] ([ID])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_Admin]
GO
USE [master]
GO
ALTER DATABASE [DuLich] SET  READ_WRITE 
GO
