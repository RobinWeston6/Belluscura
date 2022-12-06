reportextension 56701 MyExtension extends "Standard Sales - Order Conf."
{
    WordLayout = './src/Layouts/StandardSalesConfirmation.docx';

    dataset
    {
        add(Line)
        {
            column(Discount; Discount)
            { }
            column(DiscountLbl; DiscountLbl)
            { }
        }
        modify(line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                if (Line.Type = Line.Type::Item) and
                   (Line."No." = '201-06-17-0017.A') and
                   (Line.Quantity <> 0) then begin
                    Discount := Format(Line.Quantity * (-500));
                    DiscountLbl := 'Total 2022 Promo Discount'
                end else
                    Discount := '';
            end;
        }
    }

    var
        Discount: Text;
        DiscountLbl: Text;
}