pageextension 56728 "SK2 Pstd. Sales Cr.Memo Lines" extends "Posted Sales Credit Memo Lines"
{
    layout
    {
        addafter("Sell-to Customer No.")
        {
            field("SK2 Sell-to Customer Name"; Rec."SK2 Sell-to Customer Name")
            {
                ApplicationArea = All;
            }
            field("SK2 Document Date"; Rec."SK2 Document Date")
            {
                ApplicationArea = All;
            }
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = All;
            }
        }
        addlast(Control1)
        {
            field("SK2 Customer Posting Group"; Rec."SK2 Customer Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }
}