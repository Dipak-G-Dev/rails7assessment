class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :project
  belongs_to :assigned_by, class_name: 'User', foreign_key: 'assigned_by_id'
  belongs_to :assigned_to, class_name: 'User', foreign_key: 'assigned_to_id'
  enum status: {pending: 0, inprogress: 1, out_for_test: 2, On_production: 3, completed:4 }
end
