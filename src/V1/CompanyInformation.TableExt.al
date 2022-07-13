tableextension 56703 "SK Company Information" extends "Company Information"
{
    fields
    {
        field(56700; "SK Barcode Logo"; Blob)
        {
            Caption = 'Barcode Logo';
            SubType = Bitmap;

            trigger OnValidate()
            begin
            end;
        }
    }
}