pageextension 56708 "SK2 Purchase Order" extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("SK2 Department"; Rec."SK2 Department")
            {
                ApplicationArea = All;
            }
            field("SK2 Approver"; Rec."SK2 Approver")
            {
                ApplicationArea = All;
                OptionCaption = ' ,Keith Cook,,Paul Bray,Sarah Clark,Brian Brown,Dwayne Thompson,Mark Vines';
            }
            field("SK2 Date To Be Issued"; Rec."SK2 Date To Be Issued")
            {
                ApplicationArea = All;
            }
            field("SK2 Issued"; Rec."SK2 Issued")
            {
                ApplicationArea = All;
            }
            /*field("SK2 Engineering Type"; Rec."SK2 Engineering Type")
            {
                ApplicationArea = All;
            }
            field("SK2 Project"; Rec."SK2 Project")
            {
                ApplicationArea = All;
            }
            field("SK2 Expense Type"; Rec."SK2 Expense Type")
            {
                ApplicationArea = All;
            }*/
        }
        addafter(Status)
        {
            field("SK2 Ext. Status"; Rec."SK2 Ext. Status")
            {
                ApplicationArea = All;
                StyleExpr = ExtStatusStyleTxt;
            }
        }
        //Remove fields
        modify("No.")
        {
            Visible = false;
        }
        modify("Buy-from Vendor No.")
        {
            Visible = false;
        }
        modify("Buy-from Contact")
        {
            Importance = Additional;
        }
        modify("Posting Description")
        {
            Visible = false;
        }
        modify("Buy-from Address")
        {
            Visible = false;
        }
        modify("Buy-from Address 2")
        {
            Visible = false;
        }
        modify("Buy-from City")
        {
            Visible = false;
        }
        modify("Buy-from County")
        {
            Visible = false;
        }
        modify("Buy-from Post Code")
        {
            Visible = false;
        }
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        modify("Buy-from Contact No.")
        {
            Visible = false;
        }
        modify(BuyFromContactPhoneNo)
        {
            Visible = false;
        }
        modify(BuyFromContactMobilePhoneNo)
        {
            Visible = false;
        }
        modify(BuyFromContactEmail)
        {
            Visible = false;
        }
        modify("Document Date")
        {
            Importance = Additional;
        }
        modify("Posting Date")
        {
            Visible = false;
        }
        modify("Due Date")
        {
            Visible = false;
        }
        modify("Vendor Invoice No.")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Visible = false;
        }
        modify("No. of Archived Versions")
        {
            Visible = false;
        }
        modify("Order Date")
        {
            Visible = false;
        }
        modify("Quote No.")
        {
            Visible = false;
        }
        modify("Vendor Order No.")
        {
            Visible = false;
        }
        modify("Vendor Shipment No.")
        {
            Importance = Additional;
        }
        modify("Order Address Code")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify(Status)
        {
            Visible = false;
        }
        modify("Job Queue Status")
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = false;
        }
        modify("Expected Receipt Date")
        {
            Visible = false;
        }
        modify("Prices Including VAT")
        {
            Visible = false;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Payment Terms Code")
        {
            Visible = false;
        }
        /*modify("Payment Method Code")
        {
            Visible = false;        }*/
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify("Payment Discount %")
        {
            Visible = false;
        }
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Tax Liable")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Shipment Method Code")
        {
            Visible = false;
        }
        modify("Payment Reference")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("On Hold")
        {
            Visible = false;
        }
        modify("Inbound Whse. Handling Time")
        {
            Visible = false;
        }
        modify("Lead Time Calculation")
        {
            Visible = false;
        }
        modify("Requested Receipt Date")
        {
            Visible = false;
        }
        modify("Promised Receipt Date")
        {
            Visible = false;
        }
        modify(ShippingOptionWithLocation)
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Sell-to Customer No.")
        {
            Visible = false;
        }
        modify("Ship-to Code")
        {
            Visible = false;
        }
        modify("Ship-to Name")
        {
            Visible = false;
        }
        modify("Ship-to Address")
        {
            Visible = false;
        }
        modify("Ship-to Address 2")
        {
            Visible = false;
        }
        modify("Ship-to City")
        {
            Visible = false;
        }
        modify("Ship-to County")
        {
            Visible = false;
        }
        modify("Ship-to Post Code")
        {
            Visible = false;
        }
        modify("Ship-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Ship-to Contact")
        {
            Visible = false;
        }
        modify(PayToOptions)
        {
            Visible = false;
        }
        modify("Pay-to Name")
        {
            Visible = false;
        }
        modify("Pay-to Address")
        {
            Visible = false;
        }
        modify("Pay-to Address 2")
        {
            Visible = false;
        }
        modify("Pay-to City")
        {
            Visible = false;
        }
        modify("Pay-to County")
        {
            Visible = false;
        }
        modify("Pay-to Post Code")
        {
            Visible = false;
        }
        modify("Pay-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Pay-to Contact No.")
        {
            Visible = false;
        }
        modify("Pay-to Contact")
        {
            Visible = false;
        }
        modify(PayToContactPhoneNo)
        {
            Visible = false;
        }
        modify(PayToContactMobilePhoneNo)
        {
            Visible = false;
        }
        modify(PayToContactEmail)
        {
            Visible = false;
        }
        modify("Transaction Specification")
        {
            Visible = false;
        }
        modify("Transaction Type")
        {
            Visible = false;
        }
        modify("Transport Method")
        {
            Visible = false;
        }
        modify("Entry Point")
        {
            Visible = false;
        }
        modify("Area")
        {
            Visible = false;
        }
        modify("Prepayment %")
        {
            Visible = false;
        }
        modify("Compress Prepayment")
        {
            Visible = false;
        }
        modify("Prepmt. Payment Terms Code")
        {
            Visible = false;
        }
        modify("Prepayment Due Date")
        {
            Visible = false;
        }
        modify("Prepmt. Payment Discount %")
        {
            Visible = false;
        }
        modify("Prepmt. Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Vendor Cr. Memo No.")
        {
            Visible = false;
        }
    }
    actions
    {
        modify(Dimensions)
        {
            Visible = false;
        }
        modify(Statistics)
        {
            Visible = false;
        }
        modify(Vendor)
        {
            Visible = false;
        }
        //modify(Approvals)
        //{
        //    Visible = false;
        //}
        //modify("Co&mments")
        //{
        //    Visible = false;
        //}
        modify(DocAttach)
        {
            Visible = false;
        }
        modify(Receipts)
        {
            Visible = false;
        }
        modify(Invoices)
        {
            Visible = false;
        }
        modify(PostedPrepaymentInvoices)
        {
            Visible = false;
        }
        modify(PostedPrepaymentCrMemos)
        {
            Visible = false;
        }
        modify("In&vt. Put-away/Pick Lines")
        {
            Visible = false;
        }
        modify("Whse. Receipt Lines")
        {
            Visible = false;
        }
        modify(Warehouse_GetSalesOrder)
        {
            Visible = false;
        }
        modify("Get &Sales Order")
        {
            Visible = false;
        }
        //modify(Approve)
        //{
        //    Visible = false;
        //}
        //modify(Reject)
        //{
        //    Visible = false;
        //}
        modify(Delegate)
        {
            Visible = false;
        }
        modify(Comment)
        {
            Visible = false;
        }
        modify(Release)
        {
            Visible = false;
        }
        /*modify(Reopen)
        {
            Visible = false;
        }*/
        modify(CalculateInvoiceDiscount)
        {
            Visible = false;
        }
        modify(GetRecurringPurchaseLines)
        {
            Visible = false;
        }
        modify("Create Tracking Information")
        {
            Visible = false;
        }
        modify(CopyDocument)
        {
            Visible = false;
        }
        modify(MoveNegativeLines)
        {
            Visible = false;
        }
        modify(Functions_GetSalesOrder)
        {
            Visible = false;
        }
        modify(Action187)
        {
            Visible = false;
        }
        modify("Archive Document")
        {
            Visible = false;
        }
        modify("Send Intercompany Purchase Order")
        {
            Visible = false;
        }
        modify(IncomingDocCard)
        {
            Visible = false;
        }
        modify(SelectIncomingDoc)
        {
            Visible = false;
        }
        modify(IncomingDocAttachFile)
        {
            Visible = false;
        }
        modify(RemoveIncomingDoc)
        {
            Visible = false;
        }
        //modify(SendApprovalRequest)
        //{
        //    Visible = false;
        //}
        //modify(CancelApprovalRequest)
        //{
        //    Visible = false;
        //}
        // modify(CreateFlow)
        // {
        //     Visible = false;
        // }
        modify("Create &Whse. Receipt")
        {
            Visible = false;
        }
        modify("Create Inventor&y Put-away/Pick")
        {
            Visible = false;
        }
        modify(Post)
        {
            Caption = 'Receive';
            Promoted = true;
            PromotedOnly = true;
            PromotedCategory = New;
            trigger OnBeforeAction()
            begin
                if not PostingUnlocked then
                    BindSubscription(EvtMgt);
            end;

            trigger OnAfterAction()
            var
                ReceivedSuccessfullyMsg: Label 'Received Successfully.';
            begin
                if not PostingUnlocked then
                    UnbindSubscription(EvtMgt);
                if GetLastErrorText() = '' then
                    Message(ReceivedSuccessfullyMsg);
            end;
        }
        addafter(Post)
        {
            action(UnlockPosting)
            {
                Caption = 'Unlock Posting';
                Image = Lock;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = New;
                ApplicationArea = All;
                Visible = not PostingUnlocked;
                trigger OnAction()
                begin
                    PostingUnlocked := not PostingUnlocked;
                end;
            }
        }
        modify(Preview)
        {
            Visible = false;
        }
        modify("Post and &Print")
        {
            Visible = false;
        }
        modify(PostAndNew)
        {
            Visible = false;
        }
        modify("Test Report")
        {
            Visible = false;
        }
        modify("Post &Batch")
        {
            Visible = false;
        }
        modify("Remove From Job Queue")
        {
            Visible = false;
        }
        modify("Prepayment Test &Report")
        {
            Visible = false;
        }
        modify(PostPrepaymentInvoice)
        {
            Visible = false;
        }
        modify("Post and Print Prepmt. Invoic&e")
        {
            Visible = false;
        }
        modify(PreviewPrepmtInvoicePosting)
        {
            Visible = false;
        }
        modify(PostPrepaymentCreditMemo)
        {
            Visible = false;
        }
        modify("Post and Print Prepmt. Cr. Mem&o")
        {
            Visible = false;
        }
        modify(PreviewPrepmtCrMemoPosting)
        {
            Visible = false;
        }
        modify(SendCustom)
        {
            Visible = false;
        }
        modify(AttachAsPDF)
        {
            Visible = false;
        }
    }

    var
        EvtMgt: Codeunit "SK2 Barcd Scan Manual Evt Mgt.";
        ExtStatusStyleTxt: Text;
        PostingUnlocked: Boolean;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcExtStatus();
        ExtStatusStyleTxt := Rec.GetExtStatusStyleText();
    end;
}