using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProductsApp.Models
{
    public class Exercise
    {
        [Key]
        public int Exercise_id { get; set; }
        public int Machine_id { get; set; }
        public string Exercise_name { get; set; }
        public string Execise_video { get; set; }
        public string Exercise_muscle_group { get; set; }
        public string Exercise_img { get; set; }
    }

    public class DatainstanceExercise : DbContext
    {
        public DbSet<Exercise> Exercises { get; set; }
    }
}