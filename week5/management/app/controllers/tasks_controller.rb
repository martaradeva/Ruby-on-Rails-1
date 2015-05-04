class TasksController < ApplicationController
  def index
    set_tasks
  end

  def new
    @task = Task.new
    @task.lecture = Lecture.find(params[:lecture_id])
  end

  def show
    set_task
  end

  def edit
    set_task
  end

  def create
    # create_task_from_params
    # @task.save!
    @task = set_task_from_params
    redirect_to lecture_task_url(@task.lecture, @task)
  end

  def update
    set_task
    @task.update!(permitted_params)
    redirect_to lecture_task_url(@task.lecture, @task)
  end

  def destroy
    set_task
    @task.destroy
    redirect_to tasks_url
  end

private

  def set_tasks
    @tasks = Task.all
  end

  def set_task
    @task = Task.find_by(id: params['id'])
  end

  def permitted_params
    params.permit(:lecture_id, :task => [:name, :description])
  end

  def set_task_from_params
    task_params = {
      name: params[:task][:name],
      description: params[:task][:description],
      lecture_id: params[:lecture_id]
    }
    Task.create!(task_params)
  end

  # def create_task_from_params
  #   @task = set_task || Task.new
  #   @task.name = params["task"]['name']
  #   @task.description = params["task"]['description']
  #   @task
  # end
end
