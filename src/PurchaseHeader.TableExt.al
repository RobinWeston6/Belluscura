tableextension 56708 "SK2 Purchase Header" extends "Purchase Header"
{
    fields
    {
        field(56700; "SK2 Department"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Department';
            OptionMembers = " ","Supply Chain",Engineering,Quality,Shipping,Accounting;
        }
        field(56701; "SK2 Approver"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Approver';
            OptionMembers = " ","Keith Cook","Bo Borrello","Paul Bray","Sarah Clark","Brian Brown","Dwayne Thompson";
        }
        field(56702; "SK2 Date To Be Issued"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date To Be Issued';
        }
        field(56703; "SK2 Issued"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Issued';
        }
        field(56710; "SK2 Engineering Type"; Text[50]) //RND,Product Development,Sustaining Engineering
        {
            DataClassification = CustomerContent;
            Caption = 'Engineering Type';
            TableRelation = "SK2 Engineering Type".Description;
            ValidateTableRelation = false;
        }
        field(56711; "SK2 Project"; Text[50]) //CX, CX+, DX, Nomad, Infrastructure
        {
            DataClassification = CustomerContent;
            Caption = 'Project';
            TableRelation = "SK2 Project".Description;
            ValidateTableRelation = false;
        }
        field(56712; "SK2 Expense Type"; Text[50]) //Materials, Contract Labor, Tooling, Testing, Audit, IT, Misc Expense
        {
            DataClassification = CustomerContent;
            Caption = 'Expense Type';
            TableRelation = "SK2 Expense Type".Description;
            ValidateTableRelation = false;
        }
    }
}