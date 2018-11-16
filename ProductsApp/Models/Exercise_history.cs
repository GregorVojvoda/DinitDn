using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;


namespace ProductsApp.Models
{
    public class Exercise_history
    {
        [Key]
        public int Exeh_id { get; set; }
        public int Exercise_id { get; set; }
        public int User_id { get; set; }
        public string Exeh_text { get; set; }
        public DateTime Exeh_date { get; set; }
    }

    public class DatainstanceExeh : DbContext
    {
        public DbSet<Exercise_history> Exercise_historyes { get; set; }
    }
}