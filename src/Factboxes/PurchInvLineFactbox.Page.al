page 56753 "SK2 Purch. Inv. Line Factbox"
{
    PageType = ListPart;
    SourceTable = "Purch. Inv. Line";
    Editable = false;
    Caption = 'Purchase Invoice Lines';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}