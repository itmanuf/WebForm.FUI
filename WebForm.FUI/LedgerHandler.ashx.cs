

using System;
using System.Web;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebForm.FUI
{
    /// <summary>
    /// Summary description for LedgerHandler
    /// </summary>
    public class LedgerHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string search = context.Request["search"] ?? "";

            // Panggil API
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/InforGetLedAcc";
            var payload = new
            {
                Ledger_Account = "",
                Desc_Ledger_Account = ""
            };

            var jsonPayload = JsonConvert.SerializeObject(payload);

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
                HttpResponseMessage response = client.PostAsync(apiUrl, content).Result;

                if (!response.IsSuccessStatusCode)
                {
                    context.Response.StatusCode = 500;
                    context.Response.Write("{\"error\":\"Gagal mengambil data dari API\"}");
                    return;
                }

                string result = response.Content.ReadAsStringAsync().Result;
                var apiResult = JsonConvert.DeserializeObject<ApiResponse>(result);

                // Filtering berdasarkan search keyword
                List<Select2Item> filtered = new List<Select2Item>();

                if (apiResult?.Data != null)
                {
                    filtered = apiResult.Data
                        .Where(x => !string.IsNullOrEmpty(x.Desc_Ledger_Account) && x.Desc_Ledger_Account.IndexOf(search, StringComparison.OrdinalIgnoreCase) >= 0)
                        .Select(x => new Select2Item
                        {
                            id = x.Ledger_Account,
                            text = x.Desc_Ledger_Account
                        }).ToList();
                }


                context.Response.ContentType = "application/json";
                context.Response.Write(JsonConvert.SerializeObject(filtered));
            }
        }

        public bool IsReusable => false;

        public class ApiResponse
        {
            public List<LedgerAccount> Data { get; set; }
        }

        public class LedgerAccount
        {
            public string Desc_Ledger_Account { get; set; }
            public string Ledger_Account { get; set; }
        }

        public class Select2Item
        {
            public string id { get; set; }
            public string text { get; set; }
        }


    }
}