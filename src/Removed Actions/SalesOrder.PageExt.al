pageextension 56612 "SK Sales Order" extends "Sales Order"
{
    layout
    {
        modify("Sell-to Contact")
        {
            Importance = Additional;
        }
        modify("Posting Date")
        {
            Importance = Additional;
        }
        modify("Order Date")
        {
            Importance = Additional;
        }
        modify("Due Date")
        {
            Importance = Additional;
        }
        modify("Requested Delivery Date")
        {
            Importance = Additional;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Importance = Additional;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Importance = Additional;
        }
    }
    actions
    {
        modify(Statistics)
        {
            Visible = false;
        }
        modify(Customer)
        {
            Visible = false;
        }
        modify(Dimensions)
        {
            Visible = false;
        }
        modify(Approvals)
        {
            Visible = false;
        }
        modify("Co&mments")
        {
            Visible = false;
        }
        modify(AssemblyOrders)
        {
            Visible = false;
        }
        modify(DocAttach)
        {
            Visible = false;
        }
        modify(CRMGoToSalesOrder)
        {
            Visible = false;
        }
        modify(Invoices)
        {
            Visible = false;
        }
        modify("In&vt. Put-away/Pick Lines")
        {
            Visible = false;
        }
        modify("Warehouse Shipment Lines")
        {
            Visible = false;
        }
        modify(PagePostedSalesPrepaymentInvoices)
        {
            Visible = false;
        }
        modify(PagePostedSalesPrepaymentCrMemos)
        {
            Visible = false;
        }
        modify(PageInteractionLogEntries)
        {
            Visible = false;
        }
        modify(Approve)
        {
            Visible = false;
        }
        modify(Reject)
        {
            Visible = false;
        }
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
        modify(CreatePurchaseOrder)
        {
            Visible = false;
        }
        modify(CreatePurchaseInvoice)
        {
            Visible = false;
        }
        modify(CalculateInvoiceDiscount)
        {
            Visible = false;
        }
        modify(GetRecurringSalesLines)
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
        modify("Archive Document")
        {
            Visible = false;
        }
        modify("Send IC Sales Order")
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
        modify(OrderPromising)
        {
            Visible = false;
        }
        modify("Demand Overview")
        {
            Visible = false;
        }
        modify("Pla&nning")
        {
            Visible = false;
        }
        modify(SendApprovalRequest)
        {
            Visible = false;
        }
        modify(CancelApprovalRequest)
        {
            Visible = false;
        }
        modify(CreateFlow)
        {
            Visible = false;
        }
        modify(SeeFlows)
        {
            Visible = false;
        }
        modify("Create Inventor&y Put-away/Pick")
        {
            Visible = false;
        }
        modify("Create &Warehouse Shipment")
        {
            Visible = false;
        }
        modify(Post)
        {
            Caption = 'Send';
            Promoted = true;
            PromotedOnly = true;
            PromotedCategory = New;
            Visible = true;
            trigger OnBeforeAction()
            begin
                if not PostingUnlocked then
                    BindSubscription(EvtMgt);
            end;

            trigger OnAfterAction()
            var
                ShippedSuccessfullyMsg: Label 'Shipped Successfully.';
            begin
                if not PostingUnlocked then
                    UnbindSubscription(EvtMgt);
                if GetLastErrorText() = '' then
                    Message(ShippedSuccessfullyMsg);
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


        modify(PostAndNew)
        {
            Visible = false;
        }
        modify(PostAndSend)
        {
            Visible = false;
        }
        modify("Test Report")
        {
            Visible = false;
        }
        modify("Remove From Job Queue")
        {
            Visible = false;
        }
        modify(PreviewPosting)
        {
            Visible = false;
        }
        modify(ProformaInvoice)
        {
            Visible = false;
        }
        modify("Prepayment &Test Report")
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
        modify("Work Order")
        {
            Visible = false;
        }
        modify("Pick Instruction")
        {
            Visible = false;
        }
        modify(SendEmailConfirmation)
        {
            Visible = false;
        }
        modify("Print Confirmation")
        {
            Visible = false;
        }
        modify(AttachAsPDF)
        {
            Visible = false;
        }
    }

    var
        EvtMgt: Codeunit "SK Barcd Scan Manual Evt Mgt.";
        PostingUnlocked: Boolean;
}