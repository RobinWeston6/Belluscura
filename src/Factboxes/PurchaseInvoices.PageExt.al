pageextension 56651 "SK Purchase Invoices" extends "Purchase Invoices"
{
    layout
    {
        addfirst(factboxes)
        {
            part("SK Purch. Lines Accs Factbox"; "SK Purchase Line Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No."), "Document Type" = const(Invoice);
            }
        }
    }

}