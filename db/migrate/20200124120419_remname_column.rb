class RemnameColumn < ActiveRecord::Migration[6.0]
  def change
    # add_reference :projects_users, :developer , references: :users, index: true
    # add_foreign_key :projects_users, :users, column: :developer_id
  end
end
