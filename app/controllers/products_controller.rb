class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def query_params_method
    @parameter = params
    # p params['joe']
    render 'query_params_view.html.erb'
  end

  def show
    @product = Product.find_by(id: params[:id])

    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    # take in params and add to database
    @product = Product.new(
      name: params['form_name'],
      brand: params['form_brand'],
      description: params['form_description'],
      price: params['form_price']
    )
    @product.save
    # show a view with the info the user entered
    redirect_to "/products/#{@product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params['form_name'],
      brand: params['form_brand'],
      description: params['form_description'],
      price: params['form_price']
    )
    @product.save
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find(params[:id])
    @id = @product.id
    @product.destroy
    redirect_to "/products"
  end
end
