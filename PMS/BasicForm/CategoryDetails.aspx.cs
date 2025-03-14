using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.BasicForm
{
	public partial class CategoryDetails : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}


        protected void NewCategoryButton_Click(object sender, EventArgs e)
        {
            InsertPanel.Visible = true;
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            InsertPanel.Visible = false;
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Insertion was successful
                AlertMessage.Text = "Category inserted successfully.";
                AlertPanel.CssClass = "alert alert-success alert-dismissible fade show";
            }
            else
            {
                // Insertion failed
                AlertMessage.Text = "Error inserting category: " + e.Exception.Message;
                AlertPanel.CssClass = "alert alert-danger alert-dismissible fade show";
                e.ExceptionHandled = true; // Prevent the default error display
            }
            AlertPanel.Visible = true;
            InsertPanel.Visible = false; // Hide the insert panel
            GridView1.DataBind(); // Refresh the GridView
        }


    }
}