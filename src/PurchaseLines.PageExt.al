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
    }
}