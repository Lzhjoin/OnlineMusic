using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
using System.Data;

namespace BLL
{
    public class CMusic
    {
        DAL.CMusic music = new DAL.CMusic();

        /// <summary>
        /// 添加歌曲
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool AddMusic(Model.CMusic model)
        {
          return  music.AddMusic(model);
        }

        /// <summary>
        /// 绑定歌曲信息 
        /// </summary>
        /// <returns></returns>
        public DataSet MusicInfo()
        {
           return music.MusicInfo();
        }

        /// <summary>
        /// 更新歌曲信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool UpdateMusicInfo(Model.CMusic model)
        {
            return music.UpdateMusicInfo(model);
        }

        /// <summary>
        /// 根据歌曲ID删除歌曲
        /// </summary>
        /// <param name="MusicID"></param>
        public void DeleteMusic_ID(string MusicID)
        {
            Model.CMusic model = new Model.CMusic();
            model.MusicID = MusicID;
            music.DeleteMusic_ID(model);
        }

        /// <summary>
        /// 查找歌曲
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SearchMusic(string MusicName)
        {
            Model.CMusic model = new Model.CMusic();
            model.MusicName = MusicName;
            return music.SearchMusic(model);
        }

        /// <summary>
        /// 通过歌手ID删除数据库中记录
        /// </summary>
        /// <param name="SingerID"></param>
        public void DeleteMusic(int SingerID)
        {
            Model.CMusic model = new Model.CMusic();
            model.SingerID = SingerID;
            music.DeleteMusic(model);
        }

        /// <summary>
        /// 通过歌手ID查询歌曲及歌词文件路径
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SelectPath(int SingerID)
        {
            Model.CMusic model = new Model.CMusic();
            model.SingerID = SingerID;
            return music.SelectPath(model);
        }

        /// <summary>
        /// 通过专辑ID查询歌曲及歌词文件
        /// </summary>
        /// <param name="AlbumID"></param>
        /// <returns></returns>
        public DataSet SelectMusicPath(int AlbumID)
        {
            Model.CMusic model = new Model.CMusic();
            model.AlbumID = AlbumID;
            return music.SelectMusicPath(model);
        }

        /// <summary>
        /// 删除专辑中包含的所有歌曲
        /// </summary>
        /// <param name="AlbumID"></param>
        public void DeleteAlbumMusic(int AlbumID)
        {
            Model.CMusic model = new Model.CMusic();
            model.AlbumID = AlbumID;
            music.DeleteAlbumMusic(model);
        }

        /// <summary>
        /// 将要删除的曲风修改为其它曲风
        /// </summary>
        /// <param name="MusicStyleID"></param>
        /// <returns></returns>
        public int AlterMusicStyelID(int MusicStyleID)
        {
            Model.CMusic model = new Model.CMusic();
            model.MusicStyleID = MusicStyleID;
            return music.AlterMusicStyle(model);
        }
        
        /// <summary>
        /// 显示点击率排前十位的歌曲
        /// </summary>
        /// <returns></returns>
        public DataSet HotMusicTop()
        {
            return music.HotMusicTop();
        }

        /// <summary>
        /// 显示最新发布的十首歌曲
        /// </summary>
        /// <returns></returns>
        public DataSet NewMusicTop()
        {
            return music.NewMusicTop();
        }

        /// <summary>
        /// 通过歌手语言显示歌曲
        /// </summary>
        /// <param name="Language"></param>
        /// <returns></returns>
        public DataSet LanguageMusic(string Language)
        {
            return music.LanguageMusic(Language);
        }

        /// <summary>
        /// 通过歌手id显示该歌手排名前十的歌曲
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SingerHotMusicTop(Model.CMusic model)
        {
            return music.SingerHotMusicTop(model);
        }

        /// <summary>
        /// 通过歌曲id获取歌曲信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet Music_Player(Model.CMusic model)
        {
            return music.Music_Player(model);
        }

        /// <summary>
        /// 返回表中下一id的值
        /// </summary>
        /// <returns></returns>
        public string Select_AutoID()
        {
            return music.Select_AutoID();
        }

        /// <summary>
        /// 获取所有歌曲按点击率降序排列
        /// </summary>
        /// <returns></returns>
        public DataSet HotMusic()
        {
            return music.HotMusic();
        }

        /// <summary>
        /// 获取所有歌曲按发布日期降序排列
        /// </summary>
        /// <returns></returns>
        public DataSet NewMusic()
        {
            return music.NewMusic();
        }
    }
}
