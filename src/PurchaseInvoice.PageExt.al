pageextension 56724 "SK2 Purchase Invoice" extends "Purchase Invoice"
{

    actions
    {
        addfirst(IncomingDocument)
        {
            action(SK2IncomingDocCard)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'View';
                //Enabled = HasIncomingDocument;
                Image = ViewOrder;
                ToolTip = 'View any incoming document records and file attachments that exist for the entry or document.';

                trigger OnAction()
                var
                    IncomingDocument: Record "Incoming Document";
                begin
                    IncomingDocument.ShowCardFromEntryNo(Rec."Incoming Document Entry No.");
                end;
            }
            action(SK2SelectIncomingDoc)
            {
                AccessByPermission = TableData "Incoming Document" = R;
                ApplicationArea = Basic, Suite;
                Caption = 'Select';
                Image = SelectLineToApply;
                ToolTip = 'Select an incoming document record and file attachment that you want to link to the entry or document.';

                trigger OnAction()
                var
                    IncomingDocument: Record "Incoming Document";
                begin
                    Rec.Validate("Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(Rec."Incoming Document Entry No.", Rec.RecordId));
                end;
            }
            action(SK2RemoveIncomingDoc)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Remove';
                //Enabled = HasIncomingDocument;
                Image = RemoveLine;
                ToolTip = 'Remove an external document that has been recorded, manually or automatically, and attached as a file to a document or ledger entry.';

                trigger OnAction()
                var
                    IncomingDocument: Record "Incoming Document";
                begin
                    if IncomingDocument.Get(Rec."Incoming Document Entry No.") then
                        IncomingDocument.RemoveLinkToRelatedRecord();
                    Rec."Incoming Document Entry No." := 0;
                    Rec.Modify(true);
                end;
            }
        }
    }

    var
        myInt: Integer;
}