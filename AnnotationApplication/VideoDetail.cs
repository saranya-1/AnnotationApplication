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
    
    public partial class VideoDetail
    {
        public int frame_ID { get; set; }
        public Nullable<int> video_ID { get; set; }
        public Nullable<int> frame_Vid_ID { get; set; }
        public Nullable<int> track_ID { get; set; }
        public Nullable<int> x { get; set; }
        public Nullable<int> y { get; set; }
        public Nullable<int> width { get; set; }
        public Nullable<int> height { get; set; }
    
        public virtual Video Video { get; set; }
    }
}
