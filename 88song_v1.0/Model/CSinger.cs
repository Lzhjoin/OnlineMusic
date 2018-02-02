using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class CSinger
    {
        private string singerName;
        private int singerID;
        private int singerOnclickNum;
        private float singerMark;
        private int singerMarkNum;
        private string sex;
        private int singerTypeID;
        private string photoPath;

        public int SingerTypeID
        {
            get { return singerTypeID; }
            set { singerTypeID = value; }
        }

        public string Sex
        {
            get { return sex; }
            set { sex = value; }
        }

        public int SingerMarkNum
        {
            get { return singerMarkNum; }
            set { singerMarkNum = value; }
        }

        public float SingerMark
        {
            get { return singerMark; }
            set { singerMark = value; }
        }

        public int SingerOnclickNum
        {
            get { return singerOnclickNum; }
            set { singerOnclickNum = value; }
        }

        public int SingerID
        {
            get { return singerID; }
            set { singerID = value; }
        }

        public string SingerName
        {
            get { return singerName; }
            set { singerName = value; }
        }

        public string PhotoPath
        {
            get { return photoPath; }
            set { photoPath = value; }
        }

    }
}
