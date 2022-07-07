tableextension 56600 "SK Item" extends "Item"
{
    fields
    {
        field(56600; "SK X-PLOR Component"; Enum "SK X-PLOR Component")
        {
            DataClassification = SystemMetadata;
            Caption = 'X-PLOR Component';
        }
        field(56601; "SK SKU No. Series"; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'SKU No. Series';
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}