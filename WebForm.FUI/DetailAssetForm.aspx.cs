using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static WebForm.FUI.CreateFUI;

namespace WebForm.FUI
{
    public partial class DetailAssetForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string documentNo = Request.QueryString["DocumentNo"];
            if (!string.IsNullOrEmpty(documentNo))
            {
                var parameters = new Dictionary<string, string>
                {
                    { "DocumentNo", documentNo }
                };
                var json = JsonConvert.SerializeObject(parameters);
                GetFUIDetail(json);
            }
            else
            {
                Response.Write("Error: DocumentNo is missing");
            }
        }

        private async void GetFUIDetail(string parameters)
        {
            string apiUrl = "http://10.14.90.49/apimanuffui/Services.svc/rest/GetAllFUIbyDocumentNo";

            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(parameters, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(apiUrl, content);

                if (response.IsSuccessStatusCode)
                {
                    string responseData = await response.Content.ReadAsStringAsync();
                    var documentData = JsonConvert.DeserializeObject<DetailApiResponse>(responseData);

                    if (documentData.DocumentFUI != null && documentData.DocumentFUI.Count > 0)
                    {
                        var fui = documentData.DocumentFUI[0];

                        // Bind the basic fields to form controls
                        budget.Text = fui.AdditionalBudget.ToString();
                        amount.Text = fui.AmountBudget.ToString();
                        id.Text = fui.DocumentNo;
                        investmentType.Text = fui.InvestCode;
                        txtmasproDate.Text = fui.MassproDate;
                        nomorFUI.Text = fui.NomorFUI;
                        noteaprv.Text = fui.Notes;
                        project.Text = fui.ProjectName;
                        requesterdep.Text = fui.RequesterDepartment;
                        requester.Text = fui.RequesterName;
                        statusaprv.Text = fui.StatusApproval;
                        statuscnvrt.Text = fui.StatusConvertPR;
                        totalamount.Text = fui.TotalBudget.ToString();
                        budget2.Text = fui.TransferBudget.ToString();
                        userdep.Text = fui.UserDepartment;

                        // Handle the IsRequested condition
                        if (fui.IsRequested == true)
                        {
                            DisableFormFields();
                        }

                        // Bind DetailAsset data to the repeater (table)
                        if (documentData.DetailAsset != null && documentData.DetailAsset.Count > 0)
                        {
                            rptDetailAsset.DataSource = documentData.DetailAsset;
                            rptDetailAsset.DataBind();
                        }
                        else
                        {
                            // Optionally, you can show a message or empty row if no DetailAsset data is available
                            rptDetailAsset.DataSource = new List<DetailAsset>(); // Empty list if no data
                            rptDetailAsset.DataBind();
                        }

                        // Handle file attachments
                        if (documentData.FileAttachment != null)
                        {
                            AttachFiles(documentData.FileAttachment);
                        }
                    }
                    else
                    {
                        Response.Write("Error: No data found for the DocumentNo");
                    }
                }
                else
                {
                    Response.Write("Error: " + response.ReasonPhrase);
                }
            }
        }

        private void DisableFormFields()
        {
            // Disable all input fields, drop-downs, and buttons when IsRequested = true
            budget.Enabled = false;
            amount.Enabled = false;
            id.Enabled = false;
            investmentType.Enabled = false;
            txtmasproDate.Enabled = false;
            nomorFUI.Enabled = false;
            noteaprv.Enabled = false;
            project.Enabled = false;
            requesterdep.Enabled = false;
            requester.Enabled = false;
            statusaprv.Enabled = false;
            statuscnvrt.Enabled = false;
            totalamount.Enabled = false;
            budget2.Enabled = false;
            userdep.Enabled = false;
            BtnSubmit.Enabled = false;
            BtnSave.Enabled = false;

            // Disable file upload controls as well
            fuiForm.Enabled = false;
            momBod.Enabled = false;
            memoAsset.Enabled = false;
            beritaAcara.Enabled = false;
            attachmentOther.Enabled = false;
            attachmentOther1.Enabled = false;
        }

        private void AttachFiles(List<FileAttachment> fileAttachments)
        {
            if (fileAttachments != null)
            {
                foreach (var file in fileAttachments)
                {
                    if (file.AttachmentCode == "001")
                    {
                        lblFuiFormFileName.Text = file.AttachmentName;
                        linkFuiFormDownload.NavigateUrl = $"data:{file.AttachmentType};base64,{file.Blob}";
                    }
                    if (file.AttachmentCode == "002")
                    {
                        lblMOMBOD.Text = file.AttachmentName;
                        linkMOMBOD.NavigateUrl = $"data:{file.AttachmentType};base64,{file.Blob}";
                    }
                    if (file.AttachmentCode == "003")
                    {
                        lblMemo.Text = file.AttachmentName;
                        linkMemo.NavigateUrl = $"data:{file.AttachmentType};base64,{file.Blob}";
                    }
                    if (file.AttachmentCode == "004")
                    {
                        lblberitaAcara.Text = file.AttachmentName;
                        linkberitaAcara.NavigateUrl = $"data:{file.AttachmentType};base64,{file.Blob}";
                    }
                    if (file.AttachmentCode == "005")
                    {
                        lblAttch1.Text = file.AttachmentName;
                        linkAttch1.NavigateUrl = $"data:{file.AttachmentType};base64,{file.Blob}";
                    }
                    if (file.AttachmentCode == "006")
                    {
                        lblAttch2.Text = file.AttachmentName;
                        linkAttch2.NavigateUrl = $"data:{file.AttachmentType};base64,{file.Blob}";
                    }
                }
            }
        }

        //protected void rptDetailAsset_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        var txtLinenum = (TextBox)e.Item.FindControl("txtLinenum");
        //        if (txtLinenum != null)
        //            txtLinenum.Enabled = false;

        //        var txtAssetName = (TextBox)e.Item.FindControl("txtAssetName");
        //        if (txtAssetName != null)
        //            txtAssetName.Enabled = false;

        //        var txtReplacedAsset = (TextBox)e.Item.FindControl("txtReplacedAsset");
        //        if (txtReplacedAsset != null)
        //            txtReplacedAsset.Enabled = false;

        //        var txtReplacedAssetDesc = (TextBox)e.Item.FindControl("txtReplacedAssetDesc");
        //        if (txtReplacedAssetDesc != null)
        //            txtReplacedAssetDesc.Enabled = false;

        //        var txtAssetParent = (TextBox)e.Item.FindControl("txtAssetParent");
        //        if (txtAssetParent != null)
        //            txtAssetParent.Enabled = false;

        //        var txtAssetParentDesc = (TextBox)e.Item.FindControl("txtAssetParentDesc");
        //        if (txtAssetParentDesc != null)
        //            txtAssetParentDesc.Enabled = false;

        //        var txtLedgerAccount = (TextBox)e.Item.FindControl("txtLedgerAccount");
        //        if (txtLedgerAccount != null)
        //            txtLedgerAccount.Enabled = false;

        //        var txtLedgerAccountDesc = (TextBox)e.Item.FindControl("txtLedgerAccountDesc");
        //        if (txtLedgerAccountDesc != null)
        //            txtLedgerAccountDesc.Enabled = false;

        //        var txtAmountinorigin = (TextBox)e.Item.FindControl("txtAmountinorigin");
        //        if (txtAmountinorigin != null)
        //            txtAmountinorigin.Enabled = false;

        //        var txtCurrency = (TextBox)e.Item.FindControl("txtCurrency");
        //        if (txtCurrency != null)
        //            txtCurrency.Enabled = false;

        //        var txtAmountinIDR = (TextBox)e.Item.FindControl("txtAmountinIDR");
        //        if (txtAmountinIDR != null)
        //            txtAmountinIDR.Enabled = false;

        //        var txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
        //        if (txtQuantity != null)
        //            txtQuantity.Enabled = false;

        //        var txtUnit = (TextBox)e.Item.FindControl("txtUnit");
        //        if (txtUnit != null)
        //            txtUnit.Enabled = false;

        //        var txtLifeYear = (TextBox)e.Item.FindControl("txtLifeYear");
        //        if (txtLifeYear != null)
        //            txtLifeYear.Enabled = false;

        //        var txtStatusConvert = (TextBox)e.Item.FindControl("txtStatusConvert");
        //        if (txtStatusConvert != null)
        //            txtStatusConvert.Enabled = false;
        //        // Tambahkan FindControl lainnya di sini
        //    }
        //}

        public class DocumentFUI
        {
            public Decimal AdditionalBudget { get; set; }
            public Decimal AmountBudget { get; set; }
            public string DocumentNo { get; set; }
            public string InvestCode { get; set; }
            public bool IsRequested { get; set; }   
            public string MassproDate { get; set; }
            public string NomorFUI { get; set; }
            public string Notes { get; set; }
            public string ProjectName { get; set; }
            public string RequesterDepartment { get; set; }
            public string RequesterName { get; set; }
            public string StatusApproval { get; set; }
            public string StatusConvertPR { get; set; }
            public Decimal TotalBudget { get; set; }
            public Decimal TransferBudget { get; set; }
            public string UserDepartment { get; set; }
        }

        public class DetailAsset
        {
            public Decimal Amount { get; set; }
            public Decimal AmountInIDR { get; set; }
            public string AssetName { get; set; }
            public string AssetParent { get; set; }
            public string AssetParentDesc { get; set; }
            public string Currency {  get; set; }
            public string DocumentNo { get; set; }
            public string LedgerAccount { get; set; }
            public string LedgerAccountDesc { get; set; }
            public int LifeYear { get; set; }
            public int LineNumFUI { get; set; }
            public int? Quantity { get; set; }
            public string ReplacedAsset { get; set; }
            public string ReplacedAssetDesc { get; set; }
            public string SpecType { get; set; }
            public string StatusConvert {  get; set; }
            public string Unit { get; set; }
        }

        public class FileAttachment
        {
            public string AttachmentCode { get; set; }
            public string AttachmentName { get; set; }
            public int AttachmentSize { get; set; }
            public string AttachmentType { get; set; }
            public string Blob { get; set; }
        }

        public class DetailApiResponse
        {
            public List<DocumentFUI> DocumentFUI { get; set; }
            public List<DetailAsset> DetailAsset { get; set; }
            public List<FileAttachment> FileAttachment { get; set; }
            public ErrorMessage ErrorMessage { get; set; }
        }
    }
}