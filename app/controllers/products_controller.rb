
class ProductsController < ApplicationController
  def index
    if params['sort'] == 'price_asc'
      @products = Product.all.order(price: :asc)
    elsif params['sort'] == 'price_desc'
      @products = Product.all.order(price: :desc)
    elsif params['section'] == 'sale'
      @products = Product.where("price < ?", 20)
    elsif params['q']
      @products = Product.where("name LIKE ?", "%#{params[:q]}%")
    else
      @products = Product.all
    end

    if params[:category]
      p 'category_id passed'
      @products = Category.find_by(id: params[:category]).products
    else
      p 'category_id not passed'
      @products = Product.all
    end

    render 'index.html.erb'
  end

  def show
    if params[:id] == 'random'
      # @product = Product.all.shuffle.first
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
      @categories = @product.categories
    end
    render 'show.html.erb'
  end

  def new
    @suppliers = Supplier.all
    render 'new.html.erb'
  end

  def create
    # take in params and add to database
    # Product.create does not require @product.save
    @product = Product.new(
      name: params['form_name'],
      brand: params['form_brand'],
      description: params['form_description'],
      price: params['form_price'],
      supplier_id: params['form_supplier_id']
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
