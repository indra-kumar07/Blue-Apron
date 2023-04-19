table 50103 IngredientsList
{
    Caption = 'IngredientsList';
    DataClassification = ToBeClassified;
    DataCaptionFields = "No.";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; Calories; Decimal)
        {
            Caption = 'Calories Per Unit';
            DataClassification = ToBeClassified;
        }
        field(4; "Unit of Measure"; Code[10])
        {
            Caption = 'Unit of Measure';
            TableRelation = "Unit of Measure";
            DataClassification = ToBeClassified;
        }
        field(5; Picture; Media)
        {
            Caption = 'Picture';
            DataClassification = ToBeClassified;
        }
        
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            SalesReceivablesSetup.Get();
            "No." := NoSeriesManagement.GetNextNo(SalesReceivablesSetup."Ingredient Nos.", WorkDate(), true);
        end
    end;
}
