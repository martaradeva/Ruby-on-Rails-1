class SolutionsController < ApplicationController
  def index
    set_solutions
  end

  def new
    @solution = Solution.new
    @solution.task = Task.find(params[:task_id])
    @solution.task.lecture = Lecture.find(params[:lecture_id])
  end

  def show
    set_solution
  end

  def edit
    set_solution
  end

  def create
    @solution = Solution.create!(solution_params)
    redirect_to lecture_task_solution_url(@solution.task.lecture, @solution.task, @solution)
  end

  def update
    set_solution
    @solution.update!(solution_params)
    redirect_to lecture_task_solution_url(@solution.task.lecture, @solution.task, @solution)
  end

  def destroy
    set_solution
    @solution.destroy
    redirect_to lecture_tasks_solutions_url(@solution.task)
  end

  private

  def set_solutions
    @solutions = Solution.where(task_id: params['task_id']).all
  end

  def set_solution
    @solution = Solution.find_by(id: params['id'])
  end

  def permitted_params
    params.permit(:lecture_id, :task_id, :solution => [:name, :description])
  end

  def solution_params
    {
      content: params[:solution][:content],
      task_id: params[:task_id]
    }
  end

end
