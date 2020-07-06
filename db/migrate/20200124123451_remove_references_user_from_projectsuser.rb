class RemoveReferencesUserFromProjectsuser < ActiveRecord::Migration[6.0]
  def change
    # add_reference :projects_users, :qa, references: :users, index: true
    # add_foreign_key :projects_users, :users, column: :qa_id
  end
end
