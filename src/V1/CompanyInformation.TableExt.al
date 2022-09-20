tableextension 56703 "SK2 Company Information" extends "Company Information"
{
    fields
    {
        field(56700; "SK2 Barcode Logo"; Blob)
        {
            Caption = 'Barcode Logo';
            SubType = Bitmap;

            trigger OnValidate()
            begin
            end;
        }
    }
}