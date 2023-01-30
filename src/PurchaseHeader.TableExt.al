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

    }
}