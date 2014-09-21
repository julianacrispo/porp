class ProductsController < ApplicationController #Todo: add authorizations
  
  def index
    @products = Product.all.order("created_at DESC") #todo: sort products by activity in descending order
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
     @products = Product.all.order('created_at DESC')
   end
  end


  def show
    @product = Product.find(params[:id])
    @uses = @product.uses
    @use = Use.new
  end

  def new
    #todo: check if product already exists
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:name))
    if @product.save
      flash[:notice] = "Product was saved!"
      redirect_to @product
    else
      flash[:error] = "There was an error saving this product. Please try again."
      render :new
    end
  end


  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params.require(:product).permit(:name))
      flash[:notice] = "Product was updated!"
      redirect_to @product
    else
      flash[:error] = "There was an error saving your product. Please try again"
      render :edit
    end
  end

  def destroy 
    @product = Product.find(params[:id])
    @uses = @product.uses
    @use = Use.new

    name = @product.name

    if @product.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to products_path
    else
      flash[:error] = "There was an error deleting the product"
      render :show
    end
  end


end
