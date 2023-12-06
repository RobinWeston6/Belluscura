pageextension 56754 "SK2 Posted Purchase Invoices" extends "Posted Purchase Invoices"
{
    layout
    {
        addfirst(factboxes)
        {
            part("SK2 Purch. Lines Accs Factbox"; "SK2 Purch. Inv. Line Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

}