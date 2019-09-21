using Microsoft.AspNet.Identity;
using SmartAdminMvc.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace SmartAdminMvc.Controllers
{
    [Authorize]
    public class InsidentesController : Controller
    {
        // GET: Insidentes

        InsidentesDBContextEntities db = new InsidentesDBContextEntities();

        public ActionResult Index()
        {
            bool deboLLenarComboBoxDeOpciones = ViewBag.empresaDepartamentos == null || ViewBag.insidentesCategoria == null || ViewBag.insidentesPriorizacion == null;
            if (deboLLenarComboBoxDeOpciones)
            {
                llenarComboBoxParaCrearInsidente();
            }

           


            string userId = Convert.ToString(User.Identity.GetUserId());
            var insidentes = from s in db.insidentes
                             where s.idUsuarioCreoInsidente==userId
                             select new insidentesModelo
                             {
                                 id = s.id,
                                 fechaSolicitud=s.fechaSolicitud,
                                 breveDescripcion = s.breveDescripcion,
                                 problemaResuelto = s.problemaResuelto,
                                 estado=s.estado,
                             };

            return View(insidentes.ToList());
        }

        [HttpGet]
        public ActionResult crearInsidente()
        {
            return View();
        }

        [HttpPost]
        public ActionResult crearInsidente(insidentesModelo insidenteRequest)
        {
            string usuarioAutenticado = User.Identity.GetUserId();
            bool hayErrores = insidenteRequest == null || usuarioAutenticado == null;
            if (hayErrores)
            {
                TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
                return RedirectToAction("error", "generico");
            }

            insidente insidente = new insidente();
            insidente.fechaSolicitud = DateTime.Now;
            insidente.breveDescripcion = insidenteRequest.breveDescripcion;
            insidente.descripcion = insidenteRequest.descripcion;
            insidente.estado = PropiedadesDeModelos.estadoCreado;
            insidente.problemaResuelto = false;
            insidente.idPriorizacion = insidenteRequest.idPriorizacion;
            insidente.idCategoria = insidenteRequest.idCategoria;
            insidente.idDepartamento = insidenteRequest.idDepartamento;
            insidente.idUsuarioCreoInsidente = usuarioAutenticado;
            db.insidentes.Add(insidente);

            if (db.SaveChanges() > 0)
            {
                TempData["respuestadespuesdeejectaraccion"] = "El insidente se ha creado con exito!!!";
                return RedirectToAction("index");
            }
            else
            {
                TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
                return RedirectToAction("error", "generico");
            }
        }

        public void llenarComboBoxParaCrearInsidente()
        {
            var empresaDepartamentos = from s in db.empresaDepartamentoes
                           
                            select new pedidoPlanModelo
                            {
                                id = s.idDepartamento,
                                nombre = s.nombre
                            };

            ViewBag.empresaDepartamentos = new SelectList(empresaDepartamentos.ToList(), "id", "nombre");
            var insidentesCategoria = from s in db.insidenteCategorias

                                       select new pedidoPlanModelo
                                       {
                                           id = s.idCategoria,
                                           nombre = s.nombre
                                       };

            ViewBag.insidentesCategoria = new SelectList(insidentesCategoria.ToList(), "id", "nombre");
            var insidentesPriorizacion = from s in db.insidentePriorizacions

                                      select new pedidoPlanModelo
                                      {
                                          id = s.idPriorizacion,
                                          nombre = s.nombre
                                      };

            ViewBag.insidentesPriorizacion = new SelectList(insidentesPriorizacion.ToList(), "id", "nombre");

        }

        public ActionResult enviarInsidente(int id)
        {
            var insidente = db.insidentes.Where(x => x.id == id && x.estado.Equals(PropiedadesDeModelos.estadoCreado)).FirstOrDefault();
            if (insidente != null)
            {
                insidente.estado = PropiedadesDeModelos.estadoEnviado;
                if (db.SaveChanges()>0)
                {
                    ViewBag.cambioEstado = true;
                }
                TempData["respuestadespuesdeejectaraccion"] = "El insidente se ha enviado correctamente";
                return RedirectToAction("index", "insidentes");
            }
            else
            {
                TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
                return RedirectToAction("error", "generico");
            }

           
        }

        public ActionResult insidenteRespuesta(int id)
        {
            TempData["idInsidente"] = id;
            TempData["hayRespuestaValida"] = false;
            string userId = Convert.ToString(User.Identity.GetUserId());
            var insidente = db.insidentes.Where(x => x.id == id && x.idUsuarioCreoInsidente == userId).FirstOrDefault();
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
        public ActionResult crearRespuesta()
        {
            return View();
        }

        [HttpPost]
        public ActionResult crearRespuesta(respuestaModelo respuestaRequest)
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
            respuesta.respuestaDeSoporte = false;
            respuesta.idUsuarioRespuesta = usuarioAutenticado;
            db.insidenteRespuestas.Add(respuesta);


            if (db.SaveChanges() > 0)
            {
                TempData["respuestadespuesdeejectaraccion"] = "La respuesta ha sido creada con exito!!!";
                return RedirectToAction("index");
            }
            else
            {
                TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
                return RedirectToAction("error", "generico");
            }
           
        }


        public ActionResult marcarRespuestaValida(int id)
        {
            string usuarioAutenticado = User.Identity.GetUserId();
            int idInsidenteActivo= Convert.ToInt32(TempData["idInsidente"]);
            var respuesta = db.insidenteRespuestas.Where(x => x.idRespuesta == id).FirstOrDefault();
            var insidente = db.insidentes.Where(x => x.id == idInsidenteActivo && x.idUsuarioCreoInsidente==usuarioAutenticado).FirstOrDefault();
            if (insidente != null)
            {
                respuesta.resolvioProblema = true;
                insidente.problemaResuelto = true;
                insidente.estado = PropiedadesDeModelos.estadoCerrado;
                insidente.fechaCierre = DateTime.Now;
                db.SaveChanges();
                TempData["respuestadespuesdeejectaraccion"] = "La respuesta se ha marcado como valida";
                return RedirectToAction("index");
            }

            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }


        public ActionResult eliminarInsidente(int id)
        {
            var insidenteAEliminar = db.insidentes.Where(x => x.id == id).FirstOrDefault();
            bool puedoEliminarInsidente = insidenteAEliminar != null && insidenteAEliminar.estado == PropiedadesDeModelos.estadoCreado;
            if (puedoEliminarInsidente)
            {
                db.insidentes.Remove(insidenteAEliminar);
                db.SaveChanges();
                TempData["respuestadespuesdeejectaraccion"] = "El insidente se ha eliminado con exito!!!";
            }

            TempData["request1"] = PropiedadesDeModelos.errorAlGuardar;
            return RedirectToAction("error", "generico");
        }

    }
}