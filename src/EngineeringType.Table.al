table 56700 "SK2 Engineering Type"
{
    DataClassification = CustomerContent;
    Caption = 'Engineering Activity';
    LookupPageId = "SK2 Engineering Types";
    DrillDownPageId = "SK2 Engineering Types";

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