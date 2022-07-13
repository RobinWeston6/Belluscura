pageextension 56703 "SK Assembly Order Subform" extends "Assembly Order Subform"
{
    layout
    {

    }

    actions
    {
        modify("Event")
        {
            Visible = false;
        }
        modify(Period)
        {
            Visible = false;
        }
        modify(Variant)
        {
            Visible = false;
        }
        modify(Location)
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
        modify("Reservation Entries")
        {
            Visible = false;
        }
        modify("Show Warning")
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
        modify(AssemblyBOM)
        {
            Visible = false;
        }
        modify(SelectItemSubstitution)
        {
            Visible = false;
        }
        modify(ExplodeBOM)
        {
            Visible = false;
        }
        modify("Reserve Item")
        {
            Visible = false;
        }
        modify("Order &Tracking")
        {
            Visible = false;
        }
    }


    procedure OpenAllTrackingLines()
    var
        AssemblyLine: Record "Assembly Line";
    begin
        AssemblyLine.Copy(Rec);
        if Rec.FindFirst() then
            repeat
                if RecIsSerialTracked() then
                    Rec.OpenItemTrackingLines();
            until Rec.Next = 0;
    end;

    procedure RecIsSerialTracked(): Boolean
    var
        Item: Record Item;
    begin
        if Rec.Type <> Rec.Type::Item then
            exit(false);

        if Item.Get(Rec."No.") then begin
            exit(Item."Item Tracking Code" = 'SERIAL');
        end;
    end;
}