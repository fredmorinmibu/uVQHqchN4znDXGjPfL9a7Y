tableextension 50081 "MIBBOM Component" extends "BOM Component"
{
    fields
    {
        field(50000; "MIBLocation Code"; Code[20])
        {
            Caption = 'Component Location';
            DataClassification = ToBeClassified;
            TableRelation = location;
        }
    }
}
