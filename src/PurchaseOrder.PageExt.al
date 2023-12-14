pageextension 56708 "SK2 Purchase Order" extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("SK2 Department"; Rec."SK2 Department")
            {
                ApplicationArea = All;
            }
            field("SK2 Approver"; Rec."SK2 Approver")
            {
                ApplicationArea = All;
                OptionCaption = ' ,Keith Cook,,Paul Bray,Sarah Clark,Brian Brown,Dwayne Thompson,Mark Vines';
            }
            field("SK2 Date To Be Issued"; Rec."SK2 Date To Be Issued")
            {
                ApplicationArea = All;
            }
            field("SK2 Issued"; Rec."SK2 Issued")
            {
                ApplicationArea = All;
            }
        }
        addafter(Status)
        {
            field("SK2 Ext. Status"; Rec."SK2 Ext. Status")
            {
                ApplicationArea = All;
                StyleExpr = ExtStatusStyleTxt;
            }
        }
    }
    actions
    {

        modify(Post)
        {
            Caption = 'Receive';
            Promoted = true;
            PromotedOnly = true;
            PromotedCategory = New;
            trigger OnBeforeAction()
            begin
                if not PostingUnlocked then
                    BindSubscription(EvtMgt);
            end;

            trigger OnAfterAction()
            var
                ReceivedSuccessfullyMsg: Label 'Received Successfully.';
            begin
                if not PostingUnlocked then
                    UnbindSubscription(EvtMgt);
                if GetLastErrorText() = '' then
                    Message(ReceivedSuccessfullyMsg);
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
        EvtMgt: Codeunit "SK2 Barcd Scan Manual Evt Mgt.";
        ExtStatusStyleTxt: Text;
        PostingUnlocked: Boolean;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcExtStatus();
        ExtStatusStyleTxt := Rec.GetExtStatusStyleText();
    end;
}