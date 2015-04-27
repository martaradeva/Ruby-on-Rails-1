class ProductsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    set_products
    render_json(params[:count] ? @products.count : @products)
  end

  def show
    set_product
    render_json(@product)
  end

  def new
  end

  def create
    @product = Brand.new(name: params[:name], price: params[:price], quantity: params[:quantity])
    @product.save!
    redirect_to action: "index"
  end

  def edit
    set_product
  end

  def update
    set_product
    @product.update_attributes(name: params[:name], price: params[:price], quantity: params[:quantity])
  end

  def destroy
    set_product
    @product.destroy
  end

  def count
    set_products
    render_json(@products.count)
  end

  private
  def set_product
    @product = Product.find_by id: params[:id]
  end

  def set_products
    if params[:index] then
      @products = Product.where("id >= #{params[:index]}")
    else
      @products = Product.all
    end
  end

end
