tableextension 50100 "NoSeriesExt" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Menu Nos."; Code[20])
        {
            Caption = 'Menu Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(501001; "Ingredient Nos."; code[20])
        {
            Caption = 'Ingredient Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
