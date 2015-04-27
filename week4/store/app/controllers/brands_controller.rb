class BrandsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    set_brands
    render_json(params[:count] ? @brands.count : @brands)
  end

  def show
    set_brand
    render_json(@brand)
  end

  def new
  end

  def create
    @brand = Brand.new(name: params[:name], description: params[:description])
    @brand.save!
    redirect_to action: "index"
  end

  def edit
    set_brand
  end

  def update
    set_brand
    @brand.update_attributes(name: params[:name], description: params[:description])
  end

  def destroy
    set_brand
    @brand.destroy
  end

  def count
    set_brands
    render_json(@brands.count)
  end

  private
  def set_brand
    @brand = Brand.find_by id: params[:id]
  end

  def set_brands
    if params[:index] then
      @brands = Brand.where("id >= #{params[:index]}")
    else
      @brands = Brand.all
    end
  end

end
