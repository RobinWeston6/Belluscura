page 56603 "SK Basic RC Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = "Activities Cue";

    layout
    {
        area(content)
        {

            cuegroup("Purchases")
            {
                Caption = 'Purchases';
                field("Purchase Orders"; Rec."Purchase Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Purchase Order List";
                    ToolTip = 'Specifies purchase orders that are not posted or only partially posted.';
                }
                field("Purchase Return Orders"; Rec."SK Purchase Return Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Purchase Return Order List";
                    ToolTip = 'Specifies purchase return orders that are not posted or only partially posted.';
                }
            }
            cuegroup("Assembly")
            {
                Caption = 'Assembly';

                field("Assembly Orders"; Rec."SK Assembly Orders")
                {
                    ApplicationArea = Basic, All;
                    Caption = 'Assembly Orders';
                    DrillDownPageID = "Assembly Orders";
                    ToolTip = 'Specifies assembly orders that are not yet posted or only partially posted.';
                }
            }
            cuegroup("Sales")
            {
                Caption = 'Sales';

                field("Sales Orders"; Rec."Ongoing Sales Orders")
                {
                    ApplicationArea = Basic, All;
                    Caption = 'Sales Orders';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies sales orders that are not yet posted or only partially posted.';
                }
                field("SK Sales Return Orders"; Rec."SK Sales Return Orders")
                {
                    ApplicationArea = Basic, All;
                    Caption = 'Sales Return Orders';
                    DrillDownPageID = "Sales Return Order List";
                    ToolTip = 'Specifies sales return orders that are not yet posted or only partially posted.';
                }
            }
            cuegroup(Item)
            {
                Caption = 'Item';
                field("SK Items"; Rec."SK Items")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Item List";
                    ToolTip = 'View a list of all items.';
                }
                field("SK Item Reclass Journal"; Rec."SK Item Reclass Journal")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Item Reclass. Journal";
                    ToolTip = 'View Item Reclass Journal.';
                    BlankZero = true;
                }
                field("SK Item Tracing"; Rec."SK Item Tracing")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Item Tracing";
                    ToolTip = 'View Item Tracing.';
                    BlankZero = true;
                }
            }
        }
    }
    var
        Zero: Integer;
}
