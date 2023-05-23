tableextension 56711 "SK2 Sales Invoice Line" extends "Sales Invoice Line"
{
    fields
    {
        field(56710; "SK2 Document Date"; Date)
        {
            Caption = 'Document Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Invoice Header"."Document Date" where("No." = field("Document No.")));
            Editable = false;
        }
        field(56720; "SK2 Sell-to Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Sell-to Customer No.")));
            Editable = false;
        }
        field(56730; "SK2 Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Customer Posting Group" where("No." = field("Sell-to Customer No.")));
        }
    }
}