codeunit 56704 "SK2 Event Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnAfterOnRun', '', false, false)]
    local procedure PrintBarcodeLabel(var AssemblyHeader: Record "Assembly Header")
    var
        SNCollectionEntry: Record "SK2 SN Collection Entry";
        BarcodeLabel: Report "SK2 Barcode Label";
    begin
        SNCollectionEntry.SetRange("Source Assembly Document", AssemblyHeader."Document Type");
        SNCollectionEntry.SetRange("Source Assembly Doc. No.", AssemblyHeader."No.");
        BarcodeLabel.SetTableView(SNCollectionEntry);
        BarcodeLabel.UseRequestPage(true);
        BarcodeLabel.Run();
    end;
}