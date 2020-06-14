using DoAnCoSo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;

namespace DoAnCoSo.Controllers
{
    public class CakeController : Controller
    {
        cakeDataContext data = new cakeDataContext();
        private List<SANPHAM> Laybanhmoi(int count)
        {
            return data.SANPHAMs.OrderByDescending(a => a.GIA_SP).Take(count).ToList();
        }
        public ActionResult Trangchu()
        {
            var banhmoi = Laybanhmoi(3);
            return View(banhmoi);
        }
        public ActionResult danhmuc()
        {
            var danhmuc = from dm in data.DANHMUCs select dm;
            return PartialView(danhmuc);
        }
        public ActionResult Sptheodanhmuc(int id)
        {
            var banhdm = from bdm in data.SANPHAMs where bdm.MaDM == id select bdm;
            return View(banhdm);
        }
        public ActionResult HDSD()
        {
            return View();
        }
        public ActionResult HDMH()
        {
            return View();
        }
        public ActionResult CSBM()
        {
            return View();
        }
        public ActionResult Details(int id)
        {
            var banh = from b in data.SANPHAMs where b.MaSP==id select b;
            return View(banh.Single());
        }
        public ActionResult PTVC()
        {
            return View();
        }
        public ActionResult GT()
        {
            return View();
        }
        public ActionResult LH()
        {
            return View();
        }
        public ActionResult TT()
        {
            return View();
        }
    }
}
