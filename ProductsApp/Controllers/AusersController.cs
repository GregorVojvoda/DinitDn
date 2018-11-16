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
    public class AusersController : ApiController
    {
        private Datainstance db = new Datainstance();

        // GET: api/Ausers
        public IQueryable<Auser> GetAusers()
        {
            return db.Ausers;
        }

        // GET: api/Ausers/5
        [ResponseType(typeof(Auser))]
        public async Task<IHttpActionResult> GetAuser(int id)
        {
            Auser auser = await db.Ausers.FindAsync(id);
            if (auser == null)
            {
                return NotFound();
            }

            return Ok(auser);
        }

        // PUT: api/Ausers/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAuser(int id, Auser auser)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != auser.User_id)
            {
                return BadRequest();
            }

            db.Entry(auser).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AuserExists(id))
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

        // POST: api/Ausers
        [ResponseType(typeof(Auser))]
        public async Task<IHttpActionResult> PostAuser(Auser auser)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Ausers.Add(auser);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = auser.User_id }, auser);
        }

        // DELETE: api/Ausers/5
        [ResponseType(typeof(Auser))]
        public async Task<IHttpActionResult> DeleteAuser(int id)
        {
            Auser auser = await db.Ausers.FindAsync(id);
            if (auser == null)
            {
                return NotFound();
            }

            db.Ausers.Remove(auser);
            await db.SaveChangesAsync();

            return Ok(auser);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AuserExists(int id)
        {
            return db.Ausers.Count(e => e.User_id == id) > 0;
        }
    }
}