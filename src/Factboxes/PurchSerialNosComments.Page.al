page 56700 "SK2 Purch. Serial Nos. Commnts"
{
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Purch. Comment Line";
    Caption = 'Purch. Serial No.s';
    SourceTableView = where("SK2 Serial No." = const(true));
    AutoSplitKey = true;
    DataCaptionFields = "Document Type", "No.";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;


    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(Comment; Rec.Comment)
                {
                    Caption = 'Serial No.';
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    Caption = 'Document No.';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Date := WorkDate();
        Rec."SK2 Serial No." := true;
    end;
}