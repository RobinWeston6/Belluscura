table 56703 "SK2 Expense Type"
{
    DataClassification = CustomerContent;
    Caption = 'Expense Type';
    LookupPageId = "SK2 Expense Types";
    DrillDownPageId = "SK2 Expense Types";

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(10; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}