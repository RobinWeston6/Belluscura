pageextension 56701 "SK2 Item Tracking Lines" extends "Item Tracking Lines"
{
    layout
    {
        modify("Serial No.")
        {
            Visible = false;
            /*trigger OnAfterValidate()
            begin
                BarcodeMgt.StoreSerialNo(Rec);
                //Set SN in single instance CU

                Rec.Validate("Quantity (Base)", 1);
                QuantityBaseOnValidate();
                QuantityBaseOnAfterValidate();

                if UndefinedQtyArray[1] = 0 then
                    CurrPage.Close();
            end;*/
        }
        addafter("Serial No.")
        {
            field("SK2 Long Serial No."; Rec."SK2 Long Serial No.")
            {
                Caption = 'Serial No.';
                ApplicationArea = ItemTracking;
                Editable = SerialNoEditable;
                ToolTip = 'Specifies the serial number associated with the entry.';

                trigger OnValidate()
                begin
                    Rec.Validate("Quantity (Base)", 1);
                    QuantityBaseOnValidate();
                    QuantityBaseOnAfterValidate();

                    if UndefinedQtyArray[1] = 0 then
                        CurrPage.Close();
                end;
            }
        }
        modify(AvailabilitySerialNo)
        {
            Visible = false;
        }
        modify(AvailabilityLotNo)
        {
            Visible = false;
        }
        modify("Lot No.")
        {
            Visible = false;
        }
        modify("Quantity (Base)")
        {
            Editable = false;
        }
        modify("Qty. to Handle (Base)")
        {
            Editable = false;
        }
        modify("Appl.-to Item Entry")
        {
            Visible = false;
        }
    }

    var
        //DELETE//BarcodeMgt: Codeunit "SK2 Barcode Mgt.";
        BarcodeFunctions: Codeunit "SK2 Barcode Functions";

    trigger OnAfterGetRecord()
    begin
        Rec."SK2 Long Serial No." := Rec."Serial No.";
    end;

}