class BrandsController < ApplicationController
  # before_filter :set_brand, only: [:show, :create, :update, :delete]

  def index
    @brands = Brands.all
  end

  def show
    set_brand
  end

  def new
  end

  def create
  end

  def edit
    set_brand
  end

  def update
    set_brand
  end

  def destroy
    set_brand
  end

  def count
  end

  def count
  end

  private
  def set_brand
    @brand = Brands.find_by id: params[:id]
  end
end