using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartAdminMvc.Models
{
    public class insidentesModelo
    {
        public int id { get; set; }
        public Nullable<System.DateTime> fechaSolicitud { get; set; }
        public Nullable<System.DateTime> fechaTomado { get; set; }
        public Nullable<System.DateTime> fechaCierre { get; set; }
        public string breveDescripcion { get; set; }
        public string nombrePriorizacion { get; set; }
        public string nombreCategoria { get; set; }
        public string nombreDepartamento { get; set; }
        public string nombreDeUsuarioResolvioInsidente { get; set; }
        public string descripcion { get; set; }
        public string estado { get; set; }
        public Nullable<bool> problemaResuelto { get; set; }
        public Nullable<int> idPriorizacion { get; set; }
        public Nullable<int> idCategoria { get; set; }
        public Nullable<int> idDepartamento { get; set; }
        public string idUsuarioCreoInsidente { get; set; }

        public virtual AspNetUser AspNetUser { get; set; }
        public virtual empresaDepartamento empresaDepartamento { get; set; }
        public virtual insidenteCategoria insidenteCategoria { get; set; }
        public virtual insidentePriorizacion insidentePriorizacion { get; set; }
    }
}