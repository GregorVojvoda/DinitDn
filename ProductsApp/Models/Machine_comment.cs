using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;


namespace ProductsApp.Models
{
    public class Machine_comment
    {
        [Key]
        public int Com_id { get; set; }
        public int User_id { get; set; }
        public int Machine_id { get; set; }
        public string Username { get; set; }
        public string Text { get; set; }
    }

    public class DatainstanceComment : DbContext
    {
        public DbSet<Machine_comment> Machine_Comments { get; set; }
    }
}