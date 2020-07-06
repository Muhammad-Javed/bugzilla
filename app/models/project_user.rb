class ProjectUser < ApplicationRecord
  self.table_name = 'project_users'

  belongs_to :user
  belongs_to :project

  validates_uniqueness_of :user_id, :scope => :project_id
end
