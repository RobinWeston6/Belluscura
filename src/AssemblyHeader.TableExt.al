tableextension 56704 "SK2 Assembly Header" extends "Assembly Header"
{
    fields
    {
        field(56700; "SK2 SKU"; Code[50])
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
                    Rec."SK2 SKU" := '';
                    Item.Get(Rec."Item No.");
                    if Item."SK2 SKU No. Series" <> '' then
                        "SK2 SKU" := NoSeriesMgt.GetNextNo(Item."SK2 SKU No. Series", WorkDate(), true);
                end;
            end;
        }
    }
}