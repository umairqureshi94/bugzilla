class CreateBugUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :bug_users do |t|
      t.references :bug, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
