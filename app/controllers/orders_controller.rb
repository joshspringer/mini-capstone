class OrdersController < ApplicationController

  def create
    @product = Product.find_by(id: params[:product_id])
    @order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      subtotal: @product.price,
      tax: @product.tax,
      total: @product.total
    )
    @order.subtotal = @order.subtotal * @order.quantity
    @order.tax = @order.tax * @order.quantity
    @order.total = @order.total * @order.quantity
    @order.save
    # .errors method shows errors for rollback
    # p order.errors
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @product = Product.find_by(id: @order.product_id)
    @user_email = User.find_by(id: @order.user_id)
    render 'show.html.erb'
  end
end
