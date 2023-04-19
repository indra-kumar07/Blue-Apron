table 50100 "MenuInformation"
{
    Caption = 'MenuInformation';
    DataClassification = ToBeClassified;
    DataCaptionFields = "No.", "Description";

    fields
    {
        field(1; "No."; code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; Picture; Media)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
        }
        field(4; Price; Decimal)
        {
            Caption = 'Price';
            DataClassification = CustomerContent;
        }
        field(5; "Calories"; Decimal)
        {
            Caption = 'Calories';
            DataClassification = CustomerContent;
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula = sum(Ingredients."Total Calories" where("Item No" = field("No.")));
        }
        field(6; "No of Servings"; Integer)
        {
            Caption = 'No of Servings';
            DataClassification = CustomerContent;
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
            "No." := NoSeriesManagement.GetNextNo(SalesReceivablesSetup."Menu Nos.", WorkDate(), true);
        end
    end;

}
