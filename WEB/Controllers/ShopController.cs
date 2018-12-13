using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEB.Models;

namespace WEB.Controllers
{
    public class ShopController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            using (DBEntities db = new DBEntities())
            {
                var LinqResult = from T in db.categoryitems
                                 where T.C_Category == "S_Category"
                                 select T;
                if (LinqResult.Count() > 0)
                {
                    List<categoryitems> listc = new List<categoryitems>();
                    foreach (var item in LinqResult)
                    {
                        categoryitems c = new categoryitems();
                        c.CI_ID = item.CI_ID;
                        c.CI_Name = item.CI_Name;
                        listc.Add(c);
                    }
                    ViewBag.type = listc;
                }
            }
            return View();
        }
        [HttpPost]
        public ActionResult GetShopList(string ShopName, string ContactName, string Address, int page, int row)
        {
            using (DBEntities db = new DBEntities())
            {
                var linqResult = from S in db.shops
                                 join C in db.categoryitems on S.S_Category equals C.CI_ID where 
                        (string.IsNullOrEmpty(ShopName) || S.S_Name.Contains(ShopName))
                        && (string.IsNullOrEmpty(ContactName) || S.S_Name.Contains(ContactName))
                        && (string.IsNullOrEmpty(Address) || S.S_Name.Contains(Address))
                                 select new
                                 {
                                     S_ID = S.S_ID,
                                     S_Name = S.S_Name,
                                     CI_Name = C.CI_Name,
                                     CI_ID = C.CI_ID,
                                     S_ContactName = S.S_ContactName,
                                     S_ContactTel = S.S_ContactTel,
                                     S_Address = S.S_Address,
                                     S_Remark = S.S_Remark,
                                     S_IsHasSetAdmin = S.S_IsHasSetAdmin == 1 ? "已分配" : "未分配",
                                     S_CreateTime = S.S_CreateTime
                                 };

                var data = new object { };
                if(linqResult.Count() > 0)
                {
                    data = data = new { total = linqResult.Count(), rows = linqResult.OrderBy(x => x.S_ID).Skip((page - 1) * row).Take(row).ToList() };
                }
                return Json(data, JsonRequestBehavior.AllowGet);
            }
        }
    }
}