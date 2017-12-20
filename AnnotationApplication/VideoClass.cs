using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AnnotationApplication
{
    public class VideoClass
    {
        String video_Name;
        int count;

        public string Video_Name
        {
            get
            {
                return video_Name;
            }

            set
            {
                video_Name = value;
            }
        }

        public int Count
        {
            get
            {
                return count;
            }

            set
            {
                count = value;
            }
        }
    }
}