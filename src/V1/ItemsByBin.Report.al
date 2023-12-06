report 56701 "SK2 Items By Bin"
{
    Caption = 'Items By Bin';
    UsageCategory = Administration;
    ApplicationArea = All;
    UseRequestPage = false;
    RDLCLayout = 'src/Layouts/ItemsByBin.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(No_Item; Item."No.")
            {
            }
            column(Description_Item; Description)
            {
            }
            dataitem("Bin Content"; "Bin Content")
            {
                DataItemLink = "Item No." = field("No.");

                column(BinCode_BinContent; "Bin Code")
                {
                }
                column(QuantityBase_BinContent; "Quantity (Base)")
                {
                }
                column(LocationCode_BinContent; "Location Code")
                {
                }
            }
        }
    }
}