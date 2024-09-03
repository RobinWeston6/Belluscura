pageextension 56712 "SK2 Sales Order" extends "Sales Order"
{
    actions
    {
        modify(Post)
        {
            Caption = 'Send';
            Promoted = true;
            PromotedOnly = true;
            PromotedCategory = New;
            Visible = true;

            trigger OnBeforeAction()
            begin
                if not PostingUnlocked then
                    BindSubscription(EvtMgt);

                FilterCommentsToDelete();
            end;

            trigger OnAfterAction()
            var
                ShippedSuccessfullyMsg: Label 'Shipped Successfully.';
            begin
                if not PostingUnlocked then
                    UnbindSubscription(EvtMgt);

                OldComments.Reset();
                OldComments.MarkedOnly(true);
                OldComments.DeleteAll();

                if GetLastErrorText() = '' then
                    Message(ShippedSuccessfullyMsg);
            end;
        }
        addafter(Post)
        {
            action(UnlockPosting)
            {
                Caption = 'Unlock Posting';
                Image = Lock;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = New;
                ApplicationArea = All;
                Visible = not PostingUnlocked;

                trigger OnAction()
                begin
                    PostingUnlocked := not PostingUnlocked;
                end;
            }
        }
    }

    var
        OldCommentsTemp: Record "Sales Comment Line" temporary;
        OldComments: Record "Sales Comment Line";
        EvtMgt: Codeunit "SK2 Barcd Scan Manual Evt Mgt.";
        PostingUnlocked: Boolean;

    local procedure FilterCommentsToDelete()
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", rec."Document Type");
        SalesLine.SetRange("Document No.", rec."No.");
        OldComments.SetRange("Document Type", rec."Document Type");
        OldComments.SetRange("No.", rec."No.");
        OldComments.SetRange("SK2 Serial No.", true);

        if SalesLine.FindSet() then
            repeat
                if (SalesLine."Qty. to Ship" <> 0) or (SalesLine."Qty. to Invoice" <> 0) then begin
                    OldComments.SetRange("Line No.", SalesLine."Line No.");
                    if OldComments.FindSet() then
                        repeat
                            OldComments.Mark(true);
                        until OldComments.Next() = 0;
                end;
            until SalesLine.Next() = 0;
    end;
}