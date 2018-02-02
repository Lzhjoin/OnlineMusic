using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;
using Model;

namespace BLL
{
    public class CSinger
    {
        DAL.CSinger singer = new DAL.CSinger();
        public DataSet Select()
        {
            return singer.Select();
        }

        /// <summary>
        /// 添加歌手
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool AddSinger(Model.CSinger model)
        {
            if (singer.SelectSinger(model))
            {
                return singer.AddSinger(model);
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
            return singer.SelectSingerInfo();
        }

        public DataSet SelectSingerInfo(int SingerID)
        {
            Model.CSinger model = new Model.CSinger();
            model.SingerID = SingerID;
            return singer.SelectSingerInfo(model);
        }

        public void UpdateSingerInfo(Model.CSinger model)
        {
            singer.UpdateSingerInfo(model);
        }

        public void DeleteSinger(Model.CSinger model)
        {
            CMusic music = new CMusic();
            CAlbum album = new CAlbum();

            music.DeleteMusic(model.SingerID);
            //删除该歌手的所有专辑
            album.DeleteAlbum(model.SingerID);

            //删除该歌手
            singer.DeleteSinger(model);
        }

        /// <summary>
        /// 通过歌手ID查询该歌手的歌曲及歌词文件路径
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SelectMusic(Model.CSinger model)
        {
            CMusic music = new CMusic();
            return music.SelectPath(model.SingerID);
        }

        /// <summary>
        /// 通过歌手ID查询该歌手的专辑图片路径
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SelectAlbum(Model.CSinger model)
        {
            CAlbum album = new CAlbum();
            return album.SelectPath(model.SingerID);
        }

        /// <summary>
        /// 通过歌手姓名查找歌手
        /// </summary>
        /// <param name="SingerName"></param>
        /// <returns></returns>
        public DataSet SearchSinger(string SingerName)
        {
            Model.CSinger model=new Model.CSinger();
            model.SingerName=SingerName;

            return singer.SearchSinger(model);
        }

        /// <summary>
        /// 获取下一条歌手记录的id值
        /// </summary>
        /// <returns></returns>
        public string Select_AutoID()
        {
            return singer.Select_AutoID();
        }

        /// <summary>
        /// 获取歌手的详细信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet Detail_Singer(Model.CSinger model)
        {
            return singer.Detail_Singer(model);
        }
        
    }
}
