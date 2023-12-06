pageextension 56720 "SK2 Company Information" extends "Company Information"
{
    layout
    {
        addafter(Picture)
        {
            field("SK2 Barcode Logo"; Rec."SK2 Barcode Logo")
            {
                ApplicationArea = All;
            }
        }
    }
}