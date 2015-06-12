class Task < ActiveRecord::Base
  has_many :comments
  validates :task_name,
            presence: true
end