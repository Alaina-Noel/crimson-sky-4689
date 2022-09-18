require 'rails_helper'

RSpec.describe 'chefs show page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the show page' do
        before :each do
          @alaina = Chef.create!(name: "Alaina")
          @mallory = Chef.create!(name: "Mallory")

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

          visit "/chefs/#{@alaina.id}"
        end

      it 'I see the name of that chef & a link to view a list of all ingredients that this chef uses in their dishes' do
        expect(page).to have_link("#{@alaina.name}'s Ingredients")
      end

      it "When I click on that link I'm taken to a chef's ingredient index page and I can see a unique list of names of all the ingredients that this chef uses" do
        click_link("#{@alaina.name}'s Ingredients")
        expect(current_path).to eq("/chefs/#{@alaina.id}/ingredients")
      end

      xit "I see the three most popular ingredients that the chef uses in their dishes" do
        #(Popularity is based off of how many dishes use that ingredient)
        expect(page).to have_content('Add a Pet to this Application')
        expect(page).to have_content('Search for pet by name:')
        expect(page).to_not have_content('Search for pet by name:')

      end

    end
  end
end
