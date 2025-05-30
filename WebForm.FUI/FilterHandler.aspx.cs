using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.FUI
{
    public partial class FilterHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";

            string idFUI = Request.QueryString["idFUI"] ?? "";

            var data = new List<dynamic>
    {
        new {
            IDFUI = "FUI001",
            NomorFUI = "NF-2025-01",
            NamaProject = "Project A1",
            Requester = "User A",
            RequesterDept = "Dept A",
            UserDept = "Dept B",
            InvestType = "CapEx",
            ScheduleRequirement = "Q3 2025",
            TotalAmount = "100,000",
            StatusApproval = "Approved"
        },
        new {
            IDFUI = "FUI002",
            NomorFUI = "NF-2025-02",
            NamaProject = "Project A2",
            Requester = "User B",
            RequesterDept = "Dept B",
            UserDept = "Dept C",
            InvestType = "OpEx",
            ScheduleRequirement = "Q4 2025",
            TotalAmount = "150,000",
            StatusApproval = "Pending"
        }
    };

            // Filtering berdasarkan ID FUI
            if (!string.IsNullOrEmpty(idFUI))
            {
                data = data.FindAll(item => item.IDFUI.ToLower().Contains(idFUI.ToLower()));
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Response.Write(js.Serialize(data));
        }

    }
}