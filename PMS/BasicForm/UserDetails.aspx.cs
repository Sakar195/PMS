using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.BasicForm
{
    public partial class UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void NewUserButton_Click(object sender, EventArgs e)
        {
            InsertPanel.Visible = true;
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            InsertPanel.Visible = false;
        }
    }
}