table 56704 "SK2 GL Entry Cat. Breakdown"
{
    Caption = 'G/L Entry Category Breakdown';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "G/L Entry No."; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'G/L Entry No.';
            TableRelation = "G/L Entry"."Entry No.";
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Line No.';
        }
        field(10; "G/L Entry Amount"; Decimal)
        {
            Caption = 'G/L Entry Amount';
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Entry".Amount where("Entry No." = field("G/L Entry No.")));
            Editable = false;
        }
        field(11; "Breakdown Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
            DecimalPlaces = 2;

            trigger OnValidate()
            begin
                CalcFields("G/L Entry Amount");
                "Breakdown Percentage" := ("Breakdown Amount" / "G/L Entry Amount") * 100;
            end;
        }
        field(12; "Breakdown Percentage"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Percentage';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                CalcFields("G/L Entry Amount");
                "Breakdown Amount" := ("Breakdown Percentage" / 100) * "G/L Entry Amount";
            end;
        }
        field(20; "Engineering Activity"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Engineering Activity';
            TableRelation = "SK2 Engineering Type".Code;
        }
        field(30; "Expense Type"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Expense Type';
            TableRelation = "SK2 Expense Type".Code;
        }
        field(40; "Project"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Project';
            TableRelation = "SK2 Project".Code;
        }
    }

    keys
    {
        key(PK; "G/L Entry No.", "Line No.")
        {
            Clustered = true;
        }
        key(Amounts; "Breakdown Amount", "Breakdown Percentage")
        {
            SumIndexFields = "Breakdown Amount", "Breakdown Percentage";
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        Rec."Line No." := NextLineNo();
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure TotalPercentageForGLEntry(): Decimal
    var
        GLEntryBreakdown: Record "SK2 GL Entry Cat. Breakdown";
    begin
        GLEntryBreakdown.SetRange("G/L Entry No.", "G/L Entry No.");
        CalcSums("Breakdown Percentage");
        exit(GLEntryBreakdown."Breakdown Percentage");
    end;

    procedure TotalAmountForGLEntry(): Decimal
    var
        GLEntryBreakdown: Record "SK2 GL Entry Cat. Breakdown";
    begin
        GLEntryBreakdown.SetRange("G/L Entry No.", "G/L Entry No.");
        CalcSums("Breakdown Amount");
        exit(GLEntryBreakdown."Breakdown Amount");
    end;

    procedure RatioAmountAccountedForTotal(): Decimal
    begin
        CalcSums("G/L Entry Amount");
        exit(Round(TotalAmountForGLEntry() / "G/L Entry Amount", 0.01));
    end;

    procedure NextLineNo(): Integer
    var
        GLEntryBreakdown: Record "SK2 GL Entry Cat. Breakdown";
    begin
        GLEntryBreakdown.SetRange("G/L Entry No.", Rec."G/L Entry No.");
        if GLEntryBreakdown.FindLast() then
            exit(GLEntryBreakdown."Line No." + 1000)
        else
            exit(1000);
    end;

}