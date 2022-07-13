pageextension 56751 "SK2 Purchase Invoices" extends "Purchase Invoices"
{
    layout
    {
        addfirst(factboxes)
        {
            part("SK2 Purch. Lines Accs Factbox"; "SK2 Purchase Line Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No."), "Document Type" = const(Invoice);
            }
        }
    }

}