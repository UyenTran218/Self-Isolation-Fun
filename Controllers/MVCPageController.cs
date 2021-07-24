using Assignment1.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Assignment1.Controllers
{
    public class MVCPageController : Controller
    {
        TTDListDataEntities db = new TTDListDataEntities();
        // GET: MVCPage
        public ActionResult Index()
        {
            return View("MVCPage");
        }
        public ActionResult MVCPage(string searchText)
        {

            var thing = db.ThingsToDoes.Include(a => a.Date);
            ViewData["searchText"] = searchText;
            if (!string.IsNullOrWhiteSpace(searchText))
            {
                thing = thing.Where(a => a.thingToDo.StartsWith(searchText));
                // SELECT * FROM Animals WHERE name LIKE @searchText + '%'
            }

            return View(thing.ToList());
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            var thing = db.ThingsToDoes.Find(id);
            if (thing == null)
            {
                return HttpNotFound();
            }
            return View(thing);
        }
       
    }
}