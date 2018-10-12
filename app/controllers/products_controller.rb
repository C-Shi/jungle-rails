class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    if @product.review.size > 0
      @ave_rate = @product.review.average(:rating).round(2)
    else
      @ave_rate = 'N/A'
    end
    @review = Review.new
  end

end
