class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects, dependent: :destroy
  has_many :comments, through: :tasks, dependent: :destroy
  has_many :owned_task, foreign_key: 'assigned_by_id', class_name:'Task'
  has_many :assigned_task, foreign_key: 'assigned_to_id', class_name: 'Task'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
