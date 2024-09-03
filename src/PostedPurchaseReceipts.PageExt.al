pageextension 56706 "SK2 Posted Purchase Receipts" extends "Posted Purchase Receipts"
{
    layout
    {
        addlast(Control1)
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = All;
            }
        }
    }
}