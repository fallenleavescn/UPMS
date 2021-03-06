﻿using System;
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
        public ActionResult Login(Users user)
        {
            string ErrorMsg = string.Empty;

            if (ModelState.IsValid)
            {
                using (UPMSEntities db = new UPMSEntities())
                { 
                    var UserTbl = from u in db.Users
                                  where u.U_LoginName == user.U_LoginName && u.U_Password == user.U_Password
                                  select u;

                    Users userResult = UserTbl.FirstOrDefault();
                    if (userResult.S_ID.HasValue)
                    {
                        ErrorMsg = string.Empty;
                        Session["user"] = userResult;
                        
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