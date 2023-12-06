page 56704 "SK2 Item Stock Factbox"
{
    Caption = 'Item Stock';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Items By Bin")
            {
                Caption = 'Items By Bin';
                ApplicationArea = All;
                RunObject = report "SK2 Items By Bin";
                Image = Report;
            }
        }
    }
}