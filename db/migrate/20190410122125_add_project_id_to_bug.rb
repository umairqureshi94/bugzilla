class AddProjectIdToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :project_id, :integer
  end
end
