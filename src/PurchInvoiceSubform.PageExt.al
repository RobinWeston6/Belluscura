pageextension 56729 "SK2 Purch. Invoice Subform" extends "Purch. Invoice Subform"
{
    layout
    {
        addlast(PurchDetailLine)
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
}