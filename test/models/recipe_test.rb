require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  #Create an object with all the requirements that you want, name:(x characters, must be present ), summary: , description: 
  #Assign that object to an instance variable
  def setup
    @recipe = Recipe.new(name: "Rice and Chicken",summary: "The best rice and chicken ever", description: "mix rice and chicken and cooks for 40 minutes at 20 degrees celsious" )
  end
 
 #create the tests
 test "recipe should be valid" do
   assert @recipe.valid?
 end
 
 test "name should be present" do 
   @recipe.name = " "
   assert_not @recipe.valid?
 end

 test "name length should not be to long" do
    #write this line to fail bc in this case we want the name length less than 100 charaters
     @recipe.name = "a" * 101
     assert_not @recipe.valid?
     
 end
 
 test "name length should not be to short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
 end
 
 test "summary should be present" do
   @recipe.summary = " "
   assert_not @recipe.valid?
 end
 
 test "summary length should not be to long" do
  # the we want is 150 max
  @recipe.summary = "a" * 151
  assert_not @recipe.valid?
end

 test "summary length should not be to short" do
   #mim 10
   @recipe.summary = "a" * 9
  assert_not @recipe.valid?
 end
 
 test "description must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
 end

 test "description should not be too long" do
   @recipe.description = "a" * 501
   assert_not @recipe.valid?
 end 
 
 test "description should not be to short" do
   @recipe.description= "a" * 19
   assert_not @recipe.valid?
 end
 
end
