pageextension 56725 "SK2 Purchase Lines" extends "Purchase Lines"
{
    layout
    {
        addafter("Expected Receipt Date")
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
                ApplicationArea = All;
            }
            field("SK2 Project"; Rec."SK2 Project")
            {
                ApplicationArea = All;
            }
            field("SK2 Expense Type"; Rec."SK2 Expense Type")
            {
                ApplicationArea = All;
            }
        }
    }
}