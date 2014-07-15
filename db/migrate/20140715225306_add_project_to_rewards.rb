class AddProjectToRewards < ActiveRecord::Migration
  def change
  	add_column :rewards, :project_id, :integer
  end
end
