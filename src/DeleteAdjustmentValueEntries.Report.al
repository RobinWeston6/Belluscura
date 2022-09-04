report 56700 "SK2 Delete Adjmt Value Entries"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Delete Adjustment Value Entries';
    ProcessingOnly = true;
    Permissions = tabledata "Value Entry" = D;

    dataset
    {
        dataitem("Value Entry"; "Value Entry")
        {
            DataItemTableView = where(Adjustment = const(true), "Item No." = const('AD HOC'));
            RequestFilterFields = "Entry No.";

            trigger OnAfterGetRecord()
            begin
                "Value Entry".delete();
            end;
        }
    }

    trigger OnPreReport()
    begin
        if UserId <> 'SKENT' then
            Error('Not allowed.');
    end;
}