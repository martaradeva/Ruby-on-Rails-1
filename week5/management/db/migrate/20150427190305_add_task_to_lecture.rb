class AddTaskToLecture < ActiveRecord::Migration
  def change
    add_reference :tasks, :lecture, index: true
  end
end
