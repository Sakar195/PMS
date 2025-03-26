using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.BasicForm
{
	public partial class SubTaskDetails : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
        protected void NewSubtaskButton_Click(object sender, EventArgs e)
        {
            InsertPanel.Visible = true;
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            InsertPanel.Visible = false;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlTask = (DropDownList)e.Row.FindControl("DropDownList1");

                if (ddlTask != null)
                {
                    if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                    {
                        // Row is in edit mode, enable the dropdown
                        ddlTask.Enabled = true;
                    }
                    else
                    {
                        // Row is not in edit mode, disable the dropdown
                        ddlTask.Enabled = false;
                    }
                }
            }
        }
    }
}