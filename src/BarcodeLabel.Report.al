report 56600 "SK Barcode Label"
{
    Caption = 'Print Barcode Labels';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Layouts/BarcodeLabel.rdl';

    dataset
    {
        dataitem(CopyLoop; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            column(Number_CopyLoop;
            CopyLoop.Number)
            {
            }
            column(Picture_CompanyInfo; CompanyInfo.Picture)
            {
            }

            dataitem(SNCollection; "SK Serial No. Collection")
            {
                RequestFilterFields = SKU, "Unit Serial No.", "Battery Serial No.", "Sieve Bed Serial No.", "Send-to Document", "Send-to No.";

                column(SKU_SNCollection; SKU)
                {
                }
                column(SKU_SNCollectionEncoded; BarcodeFunctions.EncodeFont(SKU))
                {
                }
                column(Description_ParentItem; ParentItem.Description)
                {
                }
                column(UnitSerialNo_SNCollection; "Unit Serial No.")
                {
                }
                column(UnitSerialNo_SNCollectionEncoded; BarcodeFunctions.EncodeFont("Unit Serial No."))
                {
                }
                column(BatterySerialNo_SNCollection; "Battery Serial No.")
                {
                }
                column(BatterySerialNo_SNCollectionEncoded; BarcodeFunctions.EncodeFont("Battery Serial No."))
                {
                }
                column(SieveBedSerialNo_SNCollection; "Sieve Bed Serial No.")
                {
                }
                column(SieveBedSerialNo_SNCollectionEncoded; BarcodeFunctions.EncodeFont("Sieve Bed Serial No."))
                {
                }
                column(SieveBed2SerialNo_SNCollection; "Sieve Bed 2 Serial No.")
                {
                }
                column(SieveBed2SerialNo_SNCollectionEncoded; BarcodeFunctions.EncodeFont("Sieve Bed 2 Serial No."))
                {
                }
                column(ComponentItemDescArr1; ComponentItemDescArr[1])
                {
                }
                column(ComponentItemDescArr2; ComponentItemDescArr[2])
                {
                }
                column(ComponentItemDescArr3; ComponentItemDescArr[3])
                {
                }
                column(ComponentItemDescArr4; ComponentItemDescArr[4])
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if ParentItem."No." <> SNCollection."Item No." then
                        ParentItem.Get(SNCollection."Item No.");
                    PopulateComponentItemDescArr(SNCollection);
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
        BarcodeFunctions: Codeunit "SK Barcode Functions";
        ComponentItemDescArr: Array[4] of Text[100];

    procedure PopulateComponentItemDescArr(SNCollection2: Record "SK Serial No. Collection")
    var
        Item: Record Item;
        i: Integer;
        CurrItemNo: Code[20];
    begin
        for i := 1 to ArrayLen(ComponentItemDescArr) do begin
            Clear(Item);
            Clear(CurrItemNo);
            case i of
                1:
                    CurrItemNo := SNCollection2."Battery Item No.";
                2:
                    CurrItemNo := SNCollection2."Unit Item No.";
                3:
                    CurrItemNo := SNCollection2."Sieve Bed Item No.";
                4:
                    CurrItemNo := SNCollection2."Sieve Bed 2 Item No.";
            end;
            if Item.Get(CurrItemNo) then
                ComponentItemDescArr[i] := Item.Description;
        end;
    end;


}