pageextension 56705 "SK2 Posted Purchase Receipt" extends "Posted Purchase Receipt"
{
    layout
    {
        addlast(General)
        {
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = All;
                Caption = 'Last Modified At';
            }
            field(SystemModifiedBy; GetUserName(Rec.SystemModifiedBy))
            {
                ApplicationArea = All;
                Caption = 'Last Modified By';
            }
        }
    }


    local procedure GetUserName(UserID: Guid): Text
    var
        User: Record User;
    begin
        if User.Get(UserID) then
            exit(User."Full Name");
    end;

}