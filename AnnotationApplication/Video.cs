//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AnnotationApplication
{
    using System;
    using System.Collections.Generic;
    
    public partial class Video
    {
        public Video()
        {
            this.Annotations = new HashSet<Annotation>();
            this.VideoDetails = new HashSet<VideoDetail>();
        }
    
        public int video_ID { get; set; }
        public string video_Name { get; set; }
    
        public virtual ICollection<Annotation> Annotations { get; set; }
        public virtual ICollection<VideoDetail> VideoDetails { get; set; }
    }
}