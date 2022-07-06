codeunit 56603 "SK Barcode Evt. Mgt."
{
    trigger OnRun()
    begin

    end;

    /*[EventSubscriber(ObjectType::Page, Page::"Assembly Order", 'OnInsertRecordEvent', '', false, false)]
    local procedure MyProcedure()
    begin
        
    end;*/

    /*[EventSubscriber(ObjectType::Table, Database::"Assembly Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure MyProcedure(var Rec: Record "Assembly Header")
    var
        Item: Record Item;
        BarcodeSetup: Record "SK Barcode Setup";
    begin
        BarcodeSetup.GetRecordOnce();
        //  if xRec."Item No." <> '' then
        //Item.Get(xRec."Item No.")
        //else
        Item.Get(BarcodeSetup."Default Assembly Item");
        Rec.Validate("Item No.", Item."No.");
        //Rec.Validate(Quantity, 1);
    end;*/

    var
        myInt: Integer;
}