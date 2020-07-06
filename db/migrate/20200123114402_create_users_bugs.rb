class CreateUsersBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :users_bugs do |t|
      t.references :users, null: false, foreign_key: true
      t.references :bugs, null: false, foreign_key: true

      t.timestamps
    end
  end
end
