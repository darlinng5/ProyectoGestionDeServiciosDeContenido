    using Microsoft.AspNet.Identity;
using SmartAdminMvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartAdminMvc.Controllers
{
    public class insidentesAdminController : Controller
    {
        InsidentesDBContextEntities db = new InsidentesDBContextEntities();
        [Authorize(Roles = "Admin")]
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
        public ActionResult asignarUsuarioParaResolverInsidente(int id)
        {
            string userId = Convert.ToString(User.Identity.GetUserId());
            var insidenteParaAsignar = db.insidentes.Where(x => x.id == id && x.estado==PropiedadesDeModelos.estadoEnviado).FirstOrDefault();
            if (insidenteParaAsignar != null)
            {
                insidenteParaAsignar.estado = PropiedadesDeModelos.estadoAsignado;
                insidenteParaAsignar.idUsuarioResolvioInsidente = userId;
                insidenteParaAsignar.fechaTomado = DateTime.Now;

                if (db.SaveChanges() > 0)
                {
                    TempData["respuestadespuesdeejectaraccion"] = "El insidente se ha assignado a sus pendientes";
                    return RedirectToAction("index");
                }
            }
            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }


        public ActionResult misInsidentesAsignados()
        {
            string userId = Convert.ToString(User.Identity.GetUserId());
            var insidentesAsignados = from s in db.insidentes
                             where s.estado == PropiedadesDeModelos.estadoAsignado && s.idUsuarioResolvioInsidente == userId
                             select new insidentesModelo
                             {
                                 id = s.id,
                                 fechaSolicitud = s.fechaSolicitud,
                                 fechaTomado = s.fechaTomado,
                                 breveDescripcion = s.breveDescripcion,
                                 nombrePriorizacion = s.insidentePriorizacion.nombre,
                                 nombreDepartamento = s.empresaDepartamento.nombre,
                                 nombreCategoria = s.insidenteCategoria.nombre
                             };

            return View(insidentesAsignados.ToList());
        }


        public ActionResult insidenteRespuestaAdmin(int id)
        {
            TempData["idInsidente"] = id;
            TempData["hayRespuestaValida"] = false;
            string userId = Convert.ToString(User.Identity.GetUserId());
            var insidente = db.insidentes.Where(x => x.id == id && x.idUsuarioResolvioInsidente == userId).FirstOrDefault();
            bool usuarioTieneDerechoAVerEstasRespuestas = insidente != null;
            if (usuarioTieneDerechoAVerEstasRespuestas)
            {
                var respuesta = from s in db.insidenteRespuestas
                                where s.idInsidente == id
                                select new respuestaModelo
                                {
                                    idRespuesta = s.idRespuesta,
                                    fechaRespuesta = s.fechaRespuesta,
                                    usuarioSoporte = s.AspNetUser.UserName,
                                    resolvioProblema = s.resolvioProblema,
                                    respuestaDeSoporte = s.respuestaDeSoporte,
                                    comentario = s.comentario
                                };

                foreach (var item in respuesta.ToList())
                {
                    if (item.resolvioProblema == true)
                    {
                        TempData["hayRespuestaValida"] = true;
                    }
                }
                return View(respuesta.ToList());

            }


            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }


        public ActionResult crearRespuestaAdmin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult crearRespuestaAdmin(respuestaModelo respuestaRequest)
        {
            string usuarioAutenticado = User.Identity.GetUserId();
            bool hayErrores = respuestaRequest == null || usuarioAutenticado == null;
            if (hayErrores)
            {
                TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
                return RedirectToAction("error", "generico");
            }

            insidenteRespuesta respuesta = new insidenteRespuesta();
            respuesta.fechaRespuesta = DateTime.Now;
            respuesta.comentario = respuestaRequest.comentario;
            respuesta.idInsidente = Convert.ToInt32(TempData["idInsidente"]);
            respuesta.resolvioProblema = false;
            respuesta.respuestaDeSoporte = true;
            respuesta.idUsuarioRespuesta = usuarioAutenticado;
            db.insidenteRespuestas.Add(respuesta);
            if (db.SaveChanges() > 0)
            {
                TempData["respuestadespuesdeejectaraccion"] = "La respuesta ha sido creada con exito!!!";
                
                return RedirectToAction("insidenteRespuestaAdmin");
            }
            else
            {
                TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
                return RedirectToAction("error", "generico");
            }

        }

        public ActionResult misInsidentesResueltos()
        {
            string userId = User.Identity.GetUserId();
            var insidentesResueltos = from s in db.insidentes
                                      where s.idUsuarioResolvioInsidente == userId && s.estado==PropiedadesDeModelos.estadoCerrado 
                                      select new insidentesModelo
                                      {
                                          id = s.id,
                                          fechaSolicitud = s.fechaSolicitud,
                                          fechaTomado = s.fechaTomado,
                                          breveDescripcion = s.breveDescripcion,
                                          nombrePriorizacion = s.insidentePriorizacion.nombre,
                                          nombreDepartamento = s.empresaDepartamento.nombre,
                                          nombreCategoria = s.insidenteCategoria.nombre
                                      };
            return View(insidentesResueltos.ToList());
        }

       public ActionResult verDetallesInsidente(int id)
        {
            string userId = User.Identity.GetUserId();
            var insidente = db.insidentes.Where(x => x.id == id && x.idUsuarioResolvioInsidente == userId).FirstOrDefault();
            bool puedoVerInsidente = insidente != null && insidente.estado == PropiedadesDeModelos.estadoAsignado;
            if (puedoVerInsidente)
            {
                return View(insidente);
            }

            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }

        public ActionResult verSolucionDeInsidente(int id)
        {
            string userId = User.Identity.GetUserId();
            var respuesta = db.insidenteRespuestas.Where(x => x.idInsidente == id && x.resolvioProblema == true && x.idUsuarioRespuesta==userId).FirstOrDefault();
            if (respuesta != null)
            {
                return View(respuesta);
            }

            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }

        
        public ActionResult crearEscalonamiento(int id)
        {
         
            string usuarioAutenticado = User.Identity.GetUserId();
            var insidenteAEscalonar = db.insidentes.Where(x =>x.id==id &&  x.idUsuarioResolvioInsidente == usuarioAutenticado && x.estado==PropiedadesDeModelos.estadoAsignado).FirstOrDefault();
            if (insidenteAEscalonar!=null){
                insidenteAEscalonar.estado = PropiedadesDeModelos.estadoEscalonado;
                insidenteRespuesta respuestaEnviar = new insidenteRespuesta();
                respuestaEnviar.comentario = PropiedadesDeModelos.enviadoAEscalonamiento;
                respuestaEnviar.fechaRespuesta = DateTime.Now;
                respuestaEnviar.idInsidente = id;
                respuestaEnviar.respuestaDeSoporte = true;
                respuestaEnviar.idUsuarioRespuesta = usuarioAutenticado;
                db.insidenteRespuestas.Add(respuestaEnviar);
                db.SaveChanges();
                TempData["request1"] = PropiedadesDeModelos.exitoAlGuardar;
                return RedirectToAction("exito", "generico");
            }


            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }

        

    }
}