tableextension 56709 "SK2 Purchase Line" extends "Purchase Line"
{
    fields
    {
        field(56700; "SK2 Expected Payment Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Expected Payment Date';
        }
        modify("Expected Receipt Date")
        {
            trigger OnAfterValidate()
            var
                PurchaseHeader: Record "Purchase Header";
                PaymentTerms: Record "Payment Terms";
            begin
                PurchaseHeader.Get(Rec."Document Type", Rec."Document No.");
                PaymentTerms.Get(PurchaseHeader."Payment Terms Code");

                if "Expected Receipt Date" = 0D then
                    "SK2 Expected Payment Date" := 0D
                else
                    "SK2 Expected Payment Date" := CalcDate(PaymentTerms."Due Date Calculation", Rec."Expected Receipt Date");
            end;
        }
        field(56710; "SK2 Engineering Type"; Code[20])
        {
            Caption = 'Engineering Type';
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."SK2 Engineering Type" where("Document Type" = field("Document Type"), "No." = field("Document No.")));
            Editable = false;
        }
        field(56711; "SK2 Project"; Code[20])
        {
            Caption = 'Project';
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."SK2 Project" where("Document Type" = field("Document Type"), "No." = field("Document No.")));
            Editable = false;
        }
        field(56712; "SK2 Expense Type"; Code[20])
        {
            Caption = 'Expense Type';
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."SK2 Expense Type" where("Document Type" = field("Document Type"), "No." = field("Document No.")));
            Editable = false;
        }
    }
}