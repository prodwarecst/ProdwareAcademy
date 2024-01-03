/// <summary>
/// Report Certificate PDA (ID 70101).
/// </summary>
report 70101 "Certificate PDA"
{
    Caption = 'Certificate';
    UsageCategory = None;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/000 Developer Certification/Certification Exam/Rep - Certificate.rdlc';

    dataset
    {
        dataitem("Certification Exam"; "Certification Exam PDA")
        {
            column(CertificationExam_UserID; "User ID")
            {
            }
            column(CertificationExam_DateTimeStarted; Format("Date/Time Started", 0, '<Month Text> <Day>, <Year4>'))
            {
            }

            dataitem(Certification; "Certification PDA")
            {
                DataItemLink = Code = field("Certification Code");

                column(Certification_Code; Certification.Code)
                {
                }
                column(Certification_Description; Certification.Description)
                {
                }
            }
        }
    }

    labels
    {
        LblProdwareCertified = 'Prodware Certified';
        LblHasSuccessfully = 'Has successfully completed the requirements to be recognized as Prodware Certified: ';
        LblDateOfAchievement = 'Date of achievement: ';
        LblCertificationNo = 'Certification number: ';
        LblStephanLosekoot = 'Stephan Losekoot';
        LblVicePresident = 'Vice President';
    }
}