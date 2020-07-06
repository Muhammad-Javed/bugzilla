class Developer < User
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :bugs, foreign_key: :developer_id
end
