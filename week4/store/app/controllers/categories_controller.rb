class CategoriesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    set_categories
    render_json(params[:count] ? @categories.count : @categories)
  end

  def show
    set_category
    render_json(@category)
  end

  def new
  end

  def create
    @category = Brand.new(name: params[:name])
    @category.save!
    redirect_to action: "index"
  end

  def edit
    set_category
  end

  def update
    set_category
    @category.update_attributes(name: params[:name])
  end

  def destroy
    set_category
    @category.destroy
  end

  def count
    set_categories
    render_json(@categories.count)
  end

  private
  def set_category
    @category = Category.find_by id: params[:id]
  end

  def set_categories
    if params[:index] then
      @categories = Category.where("id >= #{params[:index]}")
    else
      @categories = Category.all
    end
  end

end
