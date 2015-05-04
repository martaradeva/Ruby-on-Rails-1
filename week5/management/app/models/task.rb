class Task < ActiveRecord::Base
  has_many :solutions
  belongs_to :lecture

  def lecture_name
    lecture.name
  end
end