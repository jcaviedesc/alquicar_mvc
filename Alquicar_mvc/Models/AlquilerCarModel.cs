using conexion;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Alquicar_mvc.Models
{
    public class AlquilerCarModel
    {
        [Display(Name = "Fecha de alquiler")]
        public string start_date { get; set; }

        [Display(Name = "Fecha de devolución")]
        public string final_date { get; set; }

        public string car_id { get; set; }

        public string cliente_id { get; set; }

        Connection ConnAlquiler = new Connection();
        public bool RegisterAlquiler(AlquilerCarModel alquiler)
        {
            Parameter[] data_alquiler = new Parameter[4];
            data_alquiler[0] = new Parameter("_start_date", alquiler.start_date);
            data_alquiler[1] = new Parameter("_final_date", alquiler.start_date);
            data_alquiler[2] = new Parameter("_car_id", alquiler.start_date);
            data_alquiler[3] = new Parameter("_cliente_id", alquiler.start_date);

            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("PR_INSRALQUILER", data_alquiler);
            return ConnAlquiler.Transaction(trans);
        }
    }
}