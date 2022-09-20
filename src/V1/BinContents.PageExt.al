pageextension 56718 "SK2 Bin Contents" extends "Bin Contents"
{
    layout
    {
        modify(ZoneCode)
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Zone Code")
        {
            Visible = false;
        }
        addafter("Item No.")
        {
            Field("SK2 Item Description"; SKItem.Description)
            {
                ApplicationArea = All;
                Caption = 'Item Description';
            }
        }
        modify("Variant Code")
        {
            Visible = false;
        }
        modify("Unit of Measure Code")
        {
            Visible = false;
        }
        modify("Qty. per Unit of Measure")
        {
            Visible = false;
        }
        modify(Default)
        {
            Visible = false;
        }
        modify(Dedicated)
        {
            Visible = false;
        }
        modify("Warehouse Class Code")
        {
            Visible = false;
        }
        modify("Bin Type Code")
        {
            Visible = false;
        }
        modify("Bin Ranking")
        {
            Visible = false;
        }
        modify("Block Movement")
        {
            Visible = false;
        }
        modify("Min. Qty.")
        {
            Visible = false;
        }
        modify("Max. Qty.")
        {
            Visible = false;
        }
        modify(CalcQtyUOM)
        {
            Visible = false;
        }
        modify("Pick Quantity (Base)")
        {
            Visible = false;
        }
        modify("ATO Components Pick Qty (Base)")
        {
            Visible = false;
        }
        modify("Negative Adjmt. Qty. (Base)")
        {
            Visible = false;
        }
        modify("Put-away Quantity (Base)")
        {
            Visible = false;
        }
        modify("Positive Adjmt. Qty. (Base)")
        {
            Visible = false;
        }
        modify("Fixed")
        {
            Visible = false;
        }
        modify("Cross-Dock Bin")
        {
            Visible = false;
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Item No." <> SKItem."No." then
            if not SKItem.Get(Rec."Item No.") then
                Clear(SKItem);
    end;

    var
        SKItem: Record Item;
        f: page 6512;
}