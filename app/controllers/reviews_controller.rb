class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    @product = Product.find(params[:product_id])
    @review = @product.review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = session[:user_id]

    if @review.save!
      redirect_to "/products/#{params[:product_id]}"
    else
      redirect_to '/'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    redirect_to "/products/#{params[:product_id]}"
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
