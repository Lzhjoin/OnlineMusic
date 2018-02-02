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
    public class CMusic
    {
        //从网站配置文件中获取数据库连接字符串
        static string connection = ConfigurationManager.ConnectionStrings["DB_MusicConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(connection);

        DAL.CDataBase db = new DAL.CDataBase();

        /// <summary>
        /// 向数据库中插入歌曲记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool AddMusic(Model.CMusic model)
        {
            if (ExistMusic(model))
            {
                string sql = "insert into Music(MusicName,SingerID,MusicPath,LyricPath,AlbumID,MusicStyleID,PublishDate) values('"
                    + model.MusicName + "','" + model.SingerID + "','" + model.MusicPath + "','" + model.LyricPath + "','"
                    + model.AlbumID + "','" + model.MusicStyleID + "','" + model.PublishDate + "')";
                int i = db.Exec(sql);
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 查询要插入的歌曲是否存在
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool ExistMusic(Model.CMusic model)
        {
            string sql="select * from Music where MusicName='"+model.MusicName+"' and SingerID='"+model.SingerID+"'";
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
        /// 显示歌曲信息
        /// </summary>
        /// <returns></returns>
        public DataSet MusicInfo()
        {
            string sql = "select Music.*,SingerName,AlbumName,MusicStyleName from Music,Singer,MusicStyle,Album where Singer.SingerID=Music.SingerID and Album.AlbumID=Music.AlbumID and MusicStyle.MusicStyleID=Music.MusicStyleID";

            return db.select(sql);
        }

        /// <summary>
        /// 更新歌曲信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool UpdateMusicInfo(Model.CMusic model)
        {
            string sql = "Update Music set MusicName='" + model.MusicName + "',SingerID='" + model.SingerID + "',MusicPath='" + model.MusicPath + "',LyricPath='" + model.LyricPath + "',AlbumID='" + model.AlbumID + "',MusicStyleID='" + model.MusicStyleID + "',PublishDate='" + model.PublishDate + "' where MusicID='" + model.MusicID + "'";

            if (db.Exec(sql) == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 查找歌曲
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SearchMusic(Model.CMusic model)
        {
            string sql = "select Music.*,SingerName,AlbumName,MusicStyleName from Music,Singer,MusicStyle,Album where Singer.SingerID=Music.SingerID and Album.AlbumID=Music.AlbumID and MusicStyle.MusicStyleID=Music.MusicStyleID and MusicName like '%"+model.MusicName+"%'";

            return db.select(sql);
        }

        /// <summary>
        /// 根据歌曲ID删除歌曲
        /// </summary>
        /// <param name="model"></param>
        public void DeleteMusic_ID(Model.CMusic model)
        {
            string sql = "delete from Music where MusicID='" + model.MusicID + "'";

            db.Exec(sql);
        }

        /// <summary>
        /// 根据歌手ID删除该歌手演唱的歌曲
        /// </summary>
        /// <param name="model"></param>
        public void DeleteMusic(Model.CMusic model)
        {
            string sql = "delete from Music where SingerID='" + model.SingerID + "'";

            db.Exec(sql);
        }

        /// <summary>
        /// 根据歌手ID查询歌手的歌曲及歌词文件路径
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SelectPath(Model.CMusic model)
        {
            string sql = "select MusicPath,LyricPath from Music where SingerID='" + model.SingerID + "'";

            return  db.select(sql);
        }

        /// <summary>
        /// 通过专辑ID查询专辑里面的歌曲及歌词文件路径
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SelectMusicPath(Model.CMusic model)
        {
            string sql = "select MusicPath,LyricPath from Music where AlbumID='" + model.AlbumID + "'";

            return db.select(sql);
        }

        /// <summary>
        /// 删除该专辑中的所有歌曲
        /// </summary>
        /// <param name="model"></param>
        public void DeleteAlbumMusic(Model.CMusic model)
        {
            string sql = "Delete from Music where AlbumID='" + model.AlbumID + "'";

            db.Exec(sql);
        }

        /// <summary>
        /// 更改将要删除的曲风为其它
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int AlterMusicStyle(Model.CMusic model)
        {
            string sql = "update Music set MusicStyleID=1 where MusicStyleID='"+model.MusicStyleID+"'";

            return db.Exec(sql);
        }

        /// <summary>
        /// 显示点击率排名前十位的歌曲
        /// </summary>
        /// <returns></returns>
        public DataSet HotMusicTop()
        {
            string PROC_Name = "pro_hotMusicTop";
            return db.SelectPROC(PROC_Name);
        }

        /// <summary>
        /// 显示最新发布的十首歌曲
        /// </summary>
        /// <returns></returns>
        public DataSet NewMusicTop()
        {
            string PROC_Name = "pro_newMusicTop";
            return db.SelectPROC(PROC_Name);
        }

        /// <summary>
        /// 显示不同语种的歌曲
        /// </summary>
        /// <param name="Language"></param>
        /// <returns></returns>
        public DataSet LanguageMusic(string Language)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "pro_LanguageMusic";
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter proc_Parameter = cmd.Parameters.Add(new SqlParameter("@Language", SqlDbType.NVarChar,10));
            //指明proc_Parameter参数类型为输入参数
            proc_Parameter.Direction = ParameterDirection.Input;
            //为输入参数赋值
            proc_Parameter.Value = Language;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        /// <summary>
        /// 通过歌手id显示该歌手点击率前十的歌曲
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SingerHotMusicTop(Model.CMusic model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "pro_SingerHotMusicTop";
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter pro_Parameter=cmd.Parameters.Add(new SqlParameter("@SingerID",SqlDbType.Int));
            pro_Parameter.Direction=ParameterDirection.Input;
            pro_Parameter.Value=model.SingerID;
            SqlDataAdapter da=new SqlDataAdapter(cmd);
            DataSet ds=new DataSet();
            da.Fill(ds);
            return ds;

        }

        /// <summary>
        /// 通过传入的id字符串获取歌曲信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet Music_Player(Model.CMusic model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "pro_PlayMusicList";
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter pro_Parameter = cmd.Parameters.Add(new SqlParameter("@List_MusicID", SqlDbType.NVarChar));
            pro_Parameter.Direction = ParameterDirection.Input;
            pro_Parameter.Value = model.List_MusicID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;

        }

        /// <summary>
        /// 返回表中自增的下一个id号
        /// </summary>
        /// <returns></returns>
        public string Select_AutoID()
        {
            return db.Select_AutoID("Music");
        }

        /// <summary>
        /// 根据点击率降序排列所有歌曲
        /// </summary>
        /// <returns></returns>
        public DataSet HotMusic()
        {
            return db.SelectPROC("pro_HotMusic");
        }

        /// <summary>
        /// 根据发布日期降序排列所有歌曲
        /// </summary>
        /// <returns></returns>
        public DataSet NewMusic()
        {
            return db.SelectPROC("pro_NewMusic");
        }
    }
}
