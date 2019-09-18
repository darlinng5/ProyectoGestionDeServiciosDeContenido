using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartAdminMvc.Models
{
    public class respuestaModelo
    {
        public int idRespuesta { get; set; }
        public Nullable<System.DateTime> fechaRespuesta { get; set; }
        public string usuarioSoporte { get; set; }
        public Nullable<bool> resolvioProblema { get; set; }
        public Nullable<bool> respuestaDeSoporte { get; set; }
        public string comentario { get; set; }
        public Nullable<int> idInsidente { get; set; }
        public string idUsuarioRespuesta { get; set; }
    }
}