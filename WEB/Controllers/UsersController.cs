using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEB.Models;

namespace WEB.Controllers
{
    public class UsersController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetUserList(string LoginName, string RealName, string Phone, int page, int rows)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                var linqResult = from U in db.Users
                             where (string.IsNullOrEmpty(LoginName) || U.U_LoginName.Contains(LoginName))
                             && (string.IsNullOrEmpty(RealName) || U.U_RealName.Contains(RealName))
                             && (string.IsNullOrEmpty(Phone) || U.U_Telephone.Contains(Phone))
                             && U.U_Role != 1 
                             && U.U_isDelete == false
                             select new
                             {
                                 ID = U.U_ID,
                                 LoginName = U.U_LoginName,
                                 RealName = U.U_RealName,
                                 Sex = U.U_Sex,
                                 Phone = U.U_Telephone,
                                 Role = U.U_Role,
                                 CanDelete = U.U_CanDelete
                             };

                var data = new object { };
                if (linqResult.Count() > 0)
                {
                    data = data = new { total = linqResult.Count(), rows = linqResult.OrderByDescending(x => x.ID).Skip((page - 1) * rows).Take(rows).ToList() };
                }
                return Json(data, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult AddUser(string LoginName,string Password,string RealName,string Sex,string Phone, int Role, bool CanDelete)
        {
            using(UPMSEntities db = new UPMSEntities())
            {
                Users user = new Users();
                {
                    user.U_LoginName = LoginName;
                    user.U_Password = Password;
                    user.U_RealName = RealName;
                    user.U_Sex = Sex;
                    user.U_Telephone = Phone;
                    user.U_Role = Role;
                    user.U_CanDelete = CanDelete;
                }
                db.Users.Add(user);
                int result = db.SaveChanges();

                paramModel<object> param = new paramModel<object>();
                if(result > 0)
                {
                    param.status = 1;
                    param.msg = "添加成功";
                }
                else
                {
                    param.status = 0;
                    param.msg = "添加失败";
                }
                return Json(param, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult UpdateUser(int ID, string LoginName, string Password, string RealName, string Sex, string Phone, int Role, bool CanDelete)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                Users user = new Users();
                {
                    user.U_ID = ID;
                    user.U_LoginName = LoginName;
                    user.U_Password = Password;
                    user.U_RealName = RealName;
                    user.U_Sex = Sex;
                    user.U_Telephone = Phone;
                    user.U_Role = Role;
                    user.U_CanDelete = CanDelete;
                }
                db.Entry<Users>(user).State = EntityState.Modified;
                int result = db.SaveChanges();

                paramModel<object> param = new paramModel<object>();
                if (result > 0)
                {
                    param.status = 1;
                    param.msg = "修改成功";
                }
                else
                {
                    param.status = 0;
                    param.msg = "修改失败";
                }
                return Json(param, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult NonDeleteUser(int ID)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                Users user = new Users();
                {
                    user.U_ID = ID;
                    user.U_isDelete = true;
                }
                
                db.Entry<Users>(user).State = EntityState.Modified;
                db.Entry<Users>(user).Property(u => u.U_CanDelete).IsModified = false;
                db.Entry<Users>(user).Property(u => u.S_ID).IsModified = false;
                db.Entry<Users>(user).Property(u => u.U_LoginName).IsModified = false;
                db.Entry<Users>(user).Property(u => u.U_Password).IsModified = false;
                db.Entry<Users>(user).Property(u => u.U_Role).IsModified = false;
                db.Entry<Users>(user).Property(u => u.U_Sex).IsModified = false;
                db.Entry<Users>(user).Property(u => u.U_Telephone).IsModified = false;
                int result = db.SaveChanges();

                paramModel<object> param = new paramModel<object>();
                if (result > 0)
                {
                    param.status = 1;
                    param.msg = "删除成功";
                }
                else
                {
                    param.status = 0;
                    param.msg = "删除失败";
                }
                return Json(param, JsonRequestBehavior.AllowGet);
            }
        }
    }
}