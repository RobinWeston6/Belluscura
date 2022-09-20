pageextension 56700 "SK2 Item Card" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("SK2 Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                Caption = 'Productline Code';
            }
            field("SK2 SKU No. Series"; Rec."SK2 SKU No. Series")
            {
                ApplicationArea = All;
            }
            field("SK2 Salvage %"; Rec."SK2 Salvage %")
            {
                ApplicationArea = All;
            }
        }
        addlast(Planning)
        {
            field("SK2 Stockout Warning"; Rec."Stockout Warning")
            {
                ApplicationArea = All;
            }
        }
    }
}