class Project < ApplicationRecord
  belongs_to :manager, class_name: :User, foreign_key: :manager_id

  has_many :bugs, dependent: :destroy
  has_many :project_users
  has_many :users, through: :project_users

  validates :name, presence:true, length: { minimum: 2, maximum: 40 }
end
