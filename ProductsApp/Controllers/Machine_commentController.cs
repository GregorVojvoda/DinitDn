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
    public class Machine_commentController : ApiController
    {
        private DatainstanceComment db = new DatainstanceComment();

        // GET: api/Machine_comment
        public IQueryable<Machine_comment> GetMachine_Comments()
        {
            return db.Machine_Comments;
        }

        // GET: api/Machine_comment/5
        [ResponseType(typeof(Machine_comment))]
        public async Task<IHttpActionResult> GetMachine_comment(int id)
        {
            Machine_comment machine_comment = await db.Machine_Comments.FindAsync(id);
            if (machine_comment == null)
            {
                return NotFound();
            }

            return Ok(machine_comment);
        }

        // PUT: api/Machine_comment/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutMachine_comment(int id, Machine_comment machine_comment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != machine_comment.Com_id)
            {
                return BadRequest();
            }

            db.Entry(machine_comment).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Machine_commentExists(id))
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

        // POST: api/Machine_comment
        [ResponseType(typeof(Machine_comment))]
        public async Task<IHttpActionResult> PostMachine_comment(Machine_comment machine_comment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Machine_Comments.Add(machine_comment);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = machine_comment.Com_id }, machine_comment);
        }

        // DELETE: api/Machine_comment/5
        [ResponseType(typeof(Machine_comment))]
        public async Task<IHttpActionResult> DeleteMachine_comment(int id)
        {
            Machine_comment machine_comment = await db.Machine_Comments.FindAsync(id);
            if (machine_comment == null)
            {
                return NotFound();
            }

            db.Machine_Comments.Remove(machine_comment);
            await db.SaveChangesAsync();

            return Ok(machine_comment);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Machine_commentExists(int id)
        {
            return db.Machine_Comments.Count(e => e.Com_id == id) > 0;
        }
    }
}