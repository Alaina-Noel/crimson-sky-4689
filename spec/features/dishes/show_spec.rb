require 'rails_helper'

RSpec.describe 'dishes show page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the dishes show page' do
        before :each do
          @alaina = Chef.create!(name: "Alaina")

          @basil_soup = @alaina.dishes.create!(name: "Tomato Basil Soup", description: "Delicious & Creamy")
          @chicken_feta = @alaina.dishes.create!(name: "Chicken Feta", description: "Chicken with Yogurt Feta Sauce")
          @broccoli_bake = @alaina.dishes.create!(name: "Broccoli Bake", description: "Tomato & Broccoli Baked to Perfection")
          @perfect_salmon = @alaina.dishes.create!(name: "Perfect Grilled Salmon", description: "Science backed perfectly grilled salmon with dill sauce")

          @salt = Ingredient.create!(name: "salt", calories: 100)
          @chicken = Ingredient.create!(name: "chicken", calories: 200)
          @garlic = Ingredient.create!(name: "garlic", calories: 20)
          @yogurt = Ingredient.create!(name: "yogurt", calories: 115)
          @salmon = Ingredient.create!(name: "salmon", calories: 175)
          @tomato = Ingredient.create!(name: "tomato", calories: 50)

          @basilsoup_salt = DishIngredient.create!(dish_id: @basil_soup.id , ingredient_id: @salt.id)
          @basilsoup_tomato = DishIngredient.create!(dish_id: @basil_soup.id , ingredient_id: @tomato.id)
          @basilsoup_garlic = DishIngredient.create!(dish_id: @basil_soup.id , ingredient_id: @garlic.id)

          @chickenfeta_salt = DishIngredient.create!(dish_id: @chicken_feta.id , ingredient_id: @salt.id)
          @chickenfeta_garlic = DishIngredient.create!(dish_id: @chicken_feta.id , ingredient_id: @garlic.id)

          @broccolibake_salt = DishIngredient.create!(dish_id: @broccoli_bake.id , ingredient_id: @salt.id)
          @broccolibake_tomato = DishIngredient.create!(dish_id: @broccoli_bake.id , ingredient_id: @tomato.id)
          @broccolibake_garlic = DishIngredient.create!(dish_id: @broccoli_bake.id , ingredient_id: @garlic.id)

          @perfectsalmon_salmon = DishIngredient.create!(dish_id: @perfect_salmon.id , ingredient_id: @salmon.id)
          @perfectsalmon_salt = DishIngredient.create!(dish_id: @perfect_salmon.id , ingredient_id: @salt.id)

#salt is used 4 times
#garlic is used 3 times
# tomato is used 2 times
#salmon used one time
#yogurt used not at all

          visit "/dishes/#{@basil_soup.id}"
        end

      it 'I see the dishs name and description, a list of ingredients for that dish, and I see the chefs name.' do

        expect(page).to have_content("Dish Name: #{@basil_soup.name}")
        expect(page).to have_content("Description: #{@basil_soup.description}")
        within('#ingredients_list') do
          expect(page).to have_content("salt")
          expect(page).to have_content("garlic")
          expect(page).to have_content("tomato")
          expect(page).to_not have_content("yogurt")
        end
        expect(page).to have_content("Chef's Name: Alaina")
      end

      xit 'I see the total calorie count for that dish.' do
        expect(page).to have_content("Total Calorie Count: #{@basil_soup.total_calorie_count}")
      end

    end
  end
end

