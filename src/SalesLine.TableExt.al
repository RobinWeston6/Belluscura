tableextension 56710 "SK2 Sales Line" extends "Sales Line"
{
    fields
    {
        field(56700; "SK2 Expected Receipt Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Expected Receipt Date';
        }
        modify("Planned Shipment Date")
        {
            trigger OnAfterValidate()
            var
                SalesHeader: Record "Sales Header";
                PaymentTerms: Record "Payment Terms";
            begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                PaymentTerms.Get(SalesHeader."Payment Terms Code");

                if "Planned Shipment Date" = 0D then
                    "SK2 Expected Receipt Date" := 0D
                else
                    "SK2 Expected Receipt Date" := CalcDate(PaymentTerms."Due Date Calculation", Rec."Planned Shipment Date");
            end;
        }
    }
}