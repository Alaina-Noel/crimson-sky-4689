require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients)}
    it {should have_many(:dish_ingredients)}
  end

  before(:each) do
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
  end


  describe 'instance methods' do
    describe '#total_calorie_count' do
     it 'counts all calories within a given dish' do

      expect(@basil_soup.total_calorie_count).to eq(170)
     end
    end
  end

end

