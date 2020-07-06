class CreateProjectUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :projectss_users do |t|

      t.timestamps
    end
  end
end
