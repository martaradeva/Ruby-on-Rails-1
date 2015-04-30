class LecturesController < ApplicationController
  def index
    set_lectures
  end

  def new
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
    set_lecture
    @lecture.update!
  end

  def delete
    set_lecture
    @lecture.destroy
  end

private

  def set_lectures
    @lectures = Lecture.all
  end

  def set_lecture
    @lecture = Lecture.find(params['id'])
  end
end