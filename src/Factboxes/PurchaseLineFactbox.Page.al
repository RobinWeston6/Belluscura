page 56752 "SK2 Purchase Line Factbox"
{
    PageType = ListPart;
    SourceTable = "Purchase Line";
    Editable = false;
    Caption = 'Purchase Lines';

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