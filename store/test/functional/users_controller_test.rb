require 'test_helper'

class UsersControllerTest < ActionController::TestCase
 # test "should get new" do
  #  get :new
 #   assert_response :success
  # end
 
  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_equal assigns(:users).empty?,false
  end
  
  def test_new
    get :new
    assert_not_nil assigns(:user)
    assert_response :success
  end
  def test_show
    get :show, :id => User.first.id
    assert_not_nil assigns(:user)
    assert_response :success
  end
  
  def test_edit
    get :edit, :id => User.first.id
    assert_not_nil assigns(:user)
    assert_response :success
  end
  def test_edit_with_undefined_id
    get :edit, :id => Time.now.to_i
    assert_nil assigns(:user)
    assert_response :redirect
    assert_redirected_to users_path
    assert_equal flash[:notice] = 'User not found'
  end
  #method created belum di buat
  def test_update
    put :update, :id => User.first.id,
			     :user =>{:name => 'farid',:email => 'farid@gmail.com',:pasword => '12345', :address => 'semarang'}
    assert_not_nil assigns(:user)
    assert_equal assigns(:user).name, 'updated name'      
    assert_response :redirect
    assert_equal flash[:notice] = 'User was succesful Update' 
  end
  
  def test_with_underfined_id
    put :update, :id => Time.now.to_i,
				 :user => {:name => 'update name',:email => 'farid@gmail.com',:pasword => '12345', :address => 'semarang'}
        
    assert_nil assigns(:user)
    assert_response :redirect
    assert_redirected_to users_path
    assert_equal flash[:notice], 'User not found'
  end
  
  def test_update_with_invalid_parameter
    put :update, :id => User.first.id,
                 :User => {:name => nil}
    assert_not_nil assigns(:post)
    assert_response :success
    assert_equal flash[:notice], 'User faild Update'
  end
  
  def test destroy
    assert_difference('User.count', -1) do
    delete :destroy, :id => User.first.id
    assert_not_nil assigns(:user)
    end
    assert_response :redirect
    assert_redirected_to Users_path
    assert_equal flash[:notice]="user has deleted"
  end
end
