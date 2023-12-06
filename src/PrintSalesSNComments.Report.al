report 56703 "SK2 Print Sales SN Comments"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/PrintSalesSNComments.rdlc';
    Caption = 'Print Sales SN Comments';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            PrintOnlyIfDetail = true;
            column(Picture_CompanyInfo; CompanyInformation.Picture)
            { }

            column(No_Header; "No.")
            { }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                PrintOnlyIfDetail = true;
                DataItemLink = "Document No." = field("No.");

                column(LineNo_Line; "Line No.")
                { }

                dataitem("Sales Comment Line"; "Sales Comment Line")
                {

                    DataItemLink = "No." = field("Document No."), "Document Line No." = field("Line No.");
                    DataItemTableView = where("Document Type" = const("Posted Invoice"), "SK2 Serial No." = const(true));

                    column(Comment_CommentLine; Comment)
                    { }

                    trigger OnAfterGetRecord()//"Sales Comment Line"
                    begin
                        TotalCommentCount += 1;
                    end;

                }

            }

            trigger OnAfterGetRecord() //"Sales Invoice Header"
            begin
                CompanyInformation.Get();
                CompanyInformation.CalcFields(Picture);
            end;

            trigger OnPostDataItem()//"Sales Invoice Header"
            begin
                if TotalCommentCount = 0 then
                    CurrReport.Quit();
            end;
        }
    }


    var
        CompanyInformation: Record "Company Information";
        TotalCommentCount: Integer;
}