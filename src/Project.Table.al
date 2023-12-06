table 56701 "SK2 Project"
{
    DataClassification = CustomerContent;
    Caption = 'Project';
    LookupPageId = "SK2 Projects";
    DrillDownPageId = "SK2 Projects";

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