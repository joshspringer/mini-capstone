class OrdersController < ApplicationController

  def create

    carted_products = CartedProduct.where(user_id: current_user.id).where(status: 'carted')

    if order = Order.new(
      user_id: current_user.id,
    )
    order.save

    carted_products.update(
      status: 'ordered',
      order_id: order.id
    )

    order.update(
      subtotal: order.subtotal,
      tax: order.tax,
      total: order.subtotal + order.tax
    )
    else p 'error'
    end
    # .errors method shows errors for rollback
    # p order.errors
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    
    # two ways to access user info- active record version (latter) preferred
    # @user_email = User.find_by(id: @order.user_id).email
    # @user_email = @order.user.email
    render 'show.html.erb'
  end
end
