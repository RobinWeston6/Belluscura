pageextension 56707 "SK2 Item Tracing" extends "Item Tracing"
{
    actions
    {
        modify(ShowDocument)
        {
            Visible = false;
        }
        modify(Card)
        {
            Visible = false;
        }
        modify(LedgerEntries)
        {
            Visible = false;
        }
        modify(TraceOppositeFromLine)
        {
            Visible = false;
        }
        modify(SetFiltersWithLineValues)
        {
            Visible = false;
        }
        modify("Go to Already-Traced History")
        {
            Visible = false;
        }
        modify(NextTraceResult)
        {
            Visible = false;
        }
        modify(PreviousTraceResult)
        {
            Visible = false;
        }
        modify(Print)
        {
            Visible = false;
        }
        modify(Navigate)
        {
            Visible = false;
        }
        modify(Trace)
        {
            Promoted = true;
            PromotedOnly = true;
            PromotedIsBig = true;
        }
    }
}