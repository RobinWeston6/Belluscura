page 56708 "SK2 G/L Entry Cat. Brkdn Subpg"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SK2 GL Entry Cat. Breakdown";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Breakdown Amount"; Rec."Breakdown Amount")
                {
                    ApplicationArea = All;
                }
                field("Breakdown Percentage"; Rec."Breakdown Percentage")
                {
                    ApplicationArea = All;
                }
                field("Engineering Activity"; Rec."Engineering Activity")
                {
                    ApplicationArea = All;
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = All;
                }
                field("Project"; Rec."Project")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec.Insert then;
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("G/L Entry Amount");
    end;

    var
        GLEntry: Record "G/L Entry";
        TotalAmt: Decimal;
        TotalPct: Decimal;
        Style: Text;

}