using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEB.Models;

namespace WEB.Controllers
{
    public class SystemController : Controller
    {
        [HttpGet]
        public ActionResult Index(string msg = null)
        {
            if(!string.IsNullOrEmpty(msg)) ViewBag.ErrorMsg = msg;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(users user)
        {
            string ErrorMsg = string.Empty;

            if (ModelState.IsValid)
            {
                using (DBEntities db = new DBEntities())
                { 
                    var UserTbl = from u in db.users
                                  where u.U_LoginName == user.U_LoginName && u.U_Password == user.U_Password
                                  select u.S_ID;

                    if (UserTbl.FirstOrDefault().HasValue)
                    {
                        ErrorMsg = string.Empty;
                        Session["user"] = user;
                        return RedirectToAction("index", "Admin");
                    }
                    else ErrorMsg = "账号或密码错误！";
                }
            }
            else ErrorMsg = "请输入账号和密码！";

            return RedirectToAction("index", new { msg = ErrorMsg });
        }
    }
}