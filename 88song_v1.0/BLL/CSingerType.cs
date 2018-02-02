using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
using System.Data;

namespace BLL
{
     public class CSingerType
    {
        DAL.CSingerType singerType = new DAL.CSingerType();
         /// <summary>
         /// 添加歌手类型
         /// </summary>
         /// <param name="model"></param>
         /// <returns></returns>
        public bool AddSingerType(Model.CSingerType model)
        {

           if(singerType.SelectSingerType(model)==0)
           {
               if (singerType.AddSingerType(model)==1)
                   return true;
               else
                   return false;
           }
           else
           {
               return false;
           }
        }

         /// <summary>
         /// 删除歌手类型
         /// </summary>
         /// <param name="model"></param>
        public void DeleteSingerType(Model.CSingerType model)
        {
           singerType.DeleteSingerType(model);

        }

         /// <summary>
         /// 获取歌手类型
         /// </summary>
         /// <returns></returns>
        public DataSet Select()
        {
           return singerType.Select();
        }


         /// <summary>
         /// 获取歌手类型名及id
         /// </summary>
         /// <returns></returns>
        public DataSet SingerTypeName()
        {
            return singerType.SingerTypeName();
        }

         /// <summary>
         /// 根据歌手类型ID获取歌手列表
         /// </summary>
         /// <param name="model"></param>
         /// <returns></returns>
        public DataSet SingerTypeList(Model.CSingerType model)
        {
            return singerType.SingerTypeList(model);
        }

    }
}
