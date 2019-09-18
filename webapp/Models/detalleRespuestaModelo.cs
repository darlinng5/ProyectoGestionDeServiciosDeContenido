using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartAdminMvc.Models
{
    public class detalleRespuestaModelo
    {
        public int codigo { get; set; }
        public string nombre { get; set; }
        public string nombreSeccion { get; set; }
        public int respuesta { get; set; }
        public string observacion { get; set; }
        
    }
}