pageextension 50080 "MIBPurchases & Payables Setup" extends "Purchases & Payables Setup"
{
    layout
    {
        addlast(content)
        {
            Group(MIBSpecification)
            {
                Caption = 'Lincoln-Biotech Specifications';

                field("MIBAutomatic FG Cost Adj"; Rec."MIBAutomatic FG Cost Adj")
                {
                    ApplicationArea = all;
                }

                field("MIBAutomatic FG Post Cost Adj"; rec."MIBAutomatic FG Post Cost Adj")
                {
                    ApplicationArea = all;
                }

                field("MIBDefault Template Name"; Rec."MIBDefault Template Name")
                {
                    ApplicationArea = all;
                }

                field("MIBDefault Batch Name"; Rec."MIBDefault Batch Name")
                {
                    ApplicationArea = all;
                }

            }
        }
    }
}
