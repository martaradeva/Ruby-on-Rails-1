class LecturesController < ApplicationController
  def index
    set_lectures
  end

  def new
    @lecture = Lecture.new
  end

  def show
    set_lecture
  end

  def edit
    set_lecture
  end

  def create
    create_lecture_from_params
    @lecture.save!
    redirect_to lecture_url(@lecture)
  end

  def update
    set_lecture
    @lecture.update!(params[:lecture].permit(:name, :body))
    redirect_to lecture_url(@lecture)
  end

  def destroy
    set_lecture
    @lecture.destroy
    redirect_to lectures_url
  end

private

  def set_lectures
    @lectures = Lecture.all
  end

  def set_lecture
    @lecture = Lecture.find_by(id: params['id'])
  end

  def create_lecture_from_params
    @lecture = set_lecture || Lecture.new
    @lecture.name = params["lecture"]['name']
    @lecture.body = params["lecture"]['body']
    @lecture
  end
end
