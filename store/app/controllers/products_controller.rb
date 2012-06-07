class ProductsController < ApplicationController
  before_filter :require_login, :only => [ :new,:edit, :update,:delete,:destroy]
  before_filter :find_product, :only => [:show, :edit, :update, :delete, :destroy]
  before_filter :your_product, :only => [ :edit, :update, :delete, :destroy]
  def index
    @products = Product.all
    @products_paging = Product.paginate(:per_page => 3, :page => params[:page])
  end
  
  def new
    @product= Product.new
    @child_category = Category.where(["parent_id IS NOT NULL"]).map{|x| [x.name, x.id ]}
  end
  
  def create
    
    @user = current_user
    @product = @user.products.create(params[:product])
    if @product.save
      flash[:notice] = "Article was successfully created"
      redirect_to products_path
    else
      flash[:error] = "Article was failed created"
      render :new
    end
  end
  
  def show
    
  end
  
  def edit
    
    @child_category = Category.where(["parent_id IS NOT NULL"]).map{|x| [x.name, x.id ]}
  end
  
  def update
    
    if @product.update_attributes(params[:product])
      flash[:notice] = "Article was successfully updated"
      redirect_to products_path
    else
      flash[:error] = "Article was failed to update"
      render :edit
    end
  end
  
  def destroy
    
    @product.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to products_path
  end
  
  private
  def find_product
    @product = Product.find(params[:id])
    if @product.nil?
      flash[:notice] = 'product not found'
      redirect_to products_path
    end
  end
  
  def your_product
    user=current_user
    unless @product.id == user.id || current_user.is_admin
       flash[:notice]="its not your product"
       redirect_to products_path
    end
  end
end
