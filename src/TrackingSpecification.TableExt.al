tableextension 56702 "SK2 Tracking Specification" extends "Tracking Specification"
{
    fields
    {
        field(56700; "SK2 Long Serial No."; Code[60])
        {
            DataClassification = CustomerContent;
            Caption = 'Serial No.';
            Editable = false;

            trigger OnValidate()
            begin
                BarcodeFunctions.TrimSerialNo("SK2 Long Serial No.");

                Rec.Validate("Serial No.", "SK2 Long Serial No.");

                //Set SN in single instance CU
                //DELETE//BarcodeMgt.StoreSerialNo(Rec);
            end;
        }
    }

    var
        BarcodeFunctions: Codeunit "SK2 Barcode Functions";
    //DELETE//BarcodeMgt: Codeunit "SK2 Barcode Mgt.";


    procedure CreateSNCollectionEntry(AssemblyHeader: Record "Assembly Header")
    var
        SNCollectionEntry: Record "SK2 SN Collection Entry";
    begin
        SNCollectionEntry.Init();
        SNCollectionEntry."Source Assembly Document" := AssemblyHeader."Document Type";
        SNCollectionEntry."Source Assembly Doc. No." := AssemblyHeader."No.";
        SNCollectionEntry.SKU := AssemblyHeader."SK2 SKU";
        SNCollectionEntry."Component Item No." := Rec."Item No.";
        SNCollectionEntry."Component Serial No." := Rec."Serial No.";
        SNCollectionEntry.Insert(true);
    end;
}