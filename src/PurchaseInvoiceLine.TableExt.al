tableextension 56714 "SK2 Purch. Inv. Line" extends "Purch. Inv. Line"
{
    fields
    {
        field(56710; "SK2 Engineering Type"; Text[50])
        {
            Caption = 'Engineering Type';
            TableRelation = "SK2 Engineering Type";
        }
        field(56711; "SK2 Project"; Text[50])
        {
            Caption = 'Project';
            TableRelation = "SK2 Project";
        }
        field(56712; "SK2 Expense Type"; Text[50])
        {
            Caption = 'Expense Type';
            TableRelation = "SK2 Expense Type";
        }
    }

}