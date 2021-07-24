using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1
{
    public partial class DetailPage : System.Web.UI.Page
    {
        Models.TTDListDataEntities db = new Models.TTDListDataEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public Assignment1.Models.ThingsToDo FVItem_GetItem([QueryString] int? id)
        {
            Models.ThingsToDo item = null;

            if (id.HasValue)
            {
                item = db.ThingsToDoes.Find(id.Value);
                item = db.ThingsToDoes
                    .Where(si => si.id == id.Value)
                    .Select(si => si)
                    .FirstOrDefault();
                item = (from si in db.ThingsToDoes
                        where si.id == id.Value
                        select si)
                        .FirstOrDefault();
            }
            return item;
        }

        public void FVItem_InsertItem()
        {
            var item = new Assignment1.Models.ThingsToDo();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                db.ThingsToDoes.Add(item);
                db.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void FVItem_UpdateItem(int id)
        {
            Assignment1.Models.ThingsToDo item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            item = db.ThingsToDoes.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                db.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void FVItem_DeleteItem(int id)
        {
            var item = db.ThingsToDoes.Find(id);
            db.ThingsToDoes.Remove(item);
            db.SaveChanges();
            Response.Redirect("TraditionalPage.aspx");

        }
    }
}