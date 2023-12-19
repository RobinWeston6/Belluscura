page 56701 "SK2 Sales Serial No.s Comments"
{
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Comment Line";
    Caption = 'Sales Serial No.s';
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
                field("SK2 Item Desc"; Rec."SK2 Item Desc")
                {
                    ApplicationArea = All;
                    Caption = 'Item';
                    Visible = Categorise;
                }
                field("SK2 Extracted SN"; Rec."SK2 Extracted SN")
                {
                    ApplicationArea = All;
                    Caption = 'Serial No.';
                    Visible = Categorise;
                }
                field(Comment; Rec.Comment)
                {
                    Caption = 'Serial No.';
                    ApplicationArea = All;
                    Visible = not Categorise;
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

    actions
    {
        area(Processing)
        {
            group("TEST - REMOVE")
            {
                action(ToggleCategorise)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Categorise := not Categorise;
                    end;
                }
                action(AutoCategoriseLines)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        AutoCategorise();
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Date := WorkDate();
        Rec."SK2 Serial No." := true;
        Rec.ExtractSN();
    end;

    var
        Categorise: Boolean;
        WholeDocument: Boolean;

    procedure SetCategoriseItem(NewCategorise: Boolean)
    begin
        Categorise := NewCategorise;
    end;

    procedure AutoCategorise()
    var
        SalesCommentLine: Record "Sales Comment Line";
        Item: Record Item;
        TextFunctions: Codeunit "SK2 Text Functions";
        TEMP: Text;
    begin
        Item.SetFilter("SK2 Serial No. Format", '<>%1', '');
        Item.SetCurrentKey("SK2 SN Format Length");

        SalesCommentLine.SetRange("Document Type", Rec."Document Type");
        SalesCommentLine.SetRange("No.", Rec."No.");
        if not WholeDocument then
            SalesCommentLine.SetRange("Document Line No.", Rec."Document Line No.");
        if SalesCommentLine.FindSet(true) then
            repeat
                Item.Find('-');
                TEMP := TextFunctions.AsSNFormat(SalesCommentLine."SK2 Extracted SN");
                repeat
                    if Item."SK2 Serial No. Format" = TextFunctions.AsSNFormat(SalesCommentLine."SK2 Extracted SN") then begin
                        SalesCommentLine."SK2 Item No." := Item."No.";
                        SalesCommentLine."SK2 Item Desc" := Item.Description;
                        SalesCommentLine.Modify();
                    end;
                until Item.Next() = 0;
            until SalesCommentLine.Next() = 0;


    end;
}