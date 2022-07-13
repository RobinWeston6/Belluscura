table 56702 "SK SN Collection Entry"
{
    Caption = 'SN Collection Entry';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Parent Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Parent Item No.';
            TableRelation = Item;
        }
        field(2; SKU; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'SKU';
            Editable = false;
            NotBlank = true;
        }
        field(3; "Entry No."; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Entry No.';
            Editable = false;
            AutoIncrement = true;
        }
        field(10; "Component Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Component Item No.';
            TableRelation = Item;
        }
        field(20; "Component Serial No."; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Component Serial No.';
        }
        field(160; "Send-to Document"; Enum "Sales Document Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Send-to Document';
        }
        field(161; "Send-to No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Send-to No.';
        }
        field(170; "Source Assembly Document"; enum "Assembly Document Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Source Assembly Document Type';
        }
        field(171; "Source Assembly Doc. No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Source Assembly Document No.';
        }
        field(180; "Removed from Parent Item"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Dismantled';
        }
    }

    keys
    {
        key(PK; "Parent Item No.", SKU, "Entry No.")
        {
            Clustered = true;
        }
        key(key1; "Component Item No.", "Component Serial No.")
        {
            Unique = true;
        }
    }

    trigger OnDelete()
    var
        HasBeenMarkedAsInactiveErr: Label 'Assembly %1 cannot be deleted. It has been marked as Removed.';
    begin
        if ("Send-to No." <> '') then begin
            "Removed from Parent Item" := true;
            Rec.Modify();
            Error(HasBeenMarkedAsInactiveErr, SKU);
        end;
    end;
}