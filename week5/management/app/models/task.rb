class Task < ActiveRecord::Base
  has_many :solutions
  belongs_to :lecture
end