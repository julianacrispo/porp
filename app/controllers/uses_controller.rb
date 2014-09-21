class UsesController < ApplicationController
  respond_to :html, :js

  def show
    @use = @product.uses
  end

def create
  @product = Product.find(params[:product_id])
  @uses = @product.uses

  @use = current_user.uses.build( use_params )
  @use.product = @product
  @new_use = Use.new
  

  if @use.save
    flash[:notice] = "Your use case was created!"
  else
    flash[:error] = "There was an error saving your use case. Please try again."
  end

  respond_with(@use) do |f|
    f.html { redirect_to [@product]}
  end
end

def destroy 
  @product = Product.find(params[:product_id])
  @use = @product.uses.find(params[:id])

  if @use.destroy
    flash[:notice] = "Use case was removed"
  else
    flash[:error] = "Use case couldn't be deleted. Try again"
  end

  respond_with(@use) do |f|
    f.html { redirect_to [@product]}
  end
end 

private

  def use_params
    params.require(:use).permit(:description)
  end

end
