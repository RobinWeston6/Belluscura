report 56706 "SK2 Sales Invoice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Default;
    Caption = 'Sales Invoice';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Invoice';
            column(Picture_CompanyInformation; CompanyInformation.Picture)
            { }
            column(PhoneNo_CompanyInformation; CompanyInformation."Phone No.")
            {
                IncludeCaption = true;
            }
            column(HomePage_CompanyInformation; CompanyInformation."Home Page")
            {
                IncludeCaption = true;
            }
            column(Email_CompanyInformation; CompanyInformation."E-Mail")
            {
                IncludeCaption = true;
            }
            column(DocumentDate_Header; "Document Date")
            { }
            column(DueDate_Header; "Due Date")
            { }
            column(No_Header; "No.")
            { }
            column(ExternalDocumentNo_Header; "External Document No.")
            { }
            column(QuoteNo_Header; "Quote No.")
            { }
            column(Name_SalesPerson; SalesPerson.Name)
            { }
            column(Description_PaymentTerms; PaymentTerms.Description)
            { }
            column(ShipmentDate_Header; "Shipment Date")
            { }
            column(Description_ShipmentMethod; ShipmentMethod.Description)
            { }
            column(BuyFromAddress1; BuyFromAddress[1])
            { }
            column(BuyFromAddress2; BuyFromAddress[2])
            { }
            column(BuyFromAddress3; BuyFromAddress[3])
            { }
            column(BuyFromAddress4; BuyFromAddress[4])
            { }
            column(BuyFromAddress5; BuyFromAddress[5])
            { }
            column(BuyFromAddress6; BuyFromAddress[6])
            { }
            column(BuyFromAddress7; BuyFromAddress[7])
            { }
            column(BuyFromAddress8; BuyFromAddress[8])
            { }
            column(BillToAddress1; BillToAddress[1])
            { }
            column(BillToAddress2; BillToAddress[2])
            { }
            column(BillToAddress3; BillToAddress[3])
            { }
            column(BillToAddress4; BillToAddress[4])
            { }
            column(BillToAddress5; BillToAddress[5])
            { }
            column(BillToAddress6; BillToAddress[6])
            { }
            column(BillToAddress7; BillToAddress[7])
            { }
            column(BillToAddress8; BillToAddress[8])
            { }
            column(SellToAddress1; SellToAddress[1])
            { }
            column(SellToAddress2; SellToAddress[2])
            { }
            column(SellToAddress3; SellToAddress[3])
            { }
            column(SellToAddress4; SellToAddress[4])
            { }
            column(SellToAddress5; SellToAddress[5])
            { }
            column(SellToAddress6; SellToAddress[6])
            { }
            column(SellToAddress7; SellToAddress[7])
            { }
            column(SellToAddress8; SellToAddress[8])
            { }
            column(ShipToAddress1; ShipToAddress[1])
            { }
            column(ShipToAddress2; ShipToAddress[2])
            { }
            column(ShipToAddress3; ShipToAddress[3])
            { }
            column(ShipToAddress4; ShipToAddress[4])
            { }
            column(ShipToAddress5; ShipToAddress[5])
            { }
            column(ShipToAddress6; ShipToAddress[6])
            { }
            column(ShipToAddress7; ShipToAddress[7])
            { }
            column(ShipToAddress8; ShipToAddress[8])
            { }
            column(DiscountCaption; DiscountCaption)
            { }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");

                column(Type_Line; Type)
                { }
                column(No_Line; "No.")
                { }
                column(Description_Line; Description)
                { }
                column(Quantity_Line; Quantity)
                { }
                column(UnitOfMeasure_Line; "Unit of Measure")
                { }
                column(UnitPrice_Line; "Unit Price")
                { }
                column(UnitDiscount; UnitDiscount)
                { }
                column(Line_Discount_Amount; "Line Discount Amount")
                { }
                column(LineAmount_Line; "Line Amount")
                { }

                //Sales Invoice Line
                trigger OnAfterGetRecord()
                begin
                    if not ShowGLAccounts and (Type = Type::"G/L Account") then
                        "No." := '';

                    if ("Line Discount Amount" <> 0) and (DiscountCaption = '') then
                        DiscountCaption := StrSubstNo(DiscountLbl, Date2DMY("Sales Invoice Header"."Order Date", 3));

                    if Quantity <> 0 then
                        UnitDiscount := "Line Discount Amount" / Quantity
                    else
                        UnitDiscount := 0;

                    TotalSubTotal += "Line Amount";
                    TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
                    TotalAmount += Amount;
                end;
            }

            dataitem(Totals; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

                column(TotalVATAmount; VATAmount)
                {
                    AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATDiscountAmount; -VATDiscountAmount)
                {
                    AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATBaseAmount; VATBaseAmount)
                {
                    AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalAmountInclVAT; TotalAmountInclVAT)
                {
                    AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalSubTotal; TotalSubTotal)
                {
                    AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalInvoiceDiscountAmount; TotalInvoiceDiscountAmount)
                {
                    AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalAmount; TotalAmount)
                {
                    AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                    AutoFormatType = 1;
                }

                //Totals
                trigger OnAfterGetRecord()
                var
                    TempPrepmtSalesLine: Record "Sales Invoice Line" temporary;
                    TempSalesLine: Record "Sales Invoice Line" temporary;
                    TempPrepaymentInvLineBuffer: Record "Prepayment Inv. Line Buffer" temporary;
                    TempPrepmtVATAmountLine: Record "VAT Amount Line" temporary;
                    TempPrePmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
                    SalesPostPrepayments: Codeunit "Sales-Post Prepayments";
                    SalesPost: Codeunit "Sales-Post";
                begin
                    /*Clear(TempSalesLine);
                    Clear(SalesPost);
                    TempSalesLine.DeleteAll();
                    TempVATAmountLine.DeleteAll();
                    SalesPost.GetSalesLines("Sales Invoice Header", TempSalesLine, 0);
                    TempSalesLine.CalcVATAmountLines(0, "Sales Invoice Header", TempSalesLine, TempVATAmountLine);
                    TempSalesLine.UpdateVATOnLines(0, "Sales Invoice Header", TempSalesLine, TempVATAmountLine);
                    VATAmount := TempVATAmountLine.GetTotalVATAmount();
                    VATBaseAmount := TempVATAmountLine.GetTotalVATBase();
                    VATDiscountAmount :=
                      TempVATAmountLine.GetTotalVATDiscount("Sales Invoice Header"."Currency Code", "Sales Invoice Header"."Prices Including VAT");
                    TotalAmountInclVAT := TempVATAmountLine.GetTotalAmountInclVAT();

                    TempPrepaymentInvLineBuffer.DeleteAll();
                    SalesPostPrepayments.GetSalesLines("Sales Invoice Header", 0, TempPrepmtSalesLine);
                    if not TempPrepmtSalesLine.IsEmpty() then begin
                        SalesPostPrepayments.GetSalesLinesToDeduct("Sales Invoice Header", TempSalesLine);
                        if not TempSalesLine.IsEmpty() then
                            SalesPostPrepayments.CalcVATAmountLines("Sales Invoice Header", TempSalesLine, TempPrePmtVATAmountLineDeduct, 1);
                    end;
                    SalesPostPrepayments.CalcVATAmountLines("Sales Invoice Header", TempPrepmtSalesLine, TempPrepmtVATAmountLine, 0);
                    TempPrepmtVATAmountLine.DeductVATAmountLine(TempPrePmtVATAmountLineDeduct);
                    SalesPostPrepayments.UpdateVATOnLines("Sales Invoice Header", TempPrepmtSalesLine, TempPrepmtVATAmountLine, 0);
                    SalesPostPrepayments.BuildInvLineBuffer("Sales Invoice Header", TempPrepmtSalesLine, 0, TempPrepaymentInvLineBuffer);
                    PrepmtVATAmount := TempPrepmtVATAmountLine.GetTotalVATAmount();
                    PrepmtVATBaseAmount := TempPrepmtVATAmountLine.GetTotalVATBase();
                    PrepmtTotalAmountInclVAT := TempPrepmtVATAmountLine.GetTotalAmountInclVAT();*/
                end;
            }

            //Sales Invoice Header
            trigger OnAfterGetRecord()
            begin
                if not PictureCalculated then begin
                    CompanyInformation.Get();
                    CompanyInformation.CalcFields(Picture);
                    PictureCalculated := true;
                end;

                if not SalesPerson.Get("Sales Invoice Header"."Salesperson Code") then
                    Clear(SalesPerson);
                if not ShipmentMethod.Get("Sales Invoice Header"."Shipment Method Code") then
                    Clear(ShipmentMethod);
                if not PaymentTerms.Get("Sales Invoice Header"."Payment Terms Code") then
                    Clear(PaymentTerms);

                FormatAddressFields("Sales Invoice Header");
                DiscountCaption := '';

                TotalAmount := 0;
                TotalSubTotal := 0;
                TotalInvoiceDiscountAmount := 0;

                /*FormatDocumentFields("Sales Invoice Header");
                if BuyFromContact.Get("Buy-from Contact No.") then;
                if PayToContact.Get("Pay-to Contact No.") then;

                if not IsReportInPreviewMode() then begin
                    CODEUNIT.Run(CODEUNIT::"Sales.Header-Printed", "Sales Invoice Header");
                    if ArchiveDocument then
                        ArchiveManagement.StoreSalesDocument("Sales Invoice Header", LogInteraction);
                end;*/



            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
                        ApplicationArea = All;
                    }
                    field(ShowGLAccounts; ShowGLAccounts)
                    {
                        Caption = 'Show G/L Accounts';
                        ApplicationArea = All;
                        Visible = false;
                    }
                }
            }
        }
    }

    rendering
    {
        layout(Default)
        {
            Type = RDLC;
            LayoutFile = 'src\Layouts\SalesInvoice.rdl';
        }
    }

    labels
    {
        //Header
        SalesInvoiceUCaseLbl = 'SALES INVOICE';
        SalesInvoiceLbl = 'Sales Invoice';
        DocumentDateLbl = 'Document Date';
        DueDateLbl = 'Due Date';
        PurchaseOrderNoLbl = 'Purchase Order';
        QuoteNoLbl = 'Quote No.';
        SalesPersonLbl = 'Sales Person';
        PaymentTermsLbl = 'Payment Terms';
        ShipmentDateLbl = 'Shipment Date';
        ShipmentMethodLbl = 'Shipment Method';
        SalesInvoiceDateLbl = 'Sales Invoice Date';
        ToLbl = 'To:';
        BillToLbl = 'Bill To:';
        SellToLbl = 'Sell To:';
        ShipToLbl = 'Ship To:';
        BuyFromLbl = 'Buy From:';
        PageLbl = 'Page %1 of %2';
        //Line Captions
        RequestedReceiptDateLbl = 'Requested Receipt Date';
        ItemNoLbl = 'Item No.';
        DescriptionLbl = 'Description';
        QuantityLbl = 'Qty.';
        UnitPriceLbl = 'Unit Price';
        UnitOfMeasureLbl = 'Unit';
        TotalPriceLbl = 'Total Price';
        //Totals
        SubtotalLbl = 'Subtotal:';
        InvoiceDiscountLbl = 'Invoice Discount';
        TaxLbl = 'Tax';
        TotalLbl = 'Total USD';
        ForAnyPaymentsLbl = 'For any payments please use the following account:';
        BankLbl = 'Bank:';
        BankValue = 'Chase';
        RoutingNoLbl = 'Routing No.:';
        RoutingNoValue = '111000614';
        AccountNoLbl = 'Account No.:';
        AccountNoValue = '787172698';
        HomePageLbl = 'Home Page';
        PhoneNoLbl = 'Phone No.';
        EmailLbl = 'Email';
    }

    var
        //Request Page
        NoOfCopies: Integer;
        ShowGLAccounts: Boolean;
        //DataSet
        CompanyInformation: Record "Company Information";
        SalesPerson: Record "Salesperson/Purchaser";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        BuyFromAddress: array[8] of Text[100];
        BillToAddress: array[8] of Text[100];
        SellToAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        DiscountCaption: Text;
        UnitDiscount: Decimal;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        TotalAmount: Decimal;
        TotalSubTotal: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        //Other
        FormatAddress: Codeunit "Format Address";
        DocumentTotals: Codeunit "Document Totals";
        PictureCalculated: Boolean;
        DiscountLbl: label '%1 Promo Unit Discount';

        f: report 1305;
        r: page "Sales Invoice";


    local procedure FormatAddressFields(var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        RespCenter: Record "Responsibility Center";
    begin
        FormatAddress.GetCompanyAddr(SalesInvoiceHeader."Responsibility Center", RespCenter, CompanyInformation, BuyFromAddress);
        FormatAddress.SalesInvBillTo(BillToAddress, SalesInvoiceHeader);
        FormatAddress.SalesInvSellTo(SellToAddress, SalesInvoiceHeader);
        FormatAddress.SalesInvShipTo(ShipToAddress, BillToAddress, SalesInvoiceHeader);

    end;
}