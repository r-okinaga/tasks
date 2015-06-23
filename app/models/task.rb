class Task < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :comments
  validates :task_name,
            presence: true
end