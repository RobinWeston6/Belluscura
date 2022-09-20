tableextension 56700 "SK2 Item" extends "Item"
{
    fields
    {
        field(56701; "SK2 SKU No. Series"; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'SKU No. Series';
            TableRelation = "No. Series";
        }
        field(56700; "SK2 Salvage %"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Salvage %';
            MinValue = 0;
            MaxValue = 100;
        }
    }
}