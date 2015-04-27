class AddSolutionToStudent < ActiveRecord::Migration
  def change
    add_reference :solutions, :student, index: true
  end
end
