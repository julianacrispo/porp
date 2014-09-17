class ProductsController < ApplicationController
  
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
  end

  def new
  end

  def edit
  end
end
