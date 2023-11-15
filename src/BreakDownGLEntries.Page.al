page 56709 "SK2 Break Down G/L Entries"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "G/L Entry";
    Caption = 'Break Down G/L Entries';
    PopulateAllFields = true;

    layout
    {
        area(Content)
        {
            part(Breakdown; "SK2 G/L Entry Cat. Brkdn Subpg")
            {
                Caption = 'Breakdown';
                SubPageLink = "G/L Entry No." = field("Entry No.");
                ApplicationArea = All;
            }
            field("SK2 Broken Down Amount"; Rec."SK2 Broken Down Amount")
            {
                Caption = 'Broken Down Amount';
                ApplicationArea = All;
                StyleExpr = Style;
                Visible = false;
            }
            repeater(Control1)
            {
                Caption = 'G/L Entries';

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the entry''s posting date.';
                    StyleExpr = Style;

                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the Document Type that the entry belongs to.';
                    StyleExpr = Style;

                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the entry''s Document No.';
                    StyleExpr = Style;

                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the account that the entry has been posted to.';
                    StyleExpr = Style;

                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    Editable = false;
                    ToolTip = 'Specifies the name of the account that the entry has been posted to.';
                    StyleExpr = Style;

                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a description of the entry.';
                    StyleExpr = Style;

                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the number of the related job.';
                    StyleExpr = Style;

                    Visible = false;
                }

                field("Gen. Posting Type"; Rec."Gen. Posting Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the type of transaction.';
                    StyleExpr = Style;

                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                    StyleExpr = Style;

                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                    StyleExpr = Style;

                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the quantity that was posted on the entry.';
                    StyleExpr = Style;

                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the Amount of the entry.';
                    StyleExpr = Style;

                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the total of the ledger entries that represent debits.';
                    StyleExpr = Style;

                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the total of the ledger entries that represent credits.';
                    StyleExpr = Style;

                }
                field("Additional-Currency Amount"; Rec."Additional-Currency Amount")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies the general ledger entry that is posted if you post in an additional reporting currency.';
                    StyleExpr = Style;

                    Visible = false;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the amount of VAT that is included in the total amount.';
                    StyleExpr = Style;

                    Visible = false;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the type of account that a balancing entry is posted to, such as BANK for a cash account.';
                    StyleExpr = Style;

                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the general ledger, customer, vendor, or bank account that the balancing entry is posted to, such as a cash account for cash purchases.';
                    StyleExpr = Style;

                }
                field("VAT Reporting Date"; Rec."VAT Reporting Date")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies the VAT date on the VAT entry. This is either the date that the document was created or posted, depending on your setting on the General Ledger Setup page.';
                    StyleExpr = Style;

                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                    StyleExpr = Style;

                    Visible = false;

                    trigger OnDrillDown()
                    var
                        UserMgt: Codeunit "User Management";
                    begin
                        UserMgt.DisplayUserInformation(Rec."User ID");
                    end;
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies if the entry has been part of a reverse transaction (correction) made by the Reverse function.';
                    StyleExpr = Style;

                    Visible = false;
                }
                field("Reversed by Entry No."; Rec."Reversed by Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the correcting entry. If the field Specifies a number, the entry cannot be reversed again.';
                    StyleExpr = Style;

                    Visible = false;
                }
                field("Reversed Entry No."; Rec."Reversed Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the original entry that was undone by the reverse transaction.';
                    StyleExpr = Style;

                    Visible = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                    StyleExpr = Style;

                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the entry''s external document number, such as a vendor''s invoice number.';
                    StyleExpr = Style;

                }
            }

        }
    }

    trigger OnAfterGetRecord()
    begin
        SetStyle();
    end;

    var
        Style: Text;
        AmountPercentageStyle: Enum "SK2 Page Style";


    local procedure SetStyle()
    var
        GLEntryCategoryBreakdown: Record "SK2 GL Entry Cat. Breakdown";
    begin
        GLEntryCategoryBreakdown.SetRange("G/L Entry No.", Rec."Entry No.");
        if GLEntryCategoryBreakdown.Count = 0 then
            Style := 'None'
        else
            Style := 'Attention';
        //CurrPage.Update(false);
    end;

    local procedure CalcStyle()
    var
        Amt: Decimal;
    begin
        Rec.CalcFields("SK2 Broken Down Amount");
        Amt := Rec."SK2 Broken Down Amount";
        case true of
            (Amt = 0):
                AmountPercentageStyle := AmountPercentageStyle::None;
            (Amt + 0.03 >= Rec."SK2 Broken Down Amount") and (Amt - 0.03 <= Rec."SK2 Broken Down Amount"):
                AmountPercentageStyle := AmountPercentageStyle::Ambiguous;
            (Amt = Rec."SK2 Broken Down Amount"):
                AmountPercentageStyle := AmountPercentageStyle::Favorable;
            (Amt + 0.03 < Rec."SK2 Broken Down Amount") or (Amt - 0.03 > Rec."SK2 Broken Down Amount"):
                AmountPercentageStyle := AmountPercentageStyle::Attention;
        end;
        Style := format(AmountPercentageStyle);
        CurrPage.Update();
    end;
}