/// <summary>
/// Page Developer Role Center PDA (ID 70100).
/// </summary>
page 70100 "Developer Role Center PDA"
{
    Caption = 'Prodware Academy – Developer';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(HeadlineRCDeveloper; "Headline RC Developer PDA")
            {
                ApplicationArea = All;
            }
            part(DeveloperActivities; "Developer Activities PDA")
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
                RunPageView = where(Role = const(Developer));
                ToolTip = 'View detailed information for the certifications.';
            }
            action(CertificationExams)
            {
                ApplicationArea = All;
                Caption = 'Certification Exams';
                RunObject = Page "Certification Exams PDA";
                RunPageView = where(Role = const(Developer));
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
                    RunPageView = where(Role = const(Developer));
                    ToolTip = 'View detailed information for the certifications.';
                }
                action(CertificationExamList)
                {
                    ApplicationArea = All;
                    Caption = 'Certification Exams';
                    RunObject = Page "Certification Exams PDA";
                    RunPageView = where(Role = const(Developer));
                    ToolTip = 'View or edit detailed information for the certification exams.';
                }
            }
        }
    }
}