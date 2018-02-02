using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;
using Model;

namespace BLL
{
    public class CAlbum
    {
        DAL.CAlbum Album = new DAL.CAlbum();
        public DataSet Select(Model.CAlbum model)
        {
            return Album.Select(model);
        }

        /// <summary>
        /// 删除专辑
        /// </summary>
        /// <param name="SingerID"></param>
        public void DeleteAlbum(int SingerID)
        {
            Model.CAlbum model = new Model.CAlbum();

            model.SingerID = SingerID;

            Album.DeleteAlbum(model);
        }

        /// <summary>
        /// 查找专辑图片地址
        /// </summary>
        /// <param name="SingerID"></param>
        /// <returns></returns>
        public DataSet SelectPath(int SingerID)
        {
            Model.CAlbum model = new Model.CAlbum();

            model.SingerID = SingerID;

            return Album.SelectPath(model);
        }

        /// <summary>
        /// 添加专辑
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool AddAlbum(Model.CAlbum model)
        {
            DataSet ds=Album.ExistAlbum(model);
            if (ds.Tables[0].Rows.Count == 0)
            {
                Album.AddAlbum(model);

                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 显示所有专辑信息
        /// </summary>
        /// <returns></returns>
        public DataSet SelectAlbum()
        {
            return Album.SelectAlbum();
        }

        /// <summary>
        /// 显示指定专辑信息
        /// </summary>
        /// <param name="AlbumID"></param>
        /// <returns></returns>
        public DataSet SelectAlbum(string AlbumID)
        {
            Model.CAlbum model = new Model.CAlbum();

            model.AlbumID =Convert.ToInt32(AlbumID);

            return Album.SelectAlbum(model);
        }

        /// <summary>
        /// 更新专辑信息
        /// </summary>
        /// <param name="model"></param>
        public void UpdateAlbum(Model.CAlbum model)
        {
            Album.UpdateAlbum(model);
        }

        /// <summary>
        /// 获取歌手名称及ID
        /// </summary>
        /// <returns></returns>
        public DataSet SingerName()
        {
            CSinger singer = new CSinger();

            return singer.Select();
        }

        /// <summary>
        /// 通过专辑ID查询包含的歌曲文件路径
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet DeleteMusic(Model.CAlbum model)
        {
            CMusic music = new CMusic();

            return music.SelectMusicPath(model.AlbumID);
        }
        public void DeleteAlbum(Model.CAlbum model)
        {
            CMusic music = new CMusic();
            music.DeleteAlbumMusic(model.AlbumID);
            Album.DeleteAlbumInfo(model);
            
        }

        /// <summary>
        /// 通过专辑名查找专辑
        /// </summary>
        /// <param name="AlbumName"></param>
        /// <returns></returns>
        public DataSet SearchAlbum(string AlbumName)
        {
            Model.CAlbum model = new Model.CAlbum();
            model.AlbumName = AlbumName;
            return Album.SearchAlbum(model);
        }

        /// <summary>
        /// 显示点击率最高的十二张专辑
        /// </summary>
        /// <returns></returns>
        public DataSet HotAlbumTop()
        {
            return Album.HotAlbumTop();
        }

        /// <summary>
        /// 显示最新发布的四张专辑
        /// </summary>
        /// <returns></returns>
        public DataSet NewAlbumTop()
        {
            return Album.NewAlbumTop();
        }
        
        /// <summary>
        /// 获取专辑的详细信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet DetailAlbum(Model.CAlbum model)
        {
            return Album.DetailAlbum(model);
        }

        /// <summary>
        /// 获取下一条即将插入记录的id
        /// </summary>
        /// <returns></returns>
        public string Select_AutoID()
        {
            return Album.Select_AutoID();
        }

        /// <summary>
        /// 获取所有歌手的专辑 并以点击率降序排列
        /// </summary>
        /// <returns></returns>
        public DataSet Hot_Album()
        {
            return Album.Hot_Album();
        }

        /// <summary>
        ///  获取所有歌手的专辑 并以专辑发布日期降序排列
        /// </summary>
        /// <returns></returns>
        public DataSet New_Album()
        {
            return Album.New_Album();
        }
    }
}
