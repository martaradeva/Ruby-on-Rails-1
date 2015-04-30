class TasksController < ApplicationController
  def index
    set_tasks
  end

  def new
  end

  def show
    set_task
  end

  def edit
    set_task
  end

  def create
    set_task
    @task.save!
  end

  def update
    set_task
    @task.update!
  end

  def delete
    set_task
    @task.destroy
  end

private

  def set_tasks
    @tasks = Task.all
  end

  def set_task
    @task = Task.find(params[id])
  end
end
