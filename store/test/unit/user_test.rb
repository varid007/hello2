require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def test_save_without_name
    user = User.new(:email => 'farid@gmail.com',:password => 'password_test',:address => 'Semarang')
    assert_equal user.valid?, false
    assert_equal user.save, false
  end
  def test_save_with_name_lenght
    user = User.new(:name =>'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',:email => 'farid@gmail.com',:password => 'password_test',:address => 'Semarang')
    assert_equal user.valid?, false
    assert_equal user.save, false
  end
  def test_save_without_address 
    user = User.new(:name => 'farid',:email => 'farid@gmail.com',:password => 'password_test')
    assert_equal user.valid?, false
    assert_equal user.save, false
  end
  
  def test_save_without_pass
    user = User.new(:name => 'farid',:email => 'farid@gmail.com',:address => 'Semarang')
    assert_equal user.valid?, false
    assert_equal user.save, false
  end
  
  def test_save_without_email
    user = User.new(:name => 'farid',:address => 'Semarang',:password => 'password_test')
    assert_equal user.valid?, false
    assert_equal user.save, false
  end 
  
  def test_save_with_email_lenght
    user = User.new(:name => 'farid',:email => 'e',:address => 'Semarang',:password => 'password_test')
    assert_equal user.valid?, false
    assert_equal user.save, false
  end 
  
  def test_save_with_email_format
    user = User.new(:name => 'farid',:email => '@@.com',:address => 'Semarang',:password => 'password_test')
    assert_equal user.valid?, false
    assert_equal user.save, false
  end 
  
  def save_all
    user = User.new(:name => 'farid',:email => 'farid@gmail.com',:address => 'Semarang',:password => 'password_test')
    assert_equal user.valid?, true
    assert_equal user.save, true
  end
  
  #uniquenes belum di cek
  #Relationship User
  
  def test_relation_betwen_user_and_product
    user = User.create(:name => 'farid',:email => 'farid@gmail.com',:address => 'Semarang',:password => 'password_test')
    assert_not_nil user
    product = Product.create(:user_id => user.id, :name => 'Product')
    assert_not_nil user.products
    assert_equal user.products.empty?,false
    assert_equal user.products[0].class, Product
  end
  
  def test_relation_betwen_user_and_article
    user = User.create(:name => 'farid',:email => 'farid@gmail.com',:address => 'Semarang',:password => 'password_test')
    assert_not_nil user
    article = Article.create(:user_id => user.id, :title => 'title', :body => 'this a body')
    assert_not_nil user.articles
    assert_equal user.articles.empty?,false
    assert_equal user.articles[0].class, Article
  end
  
  def test_relation_betwen_user_and_comment
    user = User.create(:name => 'farid',:email => 'farid@gmail.com',:address => 'Semarang',:password => 'password_test')
    assert_not_nil user
    comment = Comment.create(:user_id => user.id, :comment => 'this a comment')
    assert_not_nil user.comments
    assert_equal user.comments.empty?,false
    assert_equal user.comments[0].class, Comment
  end
end
