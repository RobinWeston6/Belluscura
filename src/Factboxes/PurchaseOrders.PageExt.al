pageextension 56652 "SK Purchase Order List" extends "Purchase Order List"
{
    layout
    {
        addfirst(factboxes)
        {
            part("SK Purchase Order Items"; "SK Purchase Line Factbox")
            {
                Caption = 'Lines on this Purchase Order';
                ApplicationArea = All;
                SubPageLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
            }
        }
    }
}