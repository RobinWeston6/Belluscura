report 56702 "SK2 Barcode Label"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //TODO double record on layout - why?
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Layouts/BarcodeLabel.rdl';

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
            dataitem("SK2 SN Collection Entry"; "SK SN Collection Entry")
            {
                RequestFilterFields = "Parent Item No.", SKU;
                DataItemTableView = sorting("Parent Item No.", SKU);

                /*column(SKU_SNCollectionEntry; SKU)
                { }
                column(SKU_SNCollectionEncoded; BarcodeFunctions.EncodeFont(SKU))
                { }
                column(ParentItemNo_SNCollectionEntry; "Parent Item No.")
                { }
                column(Description_ParentItem; ParentItem.Description)
                { }
                column(ComponentItemNo_SNCollectionEntry; "Component Item No.")
                { }
                column(Description_ComponentItem; ComponentItem.Description)
                { }
                column(ComponentSerialNo_SNCollection; "SK2 SN Collection Entry"."Component Serial No.")
                { }
                column(ComponentSerialNo_SNCollectionEncoded; BarcodeFunctions.EncodeFont("SK2 SN Collection Entry"."Component Serial No."))
                { }
                column(RemovedFromParentItem_SNCollectionEntry; "Removed from Parent Item")
                { }*/

                dataitem(OutputLoop; Integer)
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    //Just for label output
                    column(SKU_SNCollectionEntryEncoded; BarcodeFunctions.EncodeFont("SK2 SN Collection Entry".SKU))
                    { }
                    column(Description_ParentItem; ParentItem.Description)
                    { }
                    column(SKU_SNCollectionEntry; "SK2 SN Collection Entry".SKU)
                    { }
                    column(LabelRowNo; LabelRowNo)
                    { }
                    column(ItemNos1; ItemNos[1])
                    { }
                    column(ItemNos2; ItemNos[2])
                    { }
                    column(Descriptions1; Descriptions[1])
                    { }
                    column(Descriptions2; Descriptions[2])
                    { }
                    column(SerialNos1; SerialNos[1])
                    { }
                    column(SerialNos2; SerialNos[2])
                    { }
                    column(SerialNosEncoded1; SerialNosEncoded[1])
                    { }
                    column(SerialNosEncoded2; SerialNosEncoded[2])
                    { }

                    trigger OnPreDataItem()//OutputLoop
                    begin
                        if (LineNo mod 2 = 0) and (LineNo <> "SK2 SN Collection Entry".Count) then
                            CurrReport.Skip();
                        OutputLoop.SetRange(Number, LabelRowNo);
                    end;

                    trigger OnPostDataItem() //OutputLoop
                    begin
                        LineNo += 1;
                    end;
                }

                trigger OnAfterGetRecord() //SNCollectionEntry
                var
                    xPosition: Integer;
                begin
                    if ParentItem."No." <> "SK2 SN Collection Entry"."Parent Item No." then
                        ParentItem.Get("SK2 SN Collection Entry"."Parent Item No.");

                    if ComponentItem."No." <> "SK2 SN Collection Entry"."Component Item No." then
                        ComponentItem.Get("SK2 SN Collection Entry"."Component Item No.");

                    xPosition := (LineNo mod 2) + 1;
                    ItemNos[xPosition] := "Parent Item No.";
                    Descriptions[xPosition] := ComponentItem.Description;
                    SerialNos[xPosition] := "SK2 SN Collection Entry"."Component Serial No.";
                    SerialNosEncoded[xPosition] := BarcodeFunctions.EncodeFont("SK2 SN Collection Entry"."Component Serial No.");

                    LabelRowNo := (LineNo - 1) div 2;
                end;
            }
            trigger OnPreDataItem() //CopyLoop
            begin
                CopyLoop.SetRange(Number, 1, NoOfCopies);
                if ShowOldComponents then
                    "SK2 SN Collection Entry".SetRange("Removed from Parent Item");
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
        "SK2 SN Collection Entry".SetRange("Removed from Parent Item", false);

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
        BarcodeFunctions: Codeunit "SK2 Barcode Functions";

        //Layout
        LineNo: Integer;
        LabelRowNo: Integer;
        ItemNos: array[2] of Code[20];
        Descriptions: array[2] of Text[100];
        SerialNos: array[2] of Code[50];
        SerialNosEncoded: array[2] of Text;
}