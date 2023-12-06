reportextension 56701 MyExtension extends "Standard Sales - Order Conf."
{
    WordLayout = './src/Layouts/StandardSalesConfirmation.docx';

    dataset
    {
        add(Header)
        {
            column(BillToAddress_Lbl; BillToAddressLbl)
            { }
        }
        add(Line)
        {
            column(Discount; Discount)
            { }
            column(DiscountLbl; DiscountLbl)
            { }
        }
        modify(Header)
        {
            trigger OnBeforeAfterGetRecord()
            begin
                DiscountLbl := '';
            end;
        }
        modify(line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                Discount := '';
                if Line."Line Discount Amount" <> 0 then begin
                    Discount := Format(Line."Line Discount Amount");
                    DiscountLbl := 'Total 2023 Promo Discount';
                end;

            end;
        }
    }

    var
        Discount: Text;
        DiscountLbl: Text;
        BillToAddressLbl: Label 'Bill-to Address';
}