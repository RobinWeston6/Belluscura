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
            field("SK2 Salvage %"; Rec."SK2 Salvage %")
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
        addlast(ItemTracking)
        {
            field("SK2 Serial No. Format"; Rec."SK2 Serial No. Format")
            {
                ApplicationArea = All;
                Importance = Additional;
            }
        }
    }
}