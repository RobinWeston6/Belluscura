pageextension 56723 "SK2 Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(Print)
        {
            trigger OnAfterAction()
            begin
                Rec."SK2 PrintSNComments"();
            end;
        }
    }

    var
        myInt: Integer;
}