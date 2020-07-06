class RemoveUserBugs < ActiveRecord::Migration[6.0]
  def change
      drop_table :users_bugs
  end
end
