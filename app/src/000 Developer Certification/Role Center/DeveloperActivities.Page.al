/// <summary>
/// Page Developer Activities PDA (ID 70107).
/// </summary>
page 70107 "Developer Activities PDA"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = "Activities Cue PDA";

    layout
    {
        area(content)
        {
            cuegroup(Certifications)
            {
                Caption = 'Certifications';
                field(CertificationsCount; Rec."Certifications")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Certification List PDA";
                    ToolTip = 'Specifies the sum of available certifications.';
                }
                field(CertificationExamsCount; Rec."Certification Exams")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Certification Exams PDA";
                    ToolTip = 'Specifies the sum of available certification exams.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(RefreshData)
            {
                ApplicationArea = All;
                Caption = 'Refresh Data';
                Image = Refresh;
                ToolTip = 'Refreshes the data needed to make complex calculations.';

                trigger OnAction()
                begin
                    Rec."Last Date/Time Modified" := 0DT;
                    Rec.Modify();

                    Codeunit.Run(Codeunit::"Activities Mgt.");
                    CurrPage.Update(false);
                end;
            }
            action("Set Up Cues")
            {
                ApplicationArea = All;
                Caption = 'Set Up Cues';
                Image = Setup;
                ToolTip = 'Set up the cues (status tiles) related to the role.';

                trigger OnAction()
                var
                    CueRecordRef: RecordRef;
                begin
                    CueRecordRef.GetTable(Rec);
                    CuesAndKpis.OpenCustomizePageForCurrentUser(CueRecordRef.Number);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
            Commit();
        end;

        Rec.SetRange("Role Filter", Rec."Role Filter"::Developer);
        Rec.SetRange("User ID Filter", UserId());
    end;

    var
        CuesAndKpis: Codeunit "Cues And KPIs";
}