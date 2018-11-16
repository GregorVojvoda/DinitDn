using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using ProductsApp.Models;

namespace ProductsApp.Controllers
{
    public class Exercise_historyController : ApiController
    {
        private DatainstanceExeh db = new DatainstanceExeh();

        // GET: api/Exercise_history
        public IQueryable<Exercise_history> GetExercise_historyes()
        {
            return db.Exercise_historyes;
        }

        // GET: api/Exercise_history/5
        [ResponseType(typeof(Exercise_history))]
        public async Task<IHttpActionResult> GetExercise_history(int id)
        {
            Exercise_history exercise_history = await db.Exercise_historyes.FindAsync(id);
            if (exercise_history == null)
            {
                return NotFound();
            }

            return Ok(exercise_history);
        }

        // PUT: api/Exercise_history/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutExercise_history(int id, Exercise_history exercise_history)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != exercise_history.Exeh_id)
            {
                return BadRequest();
            }

            db.Entry(exercise_history).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Exercise_historyExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Exercise_history
        [ResponseType(typeof(Exercise_history))]
        public async Task<IHttpActionResult> PostExercise_history(Exercise_history exercise_history)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Exercise_historyes.Add(exercise_history);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = exercise_history.Exeh_id }, exercise_history);
        }

        // DELETE: api/Exercise_history/5
        [ResponseType(typeof(Exercise_history))]
        public async Task<IHttpActionResult> DeleteExercise_history(int id)
        {
            Exercise_history exercise_history = await db.Exercise_historyes.FindAsync(id);
            if (exercise_history == null)
            {
                return NotFound();
            }

            db.Exercise_historyes.Remove(exercise_history);
            await db.SaveChangesAsync();

            return Ok(exercise_history);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Exercise_historyExists(int id)
        {
            return db.Exercise_historyes.Count(e => e.Exeh_id == id) > 0;
        }
    }
}