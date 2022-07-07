codeunit 56600 "SK Barcode Mgt."
{
    SingleInstance = true;
    //EventSubscriberInstance = Manual;

    var
        SNCollection: Record "SK Serial No. Collection";
        AssemblyHeader: Record "Assembly Header";
        ExtraSieveBed: Boolean;

    procedure InitSNCollection()
    begin
        clear(SNCollection);
        SNCollection.Init();
    end;

    procedure SetAssemblyHeader(NewAssemblyHeader: Record "Assembly Header")
    begin
        AssemblyHeader := NewAssemblyHeader;
    end;

    procedure ClearAssemblyHeader()
    begin
        Clear(AssemblyHeader);
    end;

    procedure SetExtraSieveBed(NewExtraSieveBed: Boolean)
    begin
        ExtraSieveBed := NewExtraSieveBed;
    end;


    //[EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterValidateEvent', 'Serial No.', false, false)]
    procedure StoreSerialNo(var Rec: Record "Tracking Specification")
    var
        Item: Record Item;
    begin
        if AssemblyHeader."No." = '' then
            exit;

        if not Item.Get(Rec."Item No.") then
            exit;

        case Item."SK X-PLOR Component" of
            "SK X-PLOR Component"::" ":
                exit;
            "SK X-PLOR Component"::Battery:
                begin
                    SNCollection."Battery Item No." := Rec."Item No.";
                    SNCollection."Battery Serial No." := Rec."Serial No.";
                end;
            "SK X-PLOR Component"::Unit:
                begin
                    SNCollection."Unit Item No." := Rec."Item No.";
                    SNCollection."Unit Serial No." := Rec."Serial No.";
                end;
            "SK X-PLOR Component"::"Sieve Bed":
                if (SNCollection."Sieve Bed Serial No." <> '') and (ExtraSieveBed) then begin
                    SNCollection."Sieve Bed 2 Item No." := Rec."Item No.";
                    SNCollection."Sieve Bed 2 Serial No." := Rec."Serial No."
                end else begin
                    SNCollection."Sieve Bed Item No." := Rec."Item No.";
                    SNCollection."Sieve Bed Serial No." := Rec."Serial No.";
                end;
        end;

        if AllComponentsFilled() then
            CreateNewSNCollection();
    end;

    local procedure AllComponentsFilled(): Boolean
    begin
        exit(
            (SNCollection."Battery Item No." <> '') and
            (SNCollection."Battery Serial No." <> '') and
            (SNCollection."Unit Item No." <> '') and
            (SNCollection."Unit Serial No." <> '') and
            (SNCollection."Sieve Bed Item No." <> '') and
            (SNCollection."Sieve Bed Serial No." <> '') and
            (
                (not ExtraSieveBed) or
                (
                    (SNCollection."Sieve Bed 2 Item No." <> '') and
                    (SNCollection."Sieve Bed 2 Serial No." <> '')
                )
            )
        )
    end;

    procedure CreateNewSNCollection()
    begin
        SNCollection."Item No." := AssemblyHeader."Item No.";
        SNCollection."Source Assembly Document" := AssemblyHeader."Document Type";
        SNCollection."Source Assembly Doc. No." := AssemblyHeader."No.";
        SNCollection."Active Assembly" := true;
        SNCollection.Insert(true);
        PrintLabel();
        InitSNCollection();
    end;

    local procedure PrintLabel()
    var
        SNCollection2: Record "SK Serial No. Collection";
        BarcodeLabel: Report "SK Barcode Label";
    begin
        SNCollection2.SetRange(SKU, SNCollection.SKU);
        BarcodeLabel.SetTableView(SNCollection2);
        BarcodeLabel.UseRequestPage(false);
        BarcodeLabel.Run();
    end;


}