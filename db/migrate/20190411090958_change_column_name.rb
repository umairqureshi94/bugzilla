class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :bugs, :type, :b_type
  end
end
