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

                //Rec.Modify();
            end;
        }
    }

    var
        myInt: Integer;
}