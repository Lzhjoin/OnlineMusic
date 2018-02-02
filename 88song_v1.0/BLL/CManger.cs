using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using DAL;
using System.Data;
namespace BLL
{
     public class CManger
    {
         DAL.CManger manger = new DAL.CManger();
         public DataSet Login(Model.CManeger model)
         {
             DataSet ds=manger.Login(model);

             //当登录用户存在时，更新用户登录时间
             if(ds.Tables[0].Rows.Count>0)
             manger.UpdateLoginDate(model);

             return ds;
         }

         /// <summary>
         /// 修改用户密码
         /// </summary>
         /// <param name="model"></param>
         /// <returns></returns>
         public bool AlterPassword(Model.CManeger model)
         {
             DataSet ds=manger.ExistManger(model);
             //判断用户密码是否正确
             if (ds.Tables[0].Rows.Count > 0)
             {
                 manger.AlterPassword(model);

                 return true;
             }
             else
             {
                 return false;
             }
         }

         /// <summary>
         /// 添加管理员
         /// </summary>
         /// <param name="model"></param>
         /// <returns></returns>
         public bool AddManger(Model.CManeger model)
         {
             DataSet ds=manger.SelectExistManger(model);
             //查找该用户名是否已经存在
             if (ds.Tables[0].Rows.Count == 0)
             {
                 //不存在则添加
                 manger.AddManger(model);

                 return true;
             }
             else
             {
                 return false;
             }
         }

         /// <summary>
         /// 显示管理员信息
         /// </summary>
         /// <returns></returns>
         public DataSet SelectManger()
         {
             return manger.SelectManger();
         }

         /// <summary>
         /// 修改管理员信息
         /// </summary>
         /// <param name="model"></param>
         public void AlterManger(Model.CManeger model)
         {
             manger.AlterManger(model);
         }

         /// <summary>
         /// 显示管理员详细信息
         /// </summary>
         /// <param name="MangerID"></param>
         /// <returns></returns>
         public DataSet SelectManger(int MangerID)
         {
             Model.CManeger model = new Model.CManeger();

             model.MangerID = MangerID;

            return manger.SelectManger(model);
         }

         /// <summary>
         /// 删除管理员
         /// </summary>
         /// <param name="model"></param>
         public void DeleteManger(Model.CManeger model)
         {
             manger.DeleteManger(model);
         }
    }
}
