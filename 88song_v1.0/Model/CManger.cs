using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class CManeger
    {
        private int _mangerID;
        private string _mangerName;
        private string _mangerPassword;
        private string _mangerLoginDate;
        private string _mangerNewPassword;
        private string _remark;
        private string _relationWay;

        public int MangerID
        {
            get { return _mangerID; }
            set { _mangerID = value; }
        }
        

        public string MangerName
        {
            get { return _mangerName; }
            set { _mangerName = value; }
        }
        

        public string MangerPassword
        {
            get { return _mangerPassword; }
            set { _mangerPassword = value; }
        }
        

        public string MangerLoginDate
        {
            get { return _mangerLoginDate; }
            set { _mangerLoginDate = value; }
        }

        public string MangerNewPassword
        {
            get { return _mangerNewPassword; }
            set { _mangerNewPassword = value; }
        }

        public string Remark
        {
            get { return _remark; }
            set { _remark = value; }
        }

        public string RelationWay
        {
            get { return _relationWay; }
            set { _relationWay = value; }
        }

    }
}
