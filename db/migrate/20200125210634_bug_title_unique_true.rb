class BugTitleUniqueTrue < ActiveRecord::Migration[6.0]
  def change
    add_index :bugs, :title, unique: true
  end
end
