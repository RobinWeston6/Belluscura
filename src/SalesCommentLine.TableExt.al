tableextension 56705 "SK2 Sales Comment Line" extends "Sales Comment Line"
{
    fields
    {
        modify(Comment)
        {
            trigger OnAfterValidate()
            begin
                ExtractSN();
            end;
        }
        field(56700; "SK2 Serial No."; Boolean)
        {
            Caption = 'Serial No.';
            DataClassification = CustomerContent;
        }
        field(56701; "SK2 Extracted SN"; Code[80])
        {
            DataClassification = CustomerContent;
            Caption = 'Extracted Serial No.';
        }
        field(56710; "SK2 Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
            TableRelation = Item."No.";
        }
        field(56711; "SK2 Item Desc"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Item Description';
            TableRelation = Item.Description;
        }
    }

    procedure ExtractSN()
    var
        String: Text;
        LastSpace: Integer;
    begin
        String := Rec.Comment;
        String := String.TrimEnd(' ');
        LastSpace := String.LastIndexOf(' ');
        if LastSpace > 0 then
            String := CopyStr(String, LastSpace);
        "SK2 Extracted SN" := String;
    end;
}