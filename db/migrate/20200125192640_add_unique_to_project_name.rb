class AddUniqueToProjectName < ActiveRecord::Migration[6.0]
  def change
    add_index :projects, :name, unique: true
  end
end
