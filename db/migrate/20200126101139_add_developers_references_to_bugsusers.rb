class AddDevelopersReferencesToBugsusers < ActiveRecord::Migration[6.0]
  def change
    add_reference :bugs, :developer, references: :users, index: true, optional: true
    add_foreign_key :bugs, :users, column: :developer_id
  end
end
