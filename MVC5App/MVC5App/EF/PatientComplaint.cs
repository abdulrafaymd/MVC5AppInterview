namespace MVC5App.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PatientComplaint")]
    public partial class PatientComplaint
    {
        [Key]
        public int PatientComplaint_Id { get; set; }

        public int? Patient_Id { get; set; }

        public int? Complaint_Id { get; set; }

        public virtual Complaint Complaint { get; set; }

        public virtual Patient Patient { get; set; }
    }
}
