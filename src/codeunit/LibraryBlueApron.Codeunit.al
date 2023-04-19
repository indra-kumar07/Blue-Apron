codeunit 50101 "Library - Blue Apron"
{
    internal procedure CreateIngredient(var Ingredients: Record IngredientsList;IngredientName: Text[100];IngredientCalories: Decimal;IngredientsUOM: Code[10])
    begin
        Ingredients.Init();
        Ingredients.Description := IngredientName;
        Ingredients.Calories := IngredientCalories;
        Ingredients."Unit of Measure" := IngredientsUOM;
        Ingredients.Insert(true);
    end;
}
