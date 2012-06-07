class Admin::CategoriesController < Admin::ApplicationController
#  before_filter :require_admin_login, :only => [:index,:show, :edit, :update,:destroy]
  before_filter :find_category, :only => [:index,:edit,:update,:show, :edit,:update, :delete, :update,:destroy]
  
  
  def new
    @category = Category.new
    @parent_category = Category.where(["parent_id IS NULL"]).map{|x| [x.name, x.id ]}
    
  end
  
  def show
    
  end
  def index
    
    @categories = Category.all
  #  @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      flash[:notice] = 'Category was succesful create' 
      redirect_to admin_categories_path
    else
      flash[:error] = 'Category Faild to create'
      render new_admin_category_path
    end
  end
  
  def edit
   # @parent_category = Category.where(["parent_id IS NULL"]).map{|x| [x.name, x.id ]}
    
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category was successfully updated"
      redirect_to admin_categories_path
    else
      flash[:error] = "Category was failed to update"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category was successfully deleted"
    redirect_to admin_categories_path
  end
  
  private
  def find_category
    
    @parent_category = Category.where(["parent_id IS NULL"]).map{|x| [x.name, x.id ]}
    @category = Category.find_by_id(params[:id])
    if @category.nil?
      flash[:notice] = 'Category not found'
      redirect_to admin_categories_path
    end
  end
end
