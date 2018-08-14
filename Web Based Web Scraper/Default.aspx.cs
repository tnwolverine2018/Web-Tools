using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HtmlAgilityPack;
using System.Drawing;
using System.Data;
using System.Threading;
using System.Windows.Forms;
using System.IO;

namespace Web_Based_Web_Scraper
{
    public partial class Default : System.Web.UI.Page
    {

        public static DataTable mytable;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


              




            }
            else
            {


                if (txtUrl.Text != null && txtUrl.Text != "")
                {
                    getImages(txtUrl.Text);

                    MySession.Current.setURL(txtUrl.Text);
                    txtCurrentURL.Text = MySession.Current.CurrentURL;
                }


            }

        }


        protected void GetSelectedRecords(object sender, EventArgs e)
        {

            try
            {

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[4] { new DataColumn("Title"), new DataColumn("srcString"), new DataColumn("Width"), new DataColumn("Height")});
                foreach (GridViewRow row in GridViewImages.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        System.Web.UI.WebControls.CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as System.Web.UI.WebControls.CheckBox);
                        


                        if (chkRow.Checked)
                        {
                            string title = row.Cells[1].Text;
                            string source = row.Cells[2].Text;
                            dt.Rows.Add(title, source, "0", "0");
                        }
                    }
                }


                GridViewImages.DataSource = dt;
                GridViewImages.DataBind();
                litTotalResults.Text = dt.Rows.Count.ToString();

            }
            catch(Exception ex)
            {

                litTotalResults.Text = ex.Message;
            }
            


        }


        protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewImages.PageIndex = e.NewPageIndex;
            GridViewImages.DataBind();




        }

        private void getImages(string weblink)
        {

            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("Title", typeof(string));
                dt.Columns.Add("srcString", typeof(string));
                dt.Columns.Add("Width", typeof(string));
                dt.Columns.Add("Height", typeof(string));

                System.Net.WebClient wc = new System.Net.WebClient();
                wc.UseDefaultCredentials = true;


                List<string> imgList = new List<string>();
                HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                doc.Load(wc.OpenRead(weblink));  //or whatever HTML file you have 
                HtmlNodeCollection imgs = doc.DocumentNode.SelectNodes("//img[@src]");

                int i = 0;
                foreach (HtmlNode imgNode in imgs)
                {
                    try
                    {

                        DataRow newrow = dt.NewRow();


                        HtmlAttribute src = imgs[i].Attributes["src"];
                        HtmlAttribute height = imgs[i].Attributes["height"];
                        HtmlAttribute width = imgs[i].Attributes["width"];

                        if (height != null)
                        {
                            newrow["Height"] = height.Value.ToString();
                        }

                        if (width != null)
                        {
                            newrow["Width"] = width.Value.ToString();
                        }

                        newrow["Title"] = "Image " + i.ToString();
                        newrow["srcString"] = src.Value;


                        dt.Rows.Add(newrow);

                        imgList.Add(src.Value);


                    }
                    catch
                    {
                        continue;
                    }

                    i++;
                }



                litTotalResults.Text = imgList.Count.ToString() + " Total Image(s) Found";

                mytable = dt;

                GridViewImages.DataSource = dt;
                GridViewImages.DataBind();



            }
            catch (Exception ex)
            {


                litTotalResults.Text = ex.Message;

            }







        }

        private System.Drawing.Image GetImage(string url)
        {
            System.Net.WebRequest request = System.Net.WebRequest.Create(url);

            System.Net.WebResponse response = request.GetResponse();
            System.IO.Stream responseStream = response.GetResponseStream();

            Bitmap bmp = new Bitmap(responseStream);
            responseStream.Dispose();
            return bmp;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtUrl.Text = "";
            litTotalResults.Text = "0 Images";
            GridViewImages.DataBind();
        }

        protected void btnScrape_Click(object sender, EventArgs e)
        {
            getImages(txtUrl.Text);
        }

        protected void btnCapture_Click(object sender, EventArgs e)
        {

            try
            {
                string weblink = txtUrl.Text;



                //test comment




            }
            catch (Exception ex)
            {
                litTotalResults.Text = ex.Message;

            }



        }

    }
       
}