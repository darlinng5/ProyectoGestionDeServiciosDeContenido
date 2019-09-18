using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartAdminMvc.Models
{
    public static class PropiedadesDeModelos
    {
        public static string estadoCreado = "Creado";
        public static string estadoEnviado = "Enviado";
        public static string errorAlGuardar = "Se ha producido un error al guardar los datos";
        public static string exitoAlGuardar = "EXITO!!! Los datos han sido guardados.";
        public static string estadoCerrado = "Cerrado";
        public static string estadoAsignado = "Asignado";
        public static string estadoEscalonado = "Escalonado";
        public static string enviadoAEscalonamiento = "Debido a la complejidad del insidente se ha escalonado a nivel superior. Muy pronto un agente se pondra en contacto con usted.";
    }
}