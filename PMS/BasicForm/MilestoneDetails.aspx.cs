using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.BasicForm
{
    public partial class MilestoneDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NewMilestoneButton_Click(object sender, EventArgs e)
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
                // Success message
                InsertPanel.Visible = false;
            }
            else
            {
                // Handle error
                e.ExceptionHandled = true;
                // Display error message
            }
        }

        protected string GetStatusBadgeClass(string status)
        {
            switch (status.ToLower())
            {
                case "completed":
                    return "bg-success";
                case "in progress":
                    return "bg-primary";
                case "not started":
                    return "bg-secondary";
                case "on hold":
                    return "bg-warning text-dark";
                case "delayed":
                    return "bg-danger";
                default:
                    return "bg-info";
            }
        }


        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList statusDropDown = (DropDownList)e.Row.FindControl("StatusDropDown");
                if (statusDropDown != null)
                {
                    string status = DataBinder.Eval(e.Row.DataItem, "STATUS") as string;
                    if (string.IsNullOrEmpty(status))
                    {
                        // Set a default value if the status is null or empty
                        statusDropDown.SelectedValue = "Not Started"; // Or any other default value
                    }
                }
            }
        }
    }


}