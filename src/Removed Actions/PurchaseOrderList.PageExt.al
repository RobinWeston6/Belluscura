pageextension 56609 "SK Purchase Order List" extends "Purchase Order List"
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
        modify(Approvals)
        {
            Visible = false;
        }
        modify("Co&mments")
        {
            Visible = false;
        }
        modify(Receipts)
        {
            Visible = false;
        }
        modify(PostedPurchaseInvoices)
        {
            Visible = false;
        }
        modify(PostedPurchasePrepmtInvoices)
        {
            Visible = false;
        }
        modify("Prepayment Credi&t Memos")
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
        modify(Print)
        {
            Visible = false;
        }
        modify(Send)
        {
            Visible = false;
        }
        modify(AttachAsPDF)
        {
            Visible = false;
        }
        modify(Release)
        {
            Visible = false;
        }
        modify(Reopen)
        {
            Visible = false;
        }
        modify("Send IC Purchase Order")
        {
            Visible = false;
        }
        modify("Delete Invoiced")
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
        modify("Create &Whse. Receipt")
        {
            Visible = false;
        }
        modify("Create Inventor&y Put-away/Pick")
        {
            Visible = false;
        }
        modify(TestReport)
        {
            Visible = false;
        }

        modify(Preview)
        {
            Visible = false;
        }
        modify(PostAndPrint)
        {
            Visible = false;
        }
        modify(PostBatch)
        {
            Visible = false;
        }
        modify(RemoveFromJobQueue)
        {
            Visible = false;
        }
    }
}