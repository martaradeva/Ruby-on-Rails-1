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
    set_lecture
    @lecture.save!
  end

  def update
    create_lecture_from_params
    @lecture.update!
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
    @lecture = Lecture.find(params['id'])
  end

  def create_lecture_from_params
    @lecture = set_lecture || Lecture.new
    @lecture.name = params('name')
    @lecture.body = params('body')
    @lecture
  end
end
