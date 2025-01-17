require 'rails_helper'

RSpec.describe 'chefs ingredients index page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the chefs ing index page' do
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

          visit "/chefs/#{@alaina.id}/ingredients"
        end
        
        it "I can see a unique list of names of all the ingredients that this chef uses" do
        expect(current_path).to eq("/chefs/#{@alaina.id}/ingredients")
        within('#ingredients_list') do
          expect(page).to have_content("salt")
          expect(page).to have_content("garlic")
          expect(page).to have_content("tomato")
          expect(page).to have_content("salmon")
          save_and_open_page
          expect(page).to_not have_content("yogurt")
        end
      end

      it "I see the three most popular ingredients that the chef uses in their dishes" do
        #(Popularity is based off of how many dishes use that ingredient)
        within('#popular_ingredients_list') do #change to double quotes in parenthesis
          expect("salt").to appear_before('garlic')
          expect("garlic").to appear_before('tomato')
          expect(page).to_not have_content("salmon")
          #this is the correct test but it is current failing becuase I could not figure out how to list them in descending order. I got the hash of unique ingredients and their frequency - I just could not order them for the life of me.
        end
      end

    end
  end
end


  #salt is used 4 times
  #garlic is used 3 times
  # tomato is used 2 times
  #salmon used one time
  #yogurt used not at all