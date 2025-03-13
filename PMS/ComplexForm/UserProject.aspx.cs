using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.ComplexForm
{
	public partial class UserProject : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}


        protected string GetStatusBadgeClass(string status)
        {
            switch (status.ToLower())
            {
                case "completed":
                    return "bg-success";
                case "in progress":
                    return "bg-primary";
                case "pending":
                    return "bg-warning text-dark";
                case "delayed":
                    return "bg-danger";
                case "on hold":
                    return "bg-secondary";
                default:
                    return "bg-info text-dark";
            }
        }
    }
}