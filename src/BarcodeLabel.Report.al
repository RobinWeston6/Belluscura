report 56602 "SK Barcode Label"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //TODO finished layout

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
                { }
                column(LabelRowNo; (LabelRowNoX2 - 1) Div 2)
                { }
                column(ParentItemNo_SNCollectionEntry; "Parent Item No.")
                { }
                column(Description_ParentItem; ParentItem.Description)
                { }
                column(ComponentItemNo_SNCollectionEntry; "Component Item No.")
                { }
                column(Description_ComponentItem; ComponentItem.Description)
                { }
                column(RemovedFromParentItem_SNCollectionEntry; "Removed from Parent Item")
                { }
                trigger OnAfterGetRecord() //SNCollectionEntry
                begin
                    if ParentItem."No." <> "SK SN Collection Entry"."Parent Item No." then
                        ParentItem.Get("SK SN Collection Entry"."Parent Item No.");

                    if ComponentItem."No." <> "SK SN Collection Entry"."Component Item No." then
                        ComponentItem.Get("SK SN Collection Entry"."Component Item No.");

                    LabelRowNoX2 += 1;
                end;
            }
            trigger OnPreDataItem() //CopyLoop
            begin
                CopyLoop.SetRange(Number, 1, NoOfCopies);
                if ShowOldComponents then
                    "SK SN Collection Entry".SetRange("Removed from Parent Item");
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
                    field(ShowOldComponents; ShowOldComponents)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Old Components;';
                    }
                }
            }
        }
        trigger OnInit()
        begin
            NoOfCopies := 1;
            ShowComponentDetails := true;
        end;
    }

    trigger OnInitReport()
    begin
        "SK SN Collection Entry".SetRange("Removed from Parent Item", false);

        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        //Request Page
        NoOfCopies: Integer;
        ShowComponentDetails: Boolean;
        ShowOldComponents: Boolean;

        //Dataset
        CompanyInfo: Record "Company Information";
        ParentItem: Record Item;
        ComponentItem: Record Item;
        BarcodeFunctions: Codeunit "SK Barcode Functions";
        LabelRowNoX2: Integer;
}