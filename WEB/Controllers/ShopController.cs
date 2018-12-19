using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            using (UPMSEntities db = new UPMSEntities())
            {
                var LinqResult = from T in db.CategoryItems
                                 where T.C_Category == "S_Category"
                                 select T;

                if (LinqResult.Count() > 0)
                {
                    List<CategoryItems> listc = new List<CategoryItems>();
                    foreach (var item in LinqResult)
                    {
                        CategoryItems c = new CategoryItems();
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
        public ActionResult GetShopList(string ShopName, string ContactName, string Address, int page, int rows)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                var linqResult = from S in db.Shops
                                 join C in db.CategoryItems on S.S_Category equals C.CI_ID
                        where C.C_Category == "S_Category"
                        && (string.IsNullOrEmpty(ShopName) || S.S_Name.Contains(ShopName))
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
                                     S_IsHasSetAdmin = S.S_IsHasSetAdmin==true ? "已分配" : "未分配",
                                     S_CreateTime = S.S_CreateTime
                                 };

                var data = new object { };
                if(linqResult.Count() > 0)
                {
                   data = new { total = linqResult.Count(), rows = linqResult.OrderByDescending(x => x.S_ID).Skip((page - 1) * rows).Take(rows).ToList() };
                }
                return Json(data, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult AddShop(string ShopName, string Category, string TellName, string Phone, string Address, string Remark)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                Shops shop = new Shops();
                shop.S_Category = Convert.ToInt32(Category);
                shop.S_Name = ShopName;
                shop.S_ContactName = TellName;
                shop.S_ContactTel = Phone;
                shop.S_Address = Address;
                shop.S_Remark = Remark;
                shop.S_CreateTime = DateTime.Now;

                db.Shops.Add(shop);
                int len = db.SaveChanges(); 

                paramModel<int> result = new paramModel<int>();
                if (len > 0)
                {
                    result.status = 1;
                    result.msg = "添加成功!";
                }
                else
                {
                    result.status = 0;
                    result.msg = "添加失败!";
                }

                return Json(result, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult UpdateShop(string ShopName, string Category, string TellName, string Phone, string Address, string Remark, string ID)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                Shops shop = new Shops();
                {
                    shop.S_ID = Convert.ToInt32(ID);
                    shop.S_Name = ShopName;
                    shop.S_Category = Convert.ToInt32(Category);
                    shop.S_ContactName = TellName;
                    shop.S_ContactTel = Phone;
                    shop.S_Address = Address;
                    shop.S_Remark = Remark;
                }
                
                db.Entry<Shops>(shop).State = EntityState.Modified;
                int result = db.SaveChanges();

                paramModel<object> param = new paramModel<object>();
                if(result > 0)
                {
                    param.status = 1;
                    param.msg = "修改成功!";
                }
                else
                {
                    param.status = 0;
                    param.msg = "修改失败!";
                }
                return Json(param, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult DeleteShop(string ID)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                Shops shop = new Shops(); { shop.S_ID = Convert.ToInt32(ID); }
                db.Shops.Attach(shop);
                db.Shops.Remove(shop);
                int result = db.SaveChanges();

                paramModel<object> param = new paramModel<object>();
                if (result > 0)
                {
                    param.status = 1;
                    param.msg = "删除成功!";
                }
                else
                {
                    param.status = 0;
                    param.msg = "删除失败!";
                }
                return Json(param, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult AddAdmin(int SID, string LoginName)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                Users user = new Users();
                {
                    user.S_ID = SID;
                    user.U_LoginName = LoginName;
                    user.U_Password = "123456";
                }
                db.Users.Add(user);
                int result = db.SaveChanges();

                paramModel<object> param = new paramModel<object>();
                if (result > 0)
                {
                    param.status = 1;
                    param.msg = "分配成功!";
                }
                else
                {
                    param.status = 0;
                    param.msg = "分配失败!";
                }
                return Json(param, JsonRequestBehavior.AllowGet);
            }
        }
    }
}