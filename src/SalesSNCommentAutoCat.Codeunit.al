codeunit 56705 "SK2 Sales SN Comment AutoCat"
{

    procedure AutoCategoriseSalesSNComments(DocType: Enum "Sales Document Type"; DocNo: Code[20])
    begin
        AutoCategoriseSalesSNComments(DocType, DocNo, (-1));
    end;

    procedure AutoCategoriseSalesSNComments(DocType: Enum "Sales Document Type"; DocNo: Code[20]; DocLineNo: Integer)
    var
        SalesCommentLine: Record "Sales Comment Line";
    begin
        FilterSalesCommentLines(SalesCommentLine, DocType, DocNo, DocLineNo);
        if SalesCommentLine.FindSet(true) then
            repeat
                SalesCommentLine.AutoCategoriseItem(true);
            until SalesCommentLine.Next() = 0;
    end;


    procedure AllCommentsCategorised(DocType: Enum "Sales Document Type"; DocNo: Code[20]): Boolean
    begin
        exit(AllCommentsCategorised(DocType, DocNo, (-1)));
    end;

    procedure AllCommentsCategorised(DocType: Enum "Sales Document Type"; DocNo: Code[20]; DocLineNo: Integer): Boolean
    var
        SalesCommentLine: Record "Sales Comment Line";
    begin
        SalesCommentLine.SetFilter("SK2 Item No.", '%1', '');
        FilterSalesCommentLines(SalesCommentLine, DocType, DocNo, DocLineNo);
        exit(SalesCommentLine.IsEmpty)
    end;


    procedure FilterSalesCommentLines(var SalesCommentLine: Record "Sales Comment Line"; DocType: Enum "Sales Document Type"; DocNo: Code[20]; DocLineNo: Integer)
    begin
        SalesCommentLine.SetRange("SK2 Serial No.", true);
        SalesCommentLine.SetRange("Document Type", DocType);
        SalesCommentLine.SetRange("No.", DocNo);
        if DocLineNo > (-1) then
            SalesCommentLine.SetRange("Document Line No.", DocLineNo);
    end;


}