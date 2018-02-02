using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class CMusicStyle
    {
        private int musicStyleID;
        private string musicStyleName;

        public int MusicStyleID
        {
            get { return musicStyleID; }
            set { musicStyleID = value; }
        }

        public string MusicStyleName
        {
            get { return musicStyleName; }
            set { musicStyleName = value; }
        }
    }
}
