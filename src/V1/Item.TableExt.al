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
            MinValue = 0;
            MaxValue = 100;
            Caption = 'Salvage %';
        }
        field(56720; "SK2 Serial No. Format"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Serial No. Format';

            trigger OnValidate()
            var
                TextFns: Codeunit "SK2 Text Functions";
            begin
                "SK2 Serial No. Format" := TextFns.AsSNFormat("SK2 Serial No. Format");
                "SK2 SN Format Length" := StrLen("SK2 Serial No. Format");
            end;
        }
        field(56721; "SK2 SN Format Length"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Serial No. Format Length';
            Editable = false;
        }
    }
}