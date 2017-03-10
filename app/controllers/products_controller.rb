class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def query_params_method
    @parameter = params
    # p params['joe']
    render "query_params_view.html.erb"
  end

  def show
    @product = Product.find_by(id: params[:id])

    render "show.html.erb"
  end
end
