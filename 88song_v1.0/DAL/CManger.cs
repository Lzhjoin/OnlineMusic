using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Model;

namespace DAL
{
    public class CManger
    {
        CDataBase db = new CDataBase();
        /// <summary>
        /// 查询登录的用户是否存在数据库中
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet Login(Model.CManeger model)
        {
            string sql = "select * from MangerInfo where MangerName='" + model.MangerName + "' and MangerPassword='" + model.MangerPassword + "'";
            return db.select(sql);
        }

        /// <summary>
        /// 更新用户登录时间
        /// </summary>
        /// <param name="model"></param>
        public void UpdateLoginDate(Model.CManeger model)
        {
            string sql = "update MangerInfo set MangerLoginDate='" + model.MangerLoginDate + "' where MangerName='" + model.MangerName + "'";
            db.Exec(sql);
        }

        /// <summary>
        /// 核对用户名密码是否正确
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet ExistManger(Model.CManeger model)
        {
            string sql = "select * from MangerInfo where MangerName='" + model.MangerName + "' and MangerPassword='" + model.MangerPassword + "'";

            return db.select(sql);
        }

        /// <summary>
        /// 修改用户密码
        /// </summary>
        /// <param name="model"></param>
        public void AlterPassword(Model.CManeger model)
        {
            string sql = "update MangerInfo set MangerPassword='" + model.MangerNewPassword + "' where MangerName='" + model.MangerName + "'";

            db.Exec(sql);
        }

        /// <summary>
        /// 查询要添加的用户名是否已存在
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SelectExistManger(Model.CManeger model)
        {
            string sql = "select * from MangerInfo where MangerName='" + model.MangerName + "'";

            return db.select(sql);
        }

        /// <summary>
        /// 添加管理员
        /// </summary>
        /// <param name="model"></param>
        public void AddManger(Model.CManeger model)
        {
            string sql = "insert MangerInfo(MangerName,MangerPassword) values('" + model.MangerName + "','" + model.MangerPassword + "')";

            db.Exec(sql);
        }

        /// <summary>
        /// 查询管理员信息
        /// </summary>
        /// <returns></returns>
        public DataSet SelectManger()
        {
            string sql = "select *  from MangerInfo";

            return db.select(sql);
        }

        public void AlterManger(Model.CManeger model)
        {
            string sql = "update MangerInfo set MangerName='" + model.MangerName + "',MangerPassword='" + model.MangerPassword + "',Remark='" + model.Remark + "',RelationWay='" + model.RelationWay + "' where MangerID='" + model.MangerID + "'";

            db.Exec(sql);
        }

        /// <summary>
        /// 查询管理员详细信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public DataSet SelectManger(Model.CManeger model)
        {
            string sql = "select * from MangerInfo where MangerID='" + model.MangerID + "'";

            return db.select(sql);
        }

        /// <summary>
        /// 删除管理员
        /// </summary>
        /// <param name="model"></param>
        public void DeleteManger(Model.CManeger model)
        {
            string sql = "Delete from MangerInfo where MangerID='" + model.MangerID + "'";

            db.Exec(sql);
        }
    }
}
