using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.BasicForm
{
    public partial class RoleDetails : System.Web.UI.Page
    {


        // claudes
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialize page
            if (!IsPostBack)
            {
                // Hide the form panel initially
                NewRolePanel.Visible = false;
            }
        }

        protected void NewRoleButton_Click(object sender, EventArgs e)
        {
            // Show the form panel when Add New Role button is clicked
            NewRolePanel.Visible = true;

            // Reset any validation errors
            ValidationSummary1.Visible = false;

            // Hide any previous alerts
            AlertPanel.Visible = false;
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            // Hide the form panel when Cancel button is clicked
            NewRolePanel.Visible = false;
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Success message
                NewRolePanel.Visible = false;

                // Show success message
                AlertPanel.CssClass = "alert alert-success alert-dismissible fade show";
                AlertMessage.Text = "Role added successfully!";
                AlertPanel.Visible = true;
            }
            else
            {
                // Handle error
                e.ExceptionHandled = true;

                // Show error message
                AlertPanel.CssClass = "alert alert-danger alert-dismissible fade show";
                AlertMessage.Text = "Error adding role: " + e.Exception.Message;
                AlertPanel.Visible = true;
            }
        }


        // gemini
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        InsertPanel.Visible = false; // Initially hide the insertion panel
        //    }
        //}

        //protected void NewRoleButton_Click(object sender, EventArgs e)
        //{
        //    InsertPanel.Visible = true;
        //    FormView1.ChangeMode(FormViewMode.Insert); // Ensure FormView is in insert mode
        //}

        //protected void InsertCancelButton_Click(object sender, EventArgs e)
        //{
        //    InsertPanel.Visible = false;
        //}
        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
    }
}