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
    
    public partial class AnnotationDetail
    {
        public int annDetail_ID { get; set; }
        public Nullable<int> annotation_ID { get; set; }
        public Nullable<int> frame_vid_ID { get; set; }
        public Nullable<int> person1 { get; set; }
        public Nullable<int> person2 { get; set; }
        public string relationship { get; set; }
    
        public virtual Group Group { get; set; }
        public virtual Group Group1 { get; set; }
        public virtual Annotation Annotation { get; set; }
    }
}
