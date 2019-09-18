using SmartAdminMvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartAdminMvc.Controllers
{
    public class insidentesSuperAdminController : Controller
    {
        // GET: insidentesSuperAdmin
        InsidentesDBContextEntities db = new InsidentesDBContextEntities();
        [Authorize(Roles = "SuperAdmin")]
        public ActionResult Index()
        {
            var insidentes = from s in db.insidentes
                             where s.estado == PropiedadesDeModelos.estadoEnviado
                             select new insidentesModelo
                             {
                                 id = s.id,
                                 fechaSolicitud = s.fechaSolicitud,
                                 breveDescripcion = s.breveDescripcion,
                                 nombrePriorizacion = s.insidentePriorizacion.nombre,
                                 nombreDepartamento = s.empresaDepartamento.nombre,
                                 nombreCategoria = s.insidenteCategoria.nombre
                             };

            return View(insidentes.ToList());

           
        }

        public ActionResult asignados()
        {
           
            var insidentesAsignados = from s in db.insidentes
                                      where s.estado == PropiedadesDeModelos.estadoAsignado
                                      select new insidentesModelo
                                      {
                                          id = s.id,
                                          fechaSolicitud = s.fechaSolicitud,
                                          fechaTomado = s.fechaTomado,
                                          breveDescripcion = s.breveDescripcion,
                                          nombrePriorizacion = s.insidentePriorizacion.nombre,
                                          nombreDepartamento = s.empresaDepartamento.nombre,
                                          nombreCategoria = s.insidenteCategoria.nombre,
                                          nombreDeUsuarioResolvioInsidente = s.AspNetUser1.UserName
                                      };

            return View(insidentesAsignados.ToList());
        }

        public ActionResult resueltos()
        {
            var insidentesResueltos = from s in db.insidentes
                                      where s.estado == PropiedadesDeModelos.estadoCerrado
                                      select new insidentesModelo
                                      {
                                          id = s.id,
                                          fechaSolicitud = s.fechaSolicitud,
                                          fechaTomado = s.fechaTomado,
                                          breveDescripcion = s.breveDescripcion,
                                          nombrePriorizacion = s.insidentePriorizacion.nombre,
                                          nombreDepartamento = s.empresaDepartamento.nombre,
                                          nombreCategoria = s.insidenteCategoria.nombre,
                                          nombreDeUsuarioResolvioInsidente = s.AspNetUser1.UserName
                                      };

            return View(insidentesResueltos.ToList());
        }

        public ActionResult todosLosDetalles(int id)
        {
           
            var insidente = db.insidentes.Where(x => x.id == id).FirstOrDefault();
            bool puedoVerInsidente = insidente != null;
            if (puedoVerInsidente)
            {
                return View(insidente);
            }

            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }


        public void llenarComboBoxParaCrearInsidente()
        {
            var insidentesPriorizacion = from s in db.insidentePriorizacions

                                         select new pedidoPlanModelo
                                         {
                                             id = s.idPriorizacion,
                                             nombre = s.nombre
                                         };

            ViewBag.insidentesPriorizacion = new SelectList(insidentesPriorizacion.ToList(), "id", "nombre");

            var listar = from s in db.AspNetUsers
                         where s.esSoporteTecnico == true
                         select new cbxUsuariosSoporte
                         {
                             id = s.Id,
                             nombre = s.Email
                         };

            ViewBag.usuarios = new SelectList(listar.ToList(), "id", "nombre");

        }


        public ActionResult cambiarPrioridad(int id)
        {
            bool deboLLenarComboBoxDeOpciones = ViewBag.insidentesPriorizacion == null;
            if (deboLLenarComboBoxDeOpciones)
            {
                llenarComboBoxParaCrearInsidente();
            }

            TempData["idInsidenteCambiarPrioridad"] = id;
            return View();
        }
        [HttpPost]
        public ActionResult cambiarPrioridad(insidentesModelo cambiarPrioridad)
        {
            int idInsidente = Convert.ToInt32(TempData["idInsidenteCambiarPrioridad"]);
            var insidente = db.insidentes.Where(x => x.id == idInsidente && x.estado == PropiedadesDeModelos.estadoEnviado).FirstOrDefault();
            if (insidente != null)
            {
                insidente.idPriorizacion = cambiarPrioridad.idPriorizacion;
                db.SaveChanges();
                TempData["request1"] = PropiedadesDeModelos.exitoAlGuardar;
                return RedirectToAction("exito", "generico");
            }

            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }

        public ActionResult asignarUsuario(int id)
        {
            bool deboLLenarComboBoxDeOpciones = ViewBag.insidentesPriorizacion == null || ViewBag.usuarios == null;
            if (deboLLenarComboBoxDeOpciones)
            {
                llenarComboBoxParaCrearInsidente();
            }
            TempData["idInsidenteCambiarUsuario"] = id;
            return View();
        }

        [HttpPost]
        public ActionResult asignarUsuario(insidentesModelo cambiarUsuario)
        {
            
            int idInsidente = Convert.ToInt32(TempData["idInsidenteCambiarUsuario"]);
            var insidente = db.insidentes.Where(x => x.id == idInsidente && x.estado == PropiedadesDeModelos.estadoEnviado).FirstOrDefault();
            if (insidente != null)
            {

                insidente.idUsuarioResolvioInsidente = cambiarUsuario.idUsuarioCreoInsidente;
                insidente.fechaTomado = DateTime.Now;
                insidente.estado = PropiedadesDeModelos.estadoAsignado;
                db.SaveChanges();
                TempData["request1"] = PropiedadesDeModelos.exitoAlGuardar;
                return RedirectToAction("exito", "generico");
            }

            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }


    }

    
}