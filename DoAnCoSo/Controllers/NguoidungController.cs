using System;
using System.Collections.Generic;
using System.Linq;

using DoAnCoSo.Models;
using System.Web.Mvc;

namespace DoAnCoSo.Controllers
{
    public class NguoidungController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection collection, KHACHHANG kh)
        {
            var hoten = collection["HotenKH"];
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            var matkhaunhaplai = collection["Matkhaunhaplai"];
            var diachi = collection["Diachi"];
            var email = collection["Email"];
            var dienthoaikh = collection["DienthoaiKH"];
            
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống";

            }
            else if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Phải nhập tên đăng nhập";

            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Phải nhập mật khẩu";

            }
            else if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi4"] = "Phải nhập lại mật khẩu";

            }
            if (String.IsNullOrEmpty(diachi))
            {
                ViewData["Loi5"] = "Địa chỉ không được bỏ trống";

            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi6"] = "Email không được bỏ trống";

            }
            else if (String.IsNullOrEmpty(dienthoaikh))
            {
                ViewData["Loi7"] = "Phải nhập điện thoại";

            }
            else
            {
                using (var db = new cakeDataContext())
                {
                    kh.HoTen = hoten;
                    kh.Taikhoan = tendn;
                    kh.Matkhau= matkhau;
                    kh.Email = email;
                    kh.DiachiKH = diachi;
                    kh.DienthoaiKH = dienthoaikh;
                    db.KHACHHANGs.InsertOnSubmit(kh);
                    db.SubmitChanges();

                    //  db.SaveChanges();
                }
                return RedirectToAction("Dangnhap");

            }
            return this.Dangky();
        }
        [HttpGet]
        public ActionResult Dangnhap1()
        {
            return View();
        }
        public ActionResult Dangnhap(FormCollection collection)
        {
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";

            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                using (var db = new cakeDataContext())
                {
                    KHACHHANG kh = db.KHACHHANGs.SingleOrDefault(n => n.Taikhoan== tendn && n.Matkhau == matkhau);

                    if (kh != null)
                    {
                        ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                        Session["Taikhoan"] = kh;
                        return RedirectToAction("Trangchu", "Cake");
                    }
                    else
                        ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }
    }
}
