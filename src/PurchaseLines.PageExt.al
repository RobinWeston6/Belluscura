pageextension 56722 "SK2 Purchase Lines" extends "Purchase Lines"
{
    layout
    {
        addafter("Buy-from Vendor No.")
        {
            field("SK2 Vendor Name"; rec."SK2 Vendor Name")
            {
                ApplicationArea = all;
            }
        }
    }
}