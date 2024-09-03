pageextension 56704 "SK2 Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {
        addafter("Planned Shipment Date")
        {
            field("SK2 Expected Receipt Date"; Rec."SK2 Expected Receipt Date")
            {
                ApplicationArea = all;
            }
        }
        modify("Item Reference No.")
        {
            Visible = false;
        }
        modify("Description 2")
        {
            Visible = false;
        }
        modify("Bin Code")
        {
            Visible = true;
        }
        modify("Qty. to Assemble to Order")
        {
            Visible = false;
        }
        modify("Reserved Quantity")
        {
            Visible = false;
        }
        modify("Unit of Measure Code")
        {
            Visible = false;
        }
        modify("Unit Price")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Line Discount %")
        {
            Visible = false;
        }
        modify("Line Amount")
        {
            Visible = false;
        }
        modify("Qty. to Invoice")
        {
            Visible = false;
        }
        modify("Quantity Invoiced")
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        modify("Planned Delivery Date")
        {
            Visible = false;
        }
        modify("Planned Shipment Date")
        {
            Visible = false;
        }
        modify("Shipment Date")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify(ShortcutDimCode3)
        {
            Visible = false;
        }
        modify(ShortcutDimCode4)
        {
            Visible = false;
        }
        modify(ShortcutDimCode5)
        {
            Visible = false;
        }
        modify(ShortcutDimCode6)
        {
            Visible = false;
        }
        modify(ShortcutDimCode7)
        {
            Visible = false;
        }
        modify(ShortcutDimCode8)
        {
            Visible = false;
        }
    }
    actions
    {
        addfirst("&Line")
        {
            action("SK2 Serial No.s")
            {
                Caption = 'Serial No.s';
                ApplicationArea = All;
                Image = SerialNo;

                trigger OnAction()
                begin
                    ShowComments();
                end;

            }
        }
        //Remove actions
        modify(SelectMultiItems)
        {
            Visible = false;
        }
        modify(GetPrices)
        {
            Visible = false;
        }
        modify(GetLineDiscount)
        {
            Visible = false;
        }
        modify(ExplodeBOM_Functions)
        {
            Visible = false;
        }
        modify("Insert Ext. Texts")
        {
            Visible = false;
        }
        modify(Reserve)
        {
            Visible = false;
        }
        modify(OrderTracking)
        {
            Visible = false;
        }
        modify("Select Nonstoc&k Items")
        {
            Visible = false;
        }
        modify("<Action3>")
        {
            Visible = false;
        }
        modify(ItemAvailabilityByPeriod)
        {
            Visible = false;
        }
        modify(ItemAvailabilityByVariant)
        {
            Visible = false;
        }
        modify(ItemAvailabilityByLocation)
        {
            Visible = false;
        }
        modify(Lot)
        {
            Visible = false;
        }
        modify("BOM Level")
        {
            Visible = false;
        }
        modify(ItemAvailabilityByUnitOfMeasure)
        {
            Visible = false;
        }
        modify("Reservation Entries")
        {
            Visible = false;
        }
        modify(ItemTrackingLines)
        {
            Enabled = true;
            Caption = 'Serial Numbers';
        }
        modify(SelectItemSubstitution)
        {
            Visible = false;
        }
        modify(Dimensions)
        {
            Visible = false;
        }
        modify("Co&mments")
        {
            Visible = false;
        }
        modify("Item Charge &Assignment")
        {
            Visible = false;
        }
        modify(OrderPromising)
        {
            Visible = false;
        }
        modify(DocAttach)
        {
            Visible = false;
        }
        modify(AssembleToOrderLines)
        {
            Visible = false;
        }
        modify("Roll Up &Price")
        {
            Visible = false;
        }
        modify("Roll Up &Cost")
        {
            Visible = false;
        }
        modify(DocumentLineTracking)
        {
            Visible = false;
        }
        modify(DeferralSchedule)
        {
            Visible = false;
        }
        modify("Purchase &Order")
        {
            Visible = false;
        }
        modify(OpenSpecialPurchaseOrder)
        {
            Visible = false;
        }
        modify(BlanketOrder)
        {
            Visible = false;
        }
        modify(EditInExcel)
        {
            Visible = false;
        }
    }

    procedure ShowComments()
    var
        SalesCommentLine: Record "Sales Comment Line";
        SalesSNCommentSheet: Page "SK2 Sales Serial No.s Comments";
    begin
        Rec.TestField("Document No.");
        Rec.TestField("Line No.");
        SalesCommentLine.SetRange("Document Type", Rec."Document Type");
        SalesCommentLine.SetRange("No.", Rec."Document No.");
        SalesCommentLine.SetRange("Document Line No.", Rec."Line No.");
        SalesSNCommentSheet.SetTableView(SalesCommentLine);
        SalesSNCommentSheet.RunModal;
    end;
}