class RemoveCreateJoinTableUsersBugs < ActiveRecord::Migration[6.0]
  def change
    drop_table :bugs_users
  end
end
