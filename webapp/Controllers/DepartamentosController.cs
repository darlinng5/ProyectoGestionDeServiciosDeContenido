using SmartAdminMvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartAdminMvc.Controllers
{
    public class DepartamentosController : Controller
    {
        private InsidentesDBContextEntities _db = new InsidentesDBContextEntities();
        // GET: Departamentos
        public ActionResult Index()
        {
            return View(_db.empresaDepartamentoes);
        }


        public ActionResult DepartamentoNuevo()
        {   
            return View(new empresaDepartamento());
        }

        [HttpPost]
        public ActionResult DepartamentoNuevo(empresaDepartamento emp)
        {
            if (ModelState.IsValid)
            {
                _db.empresaDepartamentoes.Add(emp);
                _db.SaveChanges();
                TempData["request1"] = PropiedadesDeModelos.exitoAlGuardar;
                return RedirectToAction("exito", "generico");
            }
            return View(emp);
        }
    }
}