pageextension 56714 "SK2 Sales Return Order" extends "Sales Return Order"
{
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
        modify("Return Receipts")
        {
            Visible = false;
        }
        modify("Cred&it Memos")
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
        modify(Release)
        {
            Visible = false;
        }
        modify(Reopen)
        {
            Visible = false;
        }
        modify(CalculateInvoiceDiscount)
        {
            Visible = false;
        }
        modify("Apply Entries")
        {
            Visible = false;
        }
        modify("Create Return-Related &Documents")
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
        modify("Post and &Print")
        {
            Visible = false;
        }
        modify(GetPostedDocumentLinesToReverse)
        {
            Visible = false;
        }
        modify("Archive Document")
        {
            Visible = false;
        }
        modify("Send IC Return Order Cnfmn.")
        {
            Visible = false;
        }

        modify("Preview Posting")
        {
            Visible = false;
        }
        modify(DocAttach)
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
        modify(SendApprovalRequest)
        {
            Visible = false;
        }
        modify(CancelApprovalRequest)
        {
            Visible = false;
        }
    }
}