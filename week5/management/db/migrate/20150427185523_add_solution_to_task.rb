class AddSolutionToTask < ActiveRecord::Migration
  def change
    add_reference :solutions, :task, index: true
  end
end
