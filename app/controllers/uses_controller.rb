class UsesController < ApplicationController

  def show
    @use = @product.uses
  end

  def create
    @use = @product.uses.build (use_params)
    @use.product = @product

    if @use.save
      flash[:notice] = "Use case was saved"
    else
      flash[:error] = "There was an error saving your use case. Please try again"
    end

    redirect_to @product
  end

  private

  def use_params
    params.require(:use).permit(
      :description
      )
  end

end
