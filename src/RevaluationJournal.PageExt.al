pageextension 56721 "SK Revaluation Journal" extends "Revaluation Journal"
{
    layout
    {
        addafter("Location Code")
        {
            field("Bin Code"; Rec."Bin Code")
            {
                ApplicationArea = All;
            }
        }
    }
}