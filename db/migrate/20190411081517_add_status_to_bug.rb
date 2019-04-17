class AddStatusToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :status, :string
  end
end
