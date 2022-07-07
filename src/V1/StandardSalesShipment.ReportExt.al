reportextension 56600 "SK Standard Sales - Shipment" extends "Standard Sales - Shipment"
{
    WordLayout = 'src/Layouts/StandardSalesShipment.docx';

    dataset
    {
        modify(ItemTrackingLine)
        {
            trigger OnAfterAfterGetRecord()
            begin
                if not SerialNoCollection.Get(TempTrackingSpecBuffer."Serial No.") then
                    Clear(SerialNoCollection);
            end;
        }
        add(ItemTrackingLine)
        {
            column(BatterySN_SerialNoCollection;SerialNoCollection."Battery Serial No.")
            {}
            column(UnitSN_SerialNoCollection;SerialNoCollection."Unit Serial No.")
            {}
            column(SieveSN_SerialNoCollection;SerialNoCollection."Sieve Bed Serial No.")
            {}
            column(Sieve2SN_SerialNoCollection;SerialNoCollection."Sieve Bed 2 Serial No.")
            {}
        }
    }

    labels
    {
        SKULbl = 'SKU';
    }

    var
        SerialNoCollection: Record "SK Serial No. Collection";

    
}