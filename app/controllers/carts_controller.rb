class CartsController < ApplicationController
  
  before_filter :authorize

  def show
  end

  def add_item
    product_id = params[:product_id].to_s
    if validate_quantity(product_id)
      modify_cart_delta(product_id, + 1)
      update_stock_quantity(product_id, 1)
    else
      flash[:danger] = "This product is currently out of stock"
    end

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)
    update_stock_quantity(product_id, -1)
    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

  def validate_quantity(product_id)
    product = Product.find(product_id)
    return product.quantity > 0
  end

  def update_stock_quantity(product_id, delta)
    product = Product.find(product_id)
    new_quantity = product.quantity - delta
    product.update(quantity: new_quantity)
  end

end
