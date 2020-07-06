class RemoveUserReferencesFromBug < ActiveRecord::Migration[6.0]
  def change
     remove_reference :bugs, :user, null: false, foreign_key: true
  end
end
