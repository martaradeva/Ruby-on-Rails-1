class BrandsController < ApplicationController
  # before_filter :set_brand, only: [:show, :create, :update, :delete]

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
    redirect_to :index
  end

  def edit
    set_brand
  end

  def update
    set_brand
    redirect_to :index
  end

  def destroy
    set_brand
    redirect_to :index
  end

  def count
    set_brands
    render_json(@brands.count)
  end

  private
  def set_brand
    @brand = Brands.find_by id: params[:id]
  end

  def set_brands
    if params[:index] then
      @brands = Brand.where("id > params[:index]")
    else
      @brands = Brand.all
    end
  end

  def render_json(variable)
    render json: variable.to_json
    # respond_to do |format|
    #   format.json { render json: variable.to_json }
    # end
  end

end
