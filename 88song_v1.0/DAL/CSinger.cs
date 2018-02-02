using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Model;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
   public class CSinger
    {
       CDataBase db = new CDataBase();
       static string connection = ConfigurationManager.ConnectionStrings["DB_MusicConnectionString"].ToString();
       SqlConnection con = new SqlConnection(connection);

       /// <summary>
       /// 查询歌手ID,歌手姓名
       /// </summary>
       /// <returns></returns>
       public DataSet Select()
       {
           string sql = "select SingerID,SingerName from Singer";
           return db.select(sql);
       }

       /// <summary>
       /// 增加歌手
       /// </summary>
       /// <param name="model"></param>
       /// <returns></returns>
       public bool AddSinger(Model.CSinger model)
       {
           string sql = "insert into Singer(SingerName,Sex,PhotoPath,SingerTypeID) values('" + model.SingerName + "','" + model.Sex + "','" + model.PhotoPath + "','" + model.SingerTypeID + "')";

            db.Exec(sql);

          
             return true;
         
       }

       /// <summary>
       /// 查询要添加的歌手是否存在
       /// </summary>
       /// <param name="model"></param>
       /// <returns></returns>
       public bool SelectSinger(Model.CSinger model)
       {
           string sql = "select SingerName from Singer where SingerName='" + model.SingerName + "'";

           if (db.select(sql).Tables[0].Rows.Count == 0)
           {
               return true;
           }
           else
           {
               return false;
           }
       }

       /// <summary>
       /// 显示歌手信息
       /// </summary>
       /// <returns></returns>
       public DataSet SelectSingerInfo()
       {
           string sql = "select SingerID,SingerName,SingerOnclickNum,Sex,SingerTypeName,PhotoPath from Singer,SingerType where Singer.SingerTypeID=SingerType.SingerTypeID";

          return  db.select(sql);
       }

       /// <summary>
       /// 显示歌手详细信息
       /// </summary>
       /// <param name="model"></param>
       /// <returns></returns>
       public DataSet SelectSingerInfo(Model.CSinger model)
       {
           string sql = "select Singer.SingerTypeID,SingerID,SingerName,SingerOnclickNum,Sex,SingerTypeName,PhotoPath from Singer,SingerType where Singer.SingerTypeID=SingerType.SingerTypeID and SingerID='"+model.SingerID+"'";

           return db.select(sql);
       }

       /// <summary>
       /// 更新歌手信息
       /// </summary>
       /// <param name="model"></param>
       public void UpdateSingerInfo(Model.CSinger model)
       {
           string sql = "update Singer set SingerName='" + model.SingerName + "',SingerOnclickNum='" + model.SingerOnclickNum + "',Sex='" + model.Sex + "',SingerTypeID='" + model.SingerTypeID + "',PhotoPath='" + model.PhotoPath + "' where SingerID='" + model.SingerID + "'";

           db.Exec(sql);
       }

       /// <summary>
       /// 删除歌手信息
       /// </summary>
       /// <param name="model"></param>
       public void DeleteSinger(Model.CSinger model)
       {
           string sql = "delete from Singer where SingerID='" + model.SingerID + "'";

           db.Exec(sql);
       }

       /// <summary>
       /// 通过歌手姓名查找歌手
       /// </summary>
       /// <param name="model"></param>
       /// <returns></returns>
       public DataSet SearchSinger(Model.CSinger model)
       {
           string sql = "select SingerID,SingerName,SingerOnclickNum,Sex,SingerTypeName,PhotoPath from Singer,SingerType where Singer.SingerTypeID=SingerType.SingerTypeID and SingerName like '%" + model.SingerName + "%'";

           return db.select(sql);
       }

       /// <summary>
       /// 获取即将插入下一条记录的id值
       /// </summary>
       /// <returns></returns>
       public string Select_AutoID()
       {
           return db.Select_AutoID("Singer");
       }


       /// <summary>
       /// 获取歌手的详细资料
       /// </summary>
       /// <param name="model"></param>
       /// <returns></returns>
       public DataSet Detail_Singer(Model.CSinger model)
       {
           SqlCommand cmd = new SqlCommand();
           cmd.Connection = con;
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.CommandText = "pro_DetailSinger";

           SqlParameter pro_Parameter = cmd.Parameters.Add(new SqlParameter("@SingerID", SqlDbType.Int));
           pro_Parameter.Direction = ParameterDirection.Input;
           pro_Parameter.Value = model.SingerID;

           SqlDataAdapter da = new SqlDataAdapter(cmd);
           DataSet ds = new DataSet();
           da.Fill(ds);
           return ds;

       }
    }
}
