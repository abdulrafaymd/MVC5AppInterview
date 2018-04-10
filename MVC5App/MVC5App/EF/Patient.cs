namespace MVC5App.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Patient")]
    public partial class Patient
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Patient()
        {
            PatientComplaints = new HashSet<PatientComplaint>();
        }

        [Key]
        public int Patient_Id { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 4, ErrorMessage = "Name must not be less than 4 char")] 
        public string Fname { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 4, ErrorMessage = "Name must not be less than 4 char")]
        public string Mname { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 4, ErrorMessage = "Name must not be less than 4 char")]
        public string Lname { get; set; }

        [RegularExpression("^[0-9]*$", ErrorMessage = "Age must be numeric")]
        public int? age { get; set; }

        public int? Department_Id { get; set; }

        public int? Doctor_Id { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:mm/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? Reg_Date { get; set; }

        public virtual Department Department { get; set; }

        public virtual Doctor Doctor { get; set; }
        [NotMapped]
        public  string ComplaintJson { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PatientComplaint> PatientComplaints { get; set; }
    }
}
