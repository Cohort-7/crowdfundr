class AddRewardToPledges < ActiveRecord::Migration
  def change
  	add_column :pledges, :reward_id, :integer
  end
end
