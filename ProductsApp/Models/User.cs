using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProductsApp.Models
{
    public class Auser
    {
        [Key]
        public int User_id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Pasword { get; set; }
        
    }

    public class Datainstance: DbContext
    {
        public DbSet<Auser> Ausers { get; set; }
    }
}