class ChangeColumnNameUserType < ActiveRecord::Migration[6.0]
  def change
     rename_column :users, :user_type, :type
  end
end
