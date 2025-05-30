using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.DirectoryServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.FUI
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public class TokenResponse
        {
            public string Token { get; set; }
        }
        protected async void btnLogin_Click(object sender, EventArgs e)
        {
            var username = exampleInputEmail.Text.Trim();
            var password = exampleInputPassword.Text;

            var loginData = new { Username = username, Password = password };
            var json = JsonConvert.SerializeObject(loginData);
            var url = "http://10.14.90.49/apimanuffui/Services.svc/rest/LoginLDAP";

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                try
                {
                    var response = await client.PostAsync(url, content);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        var tokenResponse = JsonConvert.DeserializeObject<TokenResponse>(result);  // Menggunakan kelas TokenResponse yang baru

                        // Simpan token di session
                        Session["Token"] = tokenResponse.Token;
                        Response.Redirect("FrmDashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Login gagal. Periksa username atau password.";
                        lblMessage.CssClass = "text-danger";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Terjadi kesalahan: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }


    }
}