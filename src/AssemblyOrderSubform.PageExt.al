pageextension 56703 "SK2 Assembly Order Subform" extends "Assembly Order Subform"
{
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