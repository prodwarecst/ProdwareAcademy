/// <summary>
/// Permission Set ACADEMY STUDY PDA (ID 70100).
/// </summary>
permissionset 70101 "ACADEMY STUDY PDA"
{
    Assignable = true;
    Caption = 'Prodware Academy Study', Locked = true;
    Permissions =
                    tabledata "Certification PDA" = R,
                    tabledata "Certification Area PDA" = R,
                    tabledata "Certification Question PDA" = R,
                    tabledata "Certification Answer PDA" = R,
                    tabledata "Certification Exam PDA" = RIMD,
                    tabledata "Certif. Exam Result PDA" = RIMD,
                    tabledata "Activities Cue PDA" = RIMD,
                    page "Certification List PDA" = X,
                    page "Certification Card PDA" = X,
                    page "Certification Areas PDA" = X,
                    page "Certification Questions PDA" = X,
                    page "Certification Answers PDA" = X,
                    page "Certif. Answers Select. PDA" = X,
                    page "Certif. Exam Wizard PDA" = X,
                    page "Certification Exams PDA" = X,
                    page "Headline RC Consultant PDA" = X,
                    page "Consultant Activities PDA" = X,
                    page "Consultant Role Center PDA" = X,
                    page "Headline RC Developer PDA" = X,
                    page "Developer Activities PDA" = X,
                    page "Developer Role Center PDA" = X,
                    report "Certif. Exam Result PDA" = X,
                    report "Certificate PDA" = X,
                    codeunit "Permission Mgt. PDA" = X,
                    codeunit "Install Codeunit PDA" = X,
                    codeunit "Data Upgrade PDA" = X,
                    codeunit "Upgrade Tag Def PDA" = X;
}