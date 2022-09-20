pageextension 56719 "SK General Ledger Entries" extends "General Ledger Entries"
{
    layout
    {
        addfirst(Control1)
        {
            field("Journal Batch Name"; Rec."Journal Batch Name")
            {
                ApplicationArea = All;
            }
        }
    }

}