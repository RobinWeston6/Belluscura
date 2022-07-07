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
                field("Default Location"; Rec."Default Location")
                {
                    ApplicationArea = All;
                }
                field("Default Bin"; Rec."Default Bin")
                {
                    ApplicationArea = All;
                }
                field("Extra Sieve Bed as Default"; Rec."Extra Sieve Bed as Default")
                {
                    ApplicationArea = All;
                }
                field("Default Assembly Item"; Rec."Default Assembly Item")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
