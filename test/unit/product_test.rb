require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  setup do
    #Arrange necessary preconditions and inputs
    @p = FactoryGirl.create(:product)
  end

  # Example test
  test "must have a name" do
    #Act on the object of method under test
    @p.name = ""
  end

  test "product requires a description" do

  end

  test "product requires a name" do

  end

  test "product requires a price" do
  end
    #Assert that the expected results have occurred.
    refute @p.valid?
  end
end