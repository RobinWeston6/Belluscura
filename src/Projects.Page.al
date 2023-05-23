page 56706 "SK2 Projects"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SK2 Project";
    Caption = 'Projects';

    layout
    {
        area(Content)
        {
            repeater(control1)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}