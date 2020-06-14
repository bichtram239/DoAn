using System;
using System.Linq;
using System.Web.Mvc;
using DoAnCoSo.Models;
using System.Web;
using System.IO;
//using PagedList;
//using PagedList.Mvc;

namespace DoAnCoSo.Controllers
{
    public class AdminController : Controller
    {
        cakeDataContext data = new cakeDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Check(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập!";
                return View("Index");
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu!";
                return View("Index");
            }
            else
            {
                using (var db = new cakeDataContext())
                {
                    NGUOIDUNG ad = db.NGUOIDUNGs.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);

                    if (ad != null)
                    {
                        // ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                        Session["Taikhoan"] = ad;
                        return RedirectToAction("Banh", "Admin");
                    }
                    else
                    {
                        ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                        return View("Index");
                    }

                }
            }
        }
        public ActionResult Banh()//int ?page)
        {
            //int pageNumber = (page ?? 1);
            //int pageSize = 5;
            using (var db = new cakeDataContext())
            {
                return View(db.SANPHAMs.ToList());
                //return View(db.SANPHAMs.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNumber, pageSize));
            }
        }
        [HttpGet]

        public ActionResult Themsanpham()
        {
            ViewBag.MaDM = new SelectList(data.DANHMUCs.ToList().OrderBy(n => n.TenDM), "MaDM", "TenDM");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public  ActionResult Themsanpham(SANPHAM banh,HttpPostedFileBase fileupload)
        {
            using (var db = new cakeDataContext())
            {

                ViewBag.MaDM = new SelectList(db.DANHMUCs.ToList().OrderBy(n => n.TenDM), "MaDM", "TenDM");
                

                if (fileupload == null)
                {
                    ViewBag.Thongbao = "Vui lòng chọn ảnh ";

                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        var fileName = Path.GetFileName(fileupload.FileName);
                        var path = Path.Combine(Server.MapPath("~/img"), fileName);
                        if (System.IO.File.Exists(path))
                        {
                            ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                        }

                        else
                        {
                            fileupload.SaveAs(path);
                        }
                        banh.ANHBIA = fileName;
                        db.SANPHAMs.InsertOnSubmit(banh);
                        db.SubmitChanges();
                    }

                }
                return RedirectToAction("Banh");
            }
        }
        public ActionResult Chitietsanpham(int id)
        {
            SANPHAM banh = data.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = banh.MaSP;
            if(banh==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(banh);
        }
        public ActionResult Xoasanpham(int id)
        {
            SANPHAM sp = data.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MA_SP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
            
        }
        [HttpPost,ActionName("Xoasanpham")]
        public ActionResult Xacnhanxoa(int id)
        {
            SANPHAM sp = data.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MASACH = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.SANPHAMs.DeleteOnSubmit(sp);
            data.SubmitChanges();
            return RedirectToAction("Banh");
        }
        public ActionResult Suasanpham(int id)
        {
            SANPHAM sp = data.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaDM = new SelectList(data.DANHMUCs.ToList().OrderBy(n => n.TenDM), "MaDM", "TenDM");
            return View(sp);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suasanpham(SANPHAM banh, HttpPostedFileBase fileupload)
        {
            using (var db = new cakeDataContext())
            {

                ViewBag.MaDM = new SelectList(db.DANHMUCs.ToList().OrderBy(n => n.TenDM), "MaDM", "TenDM");


                if (fileupload == null)
                {
                    ViewBag.Thongbao = "Vui lòng chọn ảnh ";

                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        var fileName = Path.GetFileName(fileupload.FileName);
                        var path = Path.Combine(Server.MapPath("~/hinhanh"), fileName);
                        if (System.IO.File.Exists(path))
                        {
                            ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                        }

                        else
                        {
                            fileupload.SaveAs(path);
                        }
                        banh.ANHBIA = fileName;
                        db.SANPHAMs.InsertOnSubmit(banh);
                        db.SubmitChanges();
                    }

                }
                return RedirectToAction("Banh");
            }
        }
    }
}
