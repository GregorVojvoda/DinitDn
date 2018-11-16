using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProductsApp.Models
{
    public class Machine
    {
        [Key]
        public int Machine_id { get; set; }
        public string Machine_name { get; set; }
        public string Machine_img { get; set; }

    }

    public class DatainstanceMachine : DbContext
    {
        public DbSet<Machine> Machines { get; set; }
    }
}