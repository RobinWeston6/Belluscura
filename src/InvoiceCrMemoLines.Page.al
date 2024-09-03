page 56710 "SK2 Invoice/Cr. Memo Lines"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Invoice Line";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("SK2 Sell-to Customer Name"; Rec."SK2 Sell-to Customer Name")
                {
                    ApplicationArea = All;

                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;

                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;

                }
                field("External Doc. No."; Rec."External Doc. No.")
                {
                    ApplicationArea = All;

                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;

                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;

                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;

                }
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        InvoiceLine: Record "Sales Invoice Line";
        CrMemoLine: Record "Sales Cr.Memo Line";
    begin
        if InvoiceLine.findset then
            repeat
                Rec.Init;
                Rec := InvoiceLine;
                Rec.Insert()
            until InvoiceLine.Next() = 0;

        if CrMemoLine.FindSet() then
            repeat
                Rec.Init;
                Rec.TransferFields(CrMemoLine);
                Rec.Insert();
            until CrMemoLine.Next() = 0;

        Rec.SetCurrentKey("Posting Date");
    end;

    var
        myInt: Integer;

}