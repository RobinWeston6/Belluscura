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
                AutoCategoriseSNLine(SalesCommentLine);
            until SalesCommentLine.Next() = 0;
    end;


    procedure AllCommentsCategorised(DocType: Enum "Sales Document Type"; DocNo: Code[20]): Boolean
    begin
        AllCommentsCategorised(DocType, DocNo, (-1));
    end;

    procedure AllCommentsCategorised(DocType: Enum "Sales Document Type"; DocNo: Code[20]; DocLineNo: Integer): Boolean
    var
        SalesCommentLine: Record "Sales Comment Line";
    begin
        SalesCommentLine.SetFilter("SK2 Item No.", '<>%1', '');
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

    procedure AutoCategoriseSNLine(var SalesCommentLine: Record "Sales Comment Line")
    var
        Item: Record Item;
        TextFunctions: Codeunit "SK2 Text Functions";
    begin
        Item.SetCurrentKey("SK2 SN Format Length");
        Item.SetFilter("SK2 SN Format Length", '>%1', 0);
        if Item.Find('-') then
            repeat
                if Item."SK2 Serial No. Format" = TextFunctions.AsSNFormat(SalesCommentLine."SK2 Extracted SN") then begin
                    SalesCommentLine."SK2 Item No." := Item."No.";
                    SalesCommentLine."SK2 Item Desc" := Item.Description;
                    SalesCommentLine.Modify();
                end;
            until Item.Next() = 0;
    end;
}