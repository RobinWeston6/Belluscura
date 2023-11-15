pageextension 56713 "SK2 Sales Order List" extends "Sales Order List"
{
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
        modify("S&hipments")
        {
            Visible = false;
        }
        modify(PostedSalesInvoices)
        {
            Visible = false;
        }
        modify(PostedSalesPrepmtInvoices)
        {
            Visible = false;
        }
        modify("Prepayment Credi&t Memos")
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
        modify(CRMGoToSalesOrderListInNAV)
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
        modify("Pla&nning")
        {
            Visible = false;
        }
        modify("Order &Promising")
        {
            Visible = false;
        }
        modify("Send IC Sales Order Cnfmn.")
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
        modify("Create Inventor&y Put-away/Pick")
        {
            Visible = false;
        }
        modify("Create &Warehouse Shipment")
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
        modify("Post &Batch")
        {
            Visible = false;
        }
        modify("Remove From Job Queue")
        {
            Visible = false;
        }
        modify("Preview Posting")
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
        modify("Email Confirmation")
        {
            Visible = false;
        }
        /*modify("Print Confirmation")
        {
            Visible = false;
        }*/
        modify(AttachAsPDF)
        {
            Visible = false;
        }
        modify("Sales Reservation Avail.")
        {
            Visible = false;
        }
    }
}