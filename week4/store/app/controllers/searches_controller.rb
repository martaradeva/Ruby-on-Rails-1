class SearchesController < ApplicationController
  def search
    set_vars_from_params
    render_json(find_items)
  end

  private
  def set_vars_from_params
    @slug = params[:slug]
    @type, @property = params[:type_property].split('/')
    @property ||= "name"
  end

  def find_items
    @type.capitalize.constantize.where("#{@property} LIKE '%#{@slug}%'")
  end
end
