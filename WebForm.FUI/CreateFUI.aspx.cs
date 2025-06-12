using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.FUI
{
    public partial class CreateFUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie usernameCookie = Request.Cookies["Username"];

                if (usernameCookie == null || string.IsNullOrEmpty(usernameCookie.Value))
                {
                    // Jika cookie tidak ditemukan, redirect ke login
                    Response.Redirect("LoginForm.aspx");
                    return;
                }

                string username = usernameCookie.Value;

                RequesterName.Text = username;

                // Panggil API untuk ambil DocumentNo berdasarkan username
                GetDocumentNoByUsername(username);

                GetRequesterName(username);

                GetInvestmentTypes();

                GetDescReplacedAsset();

                GetDescledgerAccount();

                GetCurrencyList();

                GetUnitList();


            }
        }

        private async void GetDocumentNoByUsername(string username)
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/InsertNewDocumentFUI";
            var payload = new { UserName = username };
            var json = JsonConvert.SerializeObject(payload);

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                try
                {
                    var response = await client.PostAsync(apiUrl, content);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        var apiResult = JsonConvert.DeserializeObject<DocumentResponse>(result);

                        id.Text = apiResult.DocumentNo;
                    }
                    else
                    {
                        id.Text = "ERROR: Cannot fetch DocumentNo";
                    }
                }
                catch (Exception ex)
                {
                    id.Text = "ERROR: " + ex.Message;
                }
            }
        }

        private void GetInvestmentTypes()
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/SelectListInvestType";

            try
            {
                using (HttpClient client = new HttpClient())
                {
                    var payload = new { }; // Jika API tidak butuh parameter, kosongkan
                    var json = JsonConvert.SerializeObject(payload);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");

                    var response = client.PostAsync(apiUrl, content).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        var result = response.Content.ReadAsStringAsync().Result;
                        var data = JsonConvert.DeserializeObject<ApiResponse>(result);

                        if (data?.ListInvestType != null)
                        {
                            investmentType.Items.Clear();
                            investmentType.Items.Add(new ListItem("-- Pilih Investment Type --", ""));

                            foreach (var invest in data.ListInvestType)
                            {
                                if (invest.IsActive)
                                {
                                    investmentType.Items.Add(new ListItem
                                    {
                                        Text = invest.InvestCode,
                                        Value = invest.InvestCode
                                    });
                                }
                            }
                        }
                    }
                    else
                    {
                        investmentType.Items.Add(new ListItem($"Error ({response.StatusCode})", ""));
                    }
                }
            }
            catch (Exception ex)
            {
                investmentType.Items.Add(new ListItem("Exception: " + ex.Message, ""));
            }
        }

        

        private async void GetDescReplacedAsset()
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/InforGetAsset";  // Ganti dengan URL API yang sesuai

            
            var payload = new { Replaced_Asset = "", Desc_Replaced_Asset = "" };
            var json = JsonConvert.SerializeObject(payload);

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                try
                {
                    var response = await client.PostAsync(apiUrl, content);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        var apiResult = JsonConvert.DeserializeObject<ApiResponse>(result);

                        // Kirim data ke frontend menggunakan JavaScript
                        var descAssetsJson = JsonConvert.SerializeObject(apiResult.Data);
                        string script = $"<script>window.descReplacedAssets = {descAssetsJson};</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "LoadDescReplacedAssets", script, false);
                    }
                    else
                    {
                        // Handle error if the API call fails
                        string errorScript = "<script>alert('Error fetching data for Desc_Replaced_Asset');</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorFetchingData", errorScript, false);
                    }
                }
                catch (Exception ex)
                {
                    string errorScript = "<script>alert('Exception: " + ex.Message + "');</script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Exception", errorScript, false);
                }
            }
        }

        private async void GetDescledgerAccount()
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/InforGetLedAcc";
            var payload = new { Ledger_Account = "", Desc_Ledger_Account = "" };
            var json = JsonConvert.SerializeObject(payload);

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                try
                {
                    var response = await client.PostAsync(apiUrl, content);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        var apiResult = JsonConvert.DeserializeObject<LedgerApiResponse>(result);

                        var ledgerJson = JsonConvert.SerializeObject(apiResult.Data);
                        string script = $"<script>window.ledgerData = {ledgerJson};</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "LoadLedgerData", script, false);
                    }
                    else
                    {
                        string errorScript = $"<script>alert('API error: {response.StatusCode}');</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "LedgerError", errorScript, false);
                    }
                }
                catch (Exception ex)
                {
                    string errorScript = $"<script>alert('Ledger Account Error: {ex.Message}');</script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "LedgerError", errorScript, false);
                }
            }
        }

        private async void GetCurrencyList()
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/InforGetCurrency";
            var payload = new { Currency = "", Desc_Currency = "" };
            var json = JsonConvert.SerializeObject(payload);

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                try
                {
                    var response = await client.PostAsync(apiUrl, content);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        var apiResult = JsonConvert.DeserializeObject<CurrencyApiResponse>(result);

                        var currencyJson = JsonConvert.SerializeObject(apiResult.Data);
                        string script = $"<script>window.currencyData = {currencyJson};</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "LoadCurrencyData", script, false);
                    }
                    else
                    {
                        string errorScript = $"<script>alert('API error (Currency): {response.StatusCode}');</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CurrencyError", errorScript, false);
                    }
                }
                catch (Exception ex)
                {
                    string errorScript = $"<script>alert('Currency Error: {ex.Message}');</script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CurrencyError", errorScript, false);
                }
            }
        }


        private async void GetUnitList()
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/InforGetUnit";
            var payload = new { Unit = "" };
            var json = JsonConvert.SerializeObject(payload);

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                try
                {
                    var response = await client.PostAsync(apiUrl, content);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        var apiResult = JsonConvert.DeserializeObject<UnitApiResponse>(result);

                        var unitJson = JsonConvert.SerializeObject(apiResult.Data);
                        string script = $"<script>window.unitData = {unitJson};</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "LoadUnitData", script, false);
                    }
                    else
                    {
                        string errorScript = $"<script>alert('API error (Unit): {response.StatusCode}');</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "UnitError", errorScript, false);
                    }
                }
                catch (Exception ex)
                {
                    string errorScript = $"<script>alert('Unit Error: {ex.Message}');</script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "UnitError", errorScript, false);
                }
            }
        }

        private async void GetRequesterName(string username)
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/InforGetRequester";
            var payload = new { Ldap = username };
            var json = JsonConvert.SerializeObject(payload);

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                try
                {
                    var response = await client.PostAsync(apiUrl, content);
                    if (response.IsSuccessStatusCode)
                    {
                        var result = await response.Content.ReadAsStringAsync();
                        var apiResult = JsonConvert.DeserializeObject<RequesterResponse>(result);

                        if (apiResult != null && apiResult.Data.Count > 0)
                        {
                            var requester = apiResult.Data[0];  // Ambil Requester Name dari data
                            RequesterName.Text = requester.Requester_Name;  // Isi TextBox dengan Requester Name
                        }
                        else
                        {
                            RequesterName.Text = "No data found for this User";
                        }
                    }
                    else
                    {
                        RequesterName.Text = "Error: Cannot fetch Requester Name (Status: " + response.StatusCode + ")";
                    }
                }
                catch (Exception ex)
                {
                    RequesterName.Text = "Exception: " + ex.Message;
                }
            }
        }


        public class RequesterResponse
        {
            public List<RequesterData> Data { get; set; }
        }

        public class RequesterData
        {
            public string Requester_Name { get; set; }
            public string Requester_Departement { get; set; }
            public string Ldap { get; set; }
            public string Departement_Desc { get; set; }
        }

        public class CurrencyItem
        {
            public string Currency { get; set; }
        }

        public class CurrencyApiResponse
        {
            public List<CurrencyItem> Data { get; set; }
            public ErrorMessage ErrorMessage { get; set; }
        }

        public class UnitItem
        {
            public string Unit { get; set; }
        }

        public class UnitApiResponse
        {
            public List<UnitItem> Data { get; set; }
            public ErrorMessage ErrorMessage { get; set; }
        }

        public class LedgerItem
        {
            public string Ledger_Account { get; set; }
            public string Desc_Ledger_Account { get; set; }
        }

        public class LedgerApiResponse
        {
            public List<LedgerItem> Data { get; set; }
        }

        public class DescReplacedAsset
        {
            public string Desc_Replaced_Asset { get; set; }
            public string Replaced_Asset { get; set; }
        }
       
        

        // Define the structure of the API response
        public class ApiResponse
        {
            public List<InvestType> ListInvestType { get; set; }
            public List<DescReplacedAsset> Data { get; set; }          
        }

        public class InvestType
        {
            public string InvestCode { get; set; }
            public string InvestDesc { get; set; }
            public string InvestTypes { get; set; }
            public bool IsActive { get; set; }
        }

        public class DocumentResponse
        {
            public string DocumentNo { get; set; }
            public ErrorMessage ErrorMessage { get; set; }
            public bool IsRequested { get; set; }
        }

        public class ErrorMessage
        {
            public string Reason { get; set; }
        }

    }
}