require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_without_name
    product = Product.new(:description => 'this a product')
    assert_equal product.valid?, false
    assert_equal product.save, false
  end
  def test_name_lenght
    product = Product.new(:name => 'name producttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt')
    assert_equal product.valid?, false
    assert_equal product.save, false
  end
  
  def test_name_format
    product = Product.new(:name => '123456')
    assert_equal product.valid?, false
    assert_equal product.save, false
  end
end
