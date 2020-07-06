class CreateJoinTableUsersBugs < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :bugs do |t|
      # t.index [:user_id, :bug_id]
      # t.index [:bug_id, :user_id]
    end
  end
end
