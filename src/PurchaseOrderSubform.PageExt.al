pageextension 56717 "SK2 Purchase Order Subform" extends "Purchase Order Subform"
{
    layout
    {
        addafter("Requested Receipt Date")
        {
            field("SK2 Expected Payment Date"; Rec."SK2 Expected Payment Date")
            {
                ApplicationArea = All;
            }
        }
        addlast(Control1)
        {
            field("SK2 Engineering Type"; Rec."SK2 Engineering Type")
            {
                ApplicationArea = all;
            }
            field("SK2 Project"; Rec."SK2 Project")
            {
                ApplicationArea = all;
            }
            field("SK2 Expense Type"; Rec."SK2 Expense Type")
            {
                ApplicationArea = all;
            }
        }

    }
    actions
    {
        addfirst("&Line")
        {
            action("SK2 Serial No.s")
            {
                Caption = 'Serial No.s';
                ApplicationArea = All;
                Image = SerialNo;

                trigger OnAction()
                begin
                    ShowComments();
                end;

            }
        }
        modify("Item Tracking Lines")
        {
            Enabled = true;
            Caption = 'Serial Numbers';
        }
    }

    procedure ShowComments()
    var
        PurchCommentLine: Record "Purch. Comment Line";
        PurchSNCommentSheet: Page "SK2 Purch. Serial Nos. Commnts";
    begin
        Rec.TestField("Document No.");
        Rec.TestField("Line No.");
        PurchCommentLine.SetRange("Document Type", Rec."Document Type");
        PurchCommentLine.SetRange("No.", Rec."Document No.");
        PurchCommentLine.SetRange("Document Line No.", Rec."Line No.");
        PurchSNCommentSheet.SetTableView(PurchCommentLine);
        PurchSNCommentSheet.RunModal;
    end;
}