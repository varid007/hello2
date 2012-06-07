require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_without_title
    article = Article.new(:body => 'this a article')
    assert_equal article.valid?, false
    assert_equal article.save, false
  end
  
  def test_title_lenght
    article = Article.new(:title => 'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',:body => 'this a article')
    assert_equal article.valid?, false
    assert_equal article.save, false
  end
  
  def test_title_format
    article = Article.new(:title => '123',:body => 'this a article')
    assert_equal article.valid?, false
    assert_equal article.save, false
  end
  def test_save_all
    article = Article.new(:title => 'Title',:body => 'this a article')
    assert_equal article.valid?, true
    assert_equal article.save, true
  end
 
  #relationship
  def test_relation_betwen_article_and_comment
    article = Article.create(:title => 'title',:body => 'this is a body')
    assert_not_nil article
    comment = Comment.create(:article_id => article.id, :comment => 'this is a comment')
    assert_not_nil article.comments
    assert_equal article.comments.empty?,false
    assert_equal article.comments[0].class, Comment
  end
  
  def test_relation_betwen_user_and_article
    user = User.create(:name => 'farid',:email => 'farid@gmail.com',:address => 'Semarang',:password => 'password_test')
    assert_not_nil user
    article = Article.create(:user_id => user.id, :title => 'title', :body => 'this a body')
    assert_not_nil user.articles
    assert_equal user.articles.empty?,false
    assert_equal user.articles[0].class, Article
  end
end

