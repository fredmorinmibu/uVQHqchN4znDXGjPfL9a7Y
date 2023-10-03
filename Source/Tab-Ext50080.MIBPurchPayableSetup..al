tableextension 50080 "Mibu Purchase Setup 2" extends "Purchases & Payables Setup"
{

    fields
    {


        field(50003; "MIBAutomatic FG Cost Adj"; Boolean)
        {
            Caption = 'Automatic FG Cost Adjustement';
        }
        field(50004; "MIBAutomatic FG Post Cost Adj"; Boolean)
        {
            Caption = 'Automatic Post FG Cost Adjustement';
        }

        field(50005; "MIBDefault Template Name"; code[20])
        {
            Caption = 'Cost Adj.Template Name';
            TableRelation = "Item Journal Template";
            trigger OnValidate()
            begin
                if xrec."MIBDefault Template Name" <> rec."MIBDefault Template Name" then
                    "MIBDefault Batch Name" := '';
            end;
        }
        field(50006; "MIBDefault Batch Name"; code[20])
        {
            Caption = 'Cost Adj. Batch Name';
            TableRelation = "iTEM Journal batch".Name where("Journal Template Name" = field("MIBDefault Template Name"));
        }
    }
}