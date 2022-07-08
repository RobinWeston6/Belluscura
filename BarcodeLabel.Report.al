report 56602 "SK Barcode Label"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //TODO layout
    //TODO dynamic font sizes

    dataset
    {
        dataitem(CopyLoop; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            column(Number_CopyLoop; CopyLoop.Number)
            {
            }
            column(Picture_CompanyInfo; CompanyInfo.Picture)
            {
            }
            dataitem("SK SN Collection Entry"; "SK SN Collection Entry")
            {
                RequestFilterFields = "Parent Item No.", SKU;

                column(SKU; SKU)
                {
                }
                column(ParentItemNo_SNCollectionEntry; "Parent Item No.")
                { }
                column(Description_ParentItem; ParentItem.Description)
                { }
                trigger OnAfterGetRecord() //SNCollectionEntry
                begin
                    if ParentItem."No." <> "SK SN Collection Entry"."Parent Item No." then
                        ParentItem.Get("SK SN Collection Entry"."Parent Item No.");

                    if ComponentItem."No." <> "SK SN Collection Entry"."Component Item No." then
                        ComponentItem.Get("SK SN Collection Entry"."Component Item No.");
                end;
            }
            trigger OnPreDataItem() //CopyLoop
            begin
                CopyLoop.SetRange(Number, 1, NoOfCopies);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of Copies';
                    }
                    field(ShowComponentDetails; ShowComponentDetails)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Component Details';
                    }
                }
            }
        }
        trigger OnInit()
        begin
            NoOfCopies := 1;
        end;
    }

    trigger OnInitReport()
    begin
        "SK SN Collection Entry".SetRange(Dismantled, false);
        //todo functionality for show ex components

        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);

    end;

    var
        //Request Page
        NoOfCopies: Integer;
        ShowComponentDetails: Boolean;

        //Dataset
        CompanyInfo: Record "Company Information";
        ParentItem: Record Item;
        ComponentItem: Record Item;
        BarcodeFunctions: Codeunit "SK Barcode Functions";
}