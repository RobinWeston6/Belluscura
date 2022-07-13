pageextension 56700 "SK2 Item Card" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                Caption = 'Productline Code';
            }
            field("SK2 SKU No. Series"; Rec."SK2 SKU No. Series")
            {
                ApplicationArea = All;
            }
        }
        addlast(Planning)
        {
            field("Stockout Warning"; Rec."Stockout Warning")
            {
                ApplicationArea = All;
            }
        }
    }
}