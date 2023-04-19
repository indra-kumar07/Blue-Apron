codeunit 50101 "Library - Blue Apron"
{
    internal procedure CreateIngredient(var Ingredients: Record IngredientsList; IngredientName: Text[100]; IngredientCalories: Decimal; IngredientsUOM: Code[10])
    begin
        Ingredients.Init();
        Ingredients."No." := LibraryUtility.GenerateRandomCode20(Ingredients.FieldNo("No."),Database::IngredientsList);
        Ingredients.Description := IngredientName;
        Ingredients.Calories := IngredientCalories;
        Ingredients."Unit of Measure" := IngredientsUOM;
        Ingredients.Insert();
    end;

    internal procedure CreateMenu(var MenuInformation: Record MenuInformation; Desc: Text[100]; price: Decimal; NOS: Integer)
    begin
        MenuInformation.Init();
        MenuInformation."No." := LibraryUtility.GenerateRandomCode20(MenuInformation.FieldNo("No."),Database::MenuInformation);
        MenuInformation.Description := Desc;
        MenuInformation.Price := price;
        MenuInformation."No of Servings" := NOS;
        MenuInformation.Insert();
    end;

    internal procedure CreateIngredientLines(var MenuInformation: Record MenuInformation; IngredientsList: Record IngredientsList; var Ingredients: Record Ingredients; Qty: Decimal)
    begin
        Ingredients.Init();
        Ingredients."Item No" := MenuInformation."No.";
        Ingredients."Line No." := Random(100000);
        Ingredients.Validate(Ingredients."Ingredient No.", IngredientsList."No.");
        Ingredients.Validate(Ingredients."Qty. Needed", Qty);
        Ingredients.Insert();
        MenuInformation.CalcFields(Calories);
    end;

    var
        LibraryUtility: Codeunit "Library - Utility";
}
