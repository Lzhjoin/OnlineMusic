using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class CAlbum
    {
        private int albumID;
        private string albumName;
        private int singerID;
        private string albumPhotoPath;
        private string publishDate;


        public int SingerID
        {
            get { return singerID; }
            set { singerID = value; }
        }

        public string AlbumName
        {
            get { return albumName; }
            set { albumName = value; }
        }

        public int AlbumID
        {
            get { return albumID; }
            set { albumID = value; }
        }

        public string AlbumPhotoPath
        {
            get { return albumPhotoPath; }
            set { albumPhotoPath = value; }
        }

        public string PublishDate
        {
            get { return publishDate; }
            set { publishDate = value; }
        }
    }
}
