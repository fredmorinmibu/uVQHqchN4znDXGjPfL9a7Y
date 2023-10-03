pageextension 50081 "MIBAssembly BOM" extends "Assembly BOM"
{
    layout
    {
        addlast(Control1)
        {
            field("MIBLocation Code"; Rec."MIBLocation Code")
            {
                ApplicationArea = all;
            }
        }
    }
}
