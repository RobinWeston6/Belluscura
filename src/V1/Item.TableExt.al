tableextension 56700 "SK Item" extends "Item"
{
    fields
    {
        field(56701; "SK SKU No. Series"; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'SKU No. Series';
            TableRelation = "No. Series";
        }
    }
}