module ApplicationHelper
  def render_json(variable)
    respond_to do |format|
      format.json { render json: variable }
    end
  end
end
