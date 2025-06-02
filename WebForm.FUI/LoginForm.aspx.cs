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
            if (Session["Token"] != null)
            {
                Response.Redirect("UserDashboardForm.aspx");
            }

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

                        // Cek apakah API mengembalikan token atau pesan error
                        if (result.Contains("Error cannot login to LDAP"))
                        {
                            // Jika ada pesan error dari API, tampilkan pesan error ke pengguna
                            lblMessage.Text = "Invalid username or password.";
                            lblMessage.CssClass = "text-danger";
                        }
                        else
                        {
                            var tokenResponse = JsonConvert.DeserializeObject<TokenResponse>(result);

                            // Simpan token di session jika login berhasil
                            Session["Token"] = tokenResponse.Token;
                            Session["Username"] = username;

                            HttpCookie tokenCookie = new HttpCookie("AuthToken", tokenResponse.Token);
                            tokenCookie.Expires = DateTime.Now.AddMinutes(30);  // Set expiry cookie 30 menit
                            Response.Cookies.Add(tokenCookie);

                            HttpCookie usernameCookie = new HttpCookie("Username", username);
                            usernameCookie.Expires = DateTime.Now.AddMinutes(30);  // Set expiry cookie 30 menit
                            Response.Cookies.Add(usernameCookie);

                            Response.Redirect("UserDashboardForm.aspx");
                            
                        }
                    }
                    else
                    {
                        // Jika status response tidak sukses, tampilkan pesan error
                        lblMessage.Text = "Login gagal. Periksa username atau password.";
                        lblMessage.CssClass = "text-danger";
                    }
                }
                catch (Exception ex)
                {
                    // Tangani exception jika terjadi kesalahan dalam proses login
                    lblMessage.Text = "Terjadi kesalahan: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }





    }
}