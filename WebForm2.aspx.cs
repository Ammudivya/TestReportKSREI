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
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            //TextBox1.Text = "yyyy-MM-dd";
            if (!Page.IsPostBack)
            {

                SqlConnection con = new SqlConnection(@"Server=172.16.5.110\SQLEXPRESS;Database=KSREITestPortal;User Id=virtusa; password=virtusa");

                con.Open();
                SqlCommand cmd = new SqlCommand("select college_name from CollegeDetails UNION select company_name from internCompany", con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "college_name";
                DropDownList1.DataBind();
                con.Close();
            }
                

            
        }

        
        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

            DropDownList2.Items.Add("Select department");
            SqlConnection con = new SqlConnection(@"Server=172.16.5.110\SQLEXPRESS;Database=KSREITestPortal;User Id=virtusa; password=virtusa");
            con.Open();
            string s1 = DropDownList1.SelectedItem.Value;
            SqlCommand cmd1 = new SqlCommand("select count(company_id) from internCompany where company_name=@0", con);
            cmd1.Parameters.AddWithValue("@0", s1);
            int cmp = Convert.ToInt32(cmd1.ExecuteScalar());
            
            if (cmp >= 1)
            {
                cmd1 = new SqlCommand("Select company_domain from InternCompany where company_name=@0", con);
                cmd1.Parameters.AddWithValue("@0", s1);
                SqlDataAdapter ssda = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                ssda.Fill(dt);

                DropDownList2.DataSource = dt;
                DropDownList2.DataTextField = "company_domain";
                DropDownList2.DataBind();

                cmd1.Dispose();                
            }

            else
            {
                cmd1 = new SqlCommand("select college_id from CollegeDetails where college_name=@0", con);
                cmd1.Parameters.AddWithValue("@0", s1);
                int clg = Convert.ToInt32(cmd1.ExecuteScalar());
                cmd1 = new SqlCommand("Select department_name from DepartmentDetails where college_id=" + clg, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                DataTable dtt = new DataTable();
                sda.Fill(dtt);
                DropDownList2.DataSource = dtt;
                DropDownList2.DataTextField = "department_name";
                DropDownList2.DataBind();

                cmd1.Dispose();
            }

            con.Close();
                

        }

        
        

        protected void Button1_Click1(object sender, EventArgs e)
        {
            TableRow trow = new TableRow();
            TableCell tc = new TableCell();
            tc.Text = "Test name";
            trow.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Test Type";
            trow.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Test Category";
            trow.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Date of Test";
            trow.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Incharge";
            trow.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Organisation";
            trow.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Department";
            trow.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Year";
            trow.Cells.Add(tc);
            tc = new TableCell();
            tc.Text = "Pass(%)";
            trow.Cells.Add(tc);
            Table1.Rows.Add(trow);
            string clg = DropDownList1.SelectedItem.Value;
           
            string dep = DropDownList2.SelectedItem.Value;
            
            string year = DropDownList3.SelectedItem.Value;
         
            SqlConnection conn = new SqlConnection(@"Server=172.16.5.110\SQLEXPRESS;Database=KSREITestPortal;User Id=virtusa; password=virtusa");
            conn.Open();
            SqlCommand cmdd = new SqlCommand("select test_name,test_type,test_category,test_start_duration,conducted_by,conducted_to_college,conducted_to_department,conducted_to_year,test_score  from TestDetails where (conducted_to_college=@0 and conducted_to_department=@1 and conducted_to_year=@2 )", conn);
            cmdd.Parameters.AddWithValue("@0", clg);
            cmdd.Parameters.AddWithValue("@1", dep);
            cmdd.Parameters.AddWithValue("@2", year);
            SqlDataReader sr = cmdd.ExecuteReader();
            while (sr.Read())
            {
                TableRow trow2 = new TableRow();
                TableCell tc2 = new TableCell();
                tc2.Text = sr.GetString(0);
                trow2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text = sr.GetString(1);
                trow2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text = sr.GetString(2);
                trow2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text = sr.GetString(3);
                trow2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text = sr.GetString(4);
                trow2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text = sr.GetString(5);
                trow2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text = sr.GetString(6);
                trow2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text =sr.GetString(7);
                trow2.Cells.Add(tc2);
                tc2 = new TableCell();
                tc2.Text = Convert.ToString(sr.GetDecimal(8));
                trow2.Cells.Add(tc2);

                Table1.Rows.Add(trow2);

                //string date = DropDownList1.SelectedItem.Value;


            }

            conn.Close();

        }
    }

}
