class CartedProductsController < ApplicationController

  def create
    @cart = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: 'carted'
      )
    @cart.errors
    @cart.save

    redirect_to '/cart'
    flash[:success] = 'This product has been added to the cart'
  end

  def show
    @carted_products = CartedProduct.where(user_id: current_user.id).where(status: "carted")
    render 'show.html.erb'
  end

  def remove
    item = CartedProduct.where(product_id: params[:product_id]).where(status: "carted").where(user_id: current_user.id)

    item.update(
      status: 'removed'
    )

    redirect_to '/cart'
  end

end
