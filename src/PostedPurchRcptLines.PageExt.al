pageextension 56722 "SK2 Posted Purch. Rcpt. Lines" extends "Posted Purchase Receipt Lines"
{
    layout
    {
        addlast(Control1)
        {
            field(SystemModifiedBy; ModifiedBy)
            {
                Caption = 'Last Modified By';
                ApplicationArea = All;
            }
            field(SystemCreatedBy; CreatedBy)
            {
                Caption = 'Created By';
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CreatedBy := '';
        ModifiedBy := '';
        Clear(User);
        if User.Get(Rec.SystemCreatedBy) then begin
            CreatedBy := User."Full Name";
            if Rec.SystemModifiedBy <> Rec.SystemCreatedBy then
                if User.Get(Rec.SystemModifiedBy) then;

            ModifiedBy := User."Full Name";
        end;
    end;

    var
        User: Record User;
        CreatedBy: Text[100];
        ModifiedBy: Text[100];

}