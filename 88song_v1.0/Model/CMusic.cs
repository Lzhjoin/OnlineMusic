using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class CMusic
    {
        private string musicID;
        private string musicName;
        private int singerID;
        private string musicPath;
        private string lyricPath;
        private int albumID;
        private int musicStyleID;
        private string publishDate;
        private string list_MusicID;

        public string MusicID
        {
            get { return musicID; }
            set { musicID = value; }
        }

        public string MusicName
        {
            get { return musicName; }
            set { musicName = value; }
        }

        public int SingerID
        {
            get { return singerID; }
            set { singerID = value; }
        }

        public string MusicPath
        {
            get { return musicPath; }
            set { musicPath = value; }
        }

        public string LyricPath
        {
            get { return lyricPath; }
            set { lyricPath = value; }
        }

        public int AlbumID
        {
            get { return albumID; }
            set { albumID = value; }
        }

        public int MusicStyleID
        {
            get { return musicStyleID; }
            set { musicStyleID = value; }
        }

        public string PublishDate
        {
            get { return publishDate; }
            set { publishDate = value; }
        }

        public string List_MusicID
        {
            get { return list_MusicID; }
            set { list_MusicID = value; }
        }
    }
}
