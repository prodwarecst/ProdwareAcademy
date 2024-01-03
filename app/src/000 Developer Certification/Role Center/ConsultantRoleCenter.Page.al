/// <summary>
/// Page Consultant Role Center PDA (ID 70102).
/// </summary>
page 70102 "Consultant Role Center PDA"
{
    Caption = 'Prodware Academy – Consultant';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(HeadlineRCConsultant; "Headline RC Consultant PDA")
            {
                ApplicationArea = All;
            }
            part(ConsultantActivities; "Consultant Activities PDA")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(creation)
        {
        }
        area(embedding)
        {
            ToolTip = 'See certification and certification exams.';
            action(Certifications)
            {
                ApplicationArea = All;
                Caption = 'Certifications';
                RunObject = Page "Certification List PDA";
                RunPageView = where(Role = const(Consultant));
                ToolTip = 'View or edit detailed information for the certifications.';
            }
            action(CertificationExams)
            {
                ApplicationArea = All;
                Caption = 'Certification Exams';
                RunObject = Page "Certification Exams PDA";
                RunPageView = where(Role = const(Consultant));
                ToolTip = 'View or edit detailed information for the certification exams.';
            }
        }
        area(sections)
        {
            group(Certification)
            {
                Caption = 'Learning Path';
                Image = Journals;
                ToolTip = 'Explore available certifications and take certification exam.';
                action(CertificationList)
                {
                    ApplicationArea = All;
                    Caption = 'Certifications';
                    Image = Journal;
                    RunObject = Page "Certification List PDA";
                    RunPageView = where(Role = const(Consultant));
                    ToolTip = 'View detailed information for the certifications.';
                }
                action(CertificationExamList)
                {
                    ApplicationArea = All;
                    Caption = 'Certification Exams';
                    RunObject = Page "Certification Exams PDA";
                    RunPageView = where(Role = const(Consultant));
                    ToolTip = 'View or edit detailed information for the certification exams.';
                }
            }
        }
    }
}