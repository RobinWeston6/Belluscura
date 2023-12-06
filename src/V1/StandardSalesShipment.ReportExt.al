reportextension 56700 "SK2 Standard Sales - Shipment" extends "Standard Sales - Shipment"
{
    WordLayout = 'src/Layouts/StandardSalesShipment.docx';
    //TODO - sort out extra loop for serial numbers in layout
    dataset
    {
        modify(ItemTrackingLine)
        {

            trigger OnAfterAfterGetRecord()
            begin
                "SK2 SN Collection Entry".SetRange("Parent Item No.", TempTrackingSpecBuffer."Item No.");
                "SK2 SN Collection Entry".SetRange(SKU, TempTrackingSpecBuffer."Serial No.");
            end;
        }
        add(ItemTrackingLine)
        {
            column(BatterySN_SerialNoCollection; '')
            { }
            column(UnitSN_SerialNoCollection; '')
            { }
            column(SieveSN_SerialNoCollection; '')
            { }
            column(Sieve2SN_SerialNoCollection; '')
            { }
        }
        addfirst(ItemTrackingLine)
        {
            dataitem("SK2 SN Collection Entry"; "SK SN Collection Entry")
            {
                column(ComponentItemNo_SNCollectionEntry; "Component Item No.")
                { }
                column(ComponentSerialNo_SNCollectionEntry; "Component Serial No.")
                { }
            }
        }
    }

    labels
    {
        SKULbl = 'SKU';
    }
}