class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
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
    flash[:success] = "You just created a new product"
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
    flash[:info] = "You just edited a product"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find(params[:id])
    @id = @product.id
    @product.destroy
    flash[:danger] = "You just deleted something"
    redirect_to "/products"
  end
end
