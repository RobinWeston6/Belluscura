pageextension 56709 "SK2 Purchase Order List" extends "Purchase Order List"
{
    layout
    {
        addfirst(factboxes)
        {
            part("SK2 Purchase Order Items"; "SK2 Purchase Line Factbox")
            {
                Caption = 'Lines on this Purchase Order';
                ApplicationArea = All;
                SubPageLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
            }
        }
        addlast(Control1)
        {
            field("SK2 Department"; Rec."SK2 Department")
            {
                ApplicationArea = All;
            }
            field("SK2 Approver"; Rec."SK2 Approver")
            {
                ApplicationArea = All;
                OptionCaption = ' ,Keith Cook,,Paul Bray,Sarah Clark,Brian Brown,Dwayne Thompson,Mark Vines';
            }
            field("SK2 Date To Be Issued"; Rec."SK2 Date To Be Issued")
            {
                ApplicationArea = All;
            }
            field("SK2 Issued"; Rec."SK2 Issued")
            {
                ApplicationArea = All;
            }
        }
        addafter(Status)
        {
            field("SK2 Ext. Status"; Rec."SK2 Ext. Status")
            {
                ApplicationArea = All;
                StyleExpr = ExtStatusStyleTxt;
            }
        }
        modify(Status)
        {
            Visible = false;
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcExtStatus();
        ExtStatusStyleTxt := Rec.GetExtStatusStyleText();
    end;

    var
        ExtStatusStyleTxt: Text;
}