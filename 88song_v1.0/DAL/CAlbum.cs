using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
//www.51aspx.com
namespace DAL
{
    public class CAlbum
    {
        //从网站配置文件中获取数据库连接字符串
        static string connection = ConfigurationManager.ConnectionStrings["DB_MusicConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(connection);

        CDataBase db = new CDataBase();
        public DataSet Select(Model.CAlbum model)
        {
            string sql = "select AlbumID,AlbumName from Album where SingerID='"+model.SingerID+"'";
            return db.select(sql);
        }

        /// <summary>
        /// 通过歌手ID删除专辑
        /// </summary>
        /// <param name="model"></param>
        public void DeleteAlbum(Model.CAlbum model)
        {
            string sql = "delete from Album where SingerID='" + model.SingerID + "'";

            db.Exec(sql);
        }
        
        
        
       /// <summary>
        /// 通过歌手ID查询专辑图片地址
       /// </summary>
       /// <param name="model"></param>
       /// <returns></returns>
        public DataSet SelectPath(Model.CAlbum model)
        {
            string sql = "select AlbumPhotoPath from Album where SingerID='" + model.SingerID + "'";

            return db.select(sql);
        }

        /// <summary>
        /// 添加专辑
        /// </summary>
        /// <param name="model"></param>
        public void AddAlbum(Model.CAlbum model)
        {
            string sql="insert into Album(AlbumName,SingerID,AlbumPhotoPath,PublishDate) values('"+model.AlbumName+"','"+model.SingerID+"','"+model.AlbumPhotoPath+"','"+model.PublishDate+"')";

            db.Exec(sql);
        }

        /// <summary>
        /// 查询该专辑是否存在
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet ExistAlbum(Model.CAlbum model)
        {
            string sql = "select * from Album where AlbumName='" + model.AlbumName + "'";

           return db.select(sql);
        }

        /// <summary>
        /// 显示专辑信息
        /// </summary>
        /// <returns></returns>
        public DataSet SelectAlbum()
        {
            string sql = "select AlbumID,AlbumName,AlbumPhotoPath,SingerName,PublishDate from Album,Singer where Singer.SingerID=Album.SingerID";

            return db.select(sql);
        }

        /// <summary>
        /// 显示指定专辑信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SelectAlbum(Model.CAlbum model)
        {
            string sql = "select AlbumID,AlbumName,AlbumPhotoPath,SingerName,Album.SingerID,PublishDate from Album,Singer where Singer.SingerID=Album.SingerID and AlbumID='"+model.AlbumID+"'";

            return db.select(sql);
        }

        /// <summary>
        /// 删除指定专辑
        /// </summary>
        /// <param name="model"></param>
        public void DeleteAlbumInfo(Model.CAlbum model)
        {
            string sql = "delete from Album where AlbumID='" + model.AlbumID + "'";

            db.Exec(sql);
        }

        /// <summary>
        /// 更新专辑信息
        /// </summary>
        /// <param name="model"></param>
        public void UpdateAlbum(Model.CAlbum model)
        {
            string sql = "Update Album set AlbumName='" + model.AlbumName + "',SingerID='" + model.SingerID + "',AlbumPhotoPath='" + model.AlbumPhotoPath + "',PublishDate='"+model.PublishDate+"' where AlbumID='" + model.AlbumID + "'";

            db.Exec(sql);
        }

        /// <summary>
        /// 通过专辑名称查找专辑
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SearchAlbum(Model.CAlbum model)
        {
            string sql = "select AlbumID,AlbumName,AlbumPhotoPath,SingerName,PublishDate from Album,Singer where Singer.SingerID=Album.SingerID and AlbumName like '%" + model.AlbumName + "%'";

            return db.select(sql);
        }

        /// <summary>
        /// 显示点击率最多的前十二个专辑
        /// </summary>
        /// <returns></returns>
        public DataSet HotAlbumTop()
        {
            string PROC_Name="pro_hotAlbumTop";
            DataSet ds = db.SelectPROC(PROC_Name);
            return ds;

        }

        /// <summary>
        /// 显示最新发布的四张专辑
        /// </summary>
        /// <returns></returns>
        public DataSet NewAlbumTop()
        {
            string PROC_Name = "pro_newAlbumTop";
            DataSet ds = db.SelectPROC(PROC_Name);
            return ds;
        }

        /// <summary>
        /// 获取专辑信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet DetailAlbum(Model.CAlbum model)
        {
            SqlCommand cmd=new SqlCommand();
            cmd.Connection=conn;
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.CommandText="pro_DetailAlbum";

            SqlParameter pro_Parameter=cmd.Parameters.Add(new SqlParameter("@AlbumID",SqlDbType.Int));
            pro_Parameter.Direction=ParameterDirection.Input;
            pro_Parameter.Value=model.AlbumID;
            SqlDataAdapter da=new SqlDataAdapter(cmd);
            DataSet ds=new DataSet();
            da.Fill(ds);
            return ds;
        }

        /// <summary>
        /// 获取下一条即将插入的数据id
        /// </summary>
        /// <returns></returns>
        public string Select_AutoID()
        {
            return db.Select_AutoID("Album");
        }

        /// <summary>
        /// 将所有歌手的专辑按点击量降序排列
        /// </summary>
        /// <returns></returns>
        public DataSet Hot_Album()
        {
            return db.SelectPROC("pro_HotAlbum");
        }

        /// <summary>
        /// 将所有歌手的专辑按歌曲发布日期降序排列
        /// </summary>
        /// <returns></returns>
        public DataSet New_Album()
        {
            return db.SelectPROC("pro_NewAlbum");
        }
    }
}
