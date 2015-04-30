class SolutionsController < ApplicationController
  def index
    set_solutions
  end

  def new
  end

  def show
    set_solution
  end

  def edit
    set_solution
  end

  def create
    set_solution
    @solution.save!
  end

  def update
    set_solution
    @solution.update!
  end

  def delete
    set_solution
    @solution.destroy
  end

private

  def set_solutions
    @solutions = Solution.all
  end

  def set_solution
    @solution = Solution.find(params['id'])
  end
end
