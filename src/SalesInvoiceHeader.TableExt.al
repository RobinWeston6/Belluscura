tableextension 56707 "SK2 Sales Invoice Header" extends "Sales Invoice Header"
{
    procedure "SK2 PrintSNComments"()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        PrintSalesSNComments: Report "SK2 Print Sales SN Comments";
    begin
        SalesInvoiceHeader.SetRange("No.", Rec."No.");
        PrintSalesSNComments.SetTableView(SalesInvoiceHeader);
        PrintSalesSNComments.UseRequestPage(false);
        PrintSalesSNComments.RunModal();
    end;
}