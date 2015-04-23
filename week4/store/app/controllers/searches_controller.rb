class SearchesController < ApplicationController
  def search
    set_vars_from_params
    @search_query = find_item(@type, @property, @slug)
    render_json(@search_query)
  end

  private
  def set_vars_from_params
    # @type = params[:type]
    # @property, @slug = params[:property_slug].split('/', 2)
    @type, @property, @slug = params[:type_property_slug].split('/')
  end

  def find_item(type, property, slug)
    Brands.first
  end
end