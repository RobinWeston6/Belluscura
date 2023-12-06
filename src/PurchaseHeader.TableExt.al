tableextension 56708 "SK2 Purchase Header" extends "Purchase Header"
{
    fields
    {
        field(56700; "SK2 Department"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Department';
            OptionMembers = " ","Supply Chain",Engineering,Quality,Shipping,Accounting;
        }
        field(56701; "SK2 Approver"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Approver';
            OptionMembers = " ","Keith Cook","Bo Borrello","Paul Bray","Sarah Clark","Brian Brown","Dwayne Thompson","Mark Vines";
        }
        field(56702; "SK2 Date To Be Issued"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date To Be Issued';
        }
        field(56703; "SK2 Issued"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Issued';
        }
        field(56710; "SK2 Engineering Type"; Text[50]) //RND,Product Development,Sustaining Engineering
        {
            DataClassification = CustomerContent;
            Caption = 'Engineering Type';
            TableRelation = "SK2 Engineering Type".Description;
            ValidateTableRelation = false;
        }
        field(56711; "SK2 Project"; Text[50]) //CX, CX+, DX, Nomad, Infrastructure
        {
            DataClassification = CustomerContent;
            Caption = 'Project';
            TableRelation = "SK2 Project".Description;
            ValidateTableRelation = false;
        }
        field(56712; "SK2 Expense Type"; Text[50]) //Materials, Contract Labor, Tooling, Testing, Audit, IT, Misc Expense
        {
            DataClassification = CustomerContent;
            Caption = 'Expense Type';
            TableRelation = "SK2 Expense Type".Description;
            ValidateTableRelation = false;
        }
        field(56720; "SK2 Ext. Status"; Enum "SK2 Purch. Doc. Ext. Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            Editable = false;
        }
    }
    procedure CalcExtStatus()
    var
        PurchLine: Record "Purchase Line";
        AllZero: Boolean;
        AllReceived: Boolean;
    begin
        Rec."SK2 Ext. Status" := Enum::"SK2 Purch. Doc. Ext. Status".FromInteger(Rec.Status.AsInteger());

        AllZero := true;
        AllReceived := true;

        PurchLine.SetRange("Document Type", Rec."Document Type");
        PurchLine.SetRange("Document No.", Rec."No.");
        if PurchLine.FindSet() then begin
            repeat
                if PurchLine."Quantity Received" <> PurchLine."Quantity" then
                    AllReceived := false;
                if PurchLine."Quantity Received" > 0 then
                    AllZero := false;
            until PurchLine.Next() = 0;

            if AllZero then
                exit;
            if AllReceived then
                Rec."SK2 Ext. Status" := Rec."SK2 Ext. Status"::"Fully Received"
            else
                Rec."SK2 Ext. Status" := Rec."SK2 Ext. Status"::"Partially Received";
        end;
    end;

    procedure GetExtStatusStyleText() StatusStyleText: Text
    var
        Style: Enum "SK2 Page Style";
    begin
        case "SK2 Ext. Status" of
            "SK2 Ext. Status"::Open:
                StatusStyleText := format(Style::Favorable);
            "SK2 Ext. Status"::"Pending Approval", "SK2 Ext. Status"::"Pending Prepayment", "SK2 Ext. Status"::Released:
                StatusStyleText := format(Style::Strong);
            "SK2 Ext. Status"::"Partially Received":
                StatusStyleText := format(Style::StrongAccent);
            "SK2 Ext. Status"::"Fully Received":
                StatusStyleText := format(Style::Unfavorable);
        end;
    end;
}