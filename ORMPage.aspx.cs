using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assignment1.Models;

namespace Assignment1
{
    public partial class ORMPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        

        

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public List<Assignment1.Models.ThingsToDo> RThingToDo_GetData()
        {
            var db = new TTDListDataEntities();

            var items = db.ThingsToDoes.Select(si => si);

            string[] sArray = null;

            if (!string.IsNullOrWhiteSpace(TBSearch.Text))
            {
                sArray = TBSearch.Text.Split(' ');
                if (sArray.Length == 1)
                {
                    // get string value from array (arrays are not recognised by LINQ string functions)
                    var str = sArray[0];
                    items = items.Where(si => si.thingToDo.StartsWith(str));
                }
                else
                {
                    foreach (var str in sArray)
                    {
                        items = items.Where(si => si.thingToDo.Contains(str)
                        || si.Date.Date1.Contains(str));
                    }
                }
            }

            items = items
                .OrderBy(si => si.id);
                    

            return items.ToList();


            
        }
    }
}