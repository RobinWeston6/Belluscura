codeunit 56704 "SK2 Event Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnAfterOnRun', '', false, false)]
    local procedure PrintBarcodeLabel(var AssemblyHeader: Record "Assembly Header")
    var
        SNCollectionEntry: Record "SK SN Collection Entry";
        BarcodeLabel: Report "SK2 Barcode Label";
    begin
        SNCollectionEntry.SetRange("Source Assembly Document", AssemblyHeader."Document Type");
        SNCollectionEntry.SetRange("Source Assembly Doc. No.", AssemblyHeader."No.");
        BarcodeLabel.SetTableView(SNCollectionEntry);
        BarcodeLabel.UseRequestPage(true);
        BarcodeLabel.Run();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnShowEarlyOrderDateMessageOnAfterCalcShowMessage', '', false, false)]
    local procedure HideMessage(var ShowMessage: Boolean)
    begin
        ShowMessage := false;
    end;

    [EventSubscriber(ObjectType::Report, Report::"Adjust Cost - Item Entries", 'OnBeforePreReport', '', false, false)]
    local procedure SkipAdHocItems(var Item: Record Item)
    begin
        Item.FilterGroup(2);
        Item.SetFilter("No.", '<>%1', 'AD HOC');
        Item.FilterGroup(0);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeCheckShipmentDateBeforeWorkDate', '', False, False)]
    local procedure CheckShipmentDateBeforeWorkDate(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; var HasBeenShown: Boolean; var IsHandled: Boolean)
    begin
        IsHandled := True;
    end;
}