tableextension 56715 "SK2 Sales Header" extends "Sales Header"
{
    procedure AutoCategoriseSerialNoComments()
    var
        AutoCat: Codeunit "SK2 Sales SN Comment AutoCat";
    begin
        AutoCat.AutoCategoriseSalesSNComments(Rec."Document Type", Rec."No.");
    end;

    procedure AllCommentsCategorised(): Boolean
    var
        AutoCat: Codeunit "SK2 Sales SN Comment AutoCat";
    begin
        exit(AutoCat.AllCommentsCategorised(Rec."Document Type", Rec."No."));
    end;
}