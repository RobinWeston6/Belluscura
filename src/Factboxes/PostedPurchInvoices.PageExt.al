pageextension 56754 "SK Posted Purchase Invoices" extends "Posted Purchase Invoices"
{
    layout
    {
        addfirst(factboxes)
        {
            part("SK Purch. Lines Accs Factbox"; "SK Purch. Inv. Line Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

}