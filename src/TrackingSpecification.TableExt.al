tableextension 56702 "SK Tracking Specification" extends "Tracking Specification"
{
    fields
    {
        field(56700; "SK Long Serial No."; Code[60])
        {
            DataClassification = CustomerContent;
            Caption = 'Serial No.';
            Editable = false;

            trigger OnValidate()
            begin
                BarcodeFunctions.TrimSerialNo("SK Long Serial No.");

                Rec.Validate("Serial No.", "SK Long Serial No.");

                //Set SN in single instance CU
                //DELETE//BarcodeMgt.StoreSerialNo(Rec);
            end;
        }
    }

    var
        BarcodeFunctions: Codeunit "SK Barcode Functions";
    //DELETE//BarcodeMgt: Codeunit "SK Barcode Mgt.";


    procedure CreateSNCollectionEntry(AssemblyHeader: Record "Assembly Header")
    var
        SNCollectionEntry: Record "SK SN Collection Entry";
    begin
        SNCollectionEntry.Init();
        SNCollectionEntry."Source Assembly Document" := AssemblyHeader."Document Type";
        SNCollectionEntry."Source Assembly Doc. No." := AssemblyHeader."No.";
        SNCollectionEntry.SKU := AssemblyHeader."SK SKU";
        SNCollectionEntry."Component Item No." := Rec."Item No.";
        SNCollectionEntry."Component Serial No." := Rec."Serial No.";
        SNCollectionEntry.Insert(true);
    end;
}