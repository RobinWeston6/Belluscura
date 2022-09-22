tableextension 56705 "SK2 Purchase Line" extends "Purchase Line"
{
    fields
    {
        field(56700; "SK2 Vendor Name"; text[100])
        {
            FieldClass = FlowField;
            Caption = 'Vendor Name';
            CalcFormula = lookup(vendor.name where("No." = field("Buy-from Vendor No.")));
        }
    }
}