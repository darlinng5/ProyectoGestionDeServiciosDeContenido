using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartAdminMvc.Models
{
    public class pedidoPlanModelo
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string Id { get; set; }
        public string Email { get; set; }
        public string descripcion { get; set; }
        public decimal precioUnitario { get; set; }
        public string estado { get; set; }
        public Nullable<int> cantidadMinimaPedido { get; set; }
    }
}