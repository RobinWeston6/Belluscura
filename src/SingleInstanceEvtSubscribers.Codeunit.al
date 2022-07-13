codeunit 56703 "SK Sngl Inst. Evt. Subscribers"
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnInsertRecordEvent', '', false, false)]
    //Run when opening the item tracking line page, bind when page opens from assembly order
    local procedure CreateSNCollectionEntry(var Rec: Record "Tracking Specification")
    var
        SNCollectionEntry: Record "SK SN Collection Entry";
    begin
        Rec.CreateSNCollectionEntry(AssemblyHeader);
    end;


    trigger OnRun()
    begin

    end;

    var
        AssemblyHeader: Record "Assembly Header";

    procedure SetAssemblyHeader(NewAssemblyHeader: Record "Assembly Header")
    begin
        AssemblyHeader := NewAssemblyHeader;
    end;
}