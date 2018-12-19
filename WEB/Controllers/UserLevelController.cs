using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEB.Controllers;
using WEB.Models;

namespace WEB.Controllers
{
    public class UserLevelController : Controller
    {
        // GET: UserLevel
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetLevelList(string LevelName, int page, int rows)
        {
            using(UPMSEntities db = new UPMSEntities())
            {
                var linqResult = from C in db.CardLevels where
                                 string.IsNullOrEmpty(LevelName) || C.CL_LevelName.Contains(LevelName)
                                 select new {
                                     ID = C.CL_ID,
                                     LevelName = C.CL_LevelName,
                                     NeedPoint = C.CL_NeedPoint,
                                     Point = C.CL_Point,
                                     Percent = C.CL_Percent
                                 };

                var data = new object { };
                if (linqResult.Count() > 0)
                {
                    data = new { total = linqResult.Count(), rows = linqResult.OrderByDescending(c => c.ID).Skip((page - 1) * rows).Take(rows).ToList() };
                }
                return Json(data, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult AddLevel(string ID, string LevelName, string NeedPoint, string Point, string Percent)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                CardLevels cd = new CardLevels();
                {
                    cd.CL_LevelName = LevelName;
                    cd.CL_NeedPoint = NeedPoint;
                    cd.CL_Point = Convert.ToDouble(Point);
                    cd.CL_Percent = Convert.ToDouble(Percent);
                    db.CardLevels.Add(cd);
                }

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
        public ActionResult UpdateLevel(string ID, string LevelName, string NeedPoint, string Point, string Percent)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                CardLevels cd = new CardLevels();
                { 
                    cd.CL_ID = Convert.ToInt32(ID);
                    cd.CL_LevelName = LevelName;
                    cd.CL_NeedPoint = NeedPoint;
                    cd.CL_Point = Convert.ToDouble(Point);
                    cd.CL_Percent = Convert.ToDouble(Percent);
                }
                db.Entry<CardLevels>(cd).State = EntityState.Modified;
                int len = db.SaveChanges();

                paramModel<int> result = new paramModel<int>();
                if (len > 0)
                {
                    result.status = 1;
                    result.msg = "修改成功!";
                }
                else
                {
                    result.status = 0;
                    result.msg = "修改失败!";
                }

                return Json(result, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult DeleteLevel(string ID)
        {
            using (UPMSEntities db = new UPMSEntities())
            {
                CardLevels cd = new CardLevels(); { cd.CL_ID = Convert.ToInt32(ID); }
                db.CardLevels.Attach(cd);
                db.CardLevels.Remove(cd);
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
    }
}