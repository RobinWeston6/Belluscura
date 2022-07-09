table 56600 "SK Barcode Setup"
{
    Caption = 'Assembly Settings';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; PK; Code[1])
        {
            DataClassification = SystemMetadata;
            Caption = 'Primary Key';
        }
        /*    field(10; "Default Location"; Code[10])
            {
                DataClassification = SystemMetadata;
                Caption = 'Default Location';
                TableRelation = Location WHERE("Use As In-Transit" = CONST(false));

                trigger OnValidate()
                begin
                    if Rec."Default location" <> xRec."Default Location" then
                        Rec."Default Bin" := '';
                end;
            }*/
    }

    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    begin
        if not Get() then
            Insert();
    end;

}