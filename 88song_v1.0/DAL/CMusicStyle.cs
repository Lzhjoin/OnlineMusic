using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class CMusicStyle
    {
        static string connection = ConfigurationManager.ConnectionStrings["DB_MusicConnectionString"].ToString();
        SqlConnection con = new SqlConnection(connection);
        CDataBase db = new CDataBase();

        /// <summary>
        /// 获取曲风名及id
        /// </summary>
        /// <returns></returns>
        public DataSet Select()
        {
            string sql = "select MusicStyleID,MusicStyleName from MusicStyle";
            return db.select(sql);
        }

        /// <summary>
        /// 添加曲风
        /// </summary>
        /// <param name="model"></param>
        public void AddMusicStyle(Model.CMusicStyle model)
        {
            string sql = "insert into MusicStyle(MusicStyleName) values('" + model.MusicStyleName + "')";

            db.Exec(sql);
        }

        /// <summary>
        /// 查询将要添加的曲风名是否存在
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet ExistMusicStyle(Model.CMusicStyle model)
        {
            string sql = "select * from MusicStyle where MusicStyleName='" + model.MusicStyleName + "'";

            return db.select(sql);
        }

        /// <summary>
        /// 删除曲风
        /// </summary>
        /// <param name="model"></param>
        public void DeleteMusicStyle(Model.CMusicStyle model)
        {
            string sql = "delete from MusicStyle where MusicStyleID='" + model.MusicStyleID + "'";

            db.Exec(sql);
        }

        /// <summary>
        /// 获取曲风名及id
        /// </summary>
        /// <returns></returns>
        public DataSet MusicStyle()
        {
            return db.SelectPROC("pro_MusicStyle");
        }

        /// <summary>
        /// 通过曲风id获取该曲风的歌曲列表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet MusicStyleList(Model.CMusicStyle model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "pro_MusicStyleList";

            SqlParameter pro_Parameter = cmd.Parameters.Add(new SqlParameter("@MusicStyleID", SqlDbType.Int));
            pro_Parameter.Direction = ParameterDirection.Input;
            pro_Parameter.Value = model.MusicStyleID;

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds;
        }
    }
}
