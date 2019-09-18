using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartAdminMvc.Controllers
{
    
    public class genericoController : Controller
    {        // GET: generico
        public ActionResult error()
        {
            ViewBag.error = TempData["request1"];

            return View();
        }

        public ActionResult exito()
        {
            ViewBag.exito = TempData["request1"];

            return View();
        }
    }
}