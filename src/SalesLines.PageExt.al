pageextension 56726 "SK2 Sales Lines" extends "Sales Lines"
{

    layout
    {
        addlast(Control1)
        {
            field("Planned Shipment Date"; Rec."Planned Shipment Date")
            {
                ApplicationArea = All;
            }
            field("SK2 Expected Receipt Date"; Rec."SK2 Expected Receipt Date")
            {
                ApplicationArea = All;
            }
        }
    }

}