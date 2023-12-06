report 56704 "SK2 Purchase Order"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Default;
    Caption = 'Purchase Order';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Purchase Order';
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
            column(No_Header; "No.")
            { }
            column(OrderDate_Header; "Order Date")
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
            column(ShipToAddress1; BillToAddress[1])
            { }
            column(ShipToAddress2; BillToAddress[2])
            { }
            column(ShipToAddress3; BillToAddress[3])
            { }
            column(ShipToAddress4; BillToAddress[4])
            { }
            column(ShipToAddress5; BillToAddress[5])
            { }
            column(ShipToAddress6; BillToAddress[6])
            { }
            column(ShipToAddress7; BillToAddress[7])
            { }
            column(ShipToAddress8; BillToAddress[8])
            { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");

                column(RequestedReceiptDate_Line; "Requested Receipt Date")
                { }
                column(ExpectedReceiptDate_Line; "Expected Receipt Date")
                { }
                column(Type_Line; Type)
                { }
                column(No_Line; "No.")
                { }
                column(Description_Line; Description)
                { }
                column(Quantity_Line; Quantity)
                { }
                column(UnitPriceLCY_Line; "Unit Price (LCY)")
                { }
                column(UnitCostLCY_Line; "Unit Cost (LCY)")
                { }
                column(LineAmount_Line; "Line Amount")
                { }

                //Purchase Line
                trigger OnAfterGetRecord()
                begin
                    if not ShowGLAccounts and (Type = Type::"G/L Account") then
                        "No." := '';

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
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATDiscountAmount; -VATDiscountAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATBaseAmount; VATBaseAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalAmountInclVAT; TotalAmountInclVAT)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalSubTotal; TotalSubTotal)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalInvoiceDiscountAmount; TotalInvoiceDiscountAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalAmount; TotalAmount)
                {
                    AutoFormatExpression = "Purchase Header"."Currency Code";
                    AutoFormatType = 1;
                }

                //Totals
                trigger OnAfterGetRecord()
                var
                    TempPrepmtPurchLine: Record "Purchase Line" temporary;
                    TempPurchLine: Record "Purchase Line" temporary;
                    TempPrepaymentInvLineBuffer: Record "Prepayment Inv. Line Buffer" temporary;
                    TempPrepmtVATAmountLine: Record "VAT Amount Line" temporary;
                    TempPrePmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
                    PurchasePostPrepayments: Codeunit "Purchase-Post Prepayments";
                    PurchPost: Codeunit "Purch.-Post";
                begin
                    Clear(TempPurchLine);
                    Clear(PurchPost);
                    TempPurchLine.DeleteAll();
                    TempVATAmountLine.DeleteAll();
                    PurchPost.GetPurchLines("Purchase Header", TempPurchLine, 0);
                    TempPurchLine.CalcVATAmountLines(0, "Purchase Header", TempPurchLine, TempVATAmountLine);
                    TempPurchLine.UpdateVATOnLines(0, "Purchase Header", TempPurchLine, TempVATAmountLine);
                    VATAmount := TempVATAmountLine.GetTotalVATAmount();
                    VATBaseAmount := TempVATAmountLine.GetTotalVATBase();
                    VATDiscountAmount :=
                      TempVATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code", "Purchase Header"."Prices Including VAT");
                    TotalAmountInclVAT := TempVATAmountLine.GetTotalAmountInclVAT();

                    TempPrepaymentInvLineBuffer.DeleteAll();
                    PurchasePostPrepayments.GetPurchLines("Purchase Header", 0, TempPrepmtPurchLine);
                    if not TempPrepmtPurchLine.IsEmpty() then begin
                        PurchasePostPrepayments.GetPurchLinesToDeduct("Purchase Header", TempPurchLine);
                        if not TempPurchLine.IsEmpty() then
                            PurchasePostPrepayments.CalcVATAmountLines("Purchase Header", TempPurchLine, TempPrePmtVATAmountLineDeduct, 1);
                    end;
                    PurchasePostPrepayments.CalcVATAmountLines("Purchase Header", TempPrepmtPurchLine, TempPrepmtVATAmountLine, 0);
                    TempPrepmtVATAmountLine.DeductVATAmountLine(TempPrePmtVATAmountLineDeduct);
                    PurchasePostPrepayments.UpdateVATOnLines("Purchase Header", TempPrepmtPurchLine, TempPrepmtVATAmountLine, 0);
                    PurchasePostPrepayments.BuildInvLineBuffer("Purchase Header", TempPrepmtPurchLine, 0, TempPrepaymentInvLineBuffer);
                    PrepmtVATAmount := TempPrepmtVATAmountLine.GetTotalVATAmount();
                    PrepmtVATBaseAmount := TempPrepmtVATAmountLine.GetTotalVATBase();
                    PrepmtTotalAmountInclVAT := TempPrepmtVATAmountLine.GetTotalAmountInclVAT();
                end;
            }

            //Purchase Header
            trigger OnAfterGetRecord()
            begin
                if not PictureCalculated then begin
                    CompanyInformation.Get();
                    CompanyInformation.CalcFields(Picture);
                    PictureCalculated := true;
                end;

                TotalAmount := 0;
                TotalSubTotal := 0;
                TotalInvoiceDiscountAmount := 0;

                FormatAddressFields("Purchase Header");
                /*FormatDocumentFields("Purchase Header");
                if BuyFromContact.Get("Buy-from Contact No.") then;
                if PayToContact.Get("Pay-to Contact No.") then;

                if not IsReportInPreviewMode() then begin
                    CODEUNIT.Run(CODEUNIT::"Purch.Header-Printed", "Purchase Header");
                    if ArchiveDocument then
                        ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);
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
            LayoutFile = 'src\Layouts\PurchaseOrder.rdl';
        }
    }

    labels
    {
        //Header
        PurchaseOrderUCaseLbl = 'PURCHASE ORDER';
        PurchaseOrderLbl = 'Purchase Order';
        PurchaseOrderDateLbl = 'Purchase Order Date';
        ToLbl = 'To:';
        BillToLbl = 'Bill To:';
        ShipToLbl = 'Ship To:';
        PageLbl = 'Page %1 of %2';
        //Line Captions
        RequestedReceiptDateLbl = 'Requested Receipt Date';
        ExpectedReceiptDateLbl = 'Expected Receipt Date';
        ItemNoLbl = 'Item No.';
        DescriptionLbl = 'Description';
        QuantityLbl = 'Quantity';
        UnitCostLbl = 'Unit Cost';
        TotalPriceLBl = 'Total Price';
        //Totals
        SubtotalLbl = 'Subtotal:';
        InvoiceDiscountLbl = 'Invoice Discount';
        TaxLbl = 'Tax';
        TotalLbl = 'Total USD';
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
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        BuyFromAddress: array[8] of Text[100];
        BillToAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
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

        f: report "Standard Purchase - Order";
        r: page "Purchase Order";


    local procedure FormatAddressFields(var PurchaseHeader: Record "Purchase Header")
    var
        RespCenter: Record "Responsibility Center";
    begin
        FormatAddress.GetCompanyAddr(PurchaseHeader."Responsibility Center", RespCenter, CompanyInformation, BillToAddress);
        FormatAddress.PurchHeaderBuyFrom(BuyFromAddress, PurchaseHeader);
        FormatAddress.PurchHeaderShipTo(ShipToAddress, PurchaseHeader);
    end;
}