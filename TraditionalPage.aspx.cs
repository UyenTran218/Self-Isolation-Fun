using Assignment1.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1
{
    public partial class TraditionalPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string s = TBSearch.Text;

            if (!string.IsNullOrWhiteSpace(s))
            {

            string sql = "SELECT Date.Date, ThingsToDo.id, ThingsToDo.thingToDo, ThingsToDo.dateID, ThingsToDo.image FROM Date INNER JOIN ThingsToDo ON Date.Id = ThingsToDo.dateID WHERE ThingsToDo.thingToDo LIKE '%"+s+"%'";

                SDSThingToDoList.SelectCommand = sql;               
            }
            
        }
    }
}