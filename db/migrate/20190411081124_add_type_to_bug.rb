class AddTypeToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :type, :string
  end
end
