using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
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
            if (Session["Token"] == null)
            {
                HttpCookie tokenCookie = Request.Cookies["AuthToken"];

                if (tokenCookie == null)
                {
                    
                    Response.Redirect("LoginForm.aspx");
                }
                else
                {
                    // Jika token ditemukan di cookies, simpan ke session
                    Session["Token"] = tokenCookie.Value;
                    
                }
            }

            HttpCookie usernameCookie = Request.Cookies["Username"];
            if (usernameCookie != null)
            {
                string loggedInUser = usernameCookie.Value;



                //RequesterName.Text = loggedInUser;  // Menampilkan username di input field

                // Mengirimkan parameter ke API untuk mendapatkan data berdasarkan username yang login
                Dictionary<string, string> parameters = new Dictionary<string, string>
                {
                    { "Ldap", loggedInUser }
                };

                var json = JsonConvert.SerializeObject(parameters);

                GetRequesterName(json);  // Mendapatkan data sesuai requester

                Dictionary<string, string> paramFUI = new Dictionary<string, string>
                {
                    { "UserName", loggedInUser }  // Sesuai format API seperti di Postman Anda
                };

                var jsonFUI = JsonConvert.SerializeObject(paramFUI);
                GetFUIData(jsonFUI);
            }
            else
            {
                // Jika username tidak ditemukan di cookies, arahkan kembali ke halaman login
                Response.Redirect("LoginForm.aspx");
            }

            LoadMassproDateDropdown();
           // GetFUIData(string parameters);
        }

        
        private async void GetFUIData(string parameters)
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/SelectHeaderFUI";
            

            using (HttpClient client = new HttpClient())
            {
                try
                {
                    // Mengirimkan data menggunakan POST
                    var content = new StringContent(parameters, Encoding.UTF8, "application/json");

                    HttpResponseMessage response = await client.PostAsync(apiUrl, content);

                    if (response.IsSuccessStatusCode)
                    {
                        string responseData = await response.Content.ReadAsStringAsync();
                        var apiResponse = JsonConvert.DeserializeObject<ApiResponse>(responseData);
                        var fuiData = apiResponse.HeaderFUI;

                        string tableRows = GenerateTableRows(fuiData);
                        DataTableContainer.InnerHtml = tableRows;
                    }
                    else
                    {
                        Response.Write("Error: " + response.ReasonPhrase);
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("Exception: " + ex.Message);
                }
            }
        }



        private async void HandleSearch()
        {
            string loggedInUser = Session["Username"] as string;

            string massproDate = this.MassproDate.SelectedValue;  // Ambil nilai dari dropdown

            
            

            // Ambil parameter pencarian dari query string
            //string DocumentNo = this.DocumentNo.Text.Trim();
            //string NomorFUI = this.NomorFUI.Text.Trim();
            string ProjectName = this.ProjectName.Text.Trim();
            //string RequesterName = this.RequesterName.Text.Trim(); 
            string RequesterDepartment = this.RequesterDepartment.Text.Trim();
            string UserDepartment = this.UserDepartment.Text.Trim();
            //string InvestType = this.InvestType.Text.Trim();
            string MassproDate = this.MassproDate.SelectedValue.Trim();          
            //string TotalBudget = this.TotalBudget.Text.Trim();
            string StatusApproval = this.StatusApproval.Text.Trim();

            // Bangun parameter yang akan dikirim ke API
            var parameters = new Dictionary<string, string>();

            //if (!string.IsNullOrEmpty(DocumentNo)) parameters.Add("DocumentNo", DocumentNo);
            //if (!string.IsNullOrEmpty(NomorFUI)) parameters.Add("NomorFUI", NomorFUI);
            if (!string.IsNullOrEmpty(ProjectName)) parameters.Add("ProjectName", ProjectName);
            //if (!string.IsNullOrEmpty(loggedInUser)) parameters.Add("RequesterName", loggedInUser);
            if (!string.IsNullOrEmpty(RequesterDepartment)) parameters.Add("RequesterDepartment", RequesterDepartment);
            if (!string.IsNullOrEmpty(UserDepartment)) parameters.Add("UserDepartment", UserDepartment);
            //if (!string.IsNullOrEmpty(InvestType)) parameters.Add("InvestType", InvestType);
            if (!string.IsNullOrEmpty(MassproDate)) parameters.Add("MassproDate", MassproDate);            
            //if (!string.IsNullOrEmpty(TotalBudget)) parameters.Add("TotalBudget", TotalBudget);
            if (!string.IsNullOrEmpty(StatusApproval)) parameters.Add("StatusApproval", StatusApproval);

            // Panggil API dengan parameter pencarian
            var jsonparam = JsonConvert.SerializeObject(parameters);
            GetFUIData(jsonparam);
        }
       
        private bool IsAllFilterEmpty()
        {
            return /*string.IsNullOrWhiteSpace(DocumentNo.Text) &&*/
                   //string.IsNullOrWhiteSpace(NomorFUI.Text) &&
                   string.IsNullOrWhiteSpace(ProjectName.Text) &&
                   //string.IsNullOrWhiteSpace(RequesterName.Text) &&
                   string.IsNullOrWhiteSpace(RequesterDepartment.Text) &&
                   string.IsNullOrWhiteSpace(UserDepartment.Text) &&
                   //string.IsNullOrWhiteSpace(InvestType.Text) &&
                   string.IsNullOrWhiteSpace(MassproDate.SelectedValue) &&                  
                   //string.IsNullOrWhiteSpace(TotalBudget.Text) &&
                   string.IsNullOrWhiteSpace(StatusApproval.Text);
        }


        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            if (IsAllFilterEmpty())
            {
                
                // Misalnya menggunakan Label lblMessage.Text
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Silakan isi minimal satu kolom filter.');", true);
                return;
            }

            // Lanjutkan ke proses pencarian
            HandleSearch();
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            // Kosongkan semua filter input
            //DocumentNo.Text = string.Empty;
            //NomorFUI.Text = string.Empty;
            ProjectName.Text = string.Empty;
           /* RequesterName.Text = Session["Username"] as string;*/ // tetap isi requester sesuai login
            RequesterDepartment.Text = string.Empty;
            UserDepartment.Text = string.Empty;
            //InvestType.Text = string.Empty;
            MassproDate.Text = string.Empty;          
            //TotalBudget.Text = string.Empty;
            StatusApproval.Text = string.Empty;

            // Panggil ulang GetFUIData() untuk load semua data
            var parameters = new Dictionary<string, string>();
            

            var json = JsonConvert.SerializeObject(parameters);
            GetFUIData(json);
        }



        // Method untuk membuat baris HTML dari data yang diterima
        private string GenerateTableRows(List<HeaderFUI> fuiData)
        {
            string tableRows = string.Empty;

            if (fuiData != null && fuiData.Count > 0)
            {
                foreach (var fui in fuiData)
                {
                    tableRows += $"<tr>" +
                                 $"<td>{fui.DocumentNo}</td>" +
                                 $"<td>{fui.NomorFUI}</td>" +
                                 $"<td>{fui.ProjectName}</td>" +
                                 $"<td>{fui.RequesterName}</td>" +
                                 $"<td>{fui.RequesterDepartment}</td>" +
                                 $"<td>{fui.UserDepartment}</td>" +
                                 $"<td>{fui.InvestType}</td>" +
                                 $"<td>{fui.MassproDate}</td>" +                               
                                 $"<td>{fui.TotalBudget}</td>" +
                                 $"<td>{fui.StatusApproval}</td>" +
                                 $"<td><button type=\"button\" class=\"btn-detail\" onclick=\"viewDetail('{fui.DocumentNo}')\">Detail</button></td>" +
                                 $"</tr>";
                }
            }
            else
            {
                tableRows = "<tr><td colspan='10'>No data found</td></tr>"; // Menampilkan pesan jika tidak ada data
            }

            return tableRows;
        }

        private async void LoadMassproDateDropdown()
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/SelectListMassproYear";

            using (HttpClient client = new HttpClient())
            {
                try
                {
                    // Membuat objek request body (content) jika diperlukan
                    var content = new StringContent("", Encoding.UTF8, "application/json");  // Menyiapkan body kosong untuk POST

                    HttpResponseMessage response = await client.PostAsync(apiUrl, content); // Menggunakan POST

                    if (response.IsSuccessStatusCode)
                    {
                        string responseData = await response.Content.ReadAsStringAsync();
                        var apiResponse = JsonConvert.DeserializeObject<MassporApiResponse>(responseData); // Deserialize response

                        // Menambahkan item ke dropdown
                        MassproDate.Items.Clear();
                        MassproDate.Items.Add(new ListItem("Select Year", "")); // Menambahkan item default

                        // Memasukkan nilai tahun dari response
                        foreach (var year in apiResponse.ListMassproYear)
                        {
                            MassproDate.Items.Add(new ListItem(year.MassproYear, year.MassproYear));
                        }
                    }
                    else
                    {
                        Response.Write("Error: " + response.ReasonPhrase); // Menangani error jika API gagal
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Exception: " + ex.Message); // Menangani exception lainnya
                }
            }
        }

        private async void GetRequesterName(string parameters)
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/InforGetRequester";  // URL API untuk mendapatkan Requester Name

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(parameters, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(apiUrl, content);

                if (response.IsSuccessStatusCode)
                {
                    // Mendapatkan response data dari API
                    string responseData = await response.Content.ReadAsStringAsync();

                    // Deserialize response JSON menjadi objek
                    var requesterData = JsonConvert.DeserializeObject<RequesterResponse>(responseData);

                    // Jika ada data yang diterima, tampilkan Requester Name di TextBox
                    if (requesterData != null && requesterData.Data.Count > 0)
                    {
                        var requester = requesterData.Data[0];
                        RequesterName.Text = requester.Requester_Name;  // Set Requester Name ke field RequesterName
                    }
                }
                else
                {
                    // Tangani error jika respons tidak sukses
                    Response.Write("Error: " + response.ReasonPhrase);
                }
            }
        }

        public class MassporApiResponse
        {
            public List<MassproYearItem> ListMassproYear { get; set; }
        }

        public class MassproYearItem
        {
            public string MassproYear { get; set; }
        }


        public class HeaderFUI
        {
            public string DocumentNo { get; set; }
            public string NomorFUI { get; set; }
            public string InvestType { get; set; }
            public string ProjectName { get; set; }
            public string RequesterName { get; set; }
            public string RequesterDepartment { get; set; }
            public string UserDepartment { get; set; }           
            public string MassproDate { get; set; }          
            public string TotalBudget { get; set; }
            public string StatusApproval { get; set; }
        }

        public class ErrorMessage
        {
            public string Reason { get; set; }
        }

        public class ApiResponse
        {
            public ErrorMessage ErrorMessage { get; set; }
            public List<HeaderFUI> HeaderFUI { get; set; }
        }

        public class RequesterResponse
        {
            public List<RequesterData> Data { get; set; }
            public ErrorMessage ErrorMessage { get; set; }
        }

        public class RequesterData
        {
            public string Requester_Name { get; set; }
            public string Requester_Departement { get; set; }
            public string Ldap { get; set; }
            public string Departement_Desc { get; set; }
        }
    }
}
