tableextension 56701 "SK Activities Cue" extends "Activities Cue"
{
    fields
    {
        field(56000; "SK Assembly Orders"; Integer)
        {
            CalcFormula = Count("Assembly Header" WHERE("Document Type" = FILTER(Order)));
            Caption = 'Assembly Orders';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50001; "SK Purchase Return Orders"; Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER("Return Order")));
            Caption = 'Purchase Return Orders';
            FieldClass = FlowField;
            Editable = false;
        }
        field(56002; "SK Sales Return Orders"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER("Return Order")));
            Caption = 'Sales Return Orders';
            FieldClass = FlowField;
            Editable = false;
        }
        field(56003; "SK Items"; Integer)
        {
            CalcFormula = Count(Item);
            Caption = 'Items';
            FieldClass = FlowField;
            Editable = false;
        }
        field(56004; "SK Item Reclass Journal"; Integer)
        {
            Caption = 'Item Reclass Journal';
            Editable = false;
        }
        field(56005; "SK Item Tracing"; Integer)
        {
            Caption = 'Item Tracing';
            Editable = false;
        }
    }
    var
        ITem: REcord Item;
}