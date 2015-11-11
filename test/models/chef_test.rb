require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef= Chef.new(chefname: "Jonathan", email: "jongamboa17@gmail.com")
  end
  
  
  
  test "chef should be valid" do
   assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chefname should not be to long" do
    #max 40
    @chef.chefname = "a"* 41
    assert_not @chef.valid?
  end
  
  test "chefname should not be to short" do
    #mim 3 
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  
  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email length should be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
   end
   
   test "email adress should be unique" do
     dup_chef = @chef.dup
     dup_chef.email = @chef.email.upcase
     @chef.save
     assert_not dup_chef.valid?
     
   end
   
   test "email validation should accept valid adresses" do
     valid_adresses = %w[user@eee.com JON_GA_ZU@eee.hello.org]
     valid_adresses.each do |va|
      @chef.email= va
      assert @chef.valid?, '#{va.inspect} should be valid'
     end
   end
   
   test "email validation should reject invalid adresses" do
     invalid_adresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am.com]
      invalid_adresses.each do |ia|
        @chef.email=ia
        assert_not @chef.valid?, '#{ia.inspect} should be invalid'
      end
   end
end