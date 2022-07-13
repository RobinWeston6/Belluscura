pageextension 56700 "SK Item Card" extends "Item Card"
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
            field("SK SKU No. Series"; Rec."SK SKU No. Series")
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