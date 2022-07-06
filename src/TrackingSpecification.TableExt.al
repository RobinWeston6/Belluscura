tableextension 56602 "SK Tracking Specification" extends "Tracking Specification"
{
    fields
    {
        field(56600; "SK Long Serial No."; Code[60])
        {
            DataClassification = CustomerContent;
            Caption = 'Serial No.';
            Editable = false;

            trigger OnValidate()
            begin
                BarcodeFunctions.TrimSerialNo("SK Long Serial No.");

                Rec.Validate("Serial No.", "SK Long Serial No.");

                //Set SN in single instance CU
                BarcodeMgt.StoreSerialNo(Rec);
            end;
        }
    }

    var
        BarcodeFunctions: Codeunit "SK Barcode Functions";
        BarcodeMgt: Codeunit "SK Barcode Mgt.";
}