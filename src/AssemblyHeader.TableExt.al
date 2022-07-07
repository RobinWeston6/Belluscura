tableextension 56604 "SK Assembly Header" extends "Assembly Header"
{
    fields
    {
        field(56600; "SK SKU"; Code[50])
        {
            Caption = 'SKU';
            DataClassification = CustomerContent;
            Editable = false;
        }
        modify("Item No.")
        {
            trigger OnAfterValidate()
            var
                Item: Record Item;
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if Rec."Item No." <> xRec."Item No." then begin
                    Rec."SK SKU" := '';
                    Item.Get(Rec."Item No.");
                    if Item."SK SKU No. Series" <> '' then
                        "SK SKU" := NoSeriesMgt.GetNextNo(Item."SK SKU No. Series", WorkDate(), true);
                end;
            end;
        }
    }
}