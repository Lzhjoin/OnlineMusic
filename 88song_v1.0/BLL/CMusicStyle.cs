using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;
using Model;

namespace BLL
{
    public class CMusicStyle
    {
        DAL.CMusicStyle musicStyle = new DAL.CMusicStyle();
        public DataSet Select()
        {
           return musicStyle.Select();
        }

        /// <summary>
        /// 添加曲风
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool AddMusicStyle(Model.CMusicStyle model)
        {
            DataSet ds = musicStyle.ExistMusicStyle(model);
            //将要添加的曲风是否不存在
            if(ds.Tables[0].Rows.Count==0)
            {
                //添加曲风
                musicStyle.AddMusicStyle(model);
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 修改属于该曲风的歌曲曲风为其它,并删除曲风
        /// </summary>
        /// <param name="model"></param>
        /// <returns>返回受影响的歌曲数</returns>
        public int AlterMusicStyleID(Model.CMusicStyle model)
        {
            CMusic music = new CMusic();

            //修改歌曲中曲风为其它
            int i=music.AlterMusicStyelID(model.MusicStyleID);
            //删除曲风
            musicStyle.DeleteMusicStyle(model);

            return i;
        }

        /// <summary>
        /// 获取曲风名及id
        /// </summary>
        /// <returns></returns>
        public DataSet MusicStyle()
        {
            return musicStyle.MusicStyle();
        }

        /// <summary>
        /// 通过曲风id获取该曲风的歌曲列表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet MusicStyleList(Model.CMusicStyle model)
        {
            return musicStyle.MusicStyleList(model);
        }
    }
}
