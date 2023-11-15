pageextension 56730 "SK2 Posted Purch. Inv. Subform" extends "Posted Purch. Invoice Subform"
{
    layout
    {
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
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}