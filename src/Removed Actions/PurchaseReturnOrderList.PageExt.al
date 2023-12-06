pageextension 56711 "SK2 Purch. Return Order List" extends "Purchase Return Order List"
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
        modify("Return Shipments")
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
        modify("Warehouse Shipment Lines")
        {
            Visible = false;
        }
        modify(Print)
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
        modify("Send IC Return Order")
        {
            Visible = false;
        }
        modify("Delete Invoiced Orders")
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
        modify(TestReport)
        {
            Visible = false;
        }

        modify(PostSelected)
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