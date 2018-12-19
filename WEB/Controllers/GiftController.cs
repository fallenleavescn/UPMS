using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEB.Models;

namespace WEB.Controllers
{
    public class GiftController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult GetGiftList(int page, int rows)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                 var linqResult = from G in db.ExchangGifts
                                 select new
                                 {
                                     ID = G.EG_ID,
                                     GiftCode = G.EG_GiftCode,
                                     GiftName = G.EG_GiftName,
                                     Point = G.EG_Point,
                                     Number = G.EG_Number,
                                     ExchangNum = G.EG_ExchangNum,
                                     Remark = G.EG_Remark
                                 };

                 var data = new object { };
                 if (linqResult.Count() > 0)
                 {
                     data = data = new { total = linqResult.Count(), rows = linqResult.OrderByDescending(x => x.ID).Skip((page - 1) * rows).Take(rows).ToList() };
                 }
                 return Json(data, JsonRequestBehavior.AllowGet);
            }
        }
    }
}