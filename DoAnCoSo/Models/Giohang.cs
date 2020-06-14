using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnCoSo.Models
{
    public class Giohang
    {
        cakeDataContext data = new cakeDataContext();
        public int iMasp { set; get; }
        public string sTensp { set; get; }
        public string sAnhbia { set; get; }
        public Double dDongia { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }
        }
        public Giohang(int Masp)
        {
            iMasp = Masp;
            SANPHAM sanpham = data.SANPHAMs.Single(n => n.MaSP == iMasp);
            sTensp = sanpham.TEN_SP;
            sAnhbia = sanpham.ANHBIA;
            dDongia = double.Parse(sanpham.GIA_SP.ToString());
            iSoluong = 1;

        }
    }
}