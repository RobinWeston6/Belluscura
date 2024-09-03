codeunit 56702 "SK2 Barcd Scan Manual Evt Mgt."
{
    EventSubscriberInstance = Manual;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeConfirmPost', '', false, false)]
    local procedure ForceReceive(var PurchaseHeader: Record "Purchase Header"; var HideDialog: Boolean; var DefaultOption: Integer)
    begin
        DefaultOption := 1;
        HideDialog := true;
        PurchaseHeader.Receive := true;
        PurchaseHeader.Invoice := false;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmSalesPost', '', false, false)]
    local procedure ForceShip(var SalesHeader: Record "Sales Header"; var HideDialog: Boolean; var DefaultOption: Integer)
    begin
        DefaultOption := 1;
        HideDialog := true;
        SalesHeader.Ship := true;
        SalesHeader.Invoice := false;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly Line Management", 'OnBeforeUpdateAssemblyLines', '', false, false)]
    local procedure AllowAssLinesPopulate(FieldNum: Integer; CurrentFieldNum: Integer; ReplaceLinesFromBOM: Boolean; var AsmHeader: Record "Assembly Header")
    begin
        CurrentFieldNum := AsmHeader.FieldNo(Quantity);
        FieldNum := AsmHeader.FieldNo(Quantity);
        ReplaceLinesFromBOM := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Assembly Header", 'OnBeforeValidateDates', '', false, false)]
    local procedure SkipDateCheck(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;
}