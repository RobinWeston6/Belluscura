tableextension 56603 "SK Company Information" extends "Company Information"
{
    fields
    {
        field(56600; "SK Barcode Logo"; Blob)
        {
            Caption = 'Barcode Logo';
            SubType = Bitmap;

            trigger OnValidate()
            begin
            end;
        }
    }
}