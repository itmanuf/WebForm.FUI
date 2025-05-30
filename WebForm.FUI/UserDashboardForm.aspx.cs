using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.FUI
{
    public partial class UserDashboardForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            // Simulasi data dummy (biasanya 5 data awal seperti di HTML)
            var data = new List<object>
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
                    Requester = "User A",
                    RequesterDept = "Dept A",
                    UserDept = "Dept B",
                    InvestType = "CapEx",
                    ScheduleRequirement = "Q3 2025",
                    TotalAmount = "200,000",
                    StatusApproval = "Pending"
                },
                // Tambahkan lebih banyak data jika perlu
            };

            
        }
    }
}