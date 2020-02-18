using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Server=172.16.5.110\SQLEXPRESS;Database=KSREITestPortal;User Id=virtusa; password=virtusa");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //DisplayRecord();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
        }
        //public DataTable DisplayRecord()

        //SqlDataAdapter Adp = new SqlDataAdapter("select test_name,conducted_to_college,conducted_to_department,conducted_to_year,conducted_by,test_score from TestDetails", con);
        //DataTable Dt = new DataTable();
        //Adp.Fill(Dt);
        //GridView1.DataSource = Dt;
        ////GridView1.DataBind();
        //return Dt;




    }
}