codeunit 50100 TestScenarios
{
    Subtype = Test;
    TestPermissions = Disabled;

[Test]
procedure Total_calories_on_menu()
var
    // MenuInformation: Record  MenuInformation;
    // Ingredients: Record Ingredients;
    IngredientsList: Record IngredientsList;
    LibraryBlueApron: Codeunit "Library - Blue Apron";
begin
    LibraryBlueApron.CreateIngredient(IngredientsList,'Potato',500,'KG');
    Error(IngredientsList."No.");
end;
}