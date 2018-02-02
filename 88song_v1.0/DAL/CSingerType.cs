using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class CSingerType
    {
        CDataBase db = new CDataBase();
        string sql;
        static string connection = ConfigurationManager.ConnectionStrings["DB_MusicConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connection);

        /// <summary>
        /// 添加歌手类型名
        /// </summary>
        /// <param name="model"></param>
        /// <returns>返回受影响的行数</returns>
        public int AddSingerType(Model.CSingerType model)
        {
            sql = "insert into SingerType(SingerTypeName) values('" + model.SingerTypeName + "')";
            return db.Exec(sql);
        }

        /// <summary>
        /// 查找歌手类型名是否存在
        /// </summary>
        /// <param name="model"></param>
        /// <returns>返回查询出来的记录行数</returns>
        public int SelectSingerType(Model.CSingerType model)
        {
            sql = "select * from SingerType where SingerTypeName='" + model.SingerTypeName + "'";
            DataSet ds= db.select(sql);
            return ds.Tables[0].Rows.Count;
        }

        /// <summary>
        /// 删除歌手类型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int DeleteSingerType(Model.CSingerType model)
        {
            sql = "delete from SingerType where SingerTypeID='" + model.SingerTypeID + "'";
            return db.Exec(sql);
        }

        /// <summary>
        /// 查询歌手类型
        /// </summary>
        /// <returns></returns>
        public DataSet Select()
        {
            sql = "select * from SingerType";
            return db.select(sql);
        }

        /// <summary>
        /// 获取所有的歌手类型及歌手id
        /// </summary>
        /// <returns></returns>
        public DataSet SingerTypeName()
        {
            return db.SelectPROC("pro_SingerTypeName");
        }

        /// <summary>
        /// 通过歌手类型id获取所有该类型的歌手信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SingerTypeList(Model.CSingerType model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "pro_SingerType";

            SqlParameter pro_Parameter = cmd.Parameters.Add(new SqlParameter("@SingerTypeID", SqlDbType.Int));
            pro_Parameter.Direction = ParameterDirection.Input;
            pro_Parameter.Value =Convert.ToInt32(model.SingerTypeID);

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
    }
}
