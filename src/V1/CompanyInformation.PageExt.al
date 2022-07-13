pageextension 56620 "SK Company Information" extends "Company Information"
{
    layout
    {
        addafter(Picture)
        {
            field("SK Barcode Logo"; Rec."SK Barcode Logo")
            {
                ApplicationArea = All;
            }
        }
    }
}