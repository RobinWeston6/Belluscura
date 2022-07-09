page 56600 "SK Barcode Setup"
{

    PageType = Card;
    SourceTable = "SK Barcode Setup";
    Caption = 'Barcode Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            group(General)
            {
                /*field("Default Location"; Rec."Default Location")
                {
                    ApplicationArea = All;
                }*/
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
