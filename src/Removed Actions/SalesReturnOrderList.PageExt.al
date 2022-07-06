pageextension 56615 "SK Sales Return Order List" extends "Sales Return Order List"
{
    actions
    {
        modify(Statistics)
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
        modify("Get Posted Doc&ument Lines to Reverse")
        {
            Visible = false;
        }
        modify("Send IC Return Order Cnfmn.")
        {
            Visible = false;
        }
        modify("Delete Invoiced Orders")
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
        modify("Create Inventor&y Put-away/Pick")
        {
            Visible = false;
        }
        modify("Create &Whse. Receipt")
        {
            Visible = false;
        }
        modify("Test Report")
        {
            Visible = false;
        }

        modify("Preview Posting")
        {
            Visible = false;
        }
        modify("Post and &Print")
        {
            Visible = false;
        }
        modify("Post and Email")
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
    }
}