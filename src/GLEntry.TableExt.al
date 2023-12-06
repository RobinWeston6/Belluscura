tableextension 56713 "SK2 G/L Entry" extends "G/L Entry"
{
    fields
    {
        field(56700; "SK2 Broken Down Amount"; Decimal)
        {
            Caption = 'Broken Down Amount';
            FieldClass = FlowField;
            CalcFormula = sum("SK2 GL Entry Cat. Breakdown"."Breakdown Amount" where("G/L Entry No." = field("Entry No.")));
            Editable = false;
        }
    }

    var
        myInt: Integer;

}