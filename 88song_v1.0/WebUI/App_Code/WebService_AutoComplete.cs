using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
///WebService_AutoComplete 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。 
 [System.Web.Script.Services.ScriptService]
public class WebService_AutoComplete : System.Web.Services.WebService {

    public WebService_AutoComplete () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetMusicName(string prefixText,int count) 
    {
        List<string> MusicName=new List<string>();

        try
        {
            using (SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DB_MusicConnectionString"].ConnectionString))
            {
                SqlCommand cmd = cn.CreateCommand();

                cmd.CommandText = "select MusicName from Music where MusicName like '" + prefixText + "%'";

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        MusicName.Add(dr.GetString(0));
                    }
                }
            }
        }
        catch (Exception)
        {
            
            throw;
        }
        return MusicName.ToArray();
    }

    [WebMethod]
    public string[] GetSingerName(string prefixText, int count)
    {
        List<string> SingerName = new List<string>();
        try
        {
            using (SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DB_MusicConnectionString"].ConnectionString))
            {
                SqlCommand cmd = cn.CreateCommand();

                cmd.CommandText = "select SingerName from Singer where SingerName like '" + prefixText + "%'";
                cn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        SingerName.Add(dr.GetString(0));
                    }
                }
            }
        }
        catch (Exception)
        {
            
            throw;
        }

        return SingerName.ToArray();
    }

    [WebMethod]
    public string[] GetAlbumName(string prefixText, int count)
    {
        List<string> AlbumName = new List<string>();

        try
        {
            using (SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DB_MusicConnectionString"].ConnectionString))
            {
                SqlCommand cmd = cn.CreateCommand();

                cmd.CommandText = "select AlbumName from Album where AlbumName like '" + prefixText + "%'";
                cn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        AlbumName.Add(dr.GetString(0));
                    }
                }
            }
        }
        catch (Exception)
        {
            
            throw;
        }

        return AlbumName.ToArray();
    }
    
}
