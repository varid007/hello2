require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def test_save_without_name
    category = Category.new(:parent_id => 'null')
    assert_equal category.valid?, false
    assert_equal category.save, false
  end
  
   def test_save_with_name_lenght
    category = Category.new(:name => 'nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee')
    assert_equal category.valid?, false
    assert_equal category.save, false
  end
   def test_save_with_name_format
    category = Category.new(:name => '12345')
    assert_equal category.valid?, false
    assert_equal category.save, false
  end
  
  #relationship
    
  def test_relation_betwen_category_and_product
    category = Category.create(:name => 'name category')
    assert_not_nil category
    product = Product.create(:name => 'Product',:category_id => category.id)
    assert_not_nil category.products
    assert_equal category.products.empty?,false
    assert_equal category.products[0].class, Product
  end
 
end
