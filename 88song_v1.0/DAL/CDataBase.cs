using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class CDataBase
    {
        //从网站配置文件中获取数据库连接字符串
        static string connection = ConfigurationManager.ConnectionStrings["DB_MusicConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(connection);

        /// <summary>
        /// 进行数据库的查询操作
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>查询出来的数据集</returns>
        public DataSet select(string sql)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(sql,conn);
            da.Fill(ds);
            da.Dispose();
            return ds;
            
        }

        /// <summary>
        /// 进行数据库的增、删、改操作
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>返回受影响的行数</returns>
        public int Exec(string sql)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            int i= cmd.ExecuteNonQuery();
            conn.Close();
            cmd.Dispose();
            return i;
        }

        /// <summary>
        /// 执行无参无返回值的存储过程
        /// </summary>
        /// <param name="PROC_Name">存储过程名</param>
        /// <returns></returns>
        public DataSet SelectPROC(string PROC_Name)
        {
            SqlCommand cmd = new SqlCommand();
            //设置数据库的连接
            cmd.Connection = conn;
            //设置要执行命令的名字
            cmd.CommandText = PROC_Name;
            //设置要执行命令的类型
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        /// <summary>
        /// 根据表名返回表中自增字段的下一个id
        /// </summary>
        /// <param name="TableName"></param>
        /// <returns></returns>
        public string Select_AutoID(string TableName)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "pro_AutoID";

            //创建参数
            IDataParameter[] parameter ={
                                            new SqlParameter("@TableName",SqlDbType.NVarChar,20),
                                            new SqlParameter("@AutoID",SqlDbType.NVarChar,10)
                                        };

            //设置参数类型
            parameter[0].Value = TableName;
            parameter[1].Direction = ParameterDirection.ReturnValue;

            cmd.Parameters.Add(parameter[0]);
            cmd.Parameters.Add(parameter[1]);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            return parameter[1].Value.ToString();
        }

        
    }
}
