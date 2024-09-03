pageextension 56702 "SK2 Assembly Order" extends "Assembly Order"
{
    layout
    {
        modify("Item No.")
        {
            trigger OnAfterValidate()
            var
            begin
                if Rec."Item No." <> '' then begin
                    Item.Get(Rec."Item No.");
                    Rec.Validate("Shortcut Dimension 1 Code", Item."Global Dimension 1 Code");

                    //Rec.Validate(Quantity, 1);
                end else begin
                    Clear(Rec);
                    exit;
                end;
            end;
        }
        addafter("Item No.")
        {
            field("SK2 SKU"; Rec."SK2 SKU")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addfirst(navigation)
        {
            action("SK2 Item Tracking")
            {
                Caption = 'Serial Numbers';
                ApplicationArea = all;

                trigger OnAction()
                var
                    SingleInstanceEvtMgt: Codeunit "SK2 Create SN Colln. ManEvtSub";
                begin
                    BindSubscription(SingleInstanceEvtMgt);
                    SingleInstanceEvtMgt.SetAssemblyheader(Rec);
                    ItemTracking();
                    Clear(SingleInstanceEvtMgt);
                    UnbindSubscription(SingleInstanceEvtMgt);
                end;
            }
        }

    }

    trigger OnOpenPage()
    begin
        //DELETE//BarcodeSetup.GetRecordOnce();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        AssemblyLine: Record "Assembly Line";
        BarcodeScanManualEvtMgt: Codeunit "SK2 Barcd Scan Manual Evt Mgt.";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        //DELETE//BarcodeSetup.GetRecordOnce();

        Rec.Validate("Due Date", WorkDate + 2);

        if xRec."Item No." <> '' then
            Item.Get(xRec."Item No.");

        BindSubscription(BarcodeScanManualEvtMgt);
        Rec.Validate("Item No.", Item."No.");
        UnbindSubscription(BarcodeScanManualEvtMgt);

        //Rec."Bin Code" := BarcodeSetup."Default Bin";
        //Rec."Location Code" := BarcodeSetup."Default Location";
        Rec.Validate("Due Date");
        Rec.Validate("Shortcut Dimension 1 Code", Item."Global Dimension 1 Code");
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
    end;

    procedure ItemTracking()
    var
        AssemblyHeader: Record "Assembly Header";
        AssemblyOrder: Page "Assembly Order";
    begin
        if Rec."Quantity (Base)" = 0 then begin
            Rec.Validate(Quantity, 1);
            Commit();
        end;

        //DELETE//Clear(BarcodeMgt);
        //DELETE//BarcodeMgt.SetExtraSieveBed(ExtraSieveBed);
        //DELETE//BarcodeMgt.SetAssemblyHeader(Rec);
        CurrPage.Lines.Page.OpenAllTrackingLines();
        //Label prints out - Scan SKU into header
        Rec.OpenItemTrackingLines();
        //DELETE//BarcodeMgt.ClearAssemblyHeader();
        CODEUNIT.Run(CODEUNIT::"Assembly-Post (Yes/No)", Rec);

        AssemblyHeader.Init();
        AssemblyHeader."No." := '';
        AssemblyHeader.Validate("Item No.", Rec."Item No.");

        AssemblyOrder.SetRecord(AssemblyHeader);
        AssemblyOrder.Editable(true);
        AssemblyOrder.Run();
    end;

    local procedure GetNoSeriesCode(): Code[20]
    begin
        case Rec."Document Type" of
            Rec."Document Type"::Quote:
                exit(AssemblySetup."Assembly Quote Nos.");
            Rec."Document Type"::Order:
                exit(AssemblySetup."Assembly Order Nos.");
            Rec."Document Type"::"Blanket Order":
                exit(AssemblySetup."Blanket Assembly Order Nos.");
        end;
    end;

    var
        Item: Record Item;
        AssemblySetup: Record "Assembly Setup";
        //DELETE//BarcodeSetup: Record "SK2 Barcode Setup";
        //DELETE//BarcodeMgt: Codeunit "SK2 Barcode Mgt.";
        AssemblyLineMgt: Codeunit "Assembly Line Management";
    //ExtraSieveBed: Boolean;

}