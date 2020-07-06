class AddQaReferencesToBug < ActiveRecord::Migration[6.0]
  def change
    add_reference :bugs, :qa, references: :users, index: true
    add_foreign_key :bugs, :users, column: :qa_id
  end
end
