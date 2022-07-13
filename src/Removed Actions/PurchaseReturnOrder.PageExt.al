pageextension 56710 "SK Purchase Return Order" extends "Purchase Return Order"
{
    actions
    {
        modify(Statistics)
        {
            Visible = false;
        }
        modify(Vendor)
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
        modify("Return Shipments")
        {
            Visible = false;
        }
        modify("Cred&it Memos")
        {
            Visible = false;
        }
        modify("Warehouse Shipment Lines")
        {
            Visible = false;
        }
        modify("In&vt. Put-away/Pick Lines")
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
        modify("&Print")
        {
            Visible = false;
        }
        modify(AttachAsPDF)
        {
            Visible = false;
        }
        modify("Re&lease")
        {
            Visible = false;
        }
        modify(Reopen)
        {
            Visible = false;
        }
        modify(GetPostedDocumentLinesToReverse)
        {
            Visible = false;
        }
        modify("Apply Entries")
        {
            Visible = false;
        }
        modify(CalculateInvoiceDiscount)
        {
            Visible = false;
        }
        modify(CopyDocument)
        {
            Visible = false;
        }
        modify("Move Negative Lines")
        {
            Visible = false;
        }
        modify("Archive Document")
        {
            Visible = false;
        }
        modify("Send IC Return Order")
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
        modify("Create &Warehouse Shipment")
        {
            Visible = false;
        }
        modify("Create Inventor&y Put-away/Pick")
        {
            Visible = false;
        }
        modify(Post)
        {
            Visible = false;
        }
        modify(Preview)
        {
            Visible = false;
        }
        modify(TestReport)
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
        modify(DocAttach)
        {
            Visible = false;
        }
    }
}