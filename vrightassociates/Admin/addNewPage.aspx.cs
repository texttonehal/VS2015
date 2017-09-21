using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vrightassociates.Admin
{
    public partial class addNewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            publishPages("publish");
        }

        protected void btnDraft_Click(object sender, EventArgs e)
        {
            publishPages("drafts");
        }

        private void publishPages(string btn)
        {
            string _title = Request.Form["txtTitle"];
            string _pageContent = Request.Form["txtPageArea"];
            string _seoTitle = Request.Form["txtSeoTitle"];
            string _seoDesc = Request.Form["txtAreaDesc"];
            string _tags = Request.Form["txtTags"];
            string _img = Request.Form["txtFile"];

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            SqlCommand cmd = new SqlCommand();

            try
            {
                if (FileUpload1.HasFile)
                {
                    con.Open();
                    FileUpload1.SaveAs(Server.MapPath("~/Image/") + FileUpload1.FileName);
                    string pic1 = FileUpload1.FileName;

                    FileUpload2.SaveAs(Server.MapPath("~/Image/") + FileUpload2.FileName);
                    string pic2 = FileUpload2.FileName;

                    FileUpload3.SaveAs(Server.MapPath("~/Image/") + FileUpload3.FileName);
                    string pic3 = FileUpload3.FileName;
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "triAdmPackgPublish";
                    cmd.Parameters.AddWithValue("@Select", btn);
                    cmd.Parameters.AddWithValue("@subCat", _subCat);
                    cmd.Parameters.AddWithValue("@title", _title);
                    cmd.Parameters.AddWithValue("@actualPrice", _actaulPrice);
                    cmd.Parameters.AddWithValue("@OfferPrice", _OfferPrice);
                    cmd.Parameters.AddWithValue("@PostContent", _PostContent);
                    cmd.Parameters.AddWithValue("@type1", _type1);
                    cmd.Parameters.AddWithValue("@Desc1", _Desc1);
                    cmd.Parameters.AddWithValue("@type2", _type2);
                    cmd.Parameters.AddWithValue("@Desc2", _Desc2);
                    cmd.Parameters.AddWithValue("@type3", _type3);
                    cmd.Parameters.AddWithValue("@Desc3", _Desc3);
                    cmd.Parameters.AddWithValue("@type4", _type4);
                    cmd.Parameters.AddWithValue("@desc4", _desc4);
                    cmd.Parameters.AddWithValue("@type5", _type5);
                    cmd.Parameters.AddWithValue("@desc5", _desc5);
                    cmd.Parameters.AddWithValue("@seoTitle", _seoTitle);
                    cmd.Parameters.AddWithValue("@seoDesc", _seoDesc);
                    cmd.Parameters.AddWithValue("@seoKey", _seoKey);
                    cmd.Parameters.AddWithValue("@tag", _tag);
                    cmd.Parameters.AddWithValue("@pic1", pic1);
                    cmd.Parameters.AddWithValue("@pic2", pic2);
                    cmd.Parameters.AddWithValue("@pic3", pic3);
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    Response.Write("<script>alert('" + dt.Rows[0][0].ToString() + "');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally { con.Close(); }

        }
    }
}