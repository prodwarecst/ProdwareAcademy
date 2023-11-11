/// <summary>
/// Permission Set ACADEMY SETUP PA PWD (ID 70100).
/// </summary>
permissionset 70100 "ACADEMY SETUP PA PWD"
{
    Assignable = true;
    Caption = 'Prodware Academy Setup', Locked = true;
    Permissions =
                    tabledata "Certification PA PWD" = RIMD,
                    tabledata "Certification Area PA PWD" = RIMD,
                    tabledata "Certification Question PA PWD" = RIMD,
                    tabledata "Certification Answer PA PWD" = RIMD,
                    tabledata "Certification Exam PA PWD" = RIMD,
                    tabledata "Certif. Exam Result PA PWD" = RIMD,
                    tabledata "Activities Cue PA PWD" = RIMD,

                    page "Certification List PA PWD" = X,
                    page "Certification Card PA PWD" = X,
                    page "Certification Areas PA PWD" = X,
                    page "Certification Questions PA PWD" = X,
                    page "Certification Answers PA PWD" = X,
                    page "Certif. Answers Select. PA PWD" = X,
                    page "Certif. Exam Wizard PA PWD" = X,
                    page "Certification Exams PA PWD" = X,
                    page "Headline RC Consultant PA PWD" = X,
                    page "Consultant Activities PA PWD" = X,
                    page "Consultant Role Center PA PWD" = X,
                    page "Headline RC Developer PA PWD" = X,
                    page "Developer Activities PA PWD" = X,
                    page "Developer Role Center PA PWD" = X,

                    report "Certif. Exam Result PA PWD" = X,
                    report "Certificate PA PWD" = X,

                    codeunit "Permission Mgt. PA PWD" = X,
                    codeunit "Install Codeunit PA PWD" = X,
                    codeunit "Data Upgrade PA PWD" = X,
                    codeunit "Upgrade Tag Def PA PWD" = X;
}